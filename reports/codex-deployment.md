# Codex 部署分析

**规则：只提示高价值候选，等你主动说安装后再部署；不每轮询问，不自动安装。**

榜单排名不等于部署许可。Skill、MCP、CLI、代码库、独立应用与参考资料采用不同接入方式。
当前查找器没有安装执行入口，也不会修改 Codex 配置或执行候选仓库命令。

高价值提示门槛：参考分至少 75，DS适配优先级为高，分析未超过30天；仍须核查具体组件、来源、权限、依赖、重叠与回滚方案。

## 高价值核查候选

### [scipy/scipy](projects/1460385.md)

**为什么值得：** 为科研计算与数据处理提供数值算法底座，支撑分析与可视化。

**重叠与增量（未核对安装清单）：** 与已有科研绘图和数据处理能力存在能力交叉，属底层计算库而非现成工具。

**代价与风险：** Windows可用pip或conda安装；BSD-3-Clause；无API费用。；与特定Python版本兼容性需核查，编译依赖可能受限。

**部署前核查：** 核查README中install guide链接与release说明。

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

### [microsoft/playwright](projects/221981891.md)

**为什么值得：** 为Codex增添浏览器自动化与端到端网页测试能力

**重叠与增量（未核对安装清单）：** 与已有PDF/文档处理有交叉，网页操作与测试环节可能形成增量

**代价与风险：** 需Node.js；Windows可用；包体与浏览器下载占用磁盘；无API费用；MCP与CLI的调用行为、网络与凭证权限尚未验证

**部署前核查：** 核查README中CLI与MCP段落及包名即可，不预先安装

### [K-Dense-AI/scientific-agent-skills](projects/1079456184.md)

**为什么值得：** 为Codex补充科学数据库查询、专业包工作流与证据可溯写作技能

**重叠与增量（未核对安装清单）：** 与已有文献检索、论文写作、科研绘图等技能明显重叠；专业数据库与领域包工作流可能有增量，需逐技能对照，本机具体组件尚未核验。

**代价与风险：** Python环境与各技能依赖包，部分数据库需注册或授权，图像生成需OpenRouter密钥；177技能质量与安全扫描结果未逐项核实，MIT许可但含第三方引用

**部署前核查：** 核查skills目录下SKILL.md、skill-requirements.toml与安全扫描工作流

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

### [ThHanke/ontosphere](projects/1049705027.md)

**为什么值得：** 通过MCP暴露43个图谱工具，让Codex可读写RDF、跑OWL推理并取用一致性修复建议。

**重叠与增量（未核对安装清单）：** 与已有科研绘图、知识图谱相关能力交叉在可视化呈现，推理校验与代理编辑溯源属潜在增量，待核验。

**代价与风险：** 走浏览器modelContext接口，需支持WebMCP的浏览器或polyfill；本地无后端。；MCP桥接稳定性、大图推理内存占用与License一致性均未验证。

**部署前核查：** 核查README的MCP工具清单、/.well-known/mcp.json清单与LICENSE文件，再看Relay设置文档。

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

### [PDFMathTranslate/PDFMathTranslate](projects/853189791.md)

**为什么值得：** 为Codex补充PDF论文双语翻译并保留公式排版的能力

**重叠与增量（未核对安装清单）：** 与已有论文阅读、PDF处理和全文对照阅读流程重叠；保留原版式的翻译输出是否提供增量需实际比较，不能认定本机缺少此能力。

**代价与风险：** 需Python3.11-3.12或Windows安装包，翻译需OpenAI等API密钥或本地Ollama，Windows或用vc_redist.x64；AGPL-3.0许可影响二次分发，翻译模型与API费用未验证

**部署前核查：** 核查pdf2zh PyPI包、Windows ZIP资产与Zotero插件仓库是否可用

### [kestra-io/kestra](projects/204164353.md)

**为什么值得：** 可编排数据与 AI 流程，并通过 MCP 或 Agent Skills 暴露给 Codex。

**重叠与增量（未核对安装清单）：** 与已有执行器、自动化能力存在交叉，声明式编排与 MCP 暴露为潜在增量。

**代价与风险：** Docker 或 JVM 部署，Apache-2.0，AI 功能可能需外部模型 API。；未验证 Windows 部署、插件权限与 MCP 暴露的安全边界。

**部署前核查：** 核查 MCP 服务端与 Agent Skills 文档、许可证及部署要求。

### [jordan-gibbs/hyperresearch](projects/1206357666.md)

**为什么值得：** 为 Codex 补上多源深研、引用逐句核验与可复用文献 vault 的研究链路。

**重叠与增量（未核对安装清单）：** 与 Codex 既有文献检索、读论文能力高度交叉，学术去重、引用核查与持久 vault 属潜在增量，待核验。

**代价与风险：** 需要 Python 3.11+ 与 pip 安装，Codex 需 workspace-write 与网络访问权限，可能产生模型费用。；Codex 目标当前需从 GitHub 安装，沙箱网络与写入权限的安全边界未验证。

**部署前核查：** 核查 pyproject.toml、安装目标 codex 的脚本与 .codex/hooks.json 的实际内容，确认所需权限。

### [oomol-lab/pdf-craft](projects/931354511.md)

**为什么值得：** 为Codex补扫描PDF到Markdown/EPUB的OCR与翻译流水线

**重叠与增量（未核对安装清单）：** 与已有PDF读取、翻译和文档处理能力有交叉，结构化重排与EPUB产出为潜在增量；本机组件待核验

**代价与风险：** Windows需Python 3.11–3.13与Poppler；本地OCR需CUDA与显存，远程OCR需端点与密钥；扫描质量与版式影响结果；远程OCR会外发页面内容，隐私需评估

**部署前核查：** 核查安装指南中的Poppler步骤、OCR后端文档与许可文件

### [firecrawl/pdf-inspector](projects/1151702019.md)

**为什么值得：** 为 PDF 文献提供快速分类与 Markdown 抽取

**重叠与增量（未核对安装清单）：** 与已有 PDF 处理能力可能交叉，增量待核验

**代价与风险：** Python/Node/Rust 任一环境；OCR 需额外运行库；抽取质量在不同版式下未知

**部署前核查：** 核查 docs/python.md 与 OCR 运行时安装说明

### [brycewang-stanford/Awesome-Journal-Skills](projects/1248879346.md)

**为什么值得：** 按目标期刊定制科研写作与投稿流程

**重叠与增量（未核对安装清单）：** 与已有论文写作、绘图能力交叉，增量在期刊级规范

**代价与风险：** 技能为Markdown但可能依赖Stata与外部平台，费用未知；数量庞大但质量与真实性未逐项验证

**部署前核查：** 核查shared-resources/venue-index.tsv与单个期刊包的SKILL.md

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
