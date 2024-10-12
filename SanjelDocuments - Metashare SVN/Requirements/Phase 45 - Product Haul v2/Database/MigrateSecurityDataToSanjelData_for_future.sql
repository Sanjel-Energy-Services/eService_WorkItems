-- Clean up old data migrated
USE [eservice6Dev]
GO
IF OBJECT_ID(N'dbo.SD_GROUP_PERMISSIONS_ConvertedToView', N'U') IS NOT NULL 
	EXEC sp_rename 'SD_GROUP_PERMISSIONS_ConvertedToView', 'SD_GROUP_PERMISSIONS';
Go
IF OBJECT_ID(N'dbo.SD_GROUP_USERS_ConvertedToView', N'U') IS NOT NULL 
	EXEC sp_rename 'SD_GROUP_USERS_ConvertedToView', 'SD_GROUP_USERS';
Go
IF OBJECT_ID(N'dbo.SD_PERMISSIONS_ConvertedToView', N'U') IS NOT NULL 
	EXEC sp_rename 'SD_PERMISSIONS_ConvertedToView', 'SD_PERMISSIONS';
Go
IF OBJECT_ID(N'dbo.SD_GROUPS_ConvertedToView', N'U') IS NOT NULL 
	EXEC sp_rename 'SD_GROUPS_ConvertedToView', 'SD_GROUPS';
Go
IF OBJECT_ID(N'dbo.SD_USERS_ConvertedToView', N'U') IS NOT NULL 
	EXEC sp_rename 'SD_USERS_ConvertedToView', 'SD_USERS';
Go



		 



CREATE TABLE [SanjelUser] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2,[HashedPassword] nvarchar(255),[ServicePointid] int,[ServicePointName] [nvarchar](100) NULL,[ServicePointDescription] [nvarchar](500) NULL,[ServicePointSystemId] [int] Not NULL,[Employeeid] int,[EmployeeName] [nvarchar](100) NULL,[EmployeeDescription] [nvarchar](500) NULL,[EmployeeSystemId] [int] Not NULL,[EmailAddress] nvarchar(255));
CREATE TABLE [UserGroup] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2);
CREATE TABLE [UserPermission] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2);
CREATE TABLE [UserGroupUserPermission] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2,[UserGroupid] int,[UserGroupName] [nvarchar](100) NULL,[UserGroupDescription] [nvarchar](500) NULL,[UserGroupSystemId] [int] Not NULL,[UserPermissionid] int,[UserPermissionName] [nvarchar](100) NULL,[UserPermissionDescription] [nvarchar](500) NULL,[UserPermissionSystemId] [int] Not NULL);
CREATE TABLE [UserGroupSanjelUser] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2,[SanjelUserid] int,[SanjelUserName] [nvarchar](100) NULL,[SanjelUserDescription] [nvarchar](500) NULL,[SanjelUserSystemId] [int] Not NULL,[UserGroupid] int,[UserGroupName] [nvarchar](100) NULL,[UserGroupDescription] [nvarchar](500) NULL,[UserGroupSystemId] [int] Not NULL);


-- Insert data from eService6
INSERT INTO [dbo].[SanjelUser]
           ([id]
           ,[entity_status]
           ,[owner_id]
           ,[name]
           ,[description]
           ,[version]
           ,[modified_user_id]
           ,[modified_user_name]
           ,[modified_datetime]
           ,[operation_type]
           ,[effective_start_datetime]
           ,[effective_end_datetime]
           ,[HashedPassword]
           ,[ServicePointid]
           ,[ServicePointSystemid]
           ,[ServicePointName]
           ,[ServicePointDescription]
           ,[Employeeid]
           ,[EmployeeSystemid]
           ,[EmployeeName]
           ,[EmployeeDescription]
           ,[EmailAddress])
Select u.id, 0 as [entity_status], 0 as [owner_id], Name, null as [description] , 1 as [version],
		  0 as [modified_user_id], null as [modified_user_name], Getdate(), 1 as [operation_type], GETDATE(), '9999-12-31 23:59:59.0000000', HASHED_PASSWORD,
u.DISTRICT_ID, 0, DISTRICT_NAME, null,
 EMP_ID, 0, EMP_NAME, null,  name+'@sanjel.com' from eservice6Dev.dbo.SD_USERS U
 join eservice6Dev.dbo.EMPLOYEES EMP on EMP_ID = emp.id
 where EMP.[EFFECTIVE_END_DATE_TIME] > getdate();
 GO

 SET IDENTITY_INSERT [dbo].[SanjelUser] ON 
 GO


INSERT INTO [dbo].[UserPermission]
           ([id]
           ,[entity_status]
           ,[owner_id]
           ,[name]
           ,[description]
           ,[version]
           ,[modified_user_id]
           ,[modified_user_name]
           ,[modified_datetime]
           ,[operation_type]
           ,[effective_start_datetime]
           ,[effective_end_datetime])
 Select id, 0 as [entity_status], 0 as [owner_id], Name, description as [description] , 1 as [version],
		  0 as [modified_user_id], null as [modified_user_name], Getdate(), 1 as [operation_type], GETDATE(), '9999-12-31 23:59:59.0000000'
		  from eservice6Dev.dbo.SD_PERMISSIONS;


INSERT INTO [dbo].[UserGroup]
           ([id]
           ,[entity_status]
           ,[owner_id]
           ,[name]
           ,[description]
           ,[version]
           ,[modified_user_id]
           ,[modified_user_name]
           ,[modified_datetime]
           ,[operation_type]
           ,[effective_start_datetime]
           ,[effective_end_datetime])
		  Select id, 0 as [entity_status], 0 as [owner_id], Name, description as [description] , 1 as [version],
		  0 as [modified_user_id], null as [modified_user_name], Getdate(), 1 as [operation_type], GETDATE(), '9999-12-31 23:59:59.0000000'
		  from eservice6Dev.dbo.SD_GROUPS;

		  INSERT INTO [dbo].[UserGroupSanjelUser]
           ([id]
           ,[entity_status]
           ,[owner_id]
           ,[name]
           ,[description]
           ,[version]
           ,[modified_user_id]
           ,[modified_user_name]
           ,[modified_datetime]
           ,[operation_type]
           ,[effective_start_datetime]
           ,[effective_end_datetime]
           ,[SanjelUserid]
           ,[SanjelUserSystemid]
           ,[SanjelUserName]
           ,[SanjelUserDescription]
           ,[UserGroupid]
           ,[UserGroupSystemid]
           ,[UserGroupName]
           ,[UserGroupDescription])
		  Select (ROW_NUMBER() over (Order by GU.User_ID, GU.GROUP_ID)), 0 as [entity_status], 0 as [owner_id], null, null as [description] , 1 as [version],
		  0 as [modified_user_id], null as [modified_user_name], Getdate(), 1 as [operation_type], GETDATE(), '9999-12-31 23:59:59.0000000',
		  U.ID,0, U.NAME, null, G.ID, 0, G.NAME, null
		  from eservice6Dev.dbo.SD_GROUP_USERS GU
		  Join SanjelUser U on GU.USER_ID = U.id
		  join eservice6Dev.dbo.SD_GROUPS G on GU.GROUP_ID = G.ID;
		  
		  INSERT INTO [dbo].[UserGroupUserPermission]
           ([id]
           ,[entity_status]
           ,[owner_id]
           ,[name]
           ,[description]
           ,[version]
           ,[modified_user_id]
           ,[modified_user_name]
           ,[modified_datetime]
           ,[operation_type]
           ,[effective_start_datetime]
           ,[effective_end_datetime]
           ,[UserGroupid]
           ,[UserGroupSystemid]
           ,[UserGroupName]
           ,[UserGroupDescription]
           ,[UserPermissionid]
           ,[UserPermissionSystemid]
           ,[UserPermissionName]
           ,[UserPermissionDescription])
		  Select (ROW_NUMBER() over (Order by GU.PERMISSION_ID, GU.GROUP_ID)), 0 as [entity_status], 0 as [owner_id], null, null as [description] , 1 as [version],
		  0 as [modified_user_id], null as [modified_user_name], Getdate(), 1 as [operation_type], GETDATE(), '9999-12-31 23:59:59.0000000',
		  G.ID,0, G.NAME, null, u.ID, 0, u.NAME, null
		  from eservice6Dev.dbo.SD_GROUP_PERMISSIONS GU
		  Join eservice6Dev.dbo.SD_PERMISSIONS U on GU.PERMISSION_ID = U.id
		  join eservice6Dev.dbo.SD_GROUPS G on GU.GROUP_ID = G.ID;

-- Create view and add back to eservice6

--Clean up old view created
USE [eservice6Dev]
IF OBJECT_ID(N'dbo.SD_USERS', N'V') IS NOT NULL  
	DROP VIEW [dbo].SD_USERS;
IF OBJECT_ID(N'dbo.SD_GROUPS', N'V') IS NOT NULL  
	DROP VIEW [dbo].SD_GROUPS;
IF OBJECT_ID(N'dbo.SD_PERMISSIONS', N'V') IS NOT NULL  
	DROP VIEW [dbo].SD_PERMISSIONS;
IF OBJECT_ID(N'dbo.SD_GROUP_USERS', N'V') IS NOT NULL  
	DROP VIEW [dbo].SD_GROUP_USERS;
IF OBJECT_ID(N'dbo.SD_GROUP_PERMISSIONS', N'V') IS NOT NULL  
	DROP VIEW [dbo].SD_GROUP_PERMISSIONS;

EXEC sp_rename 'SD_USERS', 'SD_USERS_ConvertedToView';
Go

CREATE VIEW [dbo].[SD_USERS]
 AS
  Select 
  [ID]
      ,[NAME]
      ,HashedPassword as [HASHED_PASSWORD]
      ,Employeeid as [EMP_ID]
      ,EmployeeName as [EMP_NAME]
      ,ServicePointid as [DISTRICT_ID]
      ,ServicePointName as [DISTRICT_NAME]
      ,null as [LAST_LOGIN_DATETIME]
      ,null as [LOGIN_DATETIME]
      ,null as [LOGIN_TICKET]
      ,0 as [VERSION]
      ,null as [MEASURE_UNIT_TYPE]
      ,0 as [LANGUAGE_TYPE]
      ,0 as [BUSINESS_UNIT]
      ,1 as [SANJEL_COMPANY_ID]
      ,'Sanjel Energy Services Inc.' as [SANJEL_COMPANY_NAME]
  from SanjelDataDev.dbo.SanjelUser
  where effective_end_datetime>GETDATE();
GO

EXEC sp_rename 'SD_GROUPS', 'SD_GROUPS_ConvertedToView';
Go

CREATE VIEW [dbo].[SD_GROUPS]
 AS
  Select 
  [ID]
      ,572 as [APPLICATION_ID]
      ,[NAME]
      ,[DESCRIPTION]
      ,[VERSION]
  from SanjelDataDev.dbo.UserGroup
    where effective_end_datetime>GETDATE();

GO

EXEC sp_rename 'SD_PERMISSIONS', 'SD_PERMISSIONS_ConvertedToView';
Go

CREATE VIEW [dbo].[SD_PERMISSIONS]
 AS
  Select 
  [ID]
      ,572 as [APPLICATION_ID]
      ,[NAME]
      ,[DESCRIPTION]
      ,[VERSION]
  from SanjelDataDev.dbo.UserPermission
    where effective_end_datetime>GETDATE();

GO


EXEC sp_rename 'SD_GROUP_PERMISSIONS', 'SD_GROUP_PERMISSIONS_ConvertedToView';
Go

CREATE VIEW [dbo].[SD_GROUP_PERMISSIONS]
 AS
  Select 
  [ID]
      ,UserGroupid as [Group_ID]
      ,UserPermissionid as [PERMISSION_ID]
      ,[VERSION]
  from SanjelDataDev.dbo.UserGroupUserPermission
    where effective_end_datetime>GETDATE();

GO

EXEC sp_rename 'SD_GROUP_USERS', 'SD_GROUP_USERS_ConvertedToView';
Go

CREATE VIEW [dbo].[SD_GROUP_USERS]
 AS
  Select 
  [ID]
      ,UserGroupid as [Group_ID]
      ,SanjelUserid as [USER_ID]
      ,[VERSION]
  from SanjelDataDev.dbo.UserGroupSanjelUser
    where effective_end_datetime>GETDATE();

GO