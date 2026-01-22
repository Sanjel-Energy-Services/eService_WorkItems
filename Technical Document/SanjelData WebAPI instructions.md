

# SanjelData WebAPI 使用说明



------

## 1. 接口定义 (Interface Definition)

### 1.1 基本 Web API 接口 (Standard Web API)

| 方法                                                       | 说明                             |
| ---------------------------------------------------------- | -------------------------------- |
| **SelectAll()**                                            | 单表集合查询                     |
| **SelectAllWithChild()**                                   | 集合附加子对象查询               |
| **SelectById(int id)**                                     | 按 ID 查询单对象                 |
| **SelectByIdWithChild(int id, bool isAggregatedChildren)** | 按 ID 查询单对象并附带聚合子对象 |
| **SelectBy(RequestData requestData)**                      | 条件单表集合查询                 |
| **Insert(Entity entity)**                                  | 新增对象                         |
| **Update(Entity entity)**                                  | 修改对象                         |
| **Delete(int id)**                                         | 删除对象                         |
| **SelectPagerByColumns(RequestData requestData)**          | 分页条件查询                     |

### 1.2 版本控制新增接口

| 方法                                                | 说明                         |
| --------------------------------------------------- | ---------------------------- |
| **SelectBySpecifyDate(int id, DateTime timeStamp)** | 按时间戳查询有效版本及子对象 |

------

## 2. 后台 API 调用方式 (Backend Usage)

> **注意**：需安装 NuGet 包：`System.Net.Http.Formatting.Extension`

### 2.1 调用 Controller 命名规范

`BlendChemicalApiController` → URL 使用：`BlendChemicalApi`

------

## 3. 后台调用示例（C#）

### 3.1 SelectAll


```c#
HttpClient myHttpClient = new HttpClient();

string url = "http://ipAddress:port/ControllerName/";

myHttpClient.BaseAddress = new Uri(url);

HttpResponseMessage response = myHttpClient.GetAsync("SelectAll").Result;

RequestResult result = response.Content.ReadAsAsync<RequestResult>().Result;

List<T> entities = JsonConvert.DeserializeObject<List<T>>(result.Data.ToString());
```


------

### 3.2 SelectAllWithChild


```c#

HttpClient myHttpClient = new HttpClient();

string url = "http://ipAddress:port/ControllerName/";

myHttpClient.BaseAddress = new Uri(url);

HttpResponseMessage response = myHttpClient.GetAsync("SelectAllWithChild").Result;

RequestResult result = response.Content.ReadAsAsync<RequestResult>().Result;

List<T> entities = JsonConvert.DeserializeObject<List<T>>(result.Data.ToString());

```

------

### 3.3 SelectById


```c#

HttpResponseMessage response =

  myHttpClient.GetAsync("SelectById?id=" + id).Result;

RequestResult result = response.Content.ReadAsAsync<RequestResult>().Result;

T entity = JsonConvert.DeserializeObject<T>(result.Data.ToString());

```



------

### 3.4 SelectByIdWithChild


```c#

HttpResponseMessage response =

  myHttpClient.GetAsync("SelectByIdWithChild?id=" + id + "&isAggregatedChildren=true").Result;

RequestResult result = response.Content.ReadAsAsync<RequestResult>().Result;

T entity = JsonConvert.DeserializeObject<T>(result.Data.ToString());
```


------

### 3.5 SelectBy


```c#

List<string> columnNames = new List<string>() { "Name" };

T entity = new T() { Name = "name" };

Dictionary<string, string> requestData =

  (new RequestData<T> { Entity = entity, Columns = columnNames }).Serialize();

FormUrlEncodedContent content = new FormUrlEncodedContent(requestData);

HttpResponseMessage response = myHttpClient.PostAsync("SelectBy", content).Result;

RequestResult result = response.Content.ReadAsAsync<RequestResult>().Result;

List<T> entities = JsonConvert.DeserializeObject<List<T>>(result.Data.ToString());
```


------

### 3.6 Insert


```c#

T entity = new T();

HttpResponseMessage response = myHttpClient.PostAsJsonAsync("Insert", entity).Result;

RequestResult result = response.Content.ReadAsAsync<RequestResult>().Result;

T inserted = JsonConvert.DeserializeObject<T>(result.Data.ToString());
```


------

### 3.7 Update


```c#

T currentEntity = new T();

HttpResponseMessage response = myHttpClient.PostAsJsonAsync("Update", currentEntity).Result;

RequestResult result = response.Content.ReadAsAsync<RequestResult>().Result;

T updated = JsonConvert.DeserializeObject<T>(result.Data.ToString());

```

------

### 3.8 Delete


```c#

HttpResponseMessage response = myHttpClient.GetAsync("Delete?id=" + id).Result;

RequestResult result = response.Content.ReadAsAsync<RequestResult>().Result;

T deleted = JsonConvert.DeserializeObject<T>(result.Data.ToString());

```



------

### 3.9 SelectPagerByColumns


```c#

Pager pager = new Pager() { PageIndex = 1, PageSize = 1 };

List<string> columnNames = new List<string>() { "Name" };

T entity = new T() { Name = "name" };

Dictionary<string, string> requestData =

  (new RequestData<T> { Pager = pager, Entity = entity, Columns = columnNames }).Serialize();

FormUrlEncodedContent content = new FormUrlEncodedContent(requestData);

HttpResponseMessage response = myHttpClient.PostAsync("SelectPagerByColumns", content).Result;

RequestResult result = response.Content.ReadAsAsync<RequestResult>().Result;

TargetPager<T> targetPager = JsonConvert.DeserializeObject<TargetPager<T>>(result.Data.ToString());
```


------

### 3.10 SelectBySpecifyDate


```c#

HttpResponseMessage response =

  myHttpClient.GetAsync("SelectBySpecifyDate?id=" + id + "&timestamp=" + timeStamp).Result;

RequestResult result = response.Content.ReadAsAsync<RequestResult>().Result;

T entity = JsonConvert.DeserializeObject<T>(result.Data.ToString());
```


------

## 4. 前端调用方式 (Frontend Usage - JavaScript)

### 4.1 SelectAll


```javascript
function SelectAll() {

  var url = "http://ipAddress:port/ApiControllerName/SelectAll";

  $.ajax({
    url: url,
    type: 'GET',
    success: function (data) {
      console.log(data.Data);
    }
  });
}
```


------

### 4.2 SelectAllWithChild


```javascript
function SelectAllWithChild() {

  var url = "http://ipAddress:port/ApiControllerName/SelectAllWithChild";

  $.ajax({

    url: url,
    type: 'GET',
    success: function (data) {
      console.log(data.Data);
    }
  });
}
```


------

### 4.3 SelectById


```javascript
function SelectById() {

  var url = "http://ipAddress:port/ApiControllerName/SelectById";

  $.ajax({

    url: url,
    type: 'GET',
    data: { "id": 1 },
    success: function (data) {
      console.log(data.Data);
    }
  });
}

```



------

### 4.4 SelectByIdWithChild


```javascript
function SelectByIdWithChild() {

  var url = "http://ipAddress:port/ApiControllerName/SelectByIdWithChild";

  $.ajax({

    url: url,
    type: 'GET',
    data: {
      "id": 1,
      "isAggregatedChildren": true
    },
    success: function (data) {
      console.log(data.Data);
    }
  });
}

```



------

### 4.5 SelectBy


```javascript
function SelectBy() {

  var requestData = {
    PagerJsonString: 'null',
    EntityJsonString: '{"Description": null, "Name": "name", "Id": null}',
    ColumnNamesJsonString: '["Name"]'
  };
  var url = "http://ipAddress:port/ApiControllerName/SelectBy";
  $.ajax({
    url: url,
    type: 'POST',
    data: requestData,
    success: function (data) {
      console.log(data.Data);
    }
  });
}
```


------

### 4.6 Insert


```javascript
function Insert() {
  var entity = {

    Name: "name",
    Description: "description"
  };
  var url = "http://ipAddress:port/ApiControllerName/Insert";
  $.ajax({
    url: url,
    type: 'POST',
    data: entity,
    success: function (data) {
      console.log(data.Data);
    }
  });
}
```


------

### 4.7 Delete


```javascript
function Delete() {

  var url = "http://ipAddress:port/ApiControllerName/Delete";
  $.ajax({
    url: url,
    type: 'GET',
    data: { "id": 1 },
    success: function (data) {
      console.log(data.Data);
    }
  });
}

```



------

### 4.8 SelectPagerByColumns

与 SelectBy 使用方式相同。

------

### 4.9 SelectBySpecifyDate


```javascript
function SelectBySpecifyDate() {
  var url = "http://ipAddress:port/ApiControllerName/SelectBySpecifyDate";
  $.ajax({
    url: url,
    type: 'GET',
    data: {
      'id': 1,
      'timeStamp': timeStamp
    },
    success: function (data) {
      console.log(data.Data);
    }
  });
}
```
