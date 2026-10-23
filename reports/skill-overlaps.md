# 技能重叠与融合建议（2026-10-23）

安装量到 43 个之后，最大的浪费不再是"没装"，而是**同类技能并存、选错或重复装**。
这份清单只做判断依据，不自动改动任何技能。

## 一、重叠簇

| 簇 | 现有成员 | 判断 |
|---|---|---|
| 文献链路 | `literature-review`、`paper-lookup`、`research-lookup`、`citation-management`、`bgpt-paper-search`、`nature-academic-search` | 五个环节各司其职（流程/查库/汇总/引文/证据抽取），**不该合并**，但入口需要一个 |
| 论文写作 | `scientific-writing`、`academic-integrity-rewrite`、`econ-write`、`peer-review`、`paper-deep-reader`、`nature-writing`、`nature-polishing` | 写作/改写/评审三种意图混在一起，**最容易选错** |
| 科研绘图 | `scientific-visualization`、`matplotlib`、`nature-figure`、`visualize`、`mindmap-render`、`markdown-mermaid-writing` | 出版级 vs 细粒度 vs 本机既有，边界清晰但名字不体现 |
| 统计与 ML | `statistical-analysis`、`statistical-power`、`exploratory-data-analysis`、`scikit-learn`、`umap-learn`、`shap`、`networkx` | 方法选择与用具分离，基本不重叠 |
| 阅读与解析 | `paper-deep-reader`、`pdf`、`nature-reader`、`defuddle`、`obsidian-markdown` | 强 PDF vs 网页正文 vs 笔记格式，可共存 |
| 科研流程 | `experiment-suite`、`research-explorer`、`hypothesis-generation`、`scientific-brainstorming`、`research-grants`、`ai4s-*` | 上游探索类，彼此有先后关系而非竞争 |

## 二、三个具体融合提案

**提案 1：`research-writing-hub`（最高优先）**
把 `scientific-writing`、`academic-integrity-rewrite`、`econ-write`、`peer-review` 收进一个入口技能，内部按"起草 / 改写 / 评审 / 回复审稿"四种意图路由。
- 收益：写作类从 4+ 个目录降到 1 个入口，选择歧义消失；
- 代价：原技能需要保留（或改为按需加载的 reference），否则会丢能力；
- 风险：把所有写作技能合并成一个 SKILL.md 会让上下文变长，应做成"入口短 + 四个 reference"。

**提案 2：`figure-hub`**
`scientific-visualization`（多面板、期刊风格）+ `matplotlib`（细粒度）+ `nature-figure`（本机既有）+ `visualize`（本机既有）合并为按"成品图 / 调试图 / 交互预览"三档路由的入口。
- 收益：画图时不再纠结用哪个；
- 代价：本机既有 `nature-figure`、`visualize` 属于权威配置，需先确认归属再动。

**提案 3：`literature-pipeline`**
不是合并工具，而是加一个**流程编排**技能：检索 → 筛选 → 证据抽取 → 引文落库，每一步调用已有成员。
- 收益：把五个工具串成可复用流程，这是当前真正缺的一层；
- 代价：需要定义中间产物（候选清单、证据表、引文库）的存放约定。

## 三、不建议合并的

- `statistical-analysis` 与 `scikit-learn`：一个管方法选择，一个管代码，合并会让两边都变差。
- `paper-deep-reader` 与 `pdf`：深度阅读与格式处理是不同层次。
- `graphify` / `networkx`：一个产图产物，一个做图算法。

## 四、判断依据与未验证

- 重叠判断来自各技能 SKILL.md 的 description 与已装目录清单（`installed-skills.json`），**没有逐个通读全文**，也没有实跑对比效果。
- 融合提案均未实施；实施前应确认本机权威技能（`nature-*`、`visualize`）的归属，避免和主脑的配置冲突。
- 覆盖度：43 个技能里 32 个由 Radar 安装、11 个为本机既有；既有技能的上游来源未追溯。
