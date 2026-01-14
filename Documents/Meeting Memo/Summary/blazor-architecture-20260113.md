> 日期和时间： 2026-01-13 21:08:35
> 地点：[输入地点]
> 与会人员：[输入与会人员]
## 概览
本内容整合了三次关于Blazor分层架构与职责划分的讨论成果，涵盖Data Service、Repository、Process/Business Process的职责边界、命名与组织方式、插入点策略，以及Product Hall领域的聚合结构与处理。重点包括：以组件为单位组织Service，Repository作为对外与业务流程的统一适配层，Process承载纯业务逻辑并以Model为数据形态，避免循环依赖与职责混淆；同时明确近期分工与交付目标，并对命名清理、缓存策略、报表补齐、接口准备度等风险与未决项进行梳理。内容创建于2026-01-13 21:08:35，旨在为后续实现与重构提供一致的架构指引与行动路径。
## 关键主题
- 架构分层与职责定义
  - Data Service作为前端调用唯一入口：Blazor中的数据请求与更新都通过Service，Service再调用Repository获取或提交数据，使页面层更“薄”，专注界面渲染、数据展示与事件响应。
  - Model与ViewModel转换边界：Data Service承担ViewModel与Model的转换；向后调用以Model为主，页面层不直接处理Model转换。Process层基于Model进行业务逻辑与组装拆解。
  - Repository定位：面向与SanjelData服务交互与持久化，倾向以实体为单位组织，负责聚合对象的拆解与更新的适配与调用，并可包含必要的验证与异步封装；作为数据访问层与对外服务聚合器，所有外部集成均通过Repository接入。
  - Service定位：面向UI层的请求响应与拆解，不直接承载复杂业务逻辑；数据请求转发至Repository，逻辑请求委派至Business Process。
  - Business Process定位：面向业务实体的逻辑处理，依赖Model，使用静态方法可单独进行单元测试；典型场景为条件驱动的状态变更与副作用处理。
  - Model原则：与SanjelData的entity保持同构，在项目内复制一份以便前台开发与mock测试，降低对外部模型的强依赖。
- Service组织方式（以页面/组件为单位）
  - 以组件作为命名空间：每个组件下对应一个Service，便于规范与自动生成，保证一致性要求（最多一个、必须一个）。若组件逻辑简单，可自动生成Service以保持一致性。
  - Form视为组件类型：将历史上在components下的非Form条目统一迁移到component命名空间更清晰。
  - 示例与命名：将schedule product hall迁至component目录，并建立对应的Service（讨论命名为hub line service或hall blank service），页面中的数据请求全部通过该Service实现。
- Process层的职责与复用
  - Process只做业务逻辑与数据组装：依赖Model进行组合、拆解、装配等逻辑，不直接承担数据读取（数据读取通过Repository）。可复用逻辑后续抽取到library的Process模块。
  - Library中的Process调用约束：放入library后Process以Model为数据形态，不能直接与前端耦合；需要通过Repository以接口方式注入数据访问，避免直接依赖导致耦合。
  - 依赖关系与事件机制：在Repository中注册调用Process（通过事件）的做法存在循环依赖风险，更推荐在Blazor或Service层进行调用与注册，或通过依赖注入与接口隔离，避免直接类依赖。
- Repository结构与聚合处理
  - 以实体为单位的Repository：贴近SanjelData服务的打包与职责，避免在Repository中承载过多业务组装（应下沉到Process或上移到Service）。
  - 聚合对象的适配：处理聚合更新时负责拆解与逐层调用（如order到job order的更新），并将SanjelData service的调用异步化；必要的验证可在Repository或独立验证服务中完成，需明确边界。
  - 生成化与模式固化：将聚合处理、合法性校验、映射等常规样板代码通过固定模式自动生成，减少手写差异与维护成本。
- 业务流程命名与插入点策略
  - 将“service直接调用process”调整为通过Repository调用，确保本地process与library中的process为同一接口与接入点，便于替换与维护。
  - service可承载business process的对外响应，但process在架构上应通过repository接入；repository作为适配器/聚合器统一对接接口。
  - 未来替换第三方库或迁移到标准库时，仅需在repository层替换接入，降低改动面。
  - 新增“Business Process Repository”（单一总仓库）承载所有business process接口与方法，避免process方法混入实体Repository破坏一致性。
  - 文件组织：先统一到IBusinessRepository/Business Process Repository，后续视规模再重构分包（如按部门或大类拆分：job process、prada hold process等）。
  - 缓存与内存：dependent data与master data均需缓存，避免重复与内存占用增加；映射不全应通过完善mapping或新增方法解决。
- Product Haul领域模型与多层聚合
  - 三层聚合结构在Repository中完整支持：
    - 第一层：product Haul
    - 第二层：shipping load sheet、blend unload sheet
    - 第三层：podload（隶属shipping load sheet）
  - 关联与聚合：
    - rig jobcrewassignment、crew、schedule（schedule应直接关联section）
    - crew schedule聚合下包含work schedule与unit schedule
  - report中缺失schedule相关条目需补齐；eService online中已有逻辑可参考，处理逻辑先写入Repository或按需放入process。
- 逻辑与数据操作的区分与实践
  - 业务逻辑（Process）：基于实体属性与状态的规则判断与状态转换，可抽出为静态方法并建立单元测试。
  - 数据操作（Repository）：处理数据关系与聚合（如保存/删除project及其子对象、权限数据增删），属于纯数据层因素。
  - 边界把握：可先在Service实现以快速推进，后续重构将可抽离的逻辑迁移到Process；通过mock与单元测试提高可测性与重构安全。
  - 标准化与代码评审：制定分层职责、调用关系与示例片段，作为AI与团队的提示与评审标准；AI用于code review与自动重构，纠正逻辑混写在Service的情况。
  - 迭代与抽象：先搭框架、定义接口与占位实现，逐步完善；可复用逻辑后续抽取至central library，通过Repository统一调用。
  - 统一模式：避免将逻辑散落在reader或其他层，确保各层代码只在其应有层级内实现，便于AI进行一致性review。
- 命名与归类的清理
  - 存在命名不清与历史遗留项（如“thermal”“thermal mix”“blind request from”拼写与来源不明），建议统一归入component并为其建立对应Service，清理不明来源条目。
  - Repository中出现与实体不匹配的条目（如job status repository在无对应表情况下承担组装逻辑），逻辑应迁移至Service或Process，Repository保持实体维度与数据访问职责。
- 示例与测试策略
  - 格式化注释构建：作为典型业务逻辑示例，需抽离为Process并编写单元测试，确保构建结果正确。
  - 单元测试与mock：分层的好处在于每层可mock其依赖，从而对Process进行独立测试，对Service进行响应与拆解的集成性测试。
- 近期分工与目标
  - 宝红负责：Service与Business Process的实现。
  - 张院负责：界面开发。
  - 陶秋峰负责：Model与Repository的实现，并与宝红对齐Model设计。
  - Model与SanjelData entity的同构性需复核，确保前台功能可先以mock数据推进。
## 未决问题与风险
- 依赖关系不清导致循环依赖风险：Repository中注册并调用Process可能形成类依赖循环，需明确由Service层协调Process调用或以接口/事件隔离。
- Service命名与数量标准待最终定稿：在“每个组件必须一个Service”的一致性要求与“简单组件可不设独立Service”的灵活性之间需统一标准。
- Repository与Process职责边界：验证与聚合拆解的具体落点需制定明确准则，避免逻辑分散。
- Business Process与Service边界在新功能分类上仍存在理解差异，需更多示例与文档明确。
- 多人开发可能打破既定架构原则，需依赖AI与标准文档进行持续code review与重构。
- 报表缺失：report中关于schedule的内容为空，需尽快补齐以避免数据与逻辑不一致。
- 缓存与内存占用风险：dependent data与master data双重缓存可能增加内存占用，需统一策略。
- 对SanjelData的依赖仍是风险点：若外部模型更新滞后可能影响进度；需坚持Model同构与mock先行。
- 接口准备度：短期以service私有方法过渡，若接口定义延迟，可能影响前后端联调节奏。
## 行动项
- [ ] 将schedule product hall迁移至component目录，并为其建立对应的Service（命名统一，采用最终一致命名）。
- [ ] 页面（razor）的数据请求统一通过对应Service调用，移除页面中直接触达Repository的逻辑。
- [ ] 梳理并清理component与Repository中的不明命名与历史遗留项（如“thermal”“thermal mix”“blind request from”），统一命名与归类。
- [ ] 评估并调整当前Repository中对Process的注册与调用方式，避免循环依赖；优先在Service或Blazor入口进行调用与事件注册。
- [ ] 整理可复用的Process逻辑，提取至library的Process模块，并通过Repository接口方式完成数据访问的“拐一下”。
- [ ] 整理并输出架构说明文档：包括层次关系、协作与调用方式、职责定义、代码示例片段，用作团队与AI的提示词与评审标准。
- [ ] 对齐并复核Model设计，确保与SanjelData的entity同构。
- [ ] 为关键Business Process（如格式化注释构建）编写单元测试与mock方案。
- [ ] 通过Repository统一接入三角library的服务，并在Service中完成调用链路。
- [ ] 新增并实现“Business Process Repository”，在根目录建立仓库与接口（IBusinessRepository），统一接入process。
- [ ] 将现有business process调用从service直接调用改为通过Repository调用，完成重构与引用调整。
- [ ] 补齐report与代码中的schedule相关模型与处理逻辑（包括crew schedule、work schedule、unit schedule与section关系）。
- [ ] 编写并完善Product Hall相关Repository及接口定义，完成代码调整与就位。
- [ ] 建立product hall及其关联实体的Repository结构（product hall、shipping load sheet、blank unload sheet、pallet load、rig job、crew assignment、crew、schedule）。

> **AI建议**
> AI识别到以下在会议中未达成结论或缺少明确行动项的问题，请予以关注：
> 1. 架构调用链与边界未统一、存在循环依赖风险：尚未最终明确“Business Process是否仅能通过Repository被调用，还是允许Service在特例下直接调用”，也缺少文档化的标准化调用链与DI接口（Service -&gt; Repository -&gt; Process），导致部分组件通过事件注册由Repository调用Process引发潜在循环依赖；同时“每个组件一个Service”的规则执行不一致，易造成架构分裂与维护成本上升。需立即制定并发布可执行的规则与接口契约，明确例外场景与审批机制，以降低系统性风险。
> 2. Repository与Process职责边界模糊、接口设计未定，影响前后端集成与可测试性：尚无共识细则来界定验证、聚合拆解等逻辑应留在Repository还是迁至Process，以及功能型与实体型Repository的分界标准；“统一的业务过程仓库（IBusinessRepository）”的接口方法、版本化策略、后续按域拆分方案均未确定。若继续混入过程逻辑到实体Repository或推迟接口就绪，将导致高耦合、返工与集成阻塞。需尽快定稿IBusinessRepository设计（方法契约、异常与版本策略、数据访问路径）、职责边界清单与示例。
> 3. 产品大厅领域模型与排班覆盖不完整、数据报表与缓存策略缺口：产品大厅的多层聚合定义及排班相关实体/关系（班组、工序、单元、分段等）尚未完整敲定，也未明确哪些归属Repository、哪些归属Process；对应的仓库结构与报表仍有排班数据缺失，映射与缓存策略未制定。该状态易造成数据不一致、上线延迟与内存问题。需建立领域模型与仓库蓝图、补齐报表口径与测试方案，并定义缓存粒度、失效与一致性策略。
> 4. Service组织与命名规范未定、历史命名混乱影响协作与迁移：对“每个组件必须配一个Service”的强制性及简单组件的例外规则未有最终标准；组件Service命名（如“枢纽线服务”“大厅空白服务”等）未统一，且存在“thermal”“thermal mix”“blind request from”等遗留或误分类名称。产品大厅排班相关内容迁入组件命名空间并建立对应Service的迁移事项未明确负责人、时间线与验收标准。需制定命名与归类规范、清理历史名称，并明确迁移计划与责任人。
> 5. 过程逻辑抽取与库复用缺乏准则与计划，导致测试性与复用性不足：尚未确定何时/如何将可复用的Process逻辑抽取到中心库，以及通过Repository接口“绕行”数据访问的标准模式；候选逻辑清单、单元测试与Mock方案、以及接线流程均未明确。若继续临时化或推迟抽取，逻辑可能滞留在Service中，降低测试性并提高重构风险。需制定抽取判定规则、优先级清单、测试基准与接口适配流程，并设定负责人与截止时间。