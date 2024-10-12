
-- Current Production version published.
-- new script as following

--colin.ji 2019/07/03
CREATE TABLE SanjelData.[dbo].[ServicePointNote] (
  [id] int  NOT NULL,
  [system_id] int  IDENTITY(1,1) NOT NULL,
  [version] int  NULL,
  [modified_user_id] int  NULL,
  [modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [modified_datetime] datetime2(7)  NULL,
  [operation_type] int  NULL,
  [effective_start_datetime] datetime2(7)  NULL,
  [effective_end_datetime] datetime2(7)  NULL,
  [entity_status] int  NULL,
  [owner_id] int  NULL,
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ServicePointSystemId] int  NULL,
  [ServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ServicePointid] int  NULL
);

--colin.ji 2019/07/11
CREATE TABLE SanjelData.[dbo].[BinInformation] (
  [id] int  NOT NULL,
  [system_id] int  IDENTITY(1,1) NOT NULL,
  [version] int  NULL,
  [modified_user_id] int  NULL,
  [modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [modified_datetime] datetime2(7)  NULL,
  [operation_type] int  NULL,
  [effective_start_datetime] datetime2(7)  NULL,
  [effective_end_datetime] datetime2(7)  NULL,
  [entity_status] int  NULL,
  [owner_id] int  NULL,
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [WorkingServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [BinName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Rigid] int  NULL,
  [WorkingServicePointid] int  NULL,
  [RigSystemId] int  NULL,
  [RigName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [WorkingServicePointSystemId] int  NULL,
  [BinDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [BinSystemId] int  NULL,
  [BinStatus] int  NULL,
  [RigDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [WorkingServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Binid] int  NULL
);



SET IDENTITY_INSERT SanjelData.dbo.[BinInformation] ON
GO
insert into SanjelData.dbo.BinInformation(
id,
system_id,
version,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id,
name,
description,
RigName,
BinSystemId,
BinName,
Binid,
BinDescription,
RigDescription,
Rigid,
RigSystemId,
WorkingServicePointid,
WorkingServicePointSystemId,
WorkingServicePointDescription,
WorkingServicePointName,
BinStatus
)
select 
id as id,
system_id as system_id,
version as version,
modified_user_id as modified_user_id,
modified_user_name as modified_user_name,
modified_datetime as modified_datetime,
operation_type as operation_type,
effective_start_datetime as effective_start_datetime,
effective_end_datetime as effective_end_datetime,
entity_status as entity_status,
owner_id as owner_id,
name as name,
description as description,
RigName as RigName,
BinSystemId as BinSystemId,
BinName as BinName,
Binid as Binid,
BinDescription as BinDescription,
RigDescription as RigDescription,
Rigid as Rigid,
RigSystemId as RigSystemId,
WorkingServicePointid as WorkingServicePointid,
WorkingServicePointSystemId as WorkingServicePointSystemId,
WorkingServicePointDescription as WorkingServicePointDescription,
WorkingServicePointName as WorkingServicePointName,
RigBinSectionStatus as BinStatus
from SanjelData.dbo.RigBinSection 

SET IDENTITY_INSERT SanjelData.dbo.[BinInformation] OFF
GO


ALTER TABLE SanjelData.[dbo].[BinInformation] ADD [BlendChemicalName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
GO

ALTER TABLE SanjelData.[dbo].[BinInformation] ADD [Capacity] float(53)  NULL
GO

ALTER TABLE SanjelData.[dbo].[BinInformation] ADD [BlendChemicalid] int  NULL
GO

ALTER TABLE SanjelData.[dbo].[BinInformation] ADD [Quantity] float(53)  NULL
GO

ALTER TABLE SanjelData.[dbo].[BinInformation] ADD [BlendChemicalSystemId] int  NULL
GO

ALTER TABLE SanjelData.[dbo].[BinInformation] ADD [BlendChemicalDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL





--colin.ji 2019/07/16


CREATE TABLE SanjelData.[dbo].[Manifold] (
  [modified_datetime] datetime2(7)  NULL,
  [ManifoldTypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [version] int  NULL,
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [effective_end_datetime] datetime2(7)  NULL,
  [effective_start_datetime] datetime2(7)  NULL,
  [owner_id] int  NULL,
  [modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [HomeServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ManifoldTypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [entity_status] int  NULL,
  [HomeServicePointid] int  NULL,
  [description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [system_id] int  IDENTITY(1,1) NOT NULL,
  [HomeServicePointSystemId] int  NULL,
  [ManifoldTypeid] int  NULL,
  [ManifoldTypeSystemId] int  NULL,
  [id] int  NOT NULL,
  [HomeServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [modified_user_id] int  NULL,
  [operation_type] int  NULL
)
GO

ALTER TABLE SanjelData.[dbo].[Manifold] SET (LOCK_ESCALATION = TABLE)



 CREATE TABLE SanjelData.[dbo].[ManifoldInformation] (
  [ManifoldSystemId] int  NULL,
  [owner_id] int  NULL,
  [system_id] int  IDENTITY(1,1) NOT NULL,
  [effective_start_datetime] datetime2(7)  NULL,
  [WorkingServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [modified_datetime] datetime2(7)  NULL,
  [effective_end_datetime] datetime2(7)  NULL,
  [Manifoldid] int  NULL,
  [version] int  NULL,
  [WorkingServicePointSystemId] int  NULL,
  [ManifoldDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [modified_user_id] int  NULL,
  [WorkingServicePointid] int  NULL,
  [id] int  NOT NULL,
  [WorkingServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [CallsheetNumber] int  NULL,
  [Notes] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Location] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ManifoldName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [entity_status] int  NULL,
  [operation_type] int  NULL,
  [description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE SanjelData.[dbo].[ManifoldInformation] SET (LOCK_ESCALATION = TABLE)
 
 
CREATE TABLE SanjelData.[dbo].[ManifoldType] (
  [system_id] int  IDENTITY(1,1) NOT NULL,
  [modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [effective_start_datetime] datetime2(7)  NULL,
  [owner_id] int  NULL,
  [modified_datetime] datetime2(7)  NULL,
  [version] int  NULL,
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [effective_end_datetime] datetime2(7)  NULL,
  [id] int  NOT NULL,
  [modified_user_id] int  NULL,
  [entity_status] int  NULL,
  [operation_type] int  NULL,
  [description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE SanjelData.[dbo].[ManifoldType] SET (LOCK_ESCALATION = TABLE)


CREATE TABLE SanjelData.[dbo].[PlugLoadingHead] (
  [PlugLoadingHeadSpecialtyid] int  NULL,
  [PlugLoadingHeadTypeSystemId] int  NULL,
  [effective_start_datetime] datetime2(7)  NULL,
  [owner_id] int  NULL,
  [HomeServicePointSystemId] int  NULL,
  [PlugLoadingHeadThreadTypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PlugLoadingHeadThreadTypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [system_id] int  IDENTITY(1,1) NOT NULL,
  [modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PlugLoadingHeadTypeid] int  NULL,
  [modified_datetime] datetime2(7)  NULL,
  [effective_end_datetime] datetime2(7)  NULL,
  [PlugLoadingHeadSizeid] int  NULL,
  [PlugLoadingHeadSizeSystemId] int  NULL,
  [version] int  NULL,
  [HomeServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PlugLoadingHeadThreadTypeid] int  NULL,
  [PlugLoadingHeadSpecialtyDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PlugLoadingHeadSizeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [modified_user_id] int  NULL,
  [PlugLoadingHeadSizeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id] int  NOT NULL,
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [HomeServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PlugLoadingHeadSpecialtyName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PlugLoadingHeadSpecialtySystemId] int  NULL,
  [PlugLoadingHeadTypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [HomeServicePointid] int  NULL,
  [entity_status] int  NULL,
  [PlugLoadingHeadTypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PlugLoadingHeadThreadTypeSystemId] int  NULL,
  [operation_type] int  NULL
)
GO

ALTER TABLE SanjelData.[dbo].[PlugLoadingHead] SET (LOCK_ESCALATION = TABLE)


CREATE TABLE SanjelData.[dbo].[PlugLoadingHeadInformation] (
  [Location] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [RigJobDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [RigJobName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PlugLoadingHeadDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ManifoldDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PlugLoadingHeadSubName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [effective_start_datetime] datetime2(7)  NULL,
  [owner_id] int  NULL,
  [PlugLoadingHeadName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [RigJobSystemId] int  NULL,
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [WorkingServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [TopDriveAdaptorName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [effective_end_datetime] datetime2(7)  NULL,
  [Manifoldid] int  NULL,
  [modified_datetime] datetime2(7)  NULL,
  [PlugLoadingHeadSystemId] int  NULL,
  [PlugLoadingHeadid] int  NULL,
  [version] int  NULL,
  [ManifoldSystemId] int  NULL,
  [entity_status] int  NULL,
  [modified_user_id] int  NULL,
  [RigJobid] int  NULL,
  [Notes] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [operation_type] int  NULL,
  [TopDriveAdaptorDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PlugLoadingHeadSubDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id] int  NOT NULL,
  [CallsheetNumber] int  NULL,
  [PlugLoadingHeadSubSystemId] int  NULL,
  [system_id] int  IDENTITY(1,1) NOT NULL,
  [TopDriveAdaptorSystemId] int  NULL,
  [WorkingServicePointSystemId] int  NULL,
  [modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [TopDriveAdaptorid] int  NULL,
  [ManifoldName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [WorkingServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [WorkingServicePointid] int  NULL,
  [PlugLoadingHeadSubid] int  NULL
)
GO

ALTER TABLE SanjelData.[dbo].[PlugLoadingHeadInformation] SET (LOCK_ESCALATION = TABLE)

CREATE TABLE SanjelData.[dbo].[PlugLoadingHeadSize] (
  [description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [system_id] int  IDENTITY(1,1) NOT NULL,
  [owner_id] int  NULL,
  [effective_start_datetime] datetime2(7)  NULL,
  [version] int  NULL,
  [modified_datetime] datetime2(7)  NULL,
  [effective_end_datetime] datetime2(7)  NULL,
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id] int  NOT NULL,
  [operation_type] int  NULL,
  [entity_status] int  NULL,
  [modified_user_id] int  NULL
)
GO

ALTER TABLE SanjelData.[dbo].[PlugLoadingHeadSize] SET (LOCK_ESCALATION = TABLE)


CREATE TABLE SanjelData.[dbo].[PlugLoadingHeadSpecialty] (
  [description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [entity_status] int  NULL,
  [modified_user_id] int  NULL,
  [operation_type] int  NULL,
  [owner_id] int  NULL,
  [effective_start_datetime] datetime2(7)  NULL,
  [system_id] int  IDENTITY(1,1) NOT NULL,
  [modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [modified_datetime] datetime2(7)  NULL,
  [version] int  NULL,
  [id] int  NOT NULL,
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [effective_end_datetime] datetime2(7)  NULL
)
GO

ALTER TABLE SanjelData.[dbo].[PlugLoadingHeadSpecialty] SET (LOCK_ESCALATION = TABLE)


CREATE TABLE SanjelData.[dbo].[PlugLoadingHeadSub] (
  [HomeServicePointid] int  NULL,
  [modified_user_id] int  NULL,
  [id] int  NOT NULL,
  [description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [operation_type] int  NULL,
  [entity_status] int  NULL,
  [PlugLoadingHeadSubThreadTypeSystemId] int  NULL,
  [PlugLoadingHeadSubThreadTypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [system_id] int  IDENTITY(1,1) NOT NULL,
  [effective_start_datetime] datetime2(7)  NULL,
  [modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [owner_id] int  NULL,
  [HomeServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [HomeServicePointSystemId] int  NULL,
  [PlugLoadingHeadSubThreadTypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [version] int  NULL,
  [effective_end_datetime] datetime2(7)  NULL,
  [modified_datetime] datetime2(7)  NULL,
  [HomeServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PlugLoadingHeadSubThreadTypeid] int  NULL
)
GO

ALTER TABLE SanjelData.[dbo].[PlugLoadingHeadSub] SET (LOCK_ESCALATION = TABLE)


CREATE TABLE SanjelData.[dbo].[PlugLoadingHeadSubInformation] (
  [effective_start_datetime] datetime2(7)  NULL,
  [modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Location] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [WorkingServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [owner_id] int  NULL,
  [PlugLoadingHeadSubDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PlugLoadingHeadSubName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [version] int  NULL,
  [modified_datetime] datetime2(7)  NULL,
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [effective_end_datetime] datetime2(7)  NULL,
  [WorkingServicePointSystemId] int  NULL,
  [PlugLoadingHeadSubSystemId] int  NULL,
  [PlugLoadingHeadSubid] int  NULL,
  [CallsheetNumber] int  NULL,
  [modified_user_id] int  NULL,
  [operation_type] int  NULL,
  [id] int  NOT NULL,
  [entity_status] int  NULL,
  [description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [WorkingServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [system_id] int  IDENTITY(1,1) NOT NULL,
  [WorkingServicePointid] int  NULL,
  [Notes] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE SanjelData.[dbo].[PlugLoadingHeadSubInformation] SET (LOCK_ESCALATION = TABLE)


CREATE TABLE SanjelData.[dbo].[PlugLoadingHeadSubThreadType] (
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [effective_end_datetime] datetime2(7)  NULL,
  [id] int  NOT NULL,
  [operation_type] int  NULL,
  [modified_user_id] int  NULL,
  [entity_status] int  NULL,
  [description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [system_id] int  IDENTITY(1,1) NOT NULL,
  [modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [owner_id] int  NULL,
  [effective_start_datetime] datetime2(7)  NULL,
  [version] int  NULL,
  [modified_datetime] datetime2(7)  NULL
)
GO

ALTER TABLE SanjelData.[dbo].[PlugLoadingHeadSubThreadType] SET (LOCK_ESCALATION = TABLE)


CREATE TABLE SanjelData.[dbo].[PlugLoadingHeadThreadType] (
  [description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [entity_status] int  NULL,
  [system_id] int  IDENTITY(1,1) NOT NULL,
  [modified_user_id] int  NULL,
  [id] int  NOT NULL,
  [operation_type] int  NULL,
  [version] int  NULL,
  [effective_end_datetime] datetime2(7)  NULL,
  [modified_datetime] datetime2(7)  NULL,
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [effective_start_datetime] datetime2(7)  NULL,
  [modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [owner_id] int  NULL
)
GO

ALTER TABLE SanjelData.[dbo].[PlugLoadingHeadThreadType] SET (LOCK_ESCALATION = TABLE)


CREATE TABLE SanjelData.[dbo].[PlugLoadingHeadType] (
  [modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [owner_id] int  NULL,
  [effective_start_datetime] datetime2(7)  NULL,
  [system_id] int  IDENTITY(1,1) NOT NULL,
  [version] int  NULL,
  [modified_datetime] datetime2(7)  NULL,
  [id] int  NOT NULL,
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [effective_end_datetime] datetime2(7)  NULL,
  [description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [entity_status] int  NULL,
  [operation_type] int  NULL,
  [modified_user_id] int  NULL
)
GO

ALTER TABLE SanjelData.[dbo].[PlugLoadingHeadType] SET (LOCK_ESCALATION = TABLE)


CREATE TABLE SanjelData.[dbo].[TopDrivceAdaptorInformation] (
  [description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [operation_type] int  NULL,
  [entity_status] int  NULL,
  [TopDriveAdaptorName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Notes] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [TopDriveAdaptorSystemId] int  NULL,
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [WorkingServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [WorkingServicePointSystemId] int  NULL,
  [WorkingServicePointid] int  NULL,
  [id] int  NOT NULL,
  [modified_user_id] int  NULL,
  [CallsheetNumber] int  NULL,
  [WorkingServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [version] int  NULL,
  [TopDriveAdaptorDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [effective_end_datetime] datetime2(7)  NULL,
  [modified_datetime] datetime2(7)  NULL,
  [modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [effective_start_datetime] datetime2(7)  NULL,
  [TopDriveAdaptorid] int  NULL,
  [system_id] int  IDENTITY(1,1) NOT NULL,
  [owner_id] int  NULL,
  [Location] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE SanjelData.[dbo].[TopDrivceAdaptorInformation] SET (LOCK_ESCALATION = TABLE)


CREATE TABLE SanjelData.[dbo].[TopDriveAdaptor] (
  [owner_id] int  NULL,
  [TopDrviceAdaptorThreadTypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [TopDrviceAdaptorThreadTypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [version] int  NULL,
  [HomeServicePointSystemId] int  NULL,
  [modified_datetime] datetime2(7)  NULL,
  [effective_end_datetime] datetime2(7)  NULL,
  [HomeServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [HomeServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [modified_user_id] int  NULL,
  [TopDrviceAdaptorThreadTypeid] int  NULL,
  [id] int  NOT NULL,
  [description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [operation_type] int  NULL,
  [entity_status] int  NULL,
  [HomeServicePointid] int  NULL,
  [TopDrviceAdaptorThreadTypeSystemId] int  NULL,
  [system_id] int  IDENTITY(1,1) NOT NULL,
  [effective_start_datetime] datetime2(7)  NULL,
  [modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE SanjelData.[dbo].[TopDriveAdaptor] SET (LOCK_ESCALATION = TABLE)


CREATE TABLE SanjelData.[dbo].[TopDrviceAdaptorThreadType] (
  [version] int  NULL,
  [modified_datetime] datetime2(7)  NULL,
  [id] int  NOT NULL,
  [effective_end_datetime] datetime2(7)  NULL,
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [entity_status] int  NULL,
  [operation_type] int  NULL,
  [modified_user_id] int  NULL,
  [modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [owner_id] int  NULL,
  [effective_start_datetime] datetime2(7)  NULL,
  [system_id] int  IDENTITY(1,1) NOT NULL
)
GO

ALTER TABLE SanjelData.[dbo].[TopDrviceAdaptorThreadType] SET (LOCK_ESCALATION = TABLE)


ALTER TABLE SanjelData.[dbo].[Manifold] ADD [SerialNumber] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;
ALTER TABLE SanjelData.[dbo].[PlugLoadingHead] ADD [SerialNumber] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;
ALTER TABLE SanjelData.[dbo].[TopDriveAdaptor] ADD [SerialNumber] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;
ALTER TABLE SanjelData.[dbo].[PlugLoadingHeadSub] ADD [SerialNumber] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;


--colin.ji 2019/07/17

ALTER TABLE SanjelData.[dbo].[PlugLoadingHeadSub] ADD [PlugLoadingHeadSizeid] int  NULL
GO

ALTER TABLE SanjelData.[dbo].[PlugLoadingHeadSub] ADD [PlugLoadingHeadSizeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
GO

ALTER TABLE SanjelData.[dbo].[PlugLoadingHeadSub] ADD [PlugLoadingHeadSizeSystemId] int  NULL
GO

ALTER TABLE SanjelData.[dbo].[PlugLoadingHeadSub] ADD [PlugLoadingHeadSizeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL


ALTER TABLE SanjelData.[dbo].[TopDriveAdaptor] ADD [TopDrivceAdaptorSizeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
GO

ALTER TABLE SanjelData.[dbo].[TopDriveAdaptor] ADD [TopDrivceAdaptorSizeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
GO

ALTER TABLE SanjelData.[dbo].[TopDriveAdaptor] ADD [TopDrivceAdaptorSizeid] int  NULL
GO

ALTER TABLE SanjelData.[dbo].[TopDriveAdaptor] ADD [TopDrivceAdaptorSizeSystemId] int  NULL


CREATE TABLE SanjelData.[dbo].[PlugLoadingHeadSubSize] (
  [effective_end_datetime] datetime2(7)  NULL,
  [modified_datetime] datetime2(7)  NULL,
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [owner_id] int  NULL,
  [version] int  NULL,
  [system_id] int  IDENTITY(1,1) NOT NULL,
  [modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [effective_start_datetime] datetime2(7)  NULL,
  [id] int  NOT NULL,
  [operation_type] int  NULL,
  [modified_user_id] int  NULL,
  [description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [entity_status] int  NULL
)
GO

ALTER TABLE SanjelData.[dbo].[PlugLoadingHeadSubSize] SET (LOCK_ESCALATION = TABLE)

CREATE TABLE SanjelData.[dbo].[TopDriveAdaptorSize] (
  [id] int  NOT NULL,
  [operation_type] int  NULL,
  [modified_user_id] int  NULL,
  [version] int  NULL,
  [modified_datetime] datetime2(7)  NULL,
  [effective_end_datetime] datetime2(7)  NULL,
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [owner_id] int  NULL,
  [effective_start_datetime] datetime2(7)  NULL,
  [entity_status] int  NULL,
  [description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [system_id] int  IDENTITY(1,1) NOT NULL
)
GO

ALTER TABLE SanjelData.[dbo].[TopDriveAdaptorSize] SET (LOCK_ESCALATION = TABLE);

EXEC sp_rename 'SanjelData.[dbo].[PlugLoadingHeadSub].[PlugLoadingHeadSizeSystemId]', 'PlugLoadingHeadSubSizeSystemId' , 'column';
EXEC sp_rename 'SanjelData.[dbo].[PlugLoadingHeadSub].[PlugLoadingHeadSizeName]', 'PlugLoadingHeadSubSizeName' , 'column';
EXEC sp_rename 'SanjelData.[dbo].[PlugLoadingHeadSub].[PlugLoadingHeadSizeid]', 'PlugLoadingHeadSubSizeid' , 'column';
EXEC sp_rename 'SanjelData.[dbo].[PlugLoadingHeadSub].[PlugLoadingHeadSizeDescription]', 'PlugLoadingHeadSubSizeDescription' , 'column';


--colin.ji 2019/07/18

ALTER TABLE SanjelData.[dbo].[ManifoldInformation] ADD [EquipmentStatus] int  NULL
ALTER TABLE SanjelData.[dbo].[PlugLoadingHeadInformation] ADD [EquipmentStatus] int  NULL
ALTER TABLE SanjelData.[dbo].[PlugLoadingHeadSubInformation] ADD [EquipmentStatus] int  NULL
ALTER TABLE SanjelData.[dbo].[TopDrivceAdaptorInformation] ADD [EquipmentStatus] int  NULL



UPDATE SanjelData.[dbo].[PlugLoadingHeadInformation] SET EquipmentStatus=1
UPDATE SanjelData.[dbo].[PlugLoadingHeadSubInformation] SET EquipmentStatus=1
UPDATE SanjelData.[dbo].[TopDrivceAdaptorInformation] SET EquipmentStatus=1
UPDATE SanjelData.[dbo].[ManifoldInformation] SET EquipmentStatus=1




--2019/07/29 colin.ji
SET IDENTITY_INSERT SanjelData.[dbo].[ManifoldType] ON
GO
INSERT INTO SanjelData.[dbo].[ManifoldType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:39:58.0870000', 1, '9999-12-31 23:59:59.0000000', N'Plug Loading', N'Plug Loading', 0, 1, 0, NULL, 0, '2019-07-29 16:39:58.0870000', 1);
INSERT INTO SanjelData.[dbo].[ManifoldType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:04.3700000', 2, '9999-12-31 23:59:59.0000000', N'Flush', N'Flush', 0, 1, 0, NULL, 0, '2019-07-29 16:40:04.3700000', 2);
INSERT INTO SanjelData.[dbo].[ManifoldType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:10.2070000', 3, '9999-12-31 23:59:59.0000000', N'Squeeze', N'Squeeze', 0, 1, 0, NULL, 0, '2019-07-29 16:40:10.2070000', 3);
SET IDENTITY_INSERT SanjelData.[dbo].[ManifoldType] OFF
GO

SET IDENTITY_INSERT SanjelData.[dbo].[PlugLoadingHeadType] ON
GO
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:39:58.0870000', 1, '9999-12-31 23:59:59.0000000', N'IRI', N'IRI', 0, 1, 0, NULL, 0, '2019-07-29 16:39:58.0870000', 1);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:04.3700000', 2, '9999-12-31 23:59:59.0000000', N'IRI L.W', N'IRI L.W', 0, 1, 0, NULL, 0, '2019-07-29 16:40:04.3700000', 2);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:10.2070000', 3, '9999-12-31 23:59:59.0000000', N'Sabre', N'Sabre', 0, 1, 0, NULL, 0, '2019-07-29 16:40:10.2070000', 3);
SET IDENTITY_INSERT SanjelData.[dbo].[PlugLoadingHeadType] OFF
GO

SET IDENTITY_INSERT SanjelData.[dbo].[PlugLoadingHeadSpecialty] ON
GO
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSpecialty]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:39:58.0870000', 1, '9999-12-31 23:59:59.0000000', N'Standard', N'Standard', 0, 1, 0, NULL, 0, '2019-07-29 16:39:58.0870000', 1);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSpecialty]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:04.3700000', 2, '9999-12-31 23:59:59.0000000', N'Double Plug Rotator', N'Double Plug Rotator', 0, 1, 0, NULL, 0, '2019-07-29 16:40:04.3700000', 2);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSpecialty]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:10.2070000', 3, '9999-12-31 23:59:59.0000000', N'Rotating', N'Rotating', 0, 1, 0, NULL, 0, '2019-07-29 16:40:10.2070000', 3);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSpecialty]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:15.8670000', 4, '9999-12-31 23:59:59.0000000', N'Double Rotating', N'Double Rotating', 0, 1, 0, NULL, 0, '2019-07-29 16:40:15.8670000', 4);
SET IDENTITY_INSERT SanjelData.[dbo].[PlugLoadingHeadSpecialty] OFF
GO

SET IDENTITY_INSERT SanjelData.[dbo].[TopDrviceAdaptorThreadType] ON
GO
INSERT INTO SanjelData.[dbo].[TopDrviceAdaptorThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:39:58.0870000', 1, '9999-12-31 23:59:59.0000000', N'114.3mm', N'114.3mm', 0, 1, 0, NULL, 0, '2019-07-29 16:39:58.0870000', 1);
INSERT INTO SanjelData.[dbo].[TopDrviceAdaptorThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:04.3700000', 2, '9999-12-31 23:59:59.0000000', N'127.0mm', N'127.0mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:04.3700000', 2);
INSERT INTO SanjelData.[dbo].[TopDrviceAdaptorThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:10.2070000', 3, '9999-12-31 23:59:59.0000000', N'139.7mm', N'139.7mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:10.2070000', 3);
INSERT INTO SanjelData.[dbo].[TopDrviceAdaptorThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:15.8670000', 4, '9999-12-31 23:59:59.0000000', N'177.8mm', N'177.8mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:15.8670000', 4);
INSERT INTO SanjelData.[dbo].[TopDrviceAdaptorThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:21.8530000', 5, '9999-12-31 23:59:59.0000000', N'193.7mm', N'193.7mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:21.8530000', 5);
INSERT INTO SanjelData.[dbo].[TopDrviceAdaptorThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:28.3330000', 6, '9999-12-31 23:59:59.0000000', N'219.1mm', N'219.1mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:28.3330000', 6);
INSERT INTO SanjelData.[dbo].[TopDrviceAdaptorThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:35.9200000', 7, '9999-12-31 23:59:59.0000000', N'244.5mm', N'244.5mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:35.9200000', 7);
INSERT INTO SanjelData.[dbo].[TopDrviceAdaptorThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:46.3430000', 8, '9999-12-31 23:59:59.0000000', N'273.1mm', N'273.1mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:46.3430000', 8);
INSERT INTO SanjelData.[dbo].[TopDrviceAdaptorThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:52.7100000', 9, '9999-12-31 23:59:59.0000000', N'298.5mm', N'298.5mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:52.7100000', 9);
INSERT INTO SanjelData.[dbo].[TopDrviceAdaptorThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:57.8270000', 10, '9999-12-31 23:59:59.0000000', N'339.7mm', N'339.7mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:57.8270000', 10);
INSERT INTO SanjelData.[dbo].[TopDrviceAdaptorThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:41:03.7730000', 11, '9999-12-31 23:59:59.0000000', N'406.4mm', N'406.4mm', 0, 1, 0, NULL, 0, '2019-07-29 16:41:03.7730000', 11);
INSERT INTO SanjelData.[dbo].[TopDrviceAdaptorThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:41:09.4670000', 12, '9999-12-31 23:59:59.0000000', N'508.0mm', N'508.0mm', 0, 1, 0, NULL, 0, '2019-07-29 16:41:09.4670000', 12);
SET IDENTITY_INSERT SanjelData.[dbo].[TopDrviceAdaptorThreadType] OFF
GO

SET IDENTITY_INSERT SanjelData.[dbo].[TopDriveAdaptorSize] ON
GO
INSERT INTO SanjelData.[dbo].[TopDriveAdaptorSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:39:58.0870000', 1, '9999-12-31 23:59:59.0000000', N'114.3mm', N'114.3mm', 0, 1, 0, NULL, 0, '2019-07-29 16:39:58.0870000', 1);
INSERT INTO SanjelData.[dbo].[TopDriveAdaptorSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:04.3700000', 2, '9999-12-31 23:59:59.0000000', N'127.0mm', N'127.0mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:04.3700000', 2);
INSERT INTO SanjelData.[dbo].[TopDriveAdaptorSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:10.2070000', 3, '9999-12-31 23:59:59.0000000', N'139.7mm', N'139.7mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:10.2070000', 3);
INSERT INTO SanjelData.[dbo].[TopDriveAdaptorSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:15.8670000', 4, '9999-12-31 23:59:59.0000000', N'177.8mm', N'177.8mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:15.8670000', 4);
INSERT INTO SanjelData.[dbo].[TopDriveAdaptorSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:21.8530000', 5, '9999-12-31 23:59:59.0000000', N'193.7mm', N'193.7mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:21.8530000', 5);
INSERT INTO SanjelData.[dbo].[TopDriveAdaptorSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:28.3330000', 6, '9999-12-31 23:59:59.0000000', N'219.1mm', N'219.1mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:28.3330000', 6);
INSERT INTO SanjelData.[dbo].[TopDriveAdaptorSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:35.9200000', 7, '9999-12-31 23:59:59.0000000', N'244.5mm', N'244.5mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:35.9200000', 7);
INSERT INTO SanjelData.[dbo].[TopDriveAdaptorSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:46.3430000', 8, '9999-12-31 23:59:59.0000000', N'273.1mm', N'273.1mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:46.3430000', 8);
INSERT INTO SanjelData.[dbo].[TopDriveAdaptorSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:52.7100000', 9, '9999-12-31 23:59:59.0000000', N'298.5mm', N'298.5mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:52.7100000', 9);
INSERT INTO SanjelData.[dbo].[TopDriveAdaptorSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:57.8270000', 10, '9999-12-31 23:59:59.0000000', N'339.7mm', N'339.7mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:57.8270000', 10);
INSERT INTO SanjelData.[dbo].[TopDriveAdaptorSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:41:03.7730000', 11, '9999-12-31 23:59:59.0000000', N'406.4mm', N'406.4mm', 0, 1, 0, NULL, 0, '2019-07-29 16:41:03.7730000', 11);
INSERT INTO SanjelData.[dbo].[TopDriveAdaptorSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:41:09.4670000', 12, '9999-12-31 23:59:59.0000000', N'508.0mm', N'508.0mm', 0, 1, 0, NULL, 0, '2019-07-29 16:41:09.4670000', 12);
SET IDENTITY_INSERT SanjelData.[dbo].[TopDriveAdaptorSize] OFF
GO


SET IDENTITY_INSERT SanjelData.[dbo].[PlugLoadingHeadSubSize] ON
GO
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:39:58.0870000', 1, '9999-12-31 23:59:59.0000000', N'114.3mm', N'114.3mm', 0, 1, 0, NULL, 0, '2019-07-29 16:39:58.0870000', 1);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:04.3700000', 2, '9999-12-31 23:59:59.0000000', N'127.0mm', N'127.0mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:04.3700000', 2);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:10.2070000', 3, '9999-12-31 23:59:59.0000000', N'139.7mm', N'139.7mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:10.2070000', 3);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:15.8670000', 4, '9999-12-31 23:59:59.0000000', N'177.8mm', N'177.8mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:15.8670000', 4);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:21.8530000', 5, '9999-12-31 23:59:59.0000000', N'193.7mm', N'193.7mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:21.8530000', 5);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:28.3330000', 6, '9999-12-31 23:59:59.0000000', N'219.1mm', N'219.1mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:28.3330000', 6);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:35.9200000', 7, '9999-12-31 23:59:59.0000000', N'244.5mm', N'244.5mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:35.9200000', 7);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:46.3430000', 8, '9999-12-31 23:59:59.0000000', N'273.1mm', N'273.1mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:46.3430000', 8);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:52.7100000', 9, '9999-12-31 23:59:59.0000000', N'298.5mm', N'298.5mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:52.7100000', 9);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:57.8270000', 10, '9999-12-31 23:59:59.0000000', N'339.7mm', N'339.7mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:57.8270000', 10);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:41:03.7730000', 11, '9999-12-31 23:59:59.0000000', N'406.4mm', N'406.4mm', 0, 1, 0, NULL, 0, '2019-07-29 16:41:03.7730000', 11);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:41:09.4670000', 12, '9999-12-31 23:59:59.0000000', N'508.0mm', N'508.0mm', 0, 1, 0, NULL, 0, '2019-07-29 16:41:09.4670000', 12);
SET IDENTITY_INSERT SanjelData.[dbo].[PlugLoadingHeadSubSize] OFF
GO


SET IDENTITY_INSERT SanjelData.[dbo].[PlugLoadingHeadSubThreadType] ON
GO
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:39:58.0870000', 1, '9999-12-31 23:59:59.0000000', N'114.3mm', N'114.3mm', 0, 1, 0, NULL, 0, '2019-07-29 16:39:58.0870000', 1);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:04.3700000', 2, '9999-12-31 23:59:59.0000000', N'127.0mm', N'127.0mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:04.3700000', 2);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:10.2070000', 3, '9999-12-31 23:59:59.0000000', N'139.7mm', N'139.7mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:10.2070000', 3);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:15.8670000', 4, '9999-12-31 23:59:59.0000000', N'177.8mm', N'177.8mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:15.8670000', 4);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:21.8530000', 5, '9999-12-31 23:59:59.0000000', N'193.7mm', N'193.7mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:21.8530000', 5);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:28.3330000', 6, '9999-12-31 23:59:59.0000000', N'219.1mm', N'219.1mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:28.3330000', 6);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:35.9200000', 7, '9999-12-31 23:59:59.0000000', N'244.5mm', N'244.5mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:35.9200000', 7);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:46.3430000', 8, '9999-12-31 23:59:59.0000000', N'273.1mm', N'273.1mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:46.3430000', 8);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:52.7100000', 9, '9999-12-31 23:59:59.0000000', N'298.5mm', N'298.5mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:52.7100000', 9);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:57.8270000', 10, '9999-12-31 23:59:59.0000000', N'339.7mm', N'339.7mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:57.8270000', 10);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:41:03.7730000', 11, '9999-12-31 23:59:59.0000000', N'406.4mm', N'406.4mm', 0, 1, 0, NULL, 0, '2019-07-29 16:41:03.7730000', 11);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:41:09.4670000', 12, '9999-12-31 23:59:59.0000000', N'508.0mm', N'508.0mm', 0, 1, 0, NULL, 0, '2019-07-29 16:41:09.4670000', 12);
SET IDENTITY_INSERT SanjelData.[dbo].[PlugLoadingHeadSubThreadType] OFF
GO


SET IDENTITY_INSERT SanjelData.[dbo].[PlugLoadingHeadSize] ON
GO
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:39:58.0870000', 1, '9999-12-31 23:59:59.0000000', N'114.3mm', N'114.3mm', 0, 1, 0, NULL, 0, '2019-07-29 16:39:58.0870000', 1);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:04.3700000', 2, '9999-12-31 23:59:59.0000000', N'127.0mm', N'127.0mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:04.3700000', 2);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:10.2070000', 3, '9999-12-31 23:59:59.0000000', N'139.7mm', N'139.7mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:10.2070000', 3);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:15.8670000', 4, '9999-12-31 23:59:59.0000000', N'177.8mm', N'177.8mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:15.8670000', 4);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:21.8530000', 5, '9999-12-31 23:59:59.0000000', N'193.7mm', N'193.7mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:21.8530000', 5);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:28.3330000', 6, '9999-12-31 23:59:59.0000000', N'219.1mm', N'219.1mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:28.3330000', 6);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:35.9200000', 7, '9999-12-31 23:59:59.0000000', N'244.5mm', N'244.5mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:35.9200000', 7);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:46.3430000', 8, '9999-12-31 23:59:59.0000000', N'273.1mm', N'273.1mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:46.3430000', 8);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:52.7100000', 9, '9999-12-31 23:59:59.0000000', N'298.5mm', N'298.5mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:52.7100000', 9);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:57.8270000', 10, '9999-12-31 23:59:59.0000000', N'339.7mm', N'339.7mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:57.8270000', 10);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:41:03.7730000', 11, '9999-12-31 23:59:59.0000000', N'406.4mm', N'406.4mm', 0, 1, 0, NULL, 0, '2019-07-29 16:41:03.7730000', 11);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSize]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:41:09.4670000', 12, '9999-12-31 23:59:59.0000000', N'508.0mm', N'508.0mm', 0, 1, 0, NULL, 0, '2019-07-29 16:41:09.4670000', 12);
SET IDENTITY_INSERT SanjelData.[dbo].[PlugLoadingHeadSize] OFF
GO


SET IDENTITY_INSERT SanjelData.[dbo].[PlugLoadingHeadThreadType] ON
GO
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:39:58.0870000', 1, '9999-12-31 23:59:59.0000000', N'114.3mm', N'114.3mm', 0, 1, 0, NULL, 0, '2019-07-29 16:39:58.0870000', 1);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:04.3700000', 2, '9999-12-31 23:59:59.0000000', N'127.0mm', N'127.0mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:04.3700000', 2);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:10.2070000', 3, '9999-12-31 23:59:59.0000000', N'139.7mm', N'139.7mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:10.2070000', 3);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:15.8670000', 4, '9999-12-31 23:59:59.0000000', N'177.8mm', N'177.8mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:15.8670000', 4);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:21.8530000', 5, '9999-12-31 23:59:59.0000000', N'193.7mm', N'193.7mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:21.8530000', 5);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:28.3330000', 6, '9999-12-31 23:59:59.0000000', N'219.1mm', N'219.1mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:28.3330000', 6);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:35.9200000', 7, '9999-12-31 23:59:59.0000000', N'244.5mm', N'244.5mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:35.9200000', 7);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:46.3430000', 8, '9999-12-31 23:59:59.0000000', N'273.1mm', N'273.1mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:46.3430000', 8);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:52.7100000', 9, '9999-12-31 23:59:59.0000000', N'298.5mm', N'298.5mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:52.7100000', 9);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:57.8270000', 10, '9999-12-31 23:59:59.0000000', N'339.7mm', N'339.7mm', 0, 1, 0, NULL, 0, '2019-07-29 16:40:57.8270000', 10);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:41:03.7730000', 11, '9999-12-31 23:59:59.0000000', N'406.4mm', N'406.4mm', 0, 1, 0, NULL, 0, '2019-07-29 16:41:03.7730000', 11);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:41:09.4670000', 12, '9999-12-31 23:59:59.0000000', N'508.0mm', N'508.0mm', 0, 1, 0, NULL, 0, '2019-07-29 16:41:09.4670000', 12);
SET IDENTITY_INSERT SanjelData.[dbo].[PlugLoadingHeadThreadType] OFF
GO

--2019/08/07 colin.ji

TRUNCATE TABLE SanjelData.dbo.PlugLoadingHeadSubThreadType

SET IDENTITY_INSERT SanjelData.[dbo].[PlugLoadingHeadSubThreadType] ON
GO
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:39:58.0870000', 1, '9999-12-31 23:59:59.0000000', N'', N'', 0, 1, 0, NULL, 0, '2019-07-29 16:39:58.0870000', 1);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:04.3700000', 2, '9999-12-31 23:59:59.0000000', N'EUE', N'EUE', 0, 1, 0, NULL, 0, '2019-07-29 16:40:04.3700000', 2);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:10.2070000', 3, '9999-12-31 23:59:59.0000000', N'8-Round', N'8-Round', 0, 1, 0, NULL, 0, '2019-07-29 16:40:10.2070000', 3);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:15.8670000', 4, '9999-12-31 23:59:59.0000000', N'Buttress', N'Buttress', 0, 1, 0, NULL, 0, '2019-07-29 16:40:15.8670000', 4);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:21.8530000', 5, '9999-12-31 23:59:59.0000000', N'Hydril 513', N'Hydril 513', 0, 1, 0, NULL, 0, '2019-07-29 16:40:21.8530000', 5);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:28.3330000', 6, '9999-12-31 23:59:59.0000000', N'Hydril 523', N'Hydril 523', 0, 1, 0, NULL, 0, '2019-07-29 16:40:28.3330000', 6);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:35.9200000', 7, '9999-12-31 23:59:59.0000000', N'Hydril SLX', N'Hydril SLX', 0, 1, 0, NULL, 0, '2019-07-29 16:40:35.9200000', 7);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:46.3430000', 8, '9999-12-31 23:59:59.0000000', N'QB-2', N'QB-2', 0, 1, 0, NULL, 0, '2019-07-29 16:40:46.3430000', 8);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:52.7100000', 9, '9999-12-31 23:59:59.0000000', N'IF', N'IF', 0, 1, 0, NULL, 0, '2019-07-29 16:40:52.7100000', 9);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:57.8270000', 10, '9999-12-31 23:59:59.0000000', N'FH', N'FH', 0, 1, 0, NULL, 0, '2019-07-29 16:40:57.8270000', 10);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadSubThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:41:03.7730000', 11, '9999-12-31 23:59:59.0000000', N'XH', N'XH', 0, 1, 0, NULL, 0, '2019-07-29 16:41:03.7730000', 11);

SET IDENTITY_INSERT SanjelData.[dbo].[PlugLoadingHeadSubThreadType] OFF
GO


TRUNCATE TABLE SanjelData.dbo.TopDrviceAdaptorThreadType

SET IDENTITY_INSERT SanjelData.[dbo].[TopDrviceAdaptorThreadType] ON
GO
INSERT INTO SanjelData.[dbo].[TopDrviceAdaptorThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:39:58.0870000', 1, '9999-12-31 23:59:59.0000000', N'', N'', 0, 1, 0, NULL, 0, '2019-07-29 16:39:58.0870000', 1);
INSERT INTO SanjelData.[dbo].[TopDrviceAdaptorThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:04.3700000', 2, '9999-12-31 23:59:59.0000000', N'EUE', N'EUE', 0, 1, 0, NULL, 0, '2019-07-29 16:40:04.3700000', 2);
INSERT INTO SanjelData.[dbo].[TopDrviceAdaptorThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:10.2070000', 3, '9999-12-31 23:59:59.0000000', N'8-Round', N'8-Round', 0, 1, 0, NULL, 0, '2019-07-29 16:40:10.2070000', 3);
INSERT INTO SanjelData.[dbo].[TopDrviceAdaptorThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:15.8670000', 4, '9999-12-31 23:59:59.0000000', N'Buttress', N'Buttress', 0, 1, 0, NULL, 0, '2019-07-29 16:40:15.8670000', 4);
INSERT INTO SanjelData.[dbo].[TopDrviceAdaptorThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:21.8530000', 5, '9999-12-31 23:59:59.0000000', N'Hydril 513', N'Hydril 513', 0, 1, 0, NULL, 0, '2019-07-29 16:40:21.8530000', 5);
INSERT INTO SanjelData.[dbo].[TopDrviceAdaptorThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:28.3330000', 6, '9999-12-31 23:59:59.0000000', N'Hydril 523', N'Hydril 523', 0, 1, 0, NULL, 0, '2019-07-29 16:40:28.3330000', 6);
INSERT INTO SanjelData.[dbo].[TopDrviceAdaptorThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:35.9200000', 7, '9999-12-31 23:59:59.0000000', N'Hydril SLX', N'Hydril SLX', 0, 1, 0, NULL, 0, '2019-07-29 16:40:35.9200000', 7);
INSERT INTO SanjelData.[dbo].[TopDrviceAdaptorThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:46.3430000', 8, '9999-12-31 23:59:59.0000000', N'QB-2', N'QB-2', 0, 1, 0, NULL, 0, '2019-07-29 16:40:46.3430000', 8);
INSERT INTO SanjelData.[dbo].[TopDrviceAdaptorThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:52.7100000', 9, '9999-12-31 23:59:59.0000000', N'IF', N'IF', 0, 1, 0, NULL, 0, '2019-07-29 16:40:52.7100000', 9);
INSERT INTO SanjelData.[dbo].[TopDrviceAdaptorThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:57.8270000', 10, '9999-12-31 23:59:59.0000000', N'FH', N'FH', 0, 1, 0, NULL, 0, '2019-07-29 16:40:57.8270000', 10);
INSERT INTO SanjelData.[dbo].[TopDrviceAdaptorThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:41:03.7730000', 11, '9999-12-31 23:59:59.0000000', N'XH', N'XH', 0, 1, 0, NULL, 0, '2019-07-29 16:41:03.7730000', 11);

SET IDENTITY_INSERT SanjelData.[dbo].[TopDrviceAdaptorThreadType] OFF
GO

TRUNCATE TABLE SanjelData.dbo.PlugLoadingHeadThreadType

SET IDENTITY_INSERT SanjelData.[dbo].[PlugLoadingHeadThreadType] ON
GO
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:39:58.0870000', 1, '9999-12-31 23:59:59.0000000', N'', N'', 0, 1, 0, NULL, 0, '2019-07-29 16:39:58.0870000', 1);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:04.3700000', 2, '9999-12-31 23:59:59.0000000', N'EUE', N'EUE', 0, 1, 0, NULL, 0, '2019-07-29 16:40:04.3700000', 2);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:10.2070000', 3, '9999-12-31 23:59:59.0000000', N'8-Round', N'8-Round', 0, 1, 0, NULL, 0, '2019-07-29 16:40:10.2070000', 3);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:15.8670000', 4, '9999-12-31 23:59:59.0000000', N'Buttress', N'Buttress', 0, 1, 0, NULL, 0, '2019-07-29 16:40:15.8670000', 4);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:21.8530000', 5, '9999-12-31 23:59:59.0000000', N'Hydril 513', N'Hydril 513', 0, 1, 0, NULL, 0, '2019-07-29 16:40:21.8530000', 5);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:28.3330000', 6, '9999-12-31 23:59:59.0000000', N'Hydril 523', N'Hydril 523', 0, 1, 0, NULL, 0, '2019-07-29 16:40:28.3330000', 6);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:35.9200000', 7, '9999-12-31 23:59:59.0000000', N'Hydril SLX', N'Hydril SLX', 0, 1, 0, NULL, 0, '2019-07-29 16:40:35.9200000', 7);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:46.3430000', 8, '9999-12-31 23:59:59.0000000', N'QB-2', N'QB-2', 0, 1, 0, NULL, 0, '2019-07-29 16:40:46.3430000', 8);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:52.7100000', 9, '9999-12-31 23:59:59.0000000', N'IF', N'IF', 0, 1, 0, NULL, 0, '2019-07-29 16:40:52.7100000', 9);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:40:57.8270000', 10, '9999-12-31 23:59:59.0000000', N'FH', N'FH', 0, 1, 0, NULL, 0, '2019-07-29 16:40:57.8270000', 10);
INSERT INTO SanjelData.[dbo].[PlugLoadingHeadThreadType]([version], [modified_datetime], [id], [effective_end_datetime], [name], [description], [entity_status], [operation_type], [modified_user_id], [modified_user_name], [owner_id], [effective_start_datetime], [system_id]) VALUES (1, '2019-07-29 16:41:03.7730000', 11, '9999-12-31 23:59:59.0000000', N'XH', N'XH', 0, 1, 0, NULL, 0, '2019-07-29 16:41:03.7730000', 11);

SET IDENTITY_INSERT SanjelData.[dbo].[PlugLoadingHeadThreadType] OFF
GO


-- 2019/08/08 bright.liu
CREATE TABLE SanjelData.[dbo].[Nubbin] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] int NULL ,
[modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SerialNumber] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[NubbinSizeSystemId] int NULL ,
[NubbinThreadTypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[HomeServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[HomeServicePointid] int NULL ,
[NubbinSizeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[HomeServicePointSystemId] int NULL ,
[NubbinSizeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[NubbinThreadTypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[NubbinThreadTypeSystemId] int NULL ,
[NubbinSizeid] int NULL ,
[HomeServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[NubbinThreadTypeid] int NULL 
)
;

CREATE TABLE SanjelData.[dbo].[NubbinInformation] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] int NULL ,
[modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[WorkingServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[WorkingServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[CallSheetNumber] int NULL ,
[RigJobSystemId] int NULL ,
[WorkingServicePointSystemId] int NULL ,
[EquipmentStatus] int NULL ,
[NubbinDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[RigJobid] int NULL ,
[RigJobDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Location] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[WorkingServicePointid] int NULL ,
[Notes] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[NubbinName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[RigJobName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Nubbinid] int NULL ,
[NubbinSystemId] int NULL 
)
;

CREATE TABLE SanjelData.[dbo].[NubbinSize] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] int NULL ,
[modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;

CREATE TABLE SanjelData.[dbo].[NubbinThreadType] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] int NULL ,
[modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;

CREATE TABLE SanjelData.[dbo].[Swedge] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] int NULL ,
[modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[HomeServicePointid] int NULL ,
[HomeServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SerialNumber] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SwedgeSizeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SwedgeSizeid] int NULL ,
[SwedgeSizeSystemId] int NULL ,
[SwedgeThreadTypeid] int NULL ,
[SwedgeThreadTypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SwedgeThreadTypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[HomeServicePointSystemId] int NULL ,
[HomeServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SwedgeSizeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SwedgeThreadTypeSystemId] int NULL 
)
;

CREATE TABLE SanjelData.[dbo].[SwedgeInformation] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] int NULL ,
[modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SwedgeSystemId] int NULL ,
[WorkingServicePointid] int NULL ,
[SwedgeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[RigJobSystemId] int NULL ,
[RigJobDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SwedgeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[WorkingServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Swedgeid] int NULL ,
[Notes] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[WorkingServicePointSystemId] int NULL ,
[CallSheetNumber] int NULL ,
[WorkingServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[RigJobid] int NULL ,
[EquipmentStatus] int NULL ,
[RigJobName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Location] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;

CREATE TABLE SanjelData.[dbo].[SwedgeSize] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] int NULL ,
[modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;

CREATE TABLE SanjelData.[dbo].[SwedgeThreadType] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] int NULL ,
[modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;

CREATE TABLE SanjelData.[dbo].[WitsBox] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] int NULL ,
[modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SerialNumber] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[HomeServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[HomeServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[HomeServicePointid] int NULL ,
[HomeServicePointSystemId] int NULL 
)
;

CREATE TABLE SanjelData.[dbo].[WitsBoxInformation] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] int NULL ,
[modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[WorkingServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Location] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[RigJobDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[RigJobName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[WorkingServicePointid] int NULL ,
[WorkingServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[WitsBoxSystemId] int NULL ,
[WitsBoxid] int NULL ,
[RigJobSystemId] int NULL ,
[CallSheetNumber] int NULL ,
[WorkingServicePointSystemId] int NULL ,
[WitsBoxDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[EquipmentStatus] int NULL ,
[Notes] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[RigJobid] int NULL ,
[WitsBoxName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;

--Import NubbinSize Data
SET IDENTITY_INSERT SanjelData.[dbo].[NubbinSize] ON
GO
INSERT INTO SanjelData.[dbo].[NubbinSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'1', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null)
GO
INSERT INTO SanjelData.[dbo].[NubbinSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'2', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'2 7/8"', N'2 7/8"')
GO
INSERT INTO SanjelData.[dbo].[NubbinSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'3', N'3', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'3 1/2"', N'3 1/2"')
GO
INSERT INTO SanjelData.[dbo].[NubbinSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'4', N'4', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'4"', N'4"')
GO
INSERT INTO SanjelData.[dbo].[NubbinSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'5', N'5', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'4 1/2"', N'4 1/2"')
GO
INSERT INTO SanjelData.[dbo].[NubbinSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'6', N'6', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'5"', N'5"')
GO

SET IDENTITY_INSERT SanjelData.[dbo].[NubbinSize] OFF
GO

--Import NubbinThreadType Data
insert into SanjelData.[dbo].NubbinThreadType(
id,
version,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id,
name,
description)
select 
TYPE_INDEX as ID, 
1 as version, 
LAST_MODIFIED_USER_ID as MODIFIED_USER_ID, 
LAST_MODIFIED_USER_NAME as  MODIFIED_USER_NAME,
case 
	when LAST_MODIFIED_DATE_TIME = CAST('0001-01-01 00:00:00'as DATETIME2)
	THEN CAST('2016-06-01 00:00:00' as DATETIME)
	ELSE CAST(LAST_MODIFIED_DATE_TIME as DATETIME)
End as MODIFIED_DATE_TIME,
LAST_OPERATION_TYPE as OPERATION_TYPE,
case 
	when EFFECTIVE_START_DATE_TIME = CAST('0001-01-01 00:00:00'as DATETIME2)
	THEN CAST('2016-06-01 00:00:00' as DATETIME)
	ELSE CAST(EFFECTIVE_START_DATE_TIME as DATETIME)
End as EFFECTIVE_START_DATETIME,
case 
	when EFFECTIVE_END_DATE_TIME = CAST('0001-01-01 00:00:00'as DATETIME2)
	THEN CAST('2016-06-01 00:00:00' as DATETIME)
	ELSE CAST(EFFECTIVE_END_DATE_TIME as DATETIME)
End as EFFECTIVE_END_DATETIME,
0 as ENTITY_STATUS,
0 as owner_id,
DESCRIPTION as NAME,
DESCRIPTION as DESCRIPTION
from eservice6.dbo.TYPE_VALUES where type_id = 32 and EFFECTIVE_END_DATE_TIME > GETDATE();

--Import SwedgeSize Data
SET IDENTITY_INSERT SanjelData.[dbo].[SwedgeSize] ON
GO
INSERT INTO SanjelData.[dbo].[SwedgeSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'1', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null)
GO
GO
INSERT INTO SanjelData.[dbo].[SwedgeSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'2', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'50.80mm', N'50.80mm')
GO
GO
INSERT INTO SanjelData.[dbo].[SwedgeSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'3', N'3', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'60.33mm', N'60.33mm')
GO
GO
INSERT INTO SanjelData.[dbo].[SwedgeSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'4', N'4', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'73.0mm', N'73.0mm')
GO
GO
INSERT INTO SanjelData.[dbo].[SwedgeSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'5', N'5', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'76.20mm', N'76.20mm')
GO
GO
INSERT INTO SanjelData.[dbo].[SwedgeSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'6', N'6', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'88.90mm', N'88.90mm')
GO
GO
INSERT INTO SanjelData.[dbo].[SwedgeSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'7', N'7', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'101.60mm', N'101.60mm')
GO
GO
INSERT INTO SanjelData.[dbo].[SwedgeSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'8', N'8', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'114.30mm', N'114.30mm')
GO
GO
INSERT INTO SanjelData.[dbo].[SwedgeSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'9', N'9', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'127.00mm', N'127.00mm')
GO
GO
INSERT INTO SanjelData.[dbo].[SwedgeSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'10', N'10', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'139.70mm', N'139.70mm')
GO
GO
INSERT INTO SanjelData.[dbo].[SwedgeSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'11', N'11', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'168.28mm', N'168.28mm')
GO
GO
INSERT INTO SanjelData.[dbo].[SwedgeSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'12', N'12', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'177.80mm', N'177.80mm')
GO
GO
INSERT INTO SanjelData.[dbo].[SwedgeSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'13', N'13', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'193.70mm', N'193.70mm')
GO
GO
INSERT INTO SanjelData.[dbo].[SwedgeSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'14', N'14', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'219.00mm', N'219.00mm')
GO
GO
INSERT INTO SanjelData.[dbo].[SwedgeSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'15', N'15', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'244.50mm', N'244.50mm')
GO
GO
INSERT INTO SanjelData.[dbo].[SwedgeSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'16', N'16', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'273.00mm', N'273.00mm')
GO
GO
INSERT INTO SanjelData.[dbo].[SwedgeSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'17', N'17', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'298.50mm', N'298.50mm')
GO
GO
INSERT INTO SanjelData.[dbo].[SwedgeSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'18', N'18', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'339.70mm', N'339.70mm')
GO
GO
INSERT INTO SanjelData.[dbo].[SwedgeSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'19', N'19', N'0', N'0', null, N'2019-08-08 00:00:00.0000000', N'1', N'2019-08-08 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'406.40mm', N'406.40mm')
GO
GO
SET IDENTITY_INSERT SanjelData.[dbo].[SwedgeSize] OFF
GO

--Import NubbinThreadType Data
insert into SanjelData.[dbo].SwedgeThreadType(
id,
version,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id,
name,
description)
select 
TYPE_INDEX as ID, 
1 as version, 
LAST_MODIFIED_USER_ID as MODIFIED_USER_ID, 
LAST_MODIFIED_USER_NAME as  MODIFIED_USER_NAME,
case 
	when LAST_MODIFIED_DATE_TIME = CAST('0001-01-01 00:00:00'as DATETIME2)
	THEN CAST('2016-06-01 00:00:00' as DATETIME)
	ELSE CAST(LAST_MODIFIED_DATE_TIME as DATETIME)
End as MODIFIED_DATE_TIME,
LAST_OPERATION_TYPE as OPERATION_TYPE,
case 
	when EFFECTIVE_START_DATE_TIME = CAST('0001-01-01 00:00:00'as DATETIME2)
	THEN CAST('2016-06-01 00:00:00' as DATETIME)
	ELSE CAST(EFFECTIVE_START_DATE_TIME as DATETIME)
End as EFFECTIVE_START_DATETIME,
case 
	when EFFECTIVE_END_DATE_TIME = CAST('0001-01-01 00:00:00'as DATETIME2)
	THEN CAST('2016-06-01 00:00:00' as DATETIME)
	ELSE CAST(EFFECTIVE_END_DATE_TIME as DATETIME)
End as EFFECTIVE_END_DATETIME,
0 as ENTITY_STATUS,
0 as owner_id,
DESCRIPTION as NAME,
DESCRIPTION as DESCRIPTION
from eservice6.dbo.TYPE_VALUES where type_id = 32 and EFFECTIVE_END_DATE_TIME > GETDATE();


