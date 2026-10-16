# Codex 部署分析

**规则：只提示高价值候选，等你主动说安装后再部署；不每轮询问，不自动安装。**

榜单排名不等于部署许可。Skill、MCP、CLI、代码库、独立应用与参考资料采用不同接入方式。
当前查找器没有安装执行入口，也不会修改 Codex 配置或执行候选仓库命令。

高价值提示门槛：参考分至少 75，DS适配优先级为高，分析未超过30天；仍须核查具体组件、来源、权限、依赖、重叠与回滚方案。

## 高价值核查候选

### [K-Dense-AI/scientific-agent-skills](projects/1079456184.md)

**为什么值得：** 为Codex补充科学数据库查询、专业包工作流与证据可溯写作技能

**重叠与增量（未核对安装清单）：** 与已有文献检索、论文写作、科研绘图等技能明显重叠；专业数据库与领域包工作流可能有增量，需逐技能对照，本机具体组件尚未核验。

**代价与风险：** Python环境与各技能依赖包，部分数据库需注册或授权，图像生成需OpenRouter密钥；177技能质量与安全扫描结果未逐项核实，MIT许可但含第三方引用

**部署前核查：** 核查skills目录下SKILL.md、skill-requirements.toml与安全扫描工作流

### [PDFMathTranslate/PDFMathTranslate](projects/853189791.md)

**为什么值得：** 为Codex补充PDF论文双语翻译并保留公式排版的能力

**重叠与增量（未核对安装清单）：** 与已有论文阅读、PDF处理和全文对照阅读流程重叠；保留原版式的翻译输出是否提供增量需实际比较，不能认定本机缺少此能力。

**代价与风险：** 需Python3.11-3.12或Windows安装包，翻译需OpenAI等API密钥或本地Ollama，Windows或用vc_redist.x64；AGPL-3.0许可影响二次分发，翻译模型与API费用未验证

**部署前核查：** 核查pdf2zh PyPI包、Windows ZIP资产与Zotero插件仓库是否可用

### [Graphify-Labs/graphify](projects/1200597263.md)

**为什么值得：** 将代码、文档与PDF转为可查询知识图谱，本地AST解析零LLM开销，可直接注册为Codex技能

**重叠与增量（未核对安装清单）：** 与已有知识图谱、代码检索、REA和上下文工具有交叉；确定性AST建图是否提供增量需任务级对照，当前安装状态未核验。

**代价与风险：** 需Python3.10+与uv，提供Windows安装命令，文档与PDF语义解析需配置模型或API Key；文档与PDF解析依赖外部模型产生费用，Windows历史存在MCP stdio问题，benchmark为自述

**部署前核查：** 核查graphify install --platform codex生成的技能文件路径与Windows下MCP stdio兼容性

## 不同类型如何接入

- **Skill：** 先确认具体 SKILL.md 和依赖；按本机权威技能目录规则审核、备份、预览同步，尚未安装。
- **MCP 服务：** 属于 MCP 连接与配置；须核对服务来源、权限、凭证及本地/远程运行方式，尚未连接。
- **命令行工具：** 属于本机命令行依赖；先确认 Windows 支持与隔离环境，再决定如何由 Codex 调用。
- **代码库：** 通常放入具体项目的依赖环境，不作为全局 Skill 安装。
- **独立应用：** 通常作为独立软件使用，不等于可直接装入 Codex。
- **参考资料：** 用于借鉴或学习，不作为可直接部署的工具。
- **混合工具集：** 必须拆分具体 Skill、脚本、MCP 或软件组件逐项核对，不能整库盲装。
- **待识别：** 集成方式尚未确定，先核对仓库实际内容。

官方资料：[Skills](https://developers.openai.com/plugins/concepts/skills)、[Codex MCP](https://developers.openai.com/codex/mcp)。

Top50、部署建议和项目详情持续更新，不属于30天轮次报告清理对象；所有建议都不等于安装批准。
