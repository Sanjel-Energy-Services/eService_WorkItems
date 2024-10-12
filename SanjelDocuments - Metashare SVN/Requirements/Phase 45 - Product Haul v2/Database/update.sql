-- Do NOT run it again
-- Prodcution have been updated


/****** Object:  Table [dbo].[BlendUnloadSheet]    Script Date: 7/19/2022 12:52:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BlendUnloadSheet](
	[id] [int] NOT NULL,
	[system_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[modified_user_id] [int] NULL,
	[modified_user_name] [nvarchar](50) NULL,
	[modified_datetime] [datetime2](7) NULL,
	[operation_type] [int] NULL,
	[effective_start_datetime] [datetime2](7) NULL,
	[effective_end_datetime] [datetime2](7) NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[ShippingLoadSheetid] [int] NULL,
	[ShippingLoadSheetSystemId] [int] NULL,
	[ShippingLoadSheetName] [nvarchar](100) NULL,
	[ShippingLoadSheetDescription] [nvarchar](255) NULL,
	[DestinationStorageDescription] [nvarchar](255) NULL,
	[DestinationStorageSystemId] [int] NULL,
	[UnloadAmount] [float] NULL,
	[DestinationStorageName] [nvarchar](255) NULL,
	[DestinationStorageid] [int] NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[ShippingLoadSheet](
	[id] [int] NOT NULL,
	[system_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[modified_user_id] [int] NULL,
	[modified_user_name] [nvarchar](50) NULL,
	[modified_datetime] [datetime2](7) NULL,
	[operation_type] [int] NULL,
	[effective_start_datetime] [datetime2](7) NULL,
	[effective_end_datetime] [datetime2](7) NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[SourceStorageName] [nvarchar](255) NULL,
	[SourceStorageSystemId] [int] NULL,
	[ClientRepresentative] [nvarchar](255) NULL,
	[ProgramId] [nvarchar](255) NULL,
	[ShippingStatus] [int] NULL,
	[CallSheetNumber] [int] NULL,
	[SourceStorageDescription] [nvarchar](255) NULL,
	[ProductHaulLoadDescription] [nvarchar](255) NULL,
	[ProductHaulLoadSystemId] [int] NULL,
	[OnLocationTime] [datetime2](7) NULL,
	[ExpectedOnLocationTime] [datetime2](7) NULL,
	[ProductHaulLoadid] [int] NULL,
	[RigName] [nvarchar](255) NULL,
	[Destination] [nvarchar](255) NULL,
	[LoadAmount] [float] NULL,
	[ProductHaulid] [int] NULL,
	[ProductHaulSystemId] [int] NULL,
	[ProductHaulName] [nvarchar](100) NULL,
	[ProductHaulDescription] [nvarchar](255) NULL,
	[ClientName] [nvarchar](255) NULL,
	[BlendDescription] [nvarchar](255) NULL,
	[SourceStorageid] [int] NULL,
	[BlendTestStatus] [int] NULL,
	[ProductHaulLoadName] [nvarchar](255) NULL,
	[CallSheetId] [int] NULL,
	[IsGoWithCrew] [bit] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PodLoad](
	[id] [int] NOT NULL,
	[system_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[modified_user_id] [int] NULL,
	[modified_user_name] [nvarchar](50) NULL,
	[modified_datetime] [datetime2](7) NULL,
	[operation_type] [int] NULL,
	[effective_start_datetime] [datetime2](7) NULL,
	[effective_end_datetime] [datetime2](7) NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[ShippingLoadSheetid] [int] NULL,
	[ShippingLoadSheetSystemId] [int] NULL,
	[LoadAmount] [float] NULL,
	[ShippingLoadSheetDescription] [nvarchar](255) NULL,
	[ProductHaulid] [int] NULL,
	[ProductHaulSystemId] [int] NULL,
	[ProductHaulName] [nvarchar](100) NULL,
	[ProductHaulDescription] [nvarchar](255) NULL,
	[PodIndex] [int] NULL,
	[ShippingLoadSheetName] [nvarchar](255) NULL
) ON [PRIMARY]
GO

ALTER TABLE [ProductHaulLoad] ADD [RemainsAmount] [float] NULL default 0;
ALTER TABLE [ProductHaulLoad] ADD [BlendTestingStatus] [int] NULL default 0;
ALTER TABLE [ProductHaulLoad] ADD [BlendShippingStatus] [int] NULL default 0;
Go
ALTER TABLE [ProductHaulLoad] ALTER [RemainsAmount] set default 0

update ProductHaulLoad set [BlendTestingStatus] = 0;
update ProductHaulLoad set [BlendShippingStatus] = 0;
GO

ALTER TABLE [BinInformation] ADD [LastProductHaulLoadId] [int] NULL default 0;
GO
update BinInformation set [LastProductHaulLoadId] = 0;
GO
ALTER TABLE [BinLoadHistory] ADD [BinInformationid] [int] NULL;
ALTER TABLE [BinLoadHistory] ADD [BinInformationSystemId] [int] NULL;
ALTER TABLE [BinLoadHistory] ADD [BinInformationName] [nvarchar](255) NULL;
ALTER TABLE [BinLoadHistory] ADD [BinInformationDescription] [nvarchar](255) NULL;

ALTER TABLE [BinLoadHistory] ADD [ShippingLoadSheetid] [int] NULL;
ALTER TABLE [BinLoadHistory] ADD [ShippingLoadSheetSystemId] [int] NULL;
ALTER TABLE [BinLoadHistory] ADD [ShippingLoadSheetName] [nvarchar](255) NULL;
ALTER TABLE [BinLoadHistory] ADD [ShippingLoadSheetDescription] [nvarchar](255) NULL;

--select * from BinInformation;

-- Location Service

CREATE TABLE [dbo].[Well](
	[id] [int] NOT NULL,
	[system_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[modified_user_id] [int] NULL,
	[modified_user_name] [nvarchar](50) NULL,
	[modified_datetime] [datetime2](7) NULL,
	[operation_type] [int] NULL,
	[effective_start_datetime] [datetime2](7) NULL,
	[effective_end_datetime] [datetime2](7) NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[WellOperatorDescription] [nvarchar](255) NULL,
	[WellOperatorSystemId] [int] NULL,
	[WellLocationTypeid] [int] NULL,
	[WellLocationTypeSystemId] [int] NULL,
	[WellOperatorid] [int] NULL,
	[WellTypeName] [nvarchar](255) NULL,
	[WellLocationTypeDescription] [nvarchar](255) NULL,
	[WellTypeDescription] [nvarchar](255) NULL,
	[DownHoleLocation] [ntext] NULL,
	[WellLocationTypeName] [nvarchar](255) NULL,
	[WellOperatorName] [nvarchar](255) NULL,
	[Longitude] [decimal](18, 6) NULL,
	[Licence] [nvarchar](255) NULL,
	[WellTypeid] [int] NULL,
	[SurfaceLocation] [ntext] NULL,
	[Latitude] [decimal](18, 6) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


CREATE TABLE [dbo].[LocationLookup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[LSD_TWP] [int] NULL,
	[LsdFinderFlag] [int] NULL,
	[ProcessingNotes] [ntext] NULL,
	[LSD_RGE] [int] NULL,
	[Longitude] [decimal](18, 6) NULL,
	[NTS_Map] [int] NULL,
	[NTS_Grid] [int] NULL,
	[ProcessingDateTime] [datetime2](7) NULL,
	[LSD_Mer] [int] NULL,
	[WellLocation] [nvarchar](255) NULL,
	[Latitude] [decimal](18, 6) NULL,
	[NormalizedWellLocation] [nvarchar](255) NULL,
	[NTS_MapSheet] [nvarchar](255) NULL,
	[LSD_LSD] [int] NULL,
	[LSD_Sec] [int] NULL,
	[NTS_QuaterUnit] [int] NULL,
	[NTS_Unit] [int] NULL,
	[NTS_Block] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO



ALTER TABLE [RigJob] ADD [Latitude] [decimal](18, 6) NULL;
ALTER TABLE [RigJob] ADD [Longitude] [decimal](18, 6) NULL;
GO
update rigjob set Latitude = 0, Longitude = 0 where Latitude is null;
Go

ALTER TABLE [Rig] ADD [Latitude] [decimal](18, 6) NULL;
ALTER TABLE [Rig] ADD [Longitude] [decimal](18, 6) NULL;
GO
update Rig set Latitude = 0, Longitude = 0 where Latitude is null;
Go


SET IDENTITY_INSERT [dbo].[LocationLookup] ON 

INSERT INTO [dbo].[LocationLookup]
           ([id]
		   ,[entity_status]
           ,[owner_id]
           ,[name]
           ,[description]
           ,[LSD_TWP]
           ,[LsdFinderFlag]
           ,[ProcessingNotes]
           ,[LSD_RGE]
           ,[Longitude]
           ,[NTS_Map]
           ,[NTS_Grid]
           ,[ProcessingDateTime]
           ,[LSD_Mer]
           ,[WellLocation]
           ,[Latitude]
           ,[NormalizedWellLocation]
           ,[NTS_MapSheet])
     SELECT
           AddedOrder
		   ,0
           ,0
           ,null
           ,null
           ,LSD_TWP
           ,LsdFinderFlag
           ,ProcessingNotes
           ,LSD_RGE
           ,Longitude
           ,NTS_Map
           ,NTS_Grid
           ,ProcessingDateTime
           ,LSD_Mer
           ,WellLocation
           ,Latitude
           ,NormalizedWellLocation
           ,NTS_MapSheet from [Sanjel27\DW].[SESI_DW].[dbo].[Dim_WellLocations]
GO
SET IDENTITY_INSERT [dbo].[LocationLookup] OFF 
GO
/*
CREATE TABLE [dbo].[UnitLocation](
	[id] [int] NOT NULL,
	[system_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[modified_user_id] [int] NULL,
	[modified_user_name] [nvarchar](50) NULL,
	[modified_datetime] [datetime2](7) NULL,
	[operation_type] [int] NULL,
	[effective_start_datetime] [datetime2](7) NULL,
	[effective_end_datetime] [datetime2](7) NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[UnitId] [int] NULL,
	[Latitude] [decimal](18, 6) NULL,
	[Longitude] [decimal](18, 6) NULL,
	[UnitNumber] [nvarchar](255) NULL
) ON [PRIMARY]
GO
*/
-- Sep 6, Add program and ProgramPumpingJobSection, use view to link back data in eService

CREATE VIEW [dbo].[JobDesign]
AS
select 
PRG.id as id,
0 as entity_status,
0 as owner_id,
null as name,
null as description,
PCIS.COMPANY_NAME as ClientCompanyDescription,
0 as ClientCompanySystemId,
Well_Count as WellCount,
PCIS.COMPANY_ID as ClientCompanyid,
PCIS.COMPANY_NAME as ClientCompanyName,
JD_SERVICE_POINT_ID as ServicePointid,
0 as ServicePointSystemId,
PROGRAM_ID as ProgramId,
WLI_WELL_LOCATION as SurfaceLocation,
WLI_RIG_NAME as RigDescription,
0 as RigSystemId,
REVISION_DESCRIPTION as RevisionDescription,
WLI_RIG_ID as Rigid,
Revision as Revision,
JD_SERVICE_POINT_NAME as ServicePointDescription,
JD_SERVICE_POINT_NAME as ServicePointName,
Is_Multiple_Well as IsMultipleWell,
WLI_DH_WELL_LOCATION as WellLocation,
PROGRAM_GENERATED_DATE as JobDateTime,
WLI_RIG_NAME as RigName,
COM.SHORT_NAME as ClientCompanyShortName
from eservice6srd.dbo.programs PRG inner join
eservice6srd.dbo.PRG_COMPANY_INFO_SCTNS PCIS on PCIS.ROOT_ID = PRG.id
inner join eservice6srd.dbo.COMPANIES COM on COM.Id = PCIS.COMPANY_ID
where PCIS.IS_CLIENT = 1
GO


CREATE VIEW [dbo].[JobDesignPumpingJobSection]
AS
select 
PPJS.ID as ID,
0 as entity_status,
ROOT_ID as owner_id,
null as name,
null as description,
8 as JobDuration,
isnull(RISK_MATRIX, 0) as RiskMatrix,
1 as PumperCount,
ROOT_ID as Programid,
JD_JOB_TYPE_ID as JobTypeid,
0 as JobTypeSystemId,
null as JobTypeDescription,
JD_JOB_TYPE_NAME as JobTypeName
from eservice6srd.dbo.PRG_PUMPING_JOB_SECTIONS PPJS;
GO

CREATE TABLE [dbo].[UnitCount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[WorkDate] [datetime2](7) NULL,
	[ScmtCount] [int] NULL,
	[ScmsCount] [int] NULL,
	[UnitStatus] [int] NULL,
	[ServicePointName] [nvarchar](255) NULL,
	[ServicePointSystemId] [int] NULL,
	[ServicePointDescription] [nvarchar](255) NULL,
	[ServicePointid] [int] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[EstimateJob](
	[id] [int] NOT NULL,
	[system_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[modified_user_id] [int] NULL,
	[modified_user_name] [nvarchar](50) NULL,
	[modified_datetime] [datetime2](7) NULL,
	[operation_type] [int] NULL,
	[effective_start_datetime] [datetime2](7) NULL,
	[effective_end_datetime] [datetime2](7) NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[ServicePointid] [int] NULL,
	[ServicePointSystemId] [int] NULL,
	[ClientCompanyShortName] [nvarchar](255) NULL,
	[ServicePointName] [nvarchar](255) NULL,
	[RigDescription] [nvarchar](255) NULL,
	[RigSystemId] [int] NULL,
	[ClientCompanyName] [nvarchar](255) NULL,
	[ClientCompanySystemId] [int] NULL,
	[PumperCount] [int] NULL,
	[JobDuration] [int] NULL,
	[JobTypeid] [int] NULL,
	[JobTypeSystemId] [int] NULL,
	[ProgramId] [nvarchar](255) NULL,
	[RiskMatrix] [float] NULL,
	[ClientCompanyDescription] [nvarchar](255) NULL,
	[ClientCompanyid] [int] NULL,
	[Rigid] [int] NULL,
	[JobDateTime] [datetime2](7) NULL,
	[JobTypeDescription] [nvarchar](255) NULL,
	[RigName] [nvarchar](255) NULL,
	[ServicePointDescription] [nvarchar](255) NULL,
	[PreJobTesting] [bit] NULL,
	[JobTypeName] [nvarchar](255) NULL
) ON [PRIMARY]
GO

ALTER TABLE [RigJob] ADD [PumperCount]  [int] NULL;
ALTER TABLE [RigJob] ADD [JobDuration]  [int] NULL;
ALTER TABLE [RigJob] ADD [PreJobTesting]  [bit] NULL;
Go

--SanjelSecurity




-- Drop Views 
USE [SanjelDataDev]
IF OBJECT_ID(N'dbo.SanjelUser', N'V') IS NOT NULL  
   DROP VIEW [dbo].[SanjelUser];  
GO
IF OBJECT_ID(N'dbo.UserGroup', N'V') IS NOT NULL  
   DROP VIEW [dbo].[UserGroup];  
GO
IF OBJECT_ID(N'dbo.UserGroupSanjelUser', N'V') IS NOT NULL  
   DROP VIEW [dbo].[UserGroupSanjelUser];  
GO
IF OBJECT_ID(N'dbo.UserGroupUserPermission', N'V') IS NOT NULL  
   DROP VIEW [dbo].[UserGroupUserPermission];  
GO
IF OBJECT_ID(N'dbo.UserPermission', N'V') IS NOT NULL  
   DROP VIEW [dbo].[UserPermission];  
GO

CREATE VIEW dbo.[SanjelUser]
as
Select 
	u.id as [ID],
	 0 as [entity_status],
	 0 as [owner_id],
	 Name as [Name],
	 null as [description],
	 u.id as [system_id],
	 1 as [version],
	 0 as [modified_user_id],
	 null as [modified_user_name],
	 cast('2021-12-31 23:59:59.0000000' as datetime2) as [modified_datetime],
	 1 as [operation_type],
	 cast('2021-12-31 23:59:59.0000000' as datetime2) as [effective_start_datetime],
	 cast('9999-12-31 23:59:59.0000000' as datetime2) as [effective_end_datetime],
	 HASHED_PASSWORD as [HashedPassword],
	 u.DISTRICT_ID as [ServicePointid],
	 0 as [ServicePointSystemid],
	 DISTRICT_NAME as [ServicePointName],
	 null as [ServicePointDescription],
	 EMP_ID as [Employeeid],
	 0 as EmployeeSystemid,
	 EMP_NAME as [EmployeeName],
	 null as [EmployeeDescription],
	 name+'@sanjel.com' as [EmailAddress]
from eservice6Dev.dbo.SD_USERS U
join eservice6Dev.dbo.EMPLOYEES EMP on EMP_ID = emp.id
where EMP.[EFFECTIVE_END_DATE_TIME] > getdate();
GO

CREATE VIEW dbo.UserPermission
as
Select 
	id as [ID],
	 0 as [entity_status],
	 0 as [owner_id],
	 Name as [Name],
	 null as [description],
	 id as [system_id],
	 1 as [version],
	 0 as [modified_user_id],
	 null as [modified_user_name],
	 cast('2021-12-31 23:59:59.0000000' as datetime2) as [modified_datetime],
	 1 as [operation_type],
	 cast('2021-12-31 23:59:59.0000000' as datetime2) as [effective_start_datetime],
	 cast('9999-12-31 23:59:59.0000000' as datetime2) as [effective_end_datetime]
from eservice6Dev.dbo.SD_PERMISSIONS;
GO 

CREATE VIEW dbo.UserGroup
as
Select 
	 id as [ID],
	 0 as [entity_status],
	 0 as [owner_id],
	 Name as [NAME],
	 null as [description],
	 id as [system_id],
	 1 as [version],
	 0 as [modified_user_id],
	 null as [modified_user_name],
	 cast('2021-12-31 23:59:59.0000000' as datetime2) as [modified_datetime],
	 1 as [operation_type],
	 cast('2021-12-31 23:59:59.0000000' as datetime2) as [effective_start_datetime],
	 cast('9999-12-31 23:59:59.0000000' as datetime2) as [effective_end_datetime]
from eservice6Dev.dbo.SD_PERMISSIONS;
GO

Create View [dbo].[UserGroupSanjelUser]
AS
 Select cast((ROW_NUMBER() over (Order by GU.User_ID, GU.GROUP_ID)) as int) as ID,
 	 0 as [entity_status],
	 0 as [owner_id],
	 null as [Name],
	 null as [description],
	cast((ROW_NUMBER() over (Order by GU.User_ID, GU.GROUP_ID)) as int) as system_id,
	 1 as [version],
	 0 as [modified_user_id],
	 null as [modified_user_name],
	 cast('2021-12-31 23:59:59.0000000' as datetime2) as [modified_datetime],
	 1 as [operation_type],
	 cast('2021-12-31 23:59:59.0000000' as datetime2) as [effective_start_datetime],
	 cast('9999-12-31 23:59:59.0000000' as datetime2) as [effective_end_datetime],
		  U.ID as [SanjelUserid],
		  0 as [SanjelUserSystemid],
		  U.NAME as [SanjelUserName], null as [SanjelUserDescription],
		  G.ID as [UserGroupid],
		  0 as [UserGroupSystemid],
		  G.NAME as [UserGroupName],
		  null as [UserGroupDescription]
		  from eservice6Dev.dbo.SD_GROUP_USERS GU
		  Join SanjelUser U on GU.USER_ID = U.id
		  join eservice6Dev.dbo.SD_GROUPS G on GU.GROUP_ID = G.ID;
GO
CREATE VIEW dbo.[UserGroupUserPermission] AS
Select
	cast((ROW_NUMBER() over (Order by GU.PERMISSION_ID, GU.GROUP_ID)) as int) as ID,
 	 0 as [entity_status],
	 0 as [owner_id],
	 null as [Name],
	 null as [description],
	cast((ROW_NUMBER() over (Order by GU.PERMISSION_ID, GU.GROUP_ID)) as int) as system_id,
	 1 as [version],
	 0 as [modified_user_id],
	 null as [modified_user_name],
	 cast(Getdate() as datetime2) as [modified_datetime],
	 1 as [operation_type],
	 cast(Getdate() as datetime2) as [effective_start_datetime],
	 cast('9999-12-31 23:59:59.0000000' as datetime2) as [effective_end_datetime],
		  G.ID as [UserGroupid],
		  0 as [UserGroupSystemid],
		  G.NAME as [UserGroupName],
		  null as [UserGroupDescription],
		  u.ID as [UserPermissionid],
		  0 as [UserPermissionSystemid],
		  u.NAME as [UserPermissionName],
		  null as [UserPermissionDescription]
		  from eservice6Dev.dbo.SD_GROUP_PERMISSIONS GU
		  Join eservice6Dev.dbo.SD_PERMISSIONS U on GU.PERMISSION_ID = U.id
		  join eservice6Dev.dbo.SD_GROUPS G on GU.GROUP_ID = G.ID;
GO

		  select * from SanjelUser where name = 'awang';
