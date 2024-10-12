# DAO Developer Guide

    ©MetaShare Inc. 8/22/2022

## Maintenance History

 


| **Date**   | **Modifier** | **Description** |
| ---------- | ------------ | --------------- |
| 2022-08-22 | MDDGroup     | first draft     |
|            |              |                 |
|            |              |                 |

 


## 1.1    Instruction

   MMC generates project's Dao description and usage instructions;

  The base is on CommonCore’s Dao description and usage instructions.



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

​                          

### 1.2.2    Dao definition

 ```C#
public class EntityADao: MetaShare.Common.Core.Daos.CommonObjectDao<EntityA>,Daos.Interfaces.IEntityADao
{
    public class EntityASqlBuilder : MetaShare.Common.Core.Daos.ObjectSqlBuilder
    {
        public EntityASqlBuilder(MetaShare.Common.Core.Daos.SqlDialect sqlDialect) : base(sqlDialect,"EntityA")
        {
            this.SqlInsert = "INSERT INTO EntityA(PropertyA,PropertyB," + this.SqlBaseFieldInsertFront + ") VALUES (@PropertyA,@PropertyB," + this.SqlBaseFieldInsertBack + ")";
            this.SqlUpdate = "UPDATE EntityA SET PropertyA=@PropertyA,PropertyB=@PropertyB," + this.SqlBaseFieldUpdate + " WHERE Id=@Id";
        }
    }

    public class EntityAResultHandler : MetaShare.Common.Core.Daos.CommonObjectResultHandler<EntityA>
    {
        public override void GetColumnValues(IDataReader reader,EntityA item)
        {
            base.GetColumnValues(reader, item);
            int ordinalPropertyA = reader.GetOrdinal("PropertyA");
            item.PropertyA = reader.IsDBNull(ordinalPropertyA) ? null : reader.GetString(ordinalPropertyA);
            int ordinalPropertyB = reader.GetOrdinal("PropertyB");
            item.PropertyB = reader.IsDBNull(ordinalPropertyB) ? null : reader.GetString(ordinalPropertyB);
        }

        public override void AddInsertParameters(MetaShare.Common.Core.Daos.IContext context, IDbCommand command, EntityA item)
        {
            base.AddInsertParameters(context, command, item);
            context.AddParameter(command,"PropertyA",item.PropertyA ?? (object)DBNull.Value);
            context.AddParameter(command,"PropertyB",item.PropertyB ?? (object)DBNull.Value);
        }
    }
    public EntityADao(MetaShare.Common.Core.Daos.SqlDialect sqlDialect) : base(new EntityASqlBuilder(sqlDialect), new EntityAResultHandler())
    {
    }
}
 ```



### 1.2.3    Dao’s Methods and properties included by default

```C#
namespace MetaShare.Common.Core.Daos
{
  public class CommonObjectDao<T> : CommonDao<T> where T : MetaShare.Common.Core.Entities.Common, new()
  {
    public CommonObjectDao(CommonSqlBuilder sqlBuilder, CommonResultHandler<T> resultHandler);
    public CommonObjectDao(CommonSqlBuilder sqlBuilder, CommonResultHandler<T> resultHandler, string schemaConnectionString);
    public override int OnInserted(IContext context, T item);
  }
}
```

```C#
namespace MetaShare.Common.Core.Daos
{
  public class CommonDao<T> : IDao<T>, IDao where T : new()
  {
    protected CommonDao(CommonSqlBuilder sqlBuilder, CommonResultHandler<T> resultHandler);
    protected CommonDao(CommonSqlBuilder sqlBuilder, CommonResultHandler<T> resultHandler, string schemaConnectionString);
    public string SchemaConnectionString { get; set; }
    public CommonSqlBuilder SqlBuilder { get; set; }
    public CommonResultHandler<T> ResultHandler { get; set; }
    public virtual List<T> SelectAll(IContext context);
    public virtual List<T> SelectByOwner(IContext context, T item);
    public virtual List<T> SelectBy(IContext context, T item, IList<string> byColumnNames);
    public virtual int SelectCounts(IContext context, T item, IList<string> byColumnNames);
    public virtual int SelectCounts(IContext context);
    public virtual int SelectCounts(IContext context, Expression<System.Func<T, bool>> expression);
    public virtual List<T> SelectAll(IContext context, Pager pager);
    public virtual List<T> SelectByOwner(IContext context, Pager pager, T item);
    public virtual List<T> SelectBy(IContext context, Pager pager, T item, IList<string> byColumnNames);
    public virtual List<T> SelectBy(IContext context, Expression expression);
    public List<T> SelectBy(IContext context, Pager pager, Expression expression);
    public virtual List<T> SelectBy(IContext context, Expression<System.Func<T, bool>> expression);
    public virtual List<T> SelectBy(IContext context, Pager pager, Expression<System.Func<T, bool>> expression);
    public virtual T SelectById(IContext context, T item);
    public virtual int Insert(IContext context, T item);
    protected virtual void OnInserting(IContext context, T item);
    public virtual int OnInserted(IContext context, T item);
    public virtual int Update(IContext context, T item);
    protected virtual void OnUpdating(IContext context, T item);
    protected virtual void OnUpdated(IContext context, T item);
    public virtual int Delete(IContext context, T item);
    protected virtual void OnDeleting(IContext context, T item);
    protected virtual void OnDeleted(IContext context, T item);
    public virtual int Populate(IContext context, T item);
    protected int CountSelectBy(IContext context, T condition, string sqlSelectBy, CommonDao<T>.GetResultHandler getResult,
      CommonDao<T>.AddParametersHandlerBy addParameters, IList<string> byColumnNames);
    protected List<T> SelectBy(IContext context, T condition, string sqlSelectBy, CommonDao<T>.GetResultHandler getResult,
      CommonDao<T>.AddParametersHandlerBy addParameters, IList<string> byColumnNames);
    protected List<T> SelectBy(IContext context, T condition, string sqlSelectBy,
      CommonDao<T>.GetResultHandler getResult, CommonDao<T>.AddParametersHandler addParameters);
    protected T Select(IContext context, T item, string sqlSelect, CommonDao<T>.GetResultHandler getResult,
      CommonDao<T>.AddParametersHandler addParameters);
    protected int Insert(IContext context, T item, string sqlInsert, CommonDao<T>.AddParametersHandler addParameters);
    protected int Update(IContext context, T item, string sqlUpdate, CommonDao<T>.AddParametersHandler addParameters);
    protected int Delete(IContext context, T item, string sqlDelete, CommonDao<T>.AddParametersHandler addParameters);
    public virtual List<T> SelectByColumnIds(IContext context, string columnName, int[] ids);
    public virtual List<T> SelectByColumnIds(IContext context, Pager pager, string columnName, int[] ids);
    public virtual List<T> SelectByColumnIds(IContext context, Dictionary<string, int[]> ids);
    public virtual List<T> SelectByColumnIds(IContext context, Pager pager, Dictionary<string, int[]> ids);

    public delegate void GetResultHandler(IDataReader reader, T item);
    public delegate void AddParametersHandler(IContext context, IDbCommand command, T item);
    public delegate void AddParametersHandlerBy(IContext context, IDbCommand command, T item, IList<string> byColumnNames);
  }
}
```

New methods can be rewritten or defined on this basis to meet usage requirements.

### 1.2.4    DaoInterface definition

 ```C#
public interface IEntityADao: MetaShare.Common.Core.Daos.IDao<EntityA>
{
}
 ```

### 1.2.5    DaoInterface’s Methods included by default

 ```C#
namespace MetaShare.Common.Core.Daos
{
  public interface IDao<T> : IDao
  {
      //Query all data sets
    List<T> SelectAll(IContext context);
      //Query the data collection by all data page
    List<T> SelectAll(IContext context, Pager pager);
      //The Owner query - method is not implemented yet
    List<T> SelectByOwner(IContext context, T item);
      //Query through Owner and page - method not implemented yet
    List<T> SelectByOwner(IContext context, Pager pager, T item);
      //Query by column criteria
    List<T> SelectBy(IContext context, T item, IList<string> byColumnNames);
      //Query and page through column criteria
    List<T> SelectBy(IContext context, Pager pager, T item, IList<string> byColumnNames);
      //Query by Lambda expression condition
    List<T> SelectBy(IContext context, Expression<Func<T, bool>> expression);
      //Query and page through Lambda expression conditions
    List<T> SelectBy(IContext context, Pager pager, Expression<Func<T, bool>> expression);
      //Query by expression
    List<T> SelectBy(IContext context, Expression expression);
      //Query and page through expression
    List<T> SelectBy(IContext context, Pager pager, Expression expression);
      //Query quantity
    int SelectCounts(IContext context);
      // Query the quantity by Lambda expression condition
    int SelectCounts(IContext context, Expression<Func<T, bool>> expression);
      //Query quantity by column
    int SelectCounts(IContext context, T item, IList<string> byColumnNames);
      //Query data by Id
    T SelectById(IContext context, T item);
      //Insert data
    int Insert(IContext context, T item);
      //Update data
    int Update(IContext context, T item);
      //Delete data
    int Delete(IContext context, T item);
      //Insert data
    int Populate(IContext context, T item);
      //Gets the Id after the insert is successful
    int OnInserted(IContext context, T item);
      //Query data through the data collection of columns
    List<T> SelectByColumnIds(IContext context, string columnName, int[] ids);
      //Query paging data through the data collection of columns
    List<T> SelectByColumnIds(IContext context, Pager pager, string columnName, int[] ids);
      //Query data through a column data set dictionary
    List<T> SelectByColumnIds(IContext context, Dictionary<string, int[]> ids);
      //Query paging data through the column data set dictionary
    List<T> SelectByColumnIds(IContext context, Pager pager, Dictionary<string, int[]> ids);
  }
}
 ```

### 1.2.6    Dao’s Use extensions for custom queries

\1.    Define methods to get SQL statements in SqlBuilder;

\2.    Define methods for loading data into entities and methods for loading parameters in ResultHandler;

（PS：Skip this step if you can use existing methods）

\3.    Define the query and call the following methods to complete the query in Dao.

 ```C#
protected int CountSelectBy(IContext context, T condition, string sqlSelectBy, CommonDao<T>.GetResultHandler getResult,
                            CommonDao<T>.AddParametersHandlerBy addParameters, IList<string> byColumnNames);
protected List<T> SelectBy(IContext context, T condition, string sqlSelectBy, CommonDao<T>.GetResultHandler getResult,
                           CommonDao<T>.AddParametersHandlerBy addParameters, IList<string> byColumnNames);
protected List<T> SelectBy(IContext context, T condition, string sqlSelectBy,
                           CommonDao<T>.GetResultHandler getResult, CommonDao<T>.AddParametersHandler addParameters);
protected T Select(IContext context, T item, string sqlSelect, CommonDao<T>.GetResultHandler getResult,
                   CommonDao<T>.AddParametersHandler addParameters);
 ```

Eg.

```C#
public class EntityADao: MetaShare.Common.Core.Daos.CommonObjectDao<EntityA>,Daos.Interfaces.IEntityADao
{
    public class EntityASqlBuilder : MetaShare.Common.Core.Daos.ObjectSqlBuilder
    {
        public EntityASqlBuilder(MetaShare.Common.Core.Daos.SqlDialect sqlDialect) : base(sqlDialect,"EntityA")
        {
            this.SqlInsert = "INSERT INTO EntityA(PropertyA,PropertyB," + this.SqlBaseFieldInsertFront + ") VALUES (@PropertyA,@PropertyB," 
                + this.SqlBaseFieldInsertBack + ")";
            this.SqlUpdate = "UPDATE EntityA SET PropertyA=@PropertyA,PropertyB=@PropertyB," + this.SqlBaseFieldUpdate + " WHERE Id=@Id";
        }
        //----------------------------------------------
        public string GetSqlSelectBy(Pager pager, string partSql)
        {
            int currentRow = (pager.PageIndex - 1) * pager.PageSize + 1;

            StringBuilder sql = new StringBuilder();
            sql.Append("SELECT * FROM(select row_number() over (Order by ");
            sql.Append("Id desc");
            sql.Append(") as row_num,* from ").Append(this.TableName);

            if (!string.IsNullOrWhiteSpace(partSql))
            {
                sql.Append(" WHERE ").Append(partSql);
            }

            sql.Append(" )t WHERE row_num between ");
            sql.Append(currentRow);
            sql.Append(" And ");
            sql.Append(currentRow + (pager.PageSize - 1));
            return sql.ToString();
        }
        //----------------------------------------------
    }

    public class EntityAResultHandler : MetaShare.Common.Core.Daos.CommonObjectResultHandler<EntityA>
    {
        public override void GetColumnValues(IDataReader reader,EntityA item)
        {
            base.GetColumnValues(reader, item);
            int ordinalPropertyA = reader.GetOrdinal("PropertyA");
            item.PropertyA = reader.IsDBNull(ordinalPropertyA) ? null : reader.GetString(ordinalPropertyA);
            int ordinalPropertyB = reader.GetOrdinal("PropertyB");
            item.PropertyB = reader.IsDBNull(ordinalPropertyB) ? null : reader.GetString(ordinalPropertyB);
        }

        public override void AddInsertParameters(MetaShare.Common.Core.Daos.IContext context, IDbCommand command, EntityA item)
        {
            base.AddInsertParameters(context, command, item);
            context.AddParameter(command,"PropertyA",item.PropertyA ?? (object)DBNull.Value);
            context.AddParameter(command,"PropertyB",item.PropertyB ?? (object)DBNull.Value);
        }
    }
    //----------------------------------------------
    public List<EntityA> SelectBy(IContext context, Pager pager, string partSql)
    {
        return this.SelectBy(context,
                             new EntityA(),
                             (this.SqlBuilder as EntityASqlBuilder).GetSqlSelectBy(pager, partSql),
                             this.ResultHandler.GetColumnValues,
                             this.ResultHandler.AddColumnParameters,
                             null);
    }
    //----------------------------------------------
    public EntityADao(MetaShare.Common.Core.Daos.SqlDialect sqlDialect) : base(new EntityASqlBuilder(sqlDialect), new EntityAResultHandler())
    {
    }
}
```

### 1.2.7    RegisterDao

 ```C#
public class RegisterDaos
{
    public static void RegisterAll(Type sqlDialect, Type sqlDialectVersion)
    {
        Register(DaoFactory.Instance, true,sqlDialect,sqlDialectVersion);
    }

    public static void UnRegisterAll(Type sqlDialect, Type sqlDialectVersion)
    {
        Register(DaoFactory.Instance, false,sqlDialect,sqlDialectVersion);
    }

    public static void Register(DaoFactory factory, bool isRegister, Type sqlDialect, Type sqlDialectVersion)
    {
        factory.Register(typeof(Daos.Interfaces.IEntityADao), new Daos.EntityADao(Activator.CreateInstance(sqlDialect) as SqlDialect), isRegister);
        factory.Register(typeof(Daos.Interfaces.IEntityBDao), new Daos.EntityBDao(Activator.CreateInstance(sqlDialect) as SqlDialect), isRegister);
        factory.Register(typeof(Daos.Interfaces.IEntityCDao), new Daos.EntityCDao(Activator.CreateInstance(sqlDialect) as SqlDialect), isRegister);
    }
}
 ```



### 1.2.8    Use of Dao in Service

In itself Service

 ```C#
this.Dao.Insert(context, item);
 ```

In other’s Service

 ```C#
IEntityBDao entityBDao = DaoFactory.Instance.GetDao<IEntityBDao>();
entityBDao.Insert(context, item.AssociationA2B);
 ```



 