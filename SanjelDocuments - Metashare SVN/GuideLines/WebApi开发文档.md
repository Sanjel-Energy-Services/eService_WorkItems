好的，我将剩余的内容转换为Markdown格式。

### 3 App WebApi接口

#### 3.1 Add

```csharp
RequestResult Add(TEntity entity)  -单表新增
```

C#调用

```csharp
HttpClient myHttpClient = new HttpClient();

string url = "http://ipAddress:port/ControllerName/";

myHttpClient.BaseAddress = new Uri(url);

Dictionary<string, string> entityDictionary = new Dictionary<string, string>();

entityDictionary.Add("Id", "124");

entityDictionary.Add("Name", "ClassA");

FormUrlEncodedContent content = new FormUrlEncodedContent(entityDictionary);

HttpResponseMessage response = myHttpClient.PostAsync("Add", content).Result;
```

获取调用结果：

```csharp
RequestResult result = response.Content.ReadAsAsync<RequestResult>().Result;

T entity = JsonConvert.DeserializeObject<T>(result.Data.ToString());
```

前端js调用

```javascript
var url = "http://ipAddress:port/ApiControllerName/Add";

var data = "Id=1&Name=ClassName";

$.ajax({
    url: url,
    type: "post",
    contentType: 'application/x-www-form-urlencoded',
    data: data,
    success: function (result) {
        alert(result.message);
    },
    error: function (result) {
        JSON.stringify(result);
    }
});
```

#### 3.2 Edit

```csharp
RequestResult Edit(TEntity entity)  -单表修改
```

C#调用

同Add

前端js调用

同Add

#### 3.3 UpdateFromBody

```csharp
RequestResult UpdateFromBody(([FromBody] dynamic entity)-单表修改，支持传入的部分属性修改。
```

C#调用

```csharp
HttpClient myHttpClient = new HttpClient();

string url = "http://ipAddress:port/ControllerName/";

myHttpClient.BaseAddress = new Uri(url);

object currentEntity = new { Id = 1, Name = "Class1",};      

HttpResponseMessage response = myHttpClient.PostAsJsonAsync("Update",currentEntity).Result;
```

获取调用结果：

```csharp
RequestResult result = response.Content.ReadAsAsync<RequestResult>().Result;

T entity = JsonConvert.DeserializeObject<T>(result.Data.ToString());
```

前端js调用

同Update

#### 3.4 SelectAllByColumns

```csharp
RequestResult SelectAllByColumns(TEntity entity)-单表集合查询
```

前端调用方式：

#### 3.5 SelectByColumns

```csharp
RequestResult SelectByColumns(TEntity entity)-单表单个查询
```

前端调用方式：

#### 3.6 SelectPagerByColumns

```csharp
RequestResult SelectPagerByColumns(dynamic pagerSearch)-单表集合分页查询
```

前端调用方式：

### 注意事项

1. **FromBody**：在action方法传入参数前添加`[FromBody]`属性，参数将以一个整体的json对象的形式传递。
2. **不加FromBody**：在action方法传入参数前不添加`[FromBody]`属性，参数将以表单的形式提交。

### 方法说明

1. **一次只修改部分属性的值**：目前App WebApi支持两种实体的部分属性的更新的方法：
    - `public virtual RequestResult Edit(TEntity entity)`
    - `public virtual RequestResult UpdateFromBody([FromBody] dynamic entity)`

    **方法一的使用**：
    - 目前方法一的更新只支持实体对应字段的更新，如果该实体有非引用数据的子类，并且需要同时更新子类，那么需要在查找时将子类的信息组装好，并且在更新时需要同时更新子类。如果有额外的逻辑可以重写基类方法的`protected virtual void AdditionalBusinessLogic(TEntity entity, TEntity newEntity)`。

    **方法二的使用**：
    - 与注意事项3相同，此处传回的json对象键值需要和相应实体的属性名保持一致且不区分大小写（在实体的属性中不能有大小写转换后相同改的属性名）。

    **注意事项**：
    - 目前方法二的更新只支持实体对应字段的更新，如果该实体有非引用数据的子类，并且需要同时更新子类，那么需要在查找时将子类的信息组装好，并且在更新时需要同时更新子类。如果有额外的逻辑可以重写基类方法的`protected virtual void AdditionalBusinessLogic(dynamic entity, TEntity newEntity)`。

2. **方法AdditionalBusinessLogic**：
    - 参数一`entity`：代表从前端接收的数据，`newEntity`代表经过处理后将所有与属性对相应的字段都赋好值的实体，如果没有额外逻辑，子类不需要重写，否则需要重写该方法。

### 备注

1. fromBody:在cation方法传入参数前添加`[frombody]`属性，参数将以一个整体的josn对象的形式传递。
1. 不加fromBody:在cation方法传入参数前不添加`[frombody]`属性，参数将以表单的形式提交。
