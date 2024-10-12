Use SanjelData
GO

--SanjelUser import
IF OBJECT_ID(N'dbo.SanjelUser', N'U') IS NOT NULL  
   DROP Table [dbo].[SanjelUser];  
GO

CREATE TABLE [SanjelUser] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2,[EmailAddress] nvarchar(255),[HashedPassword] nvarchar(255),[Employeeid] int,[EmployeeName] [nvarchar](100) NULL,[EmployeeDescription] [nvarchar](500) NULL,[EmployeeSystemId] [int] Not NULL,[ServicePointid] int,[ServicePointName] [nvarchar](100) NULL,[ServicePointDescription] [nvarchar](500) NULL,[ServicePointSystemId] [int] Not NULL);
GO

INSERT INTO [SanjelData].[dbo].[SanjelUser] (
    id, entity_status, owner_id, name, description, version,
    modified_user_id, modified_user_name, modified_datetime, operation_type,
    effective_start_datetime, effective_end_datetime, HashedPassword,ServicePointid,ServicePointSystemId,
	ServicePointName, ServicePointDescription, 
	Employeeid, EmployeeSystemId, EmployeeName, EmployeeDescription, EmailAddress
)
SELECT 
		u.id as [ID],
		 0 as [entity_status],
		 0 as [owner_id],
		 cast(Name as nvarchar(100)) as [Name],
		 cast(null as nvarchar(500)) as [description],
		 u.version + 1 as [version],
		 0 as [modified_user_id],
		 cast(null as nvarchar(50)) as [modified_user_name],
		 CURRENT_TIMESTAMP as [modified_datetime],
		 1 as [operation_type],
		 CURRENT_TIMESTAMP as [effective_start_datetime],
		 cast('9999-12-31 23:59:59.0000000' as datetime2) as [effective_end_datetime],
		 cast(HASHED_PASSWORD as nvarchar(200)) as [HashedPassword],
		 u.DISTRICT_ID as [ServicePointid],
		 0 as [ServicePointSystemid],
		 cast(DISTRICT_NAME as nvarchar(50)) as [ServicePointName],
		 cast(null as nvarchar(500)) as [ServicePointDescription],
		 EMP_ID as [Employeeid],
		 0 as EmployeeSystemid,
		 cast(EMP_NAME as nvarchar(100)) as [EmployeeName],
		 cast(null as nvarchar(500)) as [EmployeeDescription],
		 cast(name+'@sanjel.com' as nvarchar(500)) as [EmailAddress]
	from 
		dbo.SYN_ES_SD_USERS U
		left join dbo.SYN_ES_EMPLOYEES EMP on EMP_ID = emp.id
	where
		EMP.[EFFECTIVE_END_DATE_TIME] > getdate()
		or (EMP.[EFFECTIVE_END_DATE_TIME] is null and U.SANJEL_COMPANY_NAME = 'Sanjel Energy Services Inc.'); 
GO

--UserGroup Import
IF OBJECT_ID(N'dbo.UserGroup', N'U') IS NOT NULL  
   DROP Table [dbo].[UserGroup];  
GO

CREATE TABLE [UserGroup] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2);
GO

INSERT INTO [SanjelData].[dbo].[UserGroup] (
    id, entity_status, owner_id, name, description, version,
    modified_user_id, modified_user_name, modified_datetime, operation_type,
    effective_start_datetime, effective_end_datetime
)
SELECT 
    ID, 0, 0, NAME, DESCRIPTION, VERSION+1, 0, NULL,
	CURRENT_TIMESTAMP, 3, CURRENT_TIMESTAMP, '9999-12-31 23:59:59.0000000'
FROM dbo.[SYN_ES_SD_GROUPS] where APPLICATION_ID = 572;
GO

--UserGroupSanjelUser Import
IF OBJECT_ID(N'dbo.UserGroupSanjelUser', N'U') IS NOT NULL  
   DROP Table [dbo].[UserGroupSanjelUser];  
GO

CREATE TABLE [UserGroupSanjelUser] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2,[SanjelUserid] int,[SanjelUserName] [nvarchar](100) NULL,[SanjelUserDescription] [nvarchar](500) NULL,[SanjelUserSystemId] [int] Not NULL,[UserGroupid] int,[UserGroupName] [nvarchar](100) NULL,[UserGroupDescription] [nvarchar](500) NULL,[UserGroupSystemId] [int] Not NULL);
GO


INSERT INTO [SanjelData].[dbo].[UserGroupSanjelUser] (
    [id],
    [entity_status],
    [owner_id],
    [name],
    [description],
    [version],
    [modified_user_id],
    [modified_user_name],
    [modified_datetime],
    [operation_type],
    [effective_start_datetime],
    [effective_end_datetime],
    [SanjelUserid],
    [SanjelUserName],
    [SanjelUserDescription],
    [SanjelUserSystemId],
    [UserGroupid],
    [UserGroupName],
    [UserGroupDescription],
    [UserGroupSystemId]
)
Select cast((ROW_NUMBER() over (Order by GU.User_ID, GU.GROUP_ID)) as int) as ID,
		 0 as [entity_status],
		 0 as [owner_id],
		 null as [Name],
		 null as [description],
		 1 as [version],
		 0 as [modified_user_id],
		 null as [modified_user_name],
		CURRENT_TIMESTAMP AS modified_datetime, -- Current time
		3 AS operation_type, -- Default value
		CURRENT_TIMESTAMP AS effective_start_datetime, -- Current time
		'9999-12-31 23:59:59.0000000' AS effective_end_datetime, -- Default value
		U.ID as [SanjelUserid],
		U.NAME as [SanjelUserName], 
		U.description as [SanjelUserDescription],
		U.system_id as [SanjelUserSystemid],
		G.ID as [UserGroupid],
		G.NAME as [UserGroupName],
		G.DESCRIPTION as [UserGroupDescription],
		G.system_id as [UserGroupSystemid]
	from 
		dbo.SYN_ES_SD_GROUP_USERS GU
		Join SanjelUser U on GU.USER_ID = U.id
		join UserGroup G on GU.GROUP_ID = G.ID
GO		


--UserPermission Import
IF OBJECT_ID(N'dbo.UserPermission', N'U') IS NOT NULL  
   DROP Table [dbo].[UserPermission];  
GO

CREATE TABLE [UserPermission] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2);
GO

INSERT INTO [SanjelData].[dbo].[UserPermission] (
    id, entity_status, owner_id, name, description, version,
    modified_user_id, modified_user_name, modified_datetime, operation_type,
    effective_start_datetime, effective_end_datetime
)
SELECT 
    ID, 0, 0, NAME, DESCRIPTION, VERSION+1, 0, NULL,
	CURRENT_TIMESTAMP, 3, CURRENT_TIMESTAMP, '9999-12-31 23:59:59.0000000'
FROM dbo.[SYN_ES_SD_PERMISSIONS] where id in (select Distinct Permission_Id from dbo.[SYN_ES_SD_GROUP_PERMISSIONS] where GROUP_ID in (select distinct id from UserGroup)
)
GO

		
--UserGroupUserPermission Import

IF OBJECT_ID(N'dbo.UserGroupUserPermission', N'U') IS NOT NULL  
   DROP Table [dbo].[UserGroupUserPermission];  
GO

		
CREATE TABLE [UserGroupUserPermission] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2,[UserGroupid] int,[UserGroupName] [nvarchar](100) NULL,[UserGroupDescription] [nvarchar](500) NULL,[UserGroupSystemId] [int] Not NULL,[UserPermissionid] int,[UserPermissionName] [nvarchar](100) NULL,[UserPermissionDescription] [nvarchar](500) NULL,[UserPermissionSystemId] [int] Not NULL);
GO

INSERT INTO [SanjelData].[dbo].[UserGroupUserPermission] (
      [id],
      [entity_status],
      [owner_id],
      [name],
      [description],
      [version],
      [modified_user_id],
      [modified_user_name],
      [modified_datetime],
      [operation_type],
      [effective_start_datetime],
      [effective_end_datetime],
      [UserGroupid],
      [UserGroupName],
      [UserGroupDescription],
      [UserGroupSystemId],
      [UserPermissionid],
      [UserPermissionName],
      [UserPermissionDescription],
      [UserPermissionSystemId]
)
	Select
		cast((ROW_NUMBER() over (Order by GU.PERMISSION_ID, GU.GROUP_ID)) as int) as ID,
		 0 as [entity_status],
		 0 as [owner_id],
		 null as [Name],
		 null as [description],
		 GU.VERSION+1 as [version],
		 0 as [modified_user_id],
		 null as [modified_user_name],
		 cast(Getdate() as datetime2) as [modified_datetime],
		 1 as [operation_type],
		 cast(Getdate() as datetime2) as [effective_start_datetime],
		 cast('9999-12-31 23:59:59.0000000' as datetime2) as [effective_end_datetime],
			  G.ID as [UserGroupid],
			  G.NAME as [UserGroupName],
			  G.description as [UserGroupDescription],
			  G.system_id as [UserGroupSystemid],
			  u.ID as [UserPermissionid],
			  u.NAME as [UserPermissionName],
			  u.description as [UserPermissionDescription],
			  u.system_id as [UserPermissionSystemid]
	from 
		dbo.SYN_ES_SD_GROUP_PERMISSIONS GU
		Join dbo.UserPermission U on GU.PERMISSION_ID = U.id
		join dbo.UserGroup G on GU.GROUP_ID = G.ID;
GO





