# CustomModelBinder 的说明

### 背景说明

​	当我们用模型驱动，作为View显示的数据模型时，如果view的模型是个比较大的Model，需要分层定义子Model，而我们的View要复用，如果我们直接用整体的Model作为子View的Model,就会导致子view不能被复用，特别是那些逻辑js，所以我们的子View一定要用Model里的子对象。这样View就能复用了。

​	这个方案解决了前端的问题，但是这样也会产生一个新问题：就是我们在view里提交数据，由于我们用了子Model作为view的Model,所以asp.net mvc里的控件的name和id就不能带总Model的关系，接收数据的实体也就不能获得正确的数据。我们需要post的对象转化为Model的时候做设置，如果提交的对象的属性名字和子Model的属性名字一致，就对其进行赋值，为了统一这种设置，这就用到了：Microsoft.AspNetCore.Mvc.ModelBinding。

### 公共类

```C#
using Microsoft.AspNetCore.Mvc.ModelBinding;
using System;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;

namespace eServiceOnline.Models.ModelBinder
{
    public class CommonModelBinder<T> : IModelBinder where T:class,new()
    {
        public Task BindModelAsync(ModelBindingContext bindingContext)
        {
            var model = new T();

        PropertyInfo[] propertyInfos = model.GetType().GetProperties(BindingFlags.Instance | BindingFlags.GetProperty | BindingFlags.Public);
        foreach (PropertyInfo propertyInfo in propertyInfos)
        {
            if (bindingContext.ValueProvider.GetValue(propertyInfo.Name).FirstOrDefault() != null)
            {
                var propertyValue = bindingContext.ValueProvider.GetValue(propertyInfo.Name).FirstOrDefault();
                TypeConverter typeConverter = TypeDescriptor.GetConverter(propertyInfo.PropertyType);
                propertyInfo.SetValue(model, ConvertToValueType(propertyValue, propertyInfo.PropertyType));
            }
        }

        bindingContext.Result = ModelBindingResult.Success(model);
        return Task.CompletedTask;
    }

    public object ConvertToValueType(string value, Type targetType)
    {
        object result = null;

        bool isEmpty = string.IsNullOrWhiteSpace(value);

        if (targetType == typeof(string))
        {
            result = value;
        }
        else if (targetType == typeof(Int32) || targetType == typeof(int))
        {
            if (isEmpty)
            {
                result = 0;
            }
            else
            {
                int num = 0;
                Int32.TryParse(value, out num);
                result = num;
            }
        }
        else if (targetType == typeof(Guid))
        {
            if (isEmpty)
            {
                result = Guid.Empty;
            }
            else
            {
                result = new Guid(value);
            }
        }
        else if (targetType.IsEnum)
        {
            result = Enum.Parse(targetType, value);
        }
        else if (targetType == typeof(byte[]))
        {
            result = Convert.FromBase64String(value);
        }
        else if (targetType == typeof(DateTime))
        {
            if (isEmpty)
            {
                result = DateTime.MinValue;
            }
            else
            {
                result = Convert.ToDateTime(value);
            }
        }

        return result;
    }
}
```


### 举例使用方法

```C#
public class ParentModel
    {
        public ChildModel childModel { set; get; }
    }

[ModelBinder(BinderType = typeof(CommonModelBinder<ChildModel>))]
public class ChildModel
{
    public string property1 { set; get; }
    public string property2 { set; get; }
}
```


​    

我们只需要在子Model中加入[ModelBinder(BinderType = typeof(CommonModelBinder<子model>))]就可以了。



### 局限性

​	这个方法我们的初衷是简化转化，但也有他的局限性，比如当我们子对象里定义List某个对象时，就会造成转化不认识。它的终极解决办法是自定义的ModelBinder中对这一类型做取值处理，但是开发代价是目前不可负担的。所以，这部分的处理办法我们选取了个折中的办法，作为无效处理的一个补丁。

### 局限性解决方案

​	先在子Model里定义这个对象，再在主model定义相同的对象，这样提交数据后主model就会得到这个对象，现在我们再把这个model给子model赋值就ok了。

​	局限性的数据类型，除了基本的数据类型有不少不能适应，但这些我们基本不常用，常用的就是list 和 自定义的类。



### 局限性及解决方案举例

````c#
public class ParentModel
{
        public ChildModel childModel { set; get; }
     	public List<ThirdModel>{set;get}
}

[ModelBinder(BinderType = typeof(CommonModelBinder<ChildModel>))]
public class ChildModel
{
    public string property1 { set; get; }
    public string property2 { set; get; }
    public List<ThirdModel>{set;get}
}

public class ThirdModel
{
     public string property1 { set; get; }
    public string property2 { set; get; }
}
````



