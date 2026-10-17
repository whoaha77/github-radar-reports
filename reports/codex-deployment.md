# Codex 部署分析

**规则：只提示高价值候选，等你主动说安装后再部署；不每轮询问，不自动安装。**

榜单排名不等于部署许可。Skill、MCP、CLI、代码库、独立应用与参考资料采用不同接入方式。
当前查找器没有安装执行入口，也不会修改 Codex 配置或执行候选仓库命令。

高价值提示门槛：参考分至少 75，DS适配优先级为高，分析未超过30天；仍须核查具体组件、来源、权限、依赖、重叠与回滚方案。

## 高价值核查候选

### [docling-project/docling](projects/826168160.md)

**为什么值得：** 统一文档解析与MCP服务，可为文献与知识库提供结构化输入。

**重叠与增量（未核对安装清单）：** 与已有PDF处理能力有潜在交叉，结构化模型导出与MCP接入是待核验增量。

**代价与风险：** Python 3.10+，Windows可运行，可选OCR/VLM模型下载。；与既有PDF能力重叠程度和解析质量未验证。

**部署前核查：** 核查README中MCP server与docling-serve文档及模型许可证说明。

### [microsoft/markitdown](projects/888092115.md)

**为什么值得：** 把PDF与Office文档转成Markdown，便于LLM与检索pipeline处理。

**重叠与增量（未核对安装清单）：** 已有PDF与Word/Excel处理能力，此项目统一转Markdown并保留结构；与本机工具交叉待核验。

**代价与风险：** Python3.10至3.14，可选依赖按格式安装，本地转换，OCR可选需LLM密钥。；自我说明为面向文本分析而非高保真转换，安全和权限风险需留意。

**部署前核查：** 核查README安全注意事项与各可选依赖extra名称。

### [Stirling-Tools/Stirling-PDF](projects/594155488.md)

**为什么值得：** 可为Codex补充本地私有PDF批处理与OCR能力

**重叠与增量（未核对安装清单）：** 与已有PDF/OCR能力存在交叉，自托管API与批量流程或为增量待核验

**代价与风险：** Docker或Java运行时；OCR模型下载；Windows需Docker实测；许可与商业版边界不明，OCR与转换质量未验证

**部署前核查：** 核查LICENSE、Docker镜像标签与API文档鉴权方式

### [K-Dense-AI/scientific-agent-skills](projects/1079456184.md)

**为什么值得：** 为Codex补充成体系的科研领域技能与数据库工作流。

**重叠与增量（未核对安装清单）：** 与已有文献检索、写作润色和绘图有交叉；增量在专门科学库与验证约定，待核验。

**代价与风险：** Python环境、部分数据库凭证；按技能逐项安装；API费用未知。；数量大易过载，技能质量与安全性需抽样审查。

**部署前核查：** 核查docs/skills.md目录、单个SKILL.md样例、LICENSE.md与skill-tests工作流。

### [microsoft/playwright](projects/221981891.md)

**为什么值得：** 为Codex增添浏览器自动化与端到端网页测试能力

**重叠与增量（未核对安装清单）：** 与已有PDF/文档处理有交叉，网页操作与测试环节可能形成增量

**代价与风险：** 需Node.js；Windows可用；包体与浏览器下载占用磁盘；无API费用；MCP与CLI的调用行为、网络与凭证权限尚未验证

**部署前核查：** 核查README中CLI与MCP段落及包名即可，不预先安装

### [opendatalab/MinerU](projects/765083837.md)

**为什么值得：** 增强论文与文档解析为结构化Markdown的质量

**重叠与增量（未核对安装清单）：** 与已有PDF处理交叉，增量在公式表格与扫描件还原

**代价与风险：** Python与模型下载，可能需GPU，License需核实；授权条款与算力门槛未确认

**部署前核查：** 核查官方部署文档与许可证文件

### [54yyyu/zotero-mcp](projects/953089294.md)

**为什么值得：** 让Codex直连本地Zotero库检索、阅读与标注文献

**重叠与增量（未核对安装清单）：** 与已有文献检索和读论文能力存在明显交叉，本地库访问与标注回写为潜在增量；本机组件待核验

**代价与风险：** Windows需Python 3.10+、Zotero 7+开启本地API；MCP或技能两种接入；写入需授权；写入操作可能改动库内容；语义搜索扩展与嵌入费用未评估

**部署前核查：** 核查快速开始中的Zotero设置、安装命令、技能安装说明与MIT许可文件

### [ocrmypdf/OCRmyPDF](projects/15333471.md)

**为什么值得：** 为扫描文献批量补OCR文本层，提升检索与复制可用性。

**重叠与增量（未核对安装清单）：** 与PDF处理能力交叉，增量待核验。

**代价与风险：** 需Python、Tesseract与Ghostscript，本地运行无API费用。；Windows安装与语言包配置风险未验证。

**部署前核查：** 核查文档中Windows安装页及中文语言包说明。

### [PDFMathTranslate/PDFMathTranslate](projects/853189791.md)

**为什么值得：** 为Codex补版式保留的PDF双语翻译，可对接文献阅读。

**重叠与增量（未核对安装清单）：** 与已有读论文、PDF处理存在交叉，增量在公式表格保真。

**代价与风险：** Python 3.11-3.12；翻译服务API Key或本地Ollama。；AGPL许可与外部API费用、模型下载网络问题未验证。

**部署前核查：** 核查pdf2zh命令、翻译服务配置与MCP入口文件。

### [plotly/plotly.js](projects/45646037.md)

**为什么值得：** 为科研图表提供交互式、可导出的JavaScript渲染能力。

**重叠与增量（未核对安装清单）：** 与已有科研绘图在输出形态上存在交叉，交互渲染增量待核验。

**代价与风险：** Windows需Node或浏览器；MIT许可，无需API费用。；CDN与MathJax外部依赖在离线环境未验证。

**部署前核查：** 核查dist包的加载方式与MathJax示例文件

### [anthropics/skills](projects/1061953414.md)

**为什么值得：** 提供技能规范、模板与文档类实现范式，可用于设计自研技能结构。

**重叠与增量（未核对安装清单）：** 与已有文档处理、论文写作能力存在主题交叉，规范与模板结构属潜在增量，待核验。

**代价与风险：** 看规范与模板无需运行时；实际加载依赖Claude Code插件机制，Codex适配未证。；部分技能source-available，授权边界与非Claude环境兼容性未验证。

**部署前核查：** 核查spec目录规范文件、template目录模板与docx/pdf/pptx/xlsx子目录的授权声明。

### [getzep/graphiti](projects/840056306.md)

**为什么值得：** 为科研知识图谱与引用关系提供时序事实与混合检索能力。

**重叠与增量（未核对安装清单）：** 已有文献检索与知识图谱兴趣，此项目可补时序事实有效性；与现有检索能力交叉待核验。

**代价与风险：** Python3.10+，需Neo4j等图数据库及OpenAI等LLM密钥，费用未知。；依赖外部图数据库与LLM，小模型易失败，大规模表现未知。

**部署前核查：** 核查README安装段所列Neo4j/FalkorDB版本与依赖清单。

### [DeusData/codebase-memory-mcp](projects/1166102148.md)

**为什么值得：** 为Codex补上代码库知识图谱检索、调用链追踪与影响分析，降低大仓库上下文成本。

**重叠与增量（未核对安装清单）：** 与已有代码理解与检索能力存在交叉，图谱化查询与Cypher接口为潜在增量，待核验。

**代价与风险：** 需下载对应平台二进制并配置MCP客户端；Windows有PowerShell脚本；无API密钥要求，MIT许可。；性能与省token数据为作者自报，Windows安装与索引行为未验证。

**部署前核查：** 核查install.ps1的Windows分支、release资产架构与README中MCP配置示例文件。

### [ucbepic/docetl](projects/826111692.md)

**为什么值得：** 为批量文档数据处理提供声明式LLM流水线与自动优化。

**重叠与增量（未核对安装清单）：** 与已有PDF/Excel处理在数据加工环节有交叉，优化与并行是潜在增量。

**代价与风险：** Python环境与LLM API密钥，调用产生费用。；API成本与Windows兼容性未验证。

**部署前核查：** 核查README安装段与quickstart-claude-code文档中的Skill定义方式。

### [mesa/mesa](projects/24245737.md)

**为什么值得：** 为Codex增加智能体建模、复杂系统仿真与结果分析能力。

**重叠与增量（未核对安装清单）：** 与现有数据分析与绘图能力可衔接，仿真侧增量待核验。

**代价与风险：** 需Python环境，viz/network等依赖需选装；Windows可行性待验证。；预发布版本API变动与可视化后端兼容性未知。

**部署前核查：** 核查pyproject依赖组、README-quick-start与示例模型目录。

### [shcherbak-ai/contextgem](projects/871373324.md)

**为什么值得：** 为文档结构化抽取提供声明式管道、溯源与概率判定。

**重叠与增量（未核对安装清单）：** 已有PDF与Office处理及论文阅读，此项目可补带来源引用的结构化字段抽取；与本机能力交叉待核验。

**代价与风险：** Python，通过LiteLLM接云端或本地LLM，可含决策模型，费用未知。；小模型可能不遵循抽取指令，1.0版本有迁移破坏性变更。

**部署前核查：** 核查README中llms.txt文档索引与迁移指南所涉类名参数。

### [virgiliojr94/book-to-skill](projects/1226123343.md)

**为什么值得：** 生成按需加载的书籍与文档技能

**重叠与增量（未核对安装清单）：** 与已有读论文和PDF能力交叉，增量在跨代理技能封装

**代价与风险：** 需Python提取器、可选PDF工具链与宿主技能目录写入权限；转换质量与token节省均为作者自述，缺独立验证

**部署前核查：** 核查scripts/extract.py的--check依赖清单与SKILL.md规范

### [Hylouis233/bibverify](projects/1074176989.md)

**为什么值得：** 为Codex补充BibTeX条目核验与元数据校正，减少引用错误

**重叠与增量（未核对安装清单）：** 已有文献检索与引用管理相关能力，这里侧重条目的多源一致性与非破坏性合并，具体交集待核验

**代价与风险：** Python 3.11–3.14；部分源需邮箱或免费API密钥；Windows支持已声明；多源匹配阈值与自动更新阈值默认设置需按需调整，误判风险未知

**部署前核查：** 核查cli入口、MCP server配置与config_template.json字段

### [assafelovic/gpt-researcher](projects/639835356.md)

**为什么值得：** 可补充多代理深度研究与带引用长报告生成能力

**重叠与增量（未核对安装清单）：** 与既有文献检索、写作与PDF导出能力交叉，深层递归研究可能为增量待核验

**代价与风险：** Python 3.12+、OPENAI_API_KEY与TAVILY_API_KEY，可选Google密钥；有API费用；成本与抓取稳定性未验证，外部网页内容不可信，需人工复核引用

**部署前核查：** 核查requirements.txt依赖、main.py入口与MCP配置示例的有效性

### [op7418/guizang-ppt-skill](projects/1219042200.md)

**为什么值得：** 为 Codex 增加单文件 HTML 幻灯片与演讲者模式生成链路。

**重叠与增量（未核对安装清单）：** 与已有 PPT 生成能力存在功能交叉，HTML 与排练模式为潜在增量。

**代价与风险：** 需 Node/npx、可写文件系统；配图需图像生成 API。；AGPL 许可与第三方脚本行为需审慎核查。

**部署前核查：** 核查 SKILL.md、assets 模板与 scripts 下校验器的实际文件。

### [pdfcpu/pdfcpu](projects/94702367.md)

**为什么值得：** 为批量PDF校验、合并、水印提供本地命令行能力

**重叠与增量（未核对安装清单）：** 与已有PDF处理能力存在能力交叉，增量在脚本化批处理与校验

**代价与风险：** 需Go构建或下载对应平台二进制，无API费用；Windows下可执行文件与字体兼容性未验证

**部署前核查：** 核查README安装链接与pkg/api样例、LICENSE文件

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
