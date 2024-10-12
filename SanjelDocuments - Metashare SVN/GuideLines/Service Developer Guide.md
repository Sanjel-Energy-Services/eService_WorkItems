# Service Actions Document

    ©MetaShare Inc. 8/22/2022

## Maintenance History

| **Date**   | **Modifier** | **Description**       |
| ---------- | ------------ | --------------------- |
| 2022-08-22 | MDDGroup     | first draft           |
| 2023-01-28 | MDDGroup     | SelectByJoin examples |
|            |              |                       |



## 1.1    Instruction

  MMC generates project's Service description and usage instructions;

  The base is on CommonCore's Service description and usage instructions.

## 1.2    Specific Usage

### 1.2.1    Entity definition

```C#
public class EntityA : MetaShare.Common.Core.Entities.Common
{
    [DataMember]
    public string PropertyA{get; set;}

    [DataMember]
    public string PropertyB{get; set;}

    [DataMember]
    public int PropertyInt { get; set; }

    [DataMember]
    public DateTime PropertyDate { get; set; }

    [DataMember]
    public EnumA Status { get; set; }

    [DataMember]
    public double PropertyDouble { get; set; }

    [DataMember]
    public decimal PropertyDecimal { get; set; }

    [DataMember]
    public bool IsDelete { get; set; }

    [DataMember]
    public EntityB AssociationA2B { get; set; }

    [DataMember]
    public List<EntityC> AssociationA2C { get; set; }

    /*add customized code between this region*/
    /*add customized code between this region*/
}
```



### 1.2.2    Service definition

 ```C#
public class EntityAService : MetaShare.Common.Core.Services.Service<EntityA>, IEntityAService
{
    public EntityAService() : base(typeof(IEntityADao))
    {

    }
}
 ```



### 1.2.3    Service’s Methods and properties included by default

 ```C#
namespace MetaShare.Common.Core.Services 
{
  public class Service<T> : IService<T>, IService, IPagingService<T> where T : MetaShare.Common.Core.Entities.Common 
  {
    protected Type DaoType { get; set; }
    protected IDao<T> Dao { get; set; }
    protected ServiceAggregationInfo ServiceAggregationInfo { get; set; }
    public Service();
    public Service(Type daoType);
    public virtual List<T> SelectAll();
    public List<T> SelectAll(bool isAggregatedChildren);
    public virtual List<T> SelectByOwner(T item);
    public virtual List<T> SelectBy(T item, IList<string> byColumnNames);
    public List<T> SelectAll(Pager pager);
    public List<T> SelectAll(Pager pager, bool isAggregatedChildren);
    public List<T> SelectBy(Pager pager, T item, IList<string> byColumnNames);
    public List<T> SelectBy(T item, Expression<Func<T, bool>> expression);
    public List<T> SelectBy(Pager pager, T item, Expression<Func<T, bool>> expression);
    public List<T> SelectWithChildren(List<T> items);
    public static IContext GetContext(Type daoType, bool isTransaction);
    protected List<T> SelectBy(List<T> items, ServiceAggregationInfo aggregationInfo);
    public virtual T SelectById(T item);
    public virtual T SelectById(T item, bool isAggregatedChildren);
    protected T SelectById(ServiceAggregationInfo aggregationInfo, T item);
    protected void GetAggregatedChildMembers(ServiceAggregationArgs args, bool isSelectHistoryVersion = false);
    public virtual int Insert(T item);
    public virtual int Insert(T item, bool isUpdateChildren);
    protected int Insert(ServiceAggregationInfo aggregationInfo, T item);
    protected int CreateEntity(ServiceArgs args, ServiceAggregationInfo aggregatingInfo);
    public virtual int Update(T item);
    public virtual int Update(T item, bool isUpdateChildren);
    protected int Update(ServiceAggregationInfo aggregationInfo, T item);
    protected virtual int UpdateEntity(ServiceArgs args, ServiceAggregationInfo aggregatingInfo);
    public virtual int Delete(T item);
    public virtual int Delete(T item, bool isUpdateChildren);
    protected int Deletes(ServiceAggregationInfo aggregationInfo, T originalVersion);
    protected virtual int DeleteEntity(ServiceArgs args, ServiceAggregationInfo aggregatingInfo);
    protected void UpdateAggregatedChildMembers(ServiceAggregationArgs args);
    protected virtual void OnUpdateAggregatedChildMembersFinished(ServiceAggregationArgs args);
    protected virtual void DoAggregatedChildDelete(ServiceAggregationArgs args, ServiceAggregationArgs aggregatedChildArgs,
        MetaShare.Common.Core.Entities.Common deleteObject);
    public List<T> SelectByColumnIds(string columnName, int[] ids, bool isAggregatedChildren);
    public List<T> SelectByColumnIds(Pager pager, string columnName, int[] ids, bool isAggregatedChildren);
    public List<T> SelectByColumnIds(Dictionary<string, int[]> ids, bool isAggregatedChildren);
    public List<T> SelectByColumnIds(Pager pager, Dictionary<string, int[]> ids, bool isAggregatedChildren);
    public List<T> SelectByJoin(Expression<Func<T, bool>> condition, Expression<Func<T, bool>> loadProperties);
    public List<T> SelectByJoin(Expression<Func<T, bool>> loadProperties);
  } 
}
 ```



New methods can be rewritten or defined on this basis to meet usage requirements.



### 1.2.4    ServiceInterface definition

 ```C#
public interface IEntityAService: MetaShare.Common.Core.Services.IPagingService<EntityA>
{

}
 ```



### 1.2.5    ServiceInterface’s Methods included by default

 ```C#
namespace MetaShare.Common.Core.Services
{
  public interface IPagingService<T> : IService<T>, IService
  {
      //Query the data collection by all data page
    List<T> SelectAll(Pager pager);
      //Query the data set by paging all data. You can configure whether to query sub-attribute data
    List<T> SelectAll(Pager pager, bool isAggregatedChildren);
      //Query the data collection through column condition paging
    List<T> SelectBy(Pager pager, T item, IList<string> byColumnNames);
      //Query the data collection by paging through Lambda expression conditions
    List<T> SelectBy(Pager pager, T item, Expression<Func<T, bool>> expression);
  }
}
namespace MetaShare.Common.Core.Services
{
  public interface IService<T> : IService
  {
      //Querying all Data
    List<T> SelectAll();
      //Query all data. You can set whether to query sub-attribute data
    List<T> SelectAll(bool isAggregatedChildren);
      //Query the data through Owner, the method is not implemented yet
    List<T> SelectByOwner(T item);
      //Query data by column criteria
    List<T> SelectBy(T item, IList<string> byColumnNames);
      //Query data through Lambda expression conditions
    List<T> SelectBy(T item, Expression<Func<T, bool>> expression);
      //Query sub-attribute data
    List<T> SelectWithChildren(List<T> items);
      //Query data by Id
    T SelectById(T item);
      //Insert data
    int Insert(T item);
      //update data
    int Update(T item);
      //deleted data
    int Delete(T item);
      //Query data by Id. You can configure whether to set query sub-attribute data
    T SelectById(T item, bool isAggregatedChildren);
      //Insert data. You can configure whether to insert child attribute data at the same time
    int Insert(T item, bool isUpdateChildren);
      //Update data. You can configure whether to update sub-attribute data at the same time
    int Update(T item, bool isUpdateChildren);
      //Delete data. You can configure whether to delete child attribute data at the same time
    int Delete(T item, bool isUpdateChildren);
      //By querying data in the data set of columns, you can configure whether to set to query sub-attribute data
    List<T> SelectByColumnIds(string columnName, int[] ids, bool isAggregatedChildren);
      //To query paging data through the data set of columns, you can configure whether to set to query sub-attribute data
    List<T> SelectByColumnIds(Pager pager, string columnName, int[] ids, bool isAggregatedChildren);
      //By querying data in the column data set dictionary, you can configure whether to set to query sub-attribute data
    List<T> SelectByColumnIds(Dictionary<string, int[]> ids, bool isAggregatedChildren);
      // Through the column data set dictionary to query paging data, you can configure whether to set to query sub-attribute data
    List<T> SelectByColumnIds(Pager pager, Dictionary<string, int[]> ids, bool isAggregatedChildren);
    List<T> SelectByJoin(Expression<Func<T, bool>> condition, Expression<Func<T, bool>> loadProperties);
	List<T> SelectByJoin(Expression<Func<T, bool>> loadProperties);
  }
}
 ```

#### 1.2.5.1 Service methods examples of use 

1.  Get List of EntityA  including full  AssociationA2B and AssociationA2C  properties object and search EntityA where name contains "EntityA"
    *entityAs.AssociationA2B != null*  is going to create a table join with a full list of objects in the case of one-to-many (**1:N**) or a full object if  one'to'one (**1:1**) relationship 
```C#
IEntityAService entityAService = ServiceFactory.Instance.GetService<IEntityAService>();
 
List<EntityA> entityAs =  entityAService.SelectByJoin(entityAs => entityAs.Name.Contains("EntityA"), entityAs => entityAs.AssociationA2B != null && cr.AssociationA2C !=null);
```


2.  Get List of EntityA  including full  AssociationA2B and AssociationA2C  properties object without conditions

```C#
IEntityAService entityAService = ServiceFactory.Instance.GetService<IEntityAService>();
 
List<EntityA> entityAs =  entityAService.SelectByJoin(entityAs => entityAs.AssociationA2B != null && cr.AssociationA2C !=null);
```


### 1.2.6    Use of partial Dao methods in Service

#### 1.2.6.1    List<T> SelectBy(IContext context, T item, IList<string> byColumnNames);

```C#
1.  List<EntityA> entityAs = this.Dao.SelectBy(context, new EntityA { PropertyA = propertyA }, new List<string> { "PropertyA" });

2.  List<EntityA> items = this.Dao.SelectBy(context, new EntityA { AssociationA2B = new EntityB{ Id = entityBId } },new List<string> { "AssociationA2BId" });
```



#### 1.2.6.2    List<T> SelectBy(IContext context, Expression<Func<T, bool>> expression);

```C#
1.  List<EntityA> entityAs1 = this.Dao.SelectBy(context, entityA => entityA.Name == "entityA1" );

2.  List<EntityA> entityAs2 = this.Dao.SelectBy(context, entityA => entityA.Name.Contains("entityA1") );

3.  List<EntityA> entityAs3 = this.Dao.SelectBy(context, entityA => entityA.AssociationA2B.Id == 1);

4.  List<EntityA> entityAs4 = this.Dao.SelectBy(context, entityA => entityA.AssociationA2B.Id == 1 && entityA.Name.Contains("entityA1"), daos, aggregationInfo);



```



### 1.2.7    Use of Dao in Service 

```C#
public override int Insert(EntityA item, bool isUpdateChildren)
{
    using (IContext context = DaoFactory.Instance.GetContext(typeof(IEntityADao), true))
    {
        try
        {
            if (isUpdateChildren)
            {
                IEntityBDao entityBDao = DaoFactory.Instance.GetDao<IEntityBDao>();//*****
                entityBDao.Insert(context, item.AssociationA2B);//*****
            }
            this.Dao.Insert(context, item);//*****

            context.Commit();
            return 1;
        }
        catch (Exception e)
        {
            context.Rollback();
            return 0;
        }
    }
}
```



### 1.2.8    Use of transactions in Service

 ```C#
public override int Insert(EntityA item, bool isUpdateChildren)
{
    using (IContext context = DaoFactory.Instance.GetContext(typeof(IEntityADao), true))//*****
    {
        try
        {
            if (isUpdateChildren)
            {
                IEntityBDao entityBDao = DaoFactory.Instance.GetDao<IEntityBDao>();
                entityBDao.Insert(context, item.AssociationA2B);
            }
            this.Dao.Insert(context, item);

            context.Commit();//*****
            return 1;
        }
        catch (Exception e)
        {
            context.Rollback();//*****
            return 0;
        }
    }
}
 ```

Note: Avoid deadlocks in use.

### 1.2.9    RegisterService

 ```C#
public class RegisterServices
{
    public static void RegisterAll()
    {
        Register(ServiceFactory.Instance, true);
    }

    public static void UnRegisterAll()
    {
        Register(ServiceFactory.Instance, false);
    }

    public static void Register(ServiceFactory factory, bool isRegister)
    {
        factory.Register(typeof(Interfaces.IEntityAService), new EntityAService(), isRegister);
        factory.Register(typeof(Interfaces.IEntityBService), new EntityBService(), isRegister);
        factory.Register(typeof(Interfaces.IEntityCService), new EntityCService(), isRegister);
    }
}
 ```



### 1.2.10  Use of Service in other items

```C#
EntityA entityA = new EntityA()
{
    Id = 1,
    AssociationA2B = new EntityB() { Id = 10001 }
};

IEntityAService entityAService = ServiceFactory.Instance.GetService<IEntityAService>();
entityAService.Insert(entityA, true);




```



 