# ASP.NET Blazor 应用软件架构说明与实现规范

**版本**：v1.0（2026-01-13）  
**适用范围**：基于 ASP.NET Blazor 的前端应用及其配套后端层次（Service / Process / Repository / Model / External Services）

***

## 0. 背景与目标

为保证 Blazor 前端的可维护性、可替换性、可测试性与团队一致性，本规范将应用分为清晰的层次并定义各层职责、边界与协作方式，提供落地的目录结构、接口示例、依赖注入、测试与迁移策略。文档同时约定 **以页面/组件为单位的 Service**、**只依赖 Model 的业务逻辑（Business Process）**、以及 **以实体为单位的数据仓储（Repository）** 的实施规范，并新增 **Business Process Repository**（统一插拔点）以支持后续将本地逻辑迁移到外部库（如 SanjelLibrary）。

***

## 1. 总体架构与职责边界

### 1.1 分层示意（协作链路）

    [Blazor Component / Razor Page]
       └─ 事件/绑定 → [Component Service (每组件1个)]
            ├─ VM ↔ Model 映射（Service内）
            ├─ 取数 → [Repository (实体仓储)]
            └─ 业务 → [Business Process Repository]
                    ├─ 本地 Business Process（静态方法，仅依赖Model）
                    └─ 外部库 Process（可替换：SanjelLibrary 等）

### 1.2 各层职责

*   **UI（组件/页面）**：仅做界面渲染与轻量事件处理；所有非 UI 逻辑委派给对应 Service。
*   **Component Service（每组件一个）**：负责请求编排、**ViewModel ↔ Model 映射**、调用仓储与业务逻辑；临时小逻辑可先放 Service，后续重构到 Process。
*   **Business Process（领域逻辑）**：**只依赖 Model** 的纯业务规则（状态流转、条件判定、计算、格式化注释等）；使用静态方法以便单测与复用。
*   **Repository（实体仓储 + 第三方适配）**：以实体为单位的数据访问与聚合对象的拆解/组装；统一适配第三方服务（SanjelData/SanjelLibrary），对上暴露稳定接口。
*   **Business Process Repository（业务仓储/适配层）**：对领域逻辑提供统一插拔点；可将调用路由到本地 Process 或外部库，实现无感替换。
*   **Model（领域模型）**：维护与 SanjelData 同构的副本，降低外部耦合，支持前端独立开发与 Mock 数据。

### 1.3 关键原则

*   **单一职责**：每层只做“应该做”的事；UI 不落业务，业务不落数据访问。
*   **无循环依赖**：禁止在 Repository 内注册/绑定 Business Process（含事件/委托）；统一在组合根（Program/Startup）进行装配。
*   **统一插拔点**：Service 调用领域逻辑一律经由 **Business Process Repository**，保证迁移到外部库时 Service 无需改动。
*   **先工作后重构**：初期无法界定的细节可暂放 Service 的私有方法，功能稳定后重构到 Process 并补齐测试。

***

## 2. 项目目录与命名规范（建议）

    /Components/
      /HaulBlend/                     ← 组件/页面（Razor）
    
    /Services/
      /HaulBlend/
        IHaulBlendService.cs
        HaulBlendService.cs           ← 每组件对应一个 Service
    
    /Processes/
      /Business/
        ProductHaulComments.cs        ← 本地业务逻辑（静态类，仅依赖Model）
        ProductHaulStateFlow.cs
        ...                           ← 其他业务逻辑
    
    /Repositories/
      /Entities/
        IProductHaulRepository.cs
        ProductHaulRepository.cs
        ShippingLoadSheetRepository.cs
        PalletLoadRepository.cs
        RigJobRepository.cs
        CrewAssignmentRepository.cs
        CrewScheduleRepository.cs
        WorkScheduleRepository.cs
        UnitScheduleRepository.cs      ← 实体级仓储与聚合处理
    
      /Business/
        IBusinessProcessRepository.cs
        BusinessProcessRepository.cs   ← 业务仓储/适配层（统一插拔点）
    
      /Functional/
        IMasterDataRepository.cs
        MasterDataRepository.cs
        IDependentDataRepository.cs
        DependentDataRepository.cs     ← 功能性仓储（可缓存）
    
    /Models/Domain/                    ← 与 SanjelData 同构的模型副本
    /Mappings/                         ← VM ↔ Model 映射（AutoMapper 或手写）
    /Common/Extensions/                ← 公共扩展（后续再整理）
    /Tests/Processes/                  ← 业务逻辑单元测试

命名约定：

*   组件级 Service：`{ComponentName}Service`（如 `HaulBlendService`）。
*   实体仓储：`{EntityName}Repository`。
*   业务仓储：`BusinessProcessRepository`。
*   领域逻辑类：`{EntityName}{LogicName}`（如 `ProductHaulStateFlow` / `ProductHaulComments`）。

***

## 3. 接口设计与实现示例

> 示例仅呈关键意图，可在工程中扩展方法与异常处理。

### 3.1 组件级 Service

```csharp
// Services/HaulBlend/IHaulBlendService.cs
public interface IHaulBlendService
{
    Task<HaulBlendViewModel> LoadAsync(Guid productHaulId);
    Task<FormResult> SaveAsync(HaulBlendViewModel vm);
}
```

```csharp
// Services/HaulBlend/HaulBlendService.cs
public sealed class HaulBlendService : IHaulBlendService
{
    private readonly IProductHaulRepository _productHaulRepo;
    private readonly IBusinessProcessRepository _bpRepo;
    private readonly IMapper _mapper;

    public HaulBlendService(
        IProductHaulRepository productHaulRepo,
        IBusinessProcessRepository bpRepo,
        IMapper mapper)
    {
        _productHaulRepo = productHaulRepo;
        _bpRepo = bpRepo;
        _mapper = mapper;
    }

    public async Task<HaulBlendViewModel> LoadAsync(Guid productHaulId)
    {
        var model = await _productHaulRepo.GetAsync(productHaulId);
        var vm = _mapper.Map<HaulBlendViewModel>(model);
        vm.Comments = _bpRepo.FormatComments(model);      // 业务经由BP仓储
        return vm;
    }

    public async Task<FormResult> SaveAsync(HaulBlendViewModel vm)
    {
        var model = _mapper.Map<ProductHaul>(vm);
        model = _bpRepo.ApplyStateTransitions(model);     // 纯模型状态逻辑
        await _productHaulRepo.SaveAggregateAsync(model); // 聚合持久化/拆装
        return FormResult.Success();
    }
}
```

### 3.2 Business Process Repository（统一插拔点）

```csharp
// Repositories/Business/IBusinessProcessRepository.cs
public interface IBusinessProcessRepository
{
    string FormatComments(ProductHaul model);
    ProductHaul ApplyStateTransitions(ProductHaul model);
    // ... 更多纯领域逻辑入口
}
```

```csharp
// Repositories/Business/BusinessProcessRepository.cs
public sealed class BusinessProcessRepository : IBusinessProcessRepository
{
    private readonly IExternalProcessAdapter _external; // 指向外部库（可选）

    public string FormatComments(ProductHaul model)
        => ProductHaulComments.Build(model);             // 本地静态领域逻辑

    public ProductHaul ApplyStateTransitions(ProductHaul model)
        => ProductHaulStateFlow.Apply(model);            // 本地静态领域逻辑
}
```

### 3.3 实体仓储（示例：ProductHaul 聚合）

```csharp
// Repositories/Entities/IProductHaulRepository.cs
public interface IProductHaulRepository
{
    Task<ProductHaul> GetAsync(Guid id);
    Task SaveAggregateAsync(ProductHaul root);
    // 读取/保存/删除等；内部执行聚合拆装（ShippingLoadSheet、PalletLoad …）
}
```

`SaveAggregateAsync` 内部原则：

*   以 `ProductHaul` 为聚合根，分层更新/插入/删除其子对象（`ShippingLoadSheet`、`PalletLoad` 等）。
*   维系跨实体关联一致性（如 `RigJob`、`CrewAssignment`、`CrewSchedule → WorkSchedule/UnitSchedule`）。
*   **数据关系操作（含级联删除、关系清理）属于仓储职责**，不放到 Business Process。

***

## 4. 依赖注入与组合根（Program/Startup）

```csharp
builder.Services.AddScoped<IHaulBlendService, HaulBlendService>();                // 每组件一个Service
builder.Services.AddScoped<IProductHaulRepository, ProductHaulRepository>();      // 实体仓储
builder.Services.AddScoped<IBusinessProcessRepository, BusinessProcessRepository>(); // 业务仓储（统一插拔点）
builder.Services.AddScoped<IMasterDataRepository, MasterDataRepository>();        // 功能性仓储（可缓存）
builder.Services.AddScoped<IDependentDataRepository, DependentDataRepository>();  // 功能性仓储（可缓存）

// 注意：禁止在仓储内部注册/绑定Business Process（事件/委托），避免循环依赖。
// 若引入外部库的业务逻辑（SanjelLibrary），通过 IExternalProcessAdapter 注入即可替换实现。
```

***

## 5. 判定清单（放哪一层？）

*   **Service 层**
    *   UI 委派、请求编排、**VM ↔ Model 映射**。
    *   跨仓储数据组合与流程协调。

*   **Business Process 层**（静态方法，**仅依赖 Model**）
    *   业务规则：状态流转、条件判定、计算、格式化注释等。
    *   便于 **单元测试与复用**；不直接做外部数据访问。

*   **Repository 层**
    *   实体/聚合的数据读取、持久化、删除与关系维护。
    *   适配第三方服务统一对接；封装聚合拆解与映射到外部接口。

> 无法在初期明确时，可先在 Service 写私有方法，后续重构抽取到 Process，并经由 Business Process Repository 暴露。

***

## 6. 测试策略

*   **Business Process 单测优先**：其为纯模型逻辑，易于 xUnit/NUnit 测试；对仓储可使用 Mock。
*   **Service 测试**：关注编排与映射正确性（调用链、参数转换）；不做复杂功能验证。
*   引入 **针对格式化注释、状态流转** 的专门测试用例，保障变更不影响 UI/Service。

***

## 7. 缓存、映射与性能建议

*   `MasterDataRepository` / `DependentDataRepository` 可使用 **内存缓存**，避免重复加载；注意合并来源，减少内存浪费。
*   VM ↔ Model 映射可采用 AutoMapper 或手写 Map 方法；**映射职责归 Service**。
*   全链路采用 `async/await`；仓储端尽量批量提交，降低往返成本。

***

## 8. 迁移与替换（面向外部库 SanjelLibrary）

*   将本地业务逻辑迁移到外部库时，仅需替换 **IBusinessProcessRepository** 的实现或其内部适配器；**Service 与 UI 无需改动**。
*   外部库的实体访问仍经由实体仓储（Repository）统一适配，保证调用一致性与可测性。

***

## 9. 当前功能实施清单（Schedule Product Haul / Haul Blend）

1.  在 `/Components/HaulBlend/` 建立 Razor 组件与基本交互。
2.  在 `/Services/HaulBlend/` 创建 `IHaulBlendService` 与 `HaulBlendService`，实现 **Load/Save** 与 **VM ↔ Model 映射**。
3.  在 `/Repositories/Entities/` 完善以下仓储与聚合逻辑：
    *   `ProductHaulRepository`（三层聚合：`ProductHaul → ShippingLoadSheet → PalletLoad`）
    *   `ShippingLoadSheetRepository`, `PalletLoadRepository`
    *   `RigJobRepository`, `CrewAssignmentRepository`
    *   `CrewScheduleRepository`（含 `WorkScheduleRepository`、`UnitScheduleRepository`），处理与 `Section/Schedule` 的直接关联
4.  在 `/Repositories/Business/`：创建并实现 `IBusinessProcessRepository`，接入本地 `ProductHaulComments`、`ProductHaulStateFlow` 等逻辑。
5.  在 `/Processes/Business/`：实现静态逻辑并编写 `/Tests/Processes/` 单元测试。
6.  在 `Program.cs` 完成依赖注入，严格遵守**不在仓储内注册业务逻辑**的禁忌。
7.  如需迁移到 SanjelLibrary：替换 `IBusinessProcessRepository` 实现或其适配器即可。

***

## 10. 代码模板（片段）

### 10.1 领域逻辑（静态类）

```csharp
public static class ProductHaulComments
{
    public static string Build(ProductHaul model)
    {
        // 领域规则：按产品/装载/班组信息生成格式化注释
        // 返回可测试的确定性结果
        return $"Haul #{model.Id} - {model.BlendName} - Loads:{model.ShippingLoadSheets.Count}";
    }
}

public static class ProductHaulStateFlow
{
    public static ProductHaul Apply(ProductHaul model)
    {
        // 示例：基于条件判定状态流转
        if (model.ShippingLoadSheets.Any() && model.Status == HaulStatus.Planned)
            model.Status = HaulStatus.Ready;

        return model;
    }
}
```

### 10.2 聚合持久化（仓储骨架）

```csharp
public sealed class ProductHaulRepository : IProductHaulRepository
{
    private readonly DbContext _db; // 或外部服务网关

    public Task<ProductHaul> GetAsync(Guid id)
        => _db.Set<ProductHaul>()
              .Include(x => x.ShippingLoadSheets)
              .ThenInclude(x => x.PalletLoads)
              .FirstAsync(x => x.Id == id);

    public async Task SaveAggregateAsync(ProductHaul root)
    {
        // 父子/级联处理，确保新增/更新/删除一致性
        // 具体实现因数据源而异（EF/外部API适配）
        _db.Update(root);
        await _db.SaveChangesAsync();
    }
}
```

***

## 11. Code Review（含 AI）规则要点

*   **红线**：任何业务规则（状态流转/格式化/计算）不得落在 Repository；不得在 Repository 绑定/注册 Process。
*   **建议**：跨仓储编排留在 Service；纯模型逻辑抽取到 Process；所有领域逻辑经由 **Business Process Repository** 暴露。
*   **检测项**：
    *   Service 是否只做编排与映射？
    *   Process 是否不依赖外部数据源？
    *   Repository 是否只做数据访问与聚合拆装？
    *   依赖注入是否在组合根完成？是否不存在循环依赖？

***

## 12. 术语表

*   **Component Service**：按页面/组件划分的服务类，负责编排与映射。
*   **Business Process**：只依赖 Model 的纯领域逻辑（静态方法），可单元测试与复用。
*   **Repository**：以实体为单位的数据访问与聚合持久化层，同时适配第三方服务。
*   **Business Process Repository**：领域逻辑的统一插拔与适配层，连接本地与外部 Process。
*   **Aggregate（聚合）**：以聚合根（如 `ProductHaul`）为中心的对象集合，保证内部一致性。

***

## 13. 维护与演进

*   变更流程：先在 Process 层改动并更新测试 → Service 与 UI 无需改动 → 若迁移外部库，仅替换 BP 仓储实现。
*   文档与模板：将本规范固化为项目模板与检查清单，配合 CI 的静态分析与 AI Review 保持一致性。

***

### 附：常见问答

*   **Q：Service 与 Process 的边界不清晰怎么办？**  
    **A**：先在 Service 写最小私有方法跑通流程；当逻辑独立且仅依赖 Model 时，抽取为静态 Process，并通过 Business Process Repository 暴露接口与测试。
*   **Q：删除用户时清理权限属于哪层？**  
    **A**：这是**数据关系操作**，应在 **Repository** 层执行，而非 Process。
*   **Q：外部库上线需要改动 Service 吗？**  
    **A**：不需要。通过替换 `IBusinessProcessRepository` 的实现或其内部适配器即可。

***

> 如需，我可以把这份 Markdown 文档导出为 **PDF/Word（.docx）** 并附带一个 **最小可运行骨架项目**（含目录/接口/示例）供团队直接使用。您希望我继续生成哪种交付物？
