## MCC 2.0 .Net C# Code issue

我在MCC中新创建的WellDB项目中有一个两层Composition聚合的例子。

![WellCompoistion](https://user-images.githubusercontent.com/55812393/70480609-667ee000-1a9d-11ea-914d-1311f19add89.png)

在生成的WellService类中，我发现聚合定义代码是这样子的:

```C#
ServiceAggregationInfo wellboreSegmentsServiceAggregation = 
         this.ServiceAggregationInfo.AddCompositeCollectionChild("WellboreSegments", 
         typeof(Sesi.WellDB.Entities.Well.Wellbore.WellboreSegment), 
         typeof(Sesi.WellDB.Daos.Interfaces.Well.Wellbore.IWellboreSegmentDao), "Well");
```

我反向编译看了一下Common.Core的代码，并对比了原来eService中的聚合实现的代码，发现这部份实现在概念上是不对的。

因为目前的实现中我们并不能分层定义架构模型，所以各层的概念模型实际上是一样的，模型定义是通过代码模板来描述的。那么Service层实际上做了两件事情，也是它被引入的原因。

- DAO层的Wrapper

- 概念模型的描述和实现

当我们只观察一个实体的时候，这两部分应该是清楚地分开的，这样才能规整地实现封装和概念模型正确的映射。

- Service 从基类中继承了对DAO的操作。

- ServiceAggregationInfo 来描述实体的关联，通过递归的机制来通过各层实体的自己的Service来实现。

所以聚合定义大概代码应该是这样的：

```C#
ServiceAggregationInfo wellboreSegmentsServiceAggregation = 
         this.ServiceAggregationInfo.AddCompositeCollectionChild("WellboreSegments", 
         typeof(Sesi.WellDB.Entities.Well.Wellbore.WellboreSegment), 
   typeof(Sesi.WellDB.Services.Interfaces.Well.Wellbore.IWellboreSegmentService)，"Well");
```



在基类中实现的应该是ServiceMethodInvoker是对子类的Service的操作，而不是对DAO的操作。

这样才实现了关注点分离（Separation of Concerns)。

这里可能会带来聚合层数过多导致性能问题。这可以通过设计约束来解决，聚合层数过多在分析和设计中都是一个不好的模式，它会增强耦合，使系统丧失灵活性。关注点分离也是分析的设计的原则。但是三到四层的聚合支持在实际项目中是绝对需要的。

在实现策略上，保持目前的对DAO操作代码，并行扩展出支持Service聚合操作的接口，道理是一样的。底层机制实现后，把MMC中代码生成部分进行重构。

另外，Shared聚合和Composite聚合的区别请特别留意一下。

