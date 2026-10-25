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

### [pyvista/pyvista](projects/92974124.md)

**为什么值得：** 为科研绘图增加3D网格与体渲染能力

**重叠与增量（未核对安装清单）：** 与已有科研绘图存在潜在交叉，3D增量待核验

**代价与风险：** Python 3.10+与VTK，Windows图形后端；无头渲染与CLI输出格式未验证

**部署前核查：** 核查安装文档与CLI参考页

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

### [marcomusy/vedo](projects/110261047.md)

**为什么值得：** 基于VTK的3D科研可视化与分析，补三维网格、体数据渲染能力

**重叠与增量（未核对安装清单）：** 与科研绘图交叉，三维网格与体数据为潜在增量

**代价与风险：** pip安装，依赖VTK与图形驱动；Windows可交互窗口需显卡支持；大体积数据性能与显存占用未知，GUI依赖未验证

**部署前核查：** 核查setup依赖与examples/notebooks示例，确认Windows渲染后端

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

### [dathere/qsv](projects/320463703.md)

**为什么值得：** 高速表格数据处理，覆盖CSV/Excel转换、统计与数据字典。

**重叠与增量（未核对安装清单）：** 与已有Excel/PDF处理交叉，增量在命令行批处理与FAIR化。

**代价与风险：** Windows有构建流水线；部分AI命令需OpenAI兼容API费用。；License为Other未声明，AI功能外部依赖未验证。

**部署前核查：** 核查README许可证段、.claude/skills文档与Windows二进制发布。

### [grobidOrg/grobid](projects/5797013.md)

**为什么值得：** 为文献PDF转结构化TEI与引用解析增加服务能力

**重叠与增量（未核对安装清单）：** 与已有读论文能力交叉，结构化元数据抽取增量待核验

**代价与风险：** 需Java或Docker服务，Windows原生支持不保证，DL模型需Python可选GPU；部署体量与模型下载较大，Windows路径未验证

**部署前核查：** 核查Docker镜像说明、服务API文档与Windows兼容说明

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

### [dswah/pyGAM](projects/79413341.md)

**为什么值得：** 为Codex增加可解释非线性回归与效应图分析能力。

**重叠与增量（未核对安装清单）：** 与已有数据处理/绘图能力存在交叉，GAM建模与部分依赖图是潜在增量。

**代价与风险：** Windows装Python与pygam；可选MKL加速；无API费用。；新版Python兼容与性能未验证。

**部署前核查：** 核查setup/依赖声明与教程笔记本是否可复现。

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

### [GXL-ai/paperclip](projects/1209893338.md)

**为什么值得：** 为Codex增加生物医学文献全文检索、并行AI阅读与SQL查询能力

**重叠与增量（未核对安装清单）：** 与已有文献检索、读论文能力交叉，虚拟文件系统与map/reduce为潜在增量，待核验

**代价与风险：** 需Python 3.8+、登录账号与API Key，服务端AI功能可能产生费用，Windows需确认安装脚本兼容性；README安装脚本为curl管道，实验节选不完整；服务端依赖与数据处理合规未知

**部署前核查：** 核查发布页安装方式、Codex skill安装产物、MCP鉴权与计费说明

### [jsvine/pdfplumber](projects/41279279.md)

**为什么值得：** 为Codex补强PDF表格与字级定位抽取能力

**重叠与增量（未核对安装清单）：** 与已有PDF处理能力能力交叉，增量在表格与坐标级细节

**代价与风险：** Windows+Python 3.10+，pip安装；MIT无API费用；扫描件与复杂表格效果未验证

**部署前核查：** 查看examples目录与表格抽取演示，先试样例PDF

### [oomol-lab/pdf-craft](projects/931354511.md)

**为什么值得：** 为Codex补扫描PDF到Markdown/EPUB的OCR与翻译流水线

**重叠与增量（未核对安装清单）：** 与已有PDF读取、翻译和文档处理能力有交叉，结构化重排与EPUB产出为潜在增量；本机组件待核验

**代价与风险：** Windows需Python 3.11–3.13与Poppler；本地OCR需CUDA与显存，远程OCR需端点与密钥；扫描质量与版式影响结果；远程OCR会外发页面内容，隐私需评估

**部署前核查：** 核查安装指南中的Poppler步骤、OCR后端文档与许可文件

### [antvis/G6](projects/81810486.md)

**为什么值得：** 可为Codex增加知识图谱与关系网络的可视化引擎能力。

**重叠与增量（未核对安装清单）：** 与现有科研绘图交叉，增量在关系图布局与交互分析，待核验。

**代价与风险：** Windows需Node/npm；浏览器渲染；GPU布局需硬件支持；无API费用。；布局性能与自定义元素复杂度未验证。

**部署前核查：** 核查package.json依赖、examples示例及布局插件文档。

### [yt-project/yt](projects/88776493.md)

**为什么值得：** 可为科研体数据提供切片、投影、体渲染与派生场分析，扩展科学可视化能力。

**重叠与增量（未核对安装清单）：** 与已有科研绘图在图表层交叉，差别在体积数据与专业场分析，待核验。

**代价与风险：** Python环境，可选并行/渲染后端；数据规模与显存要求待查。；许可条款不明、Windows渲染兼容性与大文件性能均未验证。

**部署前核查：** 核查LICENSE、安装文档与quickstart笔记本中的渲染依赖说明。

### [man-group/dtale](projects/196968829.md)

**为什么值得：** 为pandas数据提供一键交互式EDA、图表与代码导出能力。

**重叠与增量（未核对安装清单）：** 与已有数据处理能力交叉明显，增量在可视化探查与代码导出，待核验。

**代价与风险：** Python与pip，浏览器访问本地端口，无API费用。；Windows防火墙可能拦截本地服务页面。

**部署前核查：** 核查dtale.show在Windows防火墙下的访问配置与依赖版本。

### [KalarisLabs/research-agent-skills](projects/1292263276.md)

**为什么值得：** 可按需加载文献、引用核验、统计与写作方法技能。

**重叠与增量（未核对安装清单）：** 与已有文献检索、润色、绘图交叉；增量在PRISMA与rebuttal流程。

**代价与风险：** 需Agent Skill运行时；部分技能需外部依赖与API。；技能质量差异、基准未独立复现。

**部署前核查：** 核查skills/literature-review/SKILL.md与citation-verification目录。

### [firecrawl/pdf-inspector](projects/1151702019.md)

**为什么值得：** 为 PDF 文献提供快速分类与 Markdown 抽取

**重叠与增量（未核对安装清单）：** 与已有 PDF 处理能力可能交叉，增量待核验

**代价与风险：** Python/Node/Rust 任一环境；OCR 需额外运行库；抽取质量在不同版式下未知

**部署前核查：** 核查 docs/python.md 与 OCR 运行时安装说明

### [iamgio/quarkdown](projects/750550657.md)

**为什么值得：** 为Codex增加Markdown到论文、幻灯片、书籍、知识库的一源多目标排版能力。

**重叠与增量（未核对安装清单）：** 与现有论文写作、PPT生成、PDF处理存在能力交叉，增量在Turing完备的Markdown扩展与多目标编译。

**代价与风险：** Kotlin/JVM运行时或发布版可执行文件，Windows安装方式与GPL-3.0条款需核查。；脚本化文档编译的安全权限模型与Windows兼容性未验证。

**部署前核查：** 核查README安装说明、VS Code扩展与agentskill评测页，确认Windows可执行文件形态。

### [brycewang-stanford/Awesome-Journal-Skills](projects/1248879346.md)

**为什么值得：** 按目标期刊定制科研写作与投稿流程

**重叠与增量（未核对安装清单）：** 与已有论文写作、绘图能力交叉，增量在期刊级规范

**代价与风险：** 技能为Markdown但可能依赖Stata与外部平台，费用未知；数量庞大但质量与真实性未逐项验证

**部署前核查：** 核查shared-resources/venue-index.tsv与单个期刊包的SKILL.md

### [xr843/fojin](projects/1177921872.md)

**为什么值得：** 为古文献与宗教文本提供带URN引用的检索与引文核验

**重叠与增量（未核对安装清单）：** 与已有文献检索交叉，增量在三语对勘与逐字引用校验待核验

**代价与风险：** 可直连托管MCP，或本地Docker+pgvector+Elasticsearch；引文核验正确性与数据许可边界未验证

**部署前核查：** 核查mcp-server/README.md与/api/verify/quote行为，确认许可证范围

### [lin1111-1/academic-integrity-rewrite](projects/1331532226.md)

**为什么值得：** 为Codex提供保留数字、单位、公式与引文的学术改写与本地审计

**重叠与增量（未核对安装清单）：** 与论文润色、引用管理能力有交叉，增量在确定性的受保护事实核对脚本

**代价与风险：** Python 3.10+与Git；Skill复制到.agents/skills，无第三方依赖；审计仅报变更不判对错，叙述式引文不识别需人工回查

**部署前核查：** 核查skills/academic-integrity-rewrite/SKILL.md与scripts/audit_revision.py，及examples用例

### [ai4s-research/open-science](projects/1288102626.md)

**为什么值得：** 本地面向科研的AI工作台，整合智能体、MCP、技能、可复现产物与溯源，与文献、绘图、实验分析兴趣高度契合

**重叠与增量（未核对安装清单）：** 与已有文献检索、读论文、绘图、PDF处理能力存在交叉，其可审计溯源、运行记录、MCP连接器与本地优先架构属潜在增量，待核验

**代价与风险：** Tauri桌面应用，支持Windows；需自带模型与API Key，可能产生费用；许可为NOASSERTION需核对；技能与MCP连接器需逐个配置；许可证非标准MIT（README徽章称MIT但元数据为Other），模型费用、科学连接器可用性与安全性未验证

**部署前核查：** 核查packages/sdk、内置ai4s-agent技能、MCP连接器与LICENSE文件，确认Windows安装包与OpenCode侧车版本

### [getomni-ai/zerox](projects/831872524.md)

**为什么值得：** 为Codex补充基于视觉模型的PDF/扫描件OCR与结构化字段抽取能力。

**重叠与增量（未核对安装清单）：** 与现有PDF处理、文献阅读存在任务交叉，增量在视觉模型OCR与schema抽取，需核验。

**代价与风险：** Node或Python包，PDF转图需graphicsmagick/ghostscript或poppler，需视觉模型API密钥。；依赖外部视觉模型，费用随页数增长，Windows下PDF转图依赖未验证。

**部署前核查：** 核查Node与Python两份README的Windows依赖说明及schema抽取示例。

### [enoch3712/ExtractThinker](projects/751474418.md)

**为什么值得：** 为文档字段化抽取与校验增加结构化管线能力

**重叠与增量（未核对安装清单）：** 与已有PDF处理交叉，增量在Pydantic契约与分类拆分

**代价与风险：** Python 3.9-3.13，模型API key，部分功能需从源码安装；MCP与并行抽取未发布正式版

**部署前核查：** 核查mcp-container.md与pypdf加载器文档

### [hanlulong/econ-writing-skill](projects/1159184254.md)

**为什么值得：** 为Codex增加经济学论文写作的结构化公式与质量审校能力。

**重叠与增量（未核对安装清单）：** 与既有论文写作润色能力存在显著交叉，经济学专门公式的潜在增量待核验。

**代价与风险：** 需Codex或Claude Code客户端，按仓库INSTALL.md安装，无需额外付费服务。；非经济学写作适用性有限，引用正确性仍需人工核验。

**部署前核查：** 核查README的Usage、SKILL.md与INSTALL.md中的安装与验证步骤。

### [1692775560/dsh-Mimir-Academic-research](projects/1340749561.md)

**为什么值得：** 把文献、实验、LaTeX、图表与远程GPU编排整合为工作台，为Codex补齐科研流水线视图。

**重叠与增量（未核对安装清单）：** 与已有文献检索、论文写作与科研绘图能力交叉，九视图工作台、实验追踪与GPU任务编排是待核验的潜在增量。

**代价与风险：** 需Node.js≥22、dsh CLI与DEEPSEEK_API_KEY，LaTeX引擎及可选Zotero；Windows支持未知。；版本兼容、远程服务器凭据与API费用风险未验证。

**部署前核查：** 核查README的Quickstart、版本兼容表、配置项与技术栈，确认Windows与LaTeX引擎方案。

### [growgraph/ontocast](projects/958212587.md)

**为什么值得：** 为Codex增加文档到知识图谱的本体化抽取与校验能力

**重叠与增量（未核对安装清单）：** 与已有PDF解析、读论文能力交叉，增量在本体抽取、SHACL校验与溯源

**代价与风险：** Python环境、LLM API Key、可选Fuseki与向量库，有模型调用费用；抽取质量与长文档成本未经本机验证

**部署前核查：** 核查pyproject依赖、ontocast入口与server/LLM配置文档

### [drpwchen/paper-fetch](projects/1296248129.md)

**为什么值得：** 可增加DOI到全文PDF的获取与JSON结构化输出。

**重叠与增量（未核对安装清单）：** 与已有PDF处理交叉；增量在出版商路由与权限核查。

**代价与风险：** Python 3.10+、Playwright、Unpaywall邮箱、可选TDM key与代理。；权限误判、反爬、版权合规。

**部署前核查：** 核查config.example.yaml、library_session.py的ROUTES表与AGENTS.md。

### [ZimoLiao/scholaraio](projects/1177129875.md)

**为什么值得：** 为代理提供文献库底座、引用与写作工作流，扩展科研上下文。

**重叠与增量（未核对安装清单）：** 已有文献检索与论文读写能力，此处补项目记忆与可追溯引用，潜在增量待核验。

**代价与风险：** 需Python 3.10+、pip安装及一次性setup，本地数据目录与索引需配置。；大规模索引性能、外部工具适配器稳定性及数据迁移风险未验证。

**部署前核查：** 核查AGENTS.md与.agents/skills/目录及scholaraio setup的配置项。

### [microsoft/UFO](projects/740316987.md)

**为什么值得：** 可为Codex增加Windows桌面GUI自动化与跨设备任务编排能力

**重叠与增量（未核对安装清单）：** 与已有执行器在自动化上交叉，GUI操作与DAG编排为潜在增量

**代价与风险：** Python3.10/3.11、Windows；LLM API密钥；Galaxy需多设备与网络；GUI代理误操作风险、API费用与Galaxy成熟度均未验证

**部署前核查：** 核查ufo目录README、requirements与快速开始文档

### [coleam00/Archon](projects/929121414.md)

**为什么值得：** 为Codex提供可复用YAML工作流与验证门禁

**重叠与增量（未核对安装清单）：** 与已有DF执行器、论文写作有流程交叉，增量待核验

**代价与风险：** 需Bun、GitHub CLI及Claude/Codex provider，API费用未知；Windows下provider与worktree行为未验证

**部署前核查：** 核查.archon/workflows示例与provider配置文档

### [uditgoenka/autoresearch](projects/1180917769.md)

**为什么值得：** 为Codex增加指标驱动自动迭代、自动回滚与实验日志

**重叠与增量（未核对安装清单）：** 与已有执行器调度和代码写作交叉，增量在机械验证闭环待核验

**代价与风险：** Node 18+、git仓库、Codex插件安装；Windows需Git Bash；无人监督的反复提交与回滚风险未验证

**部署前核查：** 核查releases中Codex安装说明与scripts目录，确认hooks是否可用

### [PiaoyangGuohai1/cli-anything-zotero](projects/1200123073.md)

**为什么值得：** 给Codex增加命令行式Zotero库检索、导入、PDF与BibTeX导出、DOCX引用渲染能力

**重叠与增量（未核对安装清单）：** 与已有文献检索、PDF处理、Word引用能力存在交叉，增量在直连本地Zotero库并批量写回

**代价与风险：** 需Python 3.10+、Zotero 7/8/9桌面端常驻运行并装JS Bridge插件；动态DOCX引用还需LibreOffice及Zotero LO插件；Windows下动态引用自动化未端到端验证，写入操作需审计；旧MCP已冻结于0.9.5

**部署前核查：** 核查zotero-cli app ping、app plugin-status、docx doctor在Windows与Zotero版本上的实际输出

### [xiehuan123/dsh-deepread](projects/1334924880.md)

**为什么值得：** 为Codex增加主张-证据配对、证据缺失标注与知识图谱导出流程。

**重叠与增量（未核对安装清单）：** 与已有读论文、科研绘图交叉，五模式与引用定位规则为待核验增量。

**代价与风险：** 便携Skill零依赖；插件形态需Node 22.19+与DSH宿主，模型调用产生API费用。；批量与全书模式调用次数多、成本高；解析失败处理未验证。

**部署前核查：** 核查skills/dsh-deepread/SKILL.md与examples/示例报告质量。

### [genspark-ai/genoffice](projects/1318187016.md)

**为什么值得：** 通过CLI/MCP让Agent本地读写真实docx/xlsx/pptx与PDF

**重叠与增量（未核对安装清单）：** 与已有Office/PDF处理能力高度交叉，字节保留与修订回滚为潜在增量

**代价与风险：** Windows安装包或CLI；需自备模型Key，存在API费用；AI修改正确性、计费与隐私未验证，MCP权限范围未知

**部署前核查：** 核查releases中的Windows安装包、genoffice CLI说明与MCP服务器配置

### [dhondta/zotero-cli](projects/321932121.md)

**为什么值得：** 为Codex补充Zotero引用排序、筛选、导出与本地问答能力

**重叠与增量（未核对安装清单）：** 与已有文献检索、PDF处理存在交叉，增量在PageRank排序与批量导出待核验

**代价与风险：** Python与pyzotero，需Zotero Web API密钥；可选GPT依赖需本地模型；GPL-3.0许可，凭据缓存路径与共享库访问权限未验证

**部署前核查：** 核查pyproject依赖、creds.txt权限逻辑与GPT可选依赖

### [deltadbu/WIT-skill](projects/1345802690.md)

**为什么值得：** 为科研写作提供提问生成、证据对齐与论文逻辑审计的思维脚手架能力

**重叠与增量（未核对安装清单）：** 与已有论文写作润色、读论文能力有交叉，增量在假设竞争与Results/Discussion分层推理

**代价与风险：** 需支持SKILL.md的Agent Skills；Windows下或用参考文档直接提示；无需API费用；未验证技能在Codex中的加载方式与CAS内容是否冲突；拆分许可边界需核对

**部署前核查：** 核查wit/SKILL.md与wit/references下的框架文档，确认可加载性

### [aloth/olcli](projects/1147798916.md)

**为什么值得：** 为 Codex 增加 Overleaf 项目拉推同步、远程编译与 latexdiff 修订输出。

**重叠与增量（未核对安装清单）：** 与已有论文写作、PDF 处理属同一链路的能力交叉，云端项目同步与 git remote 为潜在增量。

**代价与风险：** 需 Node 运行时；认证需 Overleaf 账号或 Cookie，Windows 下安装与登录方式待核。；Cookie 凭证保管与远端覆盖风险尚未验证。

**部署前核查：** 核查 README 认证章节、docs/MCP.md 与 docs/GIT-REMOTE.md 是否适用本机。

### [Linwei-Chen/paper-deep-reader-skill](projects/1319373413.md)

**为什么值得：** 为Codex补上单篇论文六段式精读与图表逐张证据化讲解流程。

**重叠与增量（未核对安装清单）：** 与已有读论文、论文写作能力存在交叉，术语分层与图表邻接规则属待核验增量。

**代价与风险：** 需git克隆到Codex skills目录；无需额外API费用，模型调用沿用宿主。；技能指令可能覆盖用户既有阅读偏好；输出长度与引用可靠性未验证。

**部署前核查：** 核查SKILL.md、references/report-template.md与.paper-reader.yaml字段。

### [yang3kc/daily_arxiv_digest](projects/729260816.md)

**为什么值得：** 可加每日论文自动打分摘要能力。

**重叠与增量（未核对安装清单）：** 与已有文献检索交叉，增定时与阈值重排。

**代价与风险：** 技能需Python3，流水线需API Key与uv。；Windows定时与API费用尚未验证。

**部署前核查：** 核查skills/arxiv-fetch/SKILL.md与config.example.json。

### [plotly/dash](projects/33702544.md)

**为什么值得：** 为Codex补充把Python分析代码转为可交互数据应用的能力

**重叠与增量（未核对安装清单）：** 与已有科研绘图存在能力交叉，交互式Web应用为潜在增量

**代价与风险：** Windows需Python与pip安装dash，浏览器运行，免费开源；Callback交互性能与部署方式未验证

**部署前核查：** 部署前核查README的getting-started教程与dash.gallery示例

### [SamurAIGPT/llm-wiki-agent](projects/630824392.md)

**为什么值得：** 以AGENTS.md驱动的自维护wiki，可为Codex增加知识图谱与文献归档流程

**重叠与增量（未核对安装清单）：** 与已有文献检索、读论文、知识图谱兴趣交叉，增量待核验

**代价与风险：** 只需agent读配置；非md文件依赖markitdown转换；MIT免费；作者宣称无需API key，实际依赖agent能力；生成质量未验证

**部署前核查：** 核查AGENTS.md、commands目录与依赖清单，确认markitdown用法

### [jacob-bd/gemini-notebook-mcp-cli](projects/1121438740.md)

**为什么值得：** 为Codex增加驱动NotebookLM笔记本、生成音视频产物的通道。

**重叠与增量（未核对安装清单）：** 与已有读论文、文献检索能力存在交叉；增量可能在于笔记本来源管理与音频、幻灯片产出，尚待核验。

**代价与风险：** Windows上需要Python或uv、Google账号，并依赖外部服务，可能有配额限制。；登录凭据存储与账号策略尚未验证，项目的云端服务接口可能变动。

**部署前核查：** 核查README中`nlm setup`所涉及的技能安装路径、MCP配置文件及`docs/AUTHENTICATION.md`凭据说明。

### [Astro-Han/karpathy-llm-wiki](projects/1201775166.md)

**为什么值得：** 为Codex加知识编译层：源料沉淀成可引用wiki页并做一致性检查。

**重叠与增量（未核对安装清单）：** 与读论文、文献检索能力交叉明显；增量在于持久化跨链与lint流程，需核验。

**代价与风险：** 复制SKILL.md等文件到skill目录，可能需Python脚本支持。；摄取与lint效果未验证，脚本在Windows兼容未知，语料版权需自控。

**部署前核查：** 核查SKILL.md、scripts目录与examples示例，确认依赖与许可。

### [gaogaotiantian/viztracer](projects/285134677.md)

**为什么值得：** 为Python代码提供低开销执行追踪与火焰图，辅助性能调试。

**重叠与增量（未核对安装清单）：** 与已有执行器无直接交叉，属性能剖析增量待核验。

**代价与风险：** Windows可pip安装，需Python与浏览器，无API费用。；追踪开销与兼容性未实测。

**部署前核查：** 核查README的pip安装与vizviewer用法。

### [blader/humanizer](projects/1136666433.md)

**为什么值得：** 为文本改写增加AI特征检测与去腔调流程，可辅助写作润色环节。

**重叠与增量（未核对安装清单）：** 与已有写作润色能力交叉，新增的是可枚举的AI痕迹检查清单。

**代价与风险：** README给出npx skills与--agent codex的安装路径，需Node与技能目录权限。；改写可能改变原文语气或事实，中文适配效果尚未验证。

**部署前核查：** 核查仓库SKILL.md内容、26模式表完整条目与LICENSE文件。

### [llmsresearch/paperbanana](projects/1149807548.md)

**为什么值得：** 为论文提供自动配图与统计图生成能力

**重叠与增量（未核对安装清单）：** 与已有科研绘图能力可能高度交叉，增量待核验

**代价与风险：** Python 3.10+，需 OpenAI/Azure/Gemini 密钥，产生 API 费用；生成结果的学术准确性未经审阅，存在错误风险

**部署前核查：** 核查 MCP 服务声明与示例输入输出目录，确认许可与密钥要求

### [ai4s-research/ai4s-skills](projects/1282340577.md)

**为什么值得：** 补强选题探索、综述写作与论文完整性审计的流程化技能

**重叠与增量（未核对安装清单）：** 与已有文献、写作、绘图、PDF能力有交叉，新增实验包与审计环节待核验

**代价与风险：** 需Python、LaTeX与本地技能目录；无强制API费用；引用真实性与图表质量仅为作者主张，安装脚本Windows支持未验证

**部署前核查：** 核查skills/*/SKILL.md、tools/validate_skills.py与examples/fno-burgers产物

### [eseifert/altero](projects/51662900.md)

**为什么值得：** 可为引用管理与文献库同步提供自托管后端，强化科研数据自主掌控。

**重叠与增量（未核对安装清单）：** 与Codex现有文献检索和引用管理能力交叉明显，自托管增量待核验。

**代价与风险：** 需Docker或Python 3.14、SQLite或PostgreSQL，Windows宜用Docker；无API费用。；beta稳定性、数据迁移不可逆与AGPL义务均未验证。

**部署前核查：** 核查docker/compose.yaml、CHANGELOG与docs/client-compatibility.md。

### [yymao/adstex](projects/42411546.md)

**为什么值得：** 从TeX引用键自动生成并更新BibTeX条目，补文献条目获取环节

**重叠与增量（未核对安装清单）：** 与已有文献检索、论文写作润色在引用条目生成上交叉，具体增量待核验

**代价与风险：** 需Python、NASA ADS账号与ADS_API_TOKEN环境变量；Windows需配置环境变量；未验证Windows下conda/pip安装、ADS接口与速率的稳定性

**部署前核查：** 核查setup.py或pyproject的入口脚本、README的token配置段与实际发布包

### [FengZhenfei/carrel](projects/1392498172.md)

**为什么值得：** 为Codex补充本体增强的知识库检索与图谱证据

**重叠与增量（未核对安装清单）：** 与已有文献检索交叉，增量在图谱关系与来源可追溯

**代价与风险：** Windows需WSL2+Docker，模型端点与API Key；部署重，模型与存储资源需求未验证

**部署前核查：** 核查deploy.sh、config/knowledge-base.env与carrel-search SKILL.md

### [infusius/masala](projects/1370994072.md)

**为什么值得：** 给Codex提供科研多窗格工作区与自定义面板能力

**重叠与增量（未核对安装清单）：** 与已有文献检索、PDF处理交叉，增量在笔记本同编辑与Agent造面板

**代价与风险：** Windows需Node、pnpm、uv与已登录Codex CLI或OpenAI Key；早期版本，Windows权限提示频繁，结果展示不全

**部署前核查：** 核查apps/server/.env.example与模块MCP入口文件

### [EBISPOT/ols4](projects/496402151.md)

**为什么值得：** 可为本机增加生物医学本体与术语检索能力，服务知识图谱与科研检索场景。

**重叠与增量（未核对安装清单）：** 与已有文献检索、读论文能力存在潜在交叉，本体术语查询可能形成增量，需核验。

**代价与风险：** 需Windows可联网环境或Docker加PostgreSQL，跑本地实例有硬件与时间成本。；远程MCP端点未实测，工具行为、限流与数据许可范围未知。

**部署前核查：** 核查OLS4 MCP端点文档与工具列表，确认许可与调用限制。

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
