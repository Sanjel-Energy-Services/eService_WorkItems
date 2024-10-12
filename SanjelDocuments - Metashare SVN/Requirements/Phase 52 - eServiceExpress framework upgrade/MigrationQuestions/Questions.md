# BlendLibrary Upgrade整理

##### 迁移过程推断及问题整理

1. 依赖SanjelData

2. 迁移文件来是否自于SanjelCommonLibrary不确定，因为在CommonLibrary同样的的方法名称，有区块被注释掉了，在BlendLibrary里是被启用的

   <img src="Image\1.png" style="zoom: 190%;" />
   <img src="Image\2.png" style="zoom: 190%;" />

迁移前文件分别为

BlendBreakDownCalculator.cs

BlendChemicalLoader.cs

BlendCostItem.cs

![](Image\3.png)

迁移后的文件分别为

BlendCalculator.cs

BlendChemicalLoader.cs

![](Image\4.png)

BlendBreakDownCalculator.cs ->BlendCalculator.cs 升级后方法的名称也做了替换，这两个类文件里的方法内容大体上一致，但是还是有些属性上的区别，是否是在升级过程中做过重构还是从别的类库进行的升级有点不确定。

Answer？
```
已经迁移到BlendLibrary的部分你不需要关心它原来在SanjelCommonLibrary中的代码了。迁移时一定程度的重构是做过的，因为它们依赖地不同的实体库。

现在你的任务是找到剩余的对原来SanjelCommonLibrary中的依赖，把它改为对SanjelLibrary的依赖。
```
3.如果是从SanjelCommonLibrary迁移过去的话，看到Online还是有很多方法实现调用的是CommonEntityBase类库，新的BlendLibrary已经对之前调用CommonEntityBase里面的方法进行了重构，例如FindItem已经通过其它方式实现，因此在Online中调用CommonEntityBase的方式也得替换，还是把CommonEntityBase移植过去？

Answer？

```
目前Online中残留的CommonEntityBase.FindItem方法可以用C#方法替换掉。以前之所以是这样写，可能是当时得处理两个不同的实体库。现在只依赖SanjelData实体就可以了。
```



4.迁移前项目的命名空间为：Sanjel.Common.BusinessEntities.Mdd迁移后项目的命名空间为：sesi.SanjelLibrary.BlendLibrary

```
这个没问题
```



5.在Develop分支下SanjelProgramManagement项目引用了旧的。注释掉一下引用后错误为下图

```c#
//using Sanjel.Common.BusinessEntities.Mdd;
//using Sanjel.Common.BusinessEntities.Mdd.Products;
```

![](Image\5.png)

旧引用的具体文件为：ProgramCostEstimatePresenter.cs文件，注释掉以后引用的类文件为以上错误信息，BlendBreakDownCalculator需要替换为新的库，BlendCostItem在BlendLibrary库里未提供，今天开会已经得知后期还是需要 将该类迁移到新库中去。

```
对的，BlendCostItem的逻辑需要迁移到BlendLibrary中
```



6.全局搜索SanjelEService,未找到旧的引用和方法调用。

7.全局搜索eServiceExpress,未找到旧的引用和方法调用。

8.全局搜索LabDatabase,未找到旧的引用和方法调用。

9.eServiceOnline已经替换为新的sesi.SanjelLibrary.BlendLibrary命名空间。在本次提交已更新过。

![](Image\6.png)

从代码中可以看到，升级之前是BlendSetion中提供的一个方法。现在调用的新的迁移过SanjelLibrary方法，因此和之前推断的从SanjelCommonLibrary的BlendBreakDownCalculator.cs ->BlendCalculator.cs的迁移有点出入，所以在这里对迁移的源头问题有点不确定，同序号2。

10.eServiceOnline还有很多文件引用的旧的命名空间，见迁移范围，Online上未迁移的文件还需要迁移吗？

Answer？

```
慢慢来，旧的命名空间在迁移过程中逐步清除。后面会有用API集成的工作来解除依赖。
```



##### 业务上的理解

看到在EserviceOnline中已经有替换新的库，涉及两个方法的替换1.BlendCalculator.IsAmountUnitTonsCategory(p.BlendCategory)

2.BlendCalculator.CovertToBlendChemicalFromBlendSection(CacheData.BlendChemicals, blendSection,CacheData.AdditionMethods, CacheData.AdditiveBlendMethods, CacheData.BlendAdditiveMeasureUnits, CacheData.BlendRecipes);

 查看代码方法时候 创建ProductHaulLoad的时，会根据productHaulLoad的BlendSectionId，获取BlendSection，

然后根据BlendSection 信息获取搅拌的化学方案信息(GetBlendChemicalByBlendSection)。

通过BlendCalculator的类库，提供水泥，水，添加剂，以及一些配方信息，按照 不同的标准，计算得到系统中的水泥混合配方数据服务。



```
BlendId是旧的实体库中的概念，现在在SanjelData实体库中，对应的实体已经建立，它是通过View来访问eService6数据库中的数据,在SanjelLibrary中只对新实体依赖。
```



##### 迁移范围

- ProgramManagement

ProgramCostEstimatePresenter（BlendCostItem，BlendBreakDownCalculator）

- eServiceOnline 还有这些文件未替换，括起来是现在引用旧的类库

eServiceWebContext（BlendBreakDownCalculator）

CostAPIController(BlendCostItem)

ProductHaulValidation(BlendBreakDownCalculator)

- eServiceOnlineAPI

CostAPIController（BlendCostItem）

CostUtils（BlendCostItem）

```
对
```

