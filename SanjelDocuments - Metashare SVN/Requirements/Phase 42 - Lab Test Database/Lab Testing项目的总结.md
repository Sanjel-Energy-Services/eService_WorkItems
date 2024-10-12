### Lab Testing项目的总结

研究了Lab Testing项目做下自己认识的小结，这是个典型的.net core Api小项目，利用了控制反转（Inversion of Control，缩写为IoC），依赖注入（Dependency Injection，简称DI），异步任务（Async Task），典型.net core集成没有更多的像元元方那种自己架构，这个项目虽小，但架构清晰，分层明确，用的产品都是比较常规。

##### 优点：

1. 前端和后端分离，利用RestFul Api和前端交互，符合技术发展方向。

2. 前端用的angular cli，升级有保障。

3. 后端结构清晰，数据库ORM用的Entity Framwork，身份验证用的.NET Core自带的 Indentity，整站交互基本都是异步任务。

Entity Framwork：微软官方支持，相对来说使用更友好，成熟，可用的操作多，也灵活。

.NET Core自带的 Indentity，利用jwt的方式进行身份验证：功能强大，能很快集成，可以适用多端登录，jwt不是存入session和cookie的，突破域名限制，身份验证时利用头信息进行回传。

异步任务：可并发执行，速度更快，这个是理论上，但基本.net5 、6推荐使用了。

4.数据序列化用的AutoMapper。

利用AutoMapper对controller中返回值进行实体转化例如：

return Ok(_mapper.Map<QualityControlResponse>(updated));

需要模板的预定义：MappingProfile:Profile

省去写很多代码倒没有，但可以复用，以为也需要预定义模板。

5.总体架构设计层次分明，某些集成化程度很高，前后端交互模型对模型。

层次分明：每个操作controller都单独成文件夹，里面是完整的套路，有交互的models,有业务逻辑的接口IServices及实现Service,Configure×××××Module注册服务。

某些集成化程度很高：数据查询集成。

模型对模型：交互中后端的接收参数[FromQuery]、[FromBody]直接把前端传来json结构数据的利用automaper进行序列化为实体。前端的json也是实体模式的写法进行传送，接收值也是json转为实体。

6.数据查询和排序也抽象集成了，调用方便，并且lambada运用合适。（详见：FilterExpressionBuilder类。）

因为这个项目做了可以所有的项均可查询，并且能联合查询，还能按所有项进行排序，倒是没有进行多字段排序。利用了接收的查询参数进行了expression转化，里面用到个小技巧，为了能多字段联合查询，不用判断是否where第一个条件，因为第一个条件不需要and后面都要and,比如where 字符串拼接的办法，一般用where 1=1 然后进行条件list遍历，逐条加and。本项目用的是比如形参是x,x=>x.true。后面再逐渐加入条件。

因为entity

lambada运用： 

return  Task.FromResult(_context.SldLabSamples
                .Where(expressionBuilder.Build())
                .Select(z => new SldLabSample()
                {
                    Id = z.Id,
                    LoginNo = z.LoginNo,
                    CreatedById = z.CreatedById,
                    CreatedOn = z.CreatedOn,
                    ClientName = z.ClientName,
                    District = z.District,
                    SampleType = z.SampleType,
                    WellName = z.WellName,
                    Name = z.Name,
                    DateCollected = z.DateCollected
                })
                .OrderBy(orderBy, direction));

我感觉其中select赋值中运用就很好，如果我们读取完毕再进行一次遍历转换也是性能浪费，因为Entity Framwork是整个lambada组成最终解析为sql语句在执行的，只是换了个写法而已，就是再好的ORM比起原生的sql语句也是性能消弱，只是写起来更方便了而已。

7. 测试项目比较健全。


##### 缺点：

1.虽然前端按角色进行了菜单展示限制，但后端的接口却没有对角色进行限制。就是一个接口只有特定的权限可以访问，这个可能是内部系统，不需要进行限制，但我做的系统一般需要进行严格限制，否则外网公布会有很大安全隐患。

2.分层部分是按照功能进行划分的，并没有整体划分。它的项目中文件夹分层把操作和工具辅助同级放在一块了，感觉不太好，感觉把操作部分放入controller这样更清晰。

3.前后端分离维护成本较高，比如要维护angular cli，就需要有相关的知识，比如node.js，还有各种的插件依赖，随着升级甚至对老的版本支持不友好，甚至新版本的工具可能对老版本不支持，或者说不是完全支持，一个小的bug就导致整个项目编译不过去；并且在国内大家用vue更多，这个东西升级很快。如果直接用asp.net则不用投入更多的额外维护angular cli成本。

##### 延申：

1.灵活的权限配置，一般权限身份（identity）和菜单（menu）相关联，甚至更细一点和每个操作（action）相关联，数据库存储菜单和操作的角色(role)权限，利用面向切面编程（Aspect Oriented Programming即AOP），拦截器进行拦截后进行操作，根据调用的controller以及里面的方法进行判断该用户角色是否有操作权限。这样就能灵活在数据库中配置某个操作执行权限了，灵活度更高，一般我们用asp.net identity会把角色(role)在控制器（controller）或者控制器方法中写死。感觉这个在asp.net 4.8以前版本里 page start差不多，不过要比page start 要高端。

