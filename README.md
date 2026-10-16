# GitHub 项目发现器

持续发现 GitHub 上有价值的项目，优先科研与效率工具，兼顾 AI、Skill、MCP、开发与新领域探索。项目筛选与状态管理在本地完成，使用 DeepSeek Flash 合批理解公开材料。

**[查看最新报告与历史](reports/README.md)**

## 当前行为

- 每轮轮换 6 条主题查询，保存发现来源与有限候选证据；不声称遍历全 GitHub。
- GitHub 数字仓库 ID 去重；保存真实时间跨度的 Star 快照，不虚构近 7 天增长。
- Flash 每批最多 4 个候选，返回 JSON 后核对项目集合、字段、数值和逐字引用；未经运行测试的项目明确标注。
- 缓存按材料、兴趣、提示词/schema 版本区分；Star 和 pushed 时间变化不触发全文重读。
- 每日估算预算上限 **20 元，按北京时间重置**，不设月度金额上限。调用前预留预算，usage 未知时保留预留额。
- 报告分为成熟可用、新兴潜力、值得借鉴；优先科研和效率，每轮最多展示 5 个。无 DS 结果时可列客观候选，明确不作为语义推荐。
- 报告保留最近 **30 天**，且至少保留最新 **10 份**；仅删除清单登记、内容未改动的历史报告。Git 历史不重写。
- 日常自动提交仅限 `reports/`；有暂存的代码修改时拒绝夹带提交。源码迭代独立验证、提交。

## 目录与安装

需要 Windows、Python 3.12+、Git、当前用户的 GitHub 凭证，以及 [deepseek-executor](https://github.com/whoaha77/deepseek-executor) 的 `bin/ask.py`。本查找器没有第三方 Python 包依赖；`requirements.txt` 无需额外安装。

```text
scripts/                查找器完整源码
tests/                  不联网的行为测试
run.ps1                 命令行入口
schedule.ps1            当前用户的定时任务安装和检查入口
config.example.json     不含密钥的配置示例
reports/                版本管理中的报告及入口
config.json             本机配置，不上传
state/                  SQLite、预算与互斥锁，不上传
work/                   原始证据、模型输入输出，不上传
logs/                   调度日志，不上传
backups/                本机备份，不上传
```

本机部署在 `D:\CodexProject\deepseek-executor\apps\github-radar`，默认自动找到上层执行器。单独克隆时，设置环境变量 `DEEPSEEK_EXECUTOR_HOME` 为执行器根目录；不要指向其 bin 子目录。

```powershell
$env:DEEPSEEK_EXECUTOR_HOME = 'D:\CodexProject\deepseek-executor'
Copy-Item config.example.json config.json
.\run.ps1 scan --dry-run
.\run.ps1 scan --no-publish --limit 4
```

执行器按其自己的规则读取 `DEEPSEEK_API_KEY` 或现有本机配置，本项目不保存密钥。GitHub 优先复用 `GH_TOKEN`/`GITHUB_TOKEN`，否则非交互调用 Git Credential Manager。仅查询公开项目，发布到配置的私有仓库；不打印或提交凭证。

已有本机配置时不要覆盖；先备份并比较。仓库默认目标为 `whoaha77/github-radar-reports`，发布前核对 origin、main 分支及远端 private 属性，禁止 force push、reset 或自动丢弃冲突。

## 使用

```powershell
.\run.ps1 scan                         # 扫描、分析、写报告并发布
.\run.ps1 scan --no-model --no-publish # 不调用模型、不发布
.\run.ps1 scan --dry-run               # 展示计划，不请求GitHub/DS、不推送
.\run.ps1 status                      # 最近运行与今日预算占用
.\run.ps1 feedback 123456 saved --reason '准备试用'
.\run.ps1 feedback 123456 known --reason '已经使用'
.\run.ps1 feedback 123456 ignore --reason '不适用'
.\run.ps1 feedback 123456 clear
.\run.ps1 cleanup                     # 仅预览可清理报告
.\run.ps1 cleanup --apply             # 按既定保留规则清理；下次报告发布时同步删除
python -m unittest discover -s tests -p 'test_*.py' -v
```

`saved`、`tried_ok` 项目加入后续关注；`known` 在材料变化前不再推荐；`ignore`、`later`、`tried_failed` 暂停筛选，`clear` 恢复。每条报告列出仓库 ID，便于反馈。

## 定时与发布

```powershell
.\schedule.ps1 -Install -DryRun
.\schedule.ps1 -Install
```

任务名 `GitHubRadar-whoaha77`。在当前 Windows 用户登录会话中，每 5 分钟做一次轻量时间检查；真正扫描只在开机后 30 分钟及随后每 120 分钟的时间窗口执行一次，正常触发误差不超过约 5 分钟。休眠错过的窗口合并为一次，不补发多轮请求。

该任务不保存 Windows 密码、不要求管理员权限，不唤醒休眠的电脑。**尚未登录 Windows 时无法使用本用户凭证运行；登录后补检查。**采集与分析阶段设置 10 分钟时间预算，发布另有请求超时；任务外层 15 分钟兜底，避免无限等待。进程互斥防止手动与定时运行重叠。

首次部署先审查白名单文件、测试、建立私有远端并提交完整源码；后续扫描仅提交报告目录。源码版本由开发迭代时单独提交。推送失败保留本地文件与提交；远端冲突不会强行覆盖。

## 预算和证据的边界

当前费率根据 [DeepSeek 官方人民币价格页](https://api-docs.deepseek.com/zh-cn/quick_start/pricing) 于 2026-10-16 核对。预算按 Flash 高峰输入未命中缓存 2 元/百万 tokens、输出 8 元/百万 tokens 的保守上界计算，不将缓存重复计入输入。实际扣费需供应商账单核对；本程序预算不包含其他工具的 DS 调用。

价格超过 30 天未核验时停止新增付费分析，仍可采集和报告；核对官方页后更新本机配置的费率与 `verified_date`。每日 20 元是上限而非消耗目标，通常不会用满。日内未知调用占用预算，不能因为超时就按零元释放。

README、Release、Star 及作者描述只是筛选材料。本程序不安装/运行候选仓库，不声称完成安全审计或性能验证。引用行号对应本机固定证据快照，远端后续修改可能改变行号。

首版采用官方仓库搜索和 README/Release 证据，不依赖 find-skills CLI、Trending HTML、复杂多 Agent 或向量数据库。查询与偏好可配置；单轮是有预算的抽样覆盖。推荐质量仍需要结合真实使用反馈逐步验证。
