--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--!!!!!!!!!!!!!!! Make sure we are connected to [Sanjel23\App] !!!!!!!!!!!!!!!
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



-- Before executing, 
-- Copy script intoto a New Query window/tab
-- Replace by Find & Replace all occurrences for following placeholders
-- 		SanjelData
-- 		eService6


-- If it is a new target database, execute first 4 manual steps below
-- And only after that, the rest of the script 


USE [SanjelData];

/* Run on Production on Dec 1.
CREATE TABLE [IncidentType] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2);
GO
CREATE TABLE [PerformanceMetric] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2);
GO
CREATE TABLE [PotentialSeverity] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2);
GO
CREATE TABLE [QualityObservationType] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2);
GO
CREATE TABLE [SeverityMatrixtype] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2);
GO
CREATE TABLE [PlugManufacture] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2);
GO
CREATE TABLE [PlugLoadingHeadManufacture] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2);
GO
---SeverityMatrixtype
INSERT INTO [dbo].[SeverityMatrixtype]([id],  [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) 
SELECT  [TYPE_INDEX] [id],1 [version],15112 [modified_user_id],'Awang' [modified_user_name],GetDate() [modified_datetime],3 [operation_type], GetDate() [effective_start_datetime],'9999-12-31 00:00:00.0000000' [effective_end_datetime], 0 [entity_status],0 [owner_id], [DESCRIPTION]  [name], [DESCRIPTION]  [description] FROM [eService6].[dbo].[TYPE_VALUES_ConvertedToView] WHERE [TYPE_ID] = N'115' ORDER BY [TYPE_INDEX]
GO
INSERT INTO [dbo].[SeverityMatrixtype]([id],  [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) 
values
(21 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , '0 - Cement in Pipe (< 10m) - Drilling Out'  , '0 - Cement in Pipe (< 10m) - Drilling Out'  ),
(22 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , '1 - Cement in Pipe (< 10m) - Drilling Out'  , '1 - Cement in Pipe (< 10m) - Drilling Out'  ),
(23 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , '2 - Cement in Pipe (> 10m < 100m) - Drilling Out'  , '2 - Cement in Pipe (> 10m < 100m) - Drilling Out'  ),
(24 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , '3 - Cement in Pipe (> 100m < 250m) - Drilling Out'  , '3 - Cement in Pipe (> 100m < 250m) - Drilling Out'  ),
(25 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , '4 - Cement in Pipe (> 250m) - Drilling Out'  , '4 - Cement in Pipe (> 250m) - Drilling Out'  )
GO


---IncidentType
INSERT INTO [dbo].[IncidentType]([id],  [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) 
SELECT  [TYPE_INDEX] [id],1 [version],15112 [modified_user_id],'Awang' [modified_user_name],GetDate() [modified_datetime],3 [operation_type], GetDate() [effective_start_datetime],'9999-12-31 00:00:00.0000000' [effective_end_datetime], 0 [entity_status],0 [owner_id], [DESCRIPTION]  [name], [DESCRIPTION]  [description] FROM [eService6].[dbo].[TYPE_VALUES_ConvertedToView] WHERE [TYPE_ID] = N'116' ORDER BY [TYPE_INDEX]
GO

INSERT INTO [dbo].[IncidentType]([id],  [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) 
values
(60 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Higher than Expected Pressure'  , 'Higher than Expected Pressure'  ),
(61 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Cement Left in Pipe'  , 'Cement Left in Pipe'  )
GO

---PerformanceMetric
INSERT INTO [dbo].[PerformanceMetric]([id],  [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) 
SELECT  [TYPE_INDEX] [id],1 [version],15112 [modified_user_id],'Awang' [modified_user_name],GetDate() [modified_datetime],3 [operation_type], GetDate() [effective_start_datetime],'9999-12-31 00:00:00.0000000' [effective_end_datetime], 0 [entity_status],0 [owner_id], [DESCRIPTION]  [name], [DESCRIPTION]  [description] FROM [eService6].[dbo].[TYPE_VALUES_ConvertedToView] WHERE [TYPE_ID] = N'117' ORDER BY [TYPE_INDEX]
GO

---PotentialSeverity
INSERT INTO [dbo].[PotentialSeverity]([id],  [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) 
values
(0 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , null  ,null  ),
(1 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , '0-Inconsequential'  , '0-Inconsequential'  ),
(2 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , '1-Minor'  , '1-Minor'  ),
(3 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , '2-Serious'  , '2-Serious'  ),
(4 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , '3-Major'  , '3-Major'  ),
(5 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , '4-Critical'  , '4-Critical'  ),
(6 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , '5-Catastrophic'  , '5-Catastrophic'  )
GO

---QualityObservationType
INSERT INTO [dbo].[QualityObservationType]([id],  [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) 
values
(0 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , null  , null  ),
(1 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Equipment'  , 'Equipment'  ),
(2 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Job Design'  , 'Job Design'  ),
(3 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Process'  , 'Process'  ),
(4 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Product'  , 'Product'  )
GO

--PlugLoadingHeadManufacture
INSERT INTO [dbo].[PlugLoadingHeadManufacture]([id],  [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) 
values
(0 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , null  , null  ),
(1 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Industrial Rubber'  , 'Industrial Rubber'  ),
(2 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Argus'  , 'Argus'  ),
(3 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Weatherford'  , 'Weatherford'  ),
(4 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Packers Plus'  , 'Packers Plus'  ),
(5 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Canadian Casing'  , 'Canadian Casing'  ),
(6 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Import Tool'  , 'Import Tool'  ),
(7 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Halliburton'  , 'Halliburton'  ),
(8 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Other'  , 'Other'  )
GO

--PlugManufacture
INSERT INTO [dbo].[PlugManufacture]([id],  [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) 
values
(0 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , null  , null  ),
(1 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Canadian Casing'  , 'Canadian Casing'  ),
(2 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Freudenberg'  , 'Freudenberg'  ),
(3 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Halliburton'  , 'Halliburton'  ),
(4 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Industrial Rubber'  , 'Industrial Rubber'  ),
(5 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Top Co'  , 'Top Co'  ),
(6 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Wichita Falls'  , 'Wichita Falls'  ),
(7 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Weatherford'  , 'Weatherford'  ),
(8 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Packers Plus'  , 'Packers Plus'  ),
(9 ,1 ,15112 ,'Awang' ,GetDate() ,3 , GetDate() ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Other'  , 'Other'  )
GO
*/




USE [eService6];


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- This view does the following :
-- 1. Pulls BlendFluidType (TYPE_ID=5) and AdditiveType (TYPE_ID=4) data from SanjelData MD database
-- 2, Identifies BlendFluidType and AdditiveType old records that are in eService table (eservice6.dbo.TYPE_VALUES originally, renamed to TYPE_VALUES_ConvertedToView) but not in MD
-- 3. Union all records from steps 1 & 2 and, also, all other (not BlendFluidType or AdditiveType) records from TYPE_VALUES_ConvertedToView

ALTER VIEW [dbo].[TYPE_VALUES]
AS

with
eservice_full as 
(
    select * from dbo.TYPE_VALUES_ConvertedToView
)
,mdm_j as 
(
    select
        6124000 + system_id        ID
        ,id                        TYPE_INDEX
        ,124                         TYPE_ID
        ,IsNull(name, description) DESCRIPTION
        ,version                   VERSION
        ,iif(effective_end_datetime > getdate(), 'A', 'T')  STATUS
        ,modified_user_id          LAST_MODIFIED_USER_ID
        ,modified_user_name        LAST_MODIFIED_USER_NAME
        ,modified_datetime         LAST_MODIFIED_DATE_TIME
        ,operation_type            LAST_OPERATION_TYPE
        ,effective_start_datetime  EFFECTIVE_START_DATE_TIME
        ,effective_end_datetime    EFFECTIVE_END_DATE_TIME
        --, entity_status
        --, owner_id
    from 
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from SanjelData.dbo.PlugLoadingHeadSpecialty) a
    where 
        rowNum = 1
)
,mdm_i as 
(
    select
        6123000 + system_id        ID
        ,id                        TYPE_INDEX
        ,123                         TYPE_ID
        ,IsNull(name, description) DESCRIPTION
        ,version                   VERSION
        ,iif(effective_end_datetime > getdate(), 'A', 'T')  STATUS
        ,modified_user_id          LAST_MODIFIED_USER_ID
        ,modified_user_name        LAST_MODIFIED_USER_NAME
        ,modified_datetime         LAST_MODIFIED_DATE_TIME
        ,operation_type            LAST_OPERATION_TYPE
        ,effective_start_datetime  EFFECTIVE_START_DATE_TIME
        ,effective_end_datetime    EFFECTIVE_END_DATE_TIME
        --, entity_status
        --, owner_id
    from 
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from SanjelData.dbo.PlugManufacture) a
    where 
        rowNum = 1
)
,mdm_h as 
(
    select
        6122000 + system_id        ID
        ,id                        TYPE_INDEX
        ,122                         TYPE_ID
        ,IsNull(name, description) DESCRIPTION
        ,version                   VERSION
        ,iif(effective_end_datetime > getdate(), 'A', 'T')  STATUS
        ,modified_user_id          LAST_MODIFIED_USER_ID
        ,modified_user_name        LAST_MODIFIED_USER_NAME
        ,modified_datetime         LAST_MODIFIED_DATE_TIME
        ,operation_type            LAST_OPERATION_TYPE
        ,effective_start_datetime  EFFECTIVE_START_DATE_TIME
        ,effective_end_datetime    EFFECTIVE_END_DATE_TIME
        --, entity_status
        --, owner_id
    from 
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from SanjelData.dbo.PlugLoadingHeadManufacture) a
    where 
        rowNum = 1
)
,mdm_g as 
(
    select
        6121000 + system_id        ID
        ,id                        TYPE_INDEX
        ,121                         TYPE_ID
        ,IsNull(name, description) DESCRIPTION
        ,version                   VERSION
        ,iif(effective_end_datetime > getdate(), 'A', 'T')  STATUS
        ,modified_user_id          LAST_MODIFIED_USER_ID
        ,modified_user_name        LAST_MODIFIED_USER_NAME
        ,modified_datetime         LAST_MODIFIED_DATE_TIME
        ,operation_type            LAST_OPERATION_TYPE
        ,effective_start_datetime  EFFECTIVE_START_DATE_TIME
        ,effective_end_datetime    EFFECTIVE_END_DATE_TIME
        --, entity_status
        --, owner_id
    from 
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from SanjelData.dbo.QualityObservationType) a
    where 
        rowNum = 1
)
,mdm_f as 
(
    select
        6120000 + system_id        ID
        ,id                        TYPE_INDEX
        ,120                         TYPE_ID
        ,IsNull(name, description) DESCRIPTION
        ,version                   VERSION
        ,iif(effective_end_datetime > getdate(), 'A', 'T')  STATUS
        ,modified_user_id          LAST_MODIFIED_USER_ID
        ,modified_user_name        LAST_MODIFIED_USER_NAME
        ,modified_datetime         LAST_MODIFIED_DATE_TIME
        ,operation_type            LAST_OPERATION_TYPE
        ,effective_start_datetime  EFFECTIVE_START_DATE_TIME
        ,effective_end_datetime    EFFECTIVE_END_DATE_TIME
        --, entity_status
        --, owner_id
    from 
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from SanjelData.dbo.PotentialSeverity) a
    where 
        rowNum = 1
)
,mdm_e as 
(
    select
        6117000 + system_id        ID
        ,id                        TYPE_INDEX
        ,117                         TYPE_ID
        ,IsNull(name, description) DESCRIPTION
        ,version                   VERSION
        ,iif(effective_end_datetime > getdate(), 'A', 'T')  STATUS
        ,modified_user_id          LAST_MODIFIED_USER_ID
        ,modified_user_name        LAST_MODIFIED_USER_NAME
        ,modified_datetime         LAST_MODIFIED_DATE_TIME
        ,operation_type            LAST_OPERATION_TYPE
        ,effective_start_datetime  EFFECTIVE_START_DATE_TIME
        ,effective_end_datetime    EFFECTIVE_END_DATE_TIME
        --, entity_status
        --, owner_id
    from 
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from SanjelData.dbo.PerformanceMetric) a
    where 
        rowNum = 1
)
,es_e_extra as 
(
    select 
        e.* 
    from
        eservice_full e
        left join mdm_e m on m.TYPE_INDEX = e.TYPE_INDEX
    where 
        e.TYPE_ID in (117)
        and m.TYPE_INDEX is null
)
,mdm_d as 
(
    select
        6116000 + system_id        ID
        ,id                        TYPE_INDEX
        ,116                         TYPE_ID
        ,IsNull(name, description) DESCRIPTION
        ,version                   VERSION
        ,iif(effective_end_datetime > getdate(), 'A', 'T')  STATUS
        ,modified_user_id          LAST_MODIFIED_USER_ID
        ,modified_user_name        LAST_MODIFIED_USER_NAME
        ,modified_datetime         LAST_MODIFIED_DATE_TIME
        ,operation_type            LAST_OPERATION_TYPE
        ,effective_start_datetime  EFFECTIVE_START_DATE_TIME
        ,effective_end_datetime    EFFECTIVE_END_DATE_TIME
        --, entity_status
        --, owner_id
    from 
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from SanjelData.dbo.IncidentType) a
    where 
        rowNum = 1
)
,es_d_extra as 
(
    select 
        e.* 
    from
        eservice_full e
        left join mdm_d m on m.TYPE_INDEX = e.TYPE_INDEX
    where 
        e.TYPE_ID in (116)
        and m.TYPE_INDEX is null
)
,mdm_c as 
(
    select
        6115000 + system_id        ID
        ,id                        TYPE_INDEX
        ,115                         TYPE_ID
        ,IsNull(name, description) DESCRIPTION
        ,version                   VERSION
        ,iif(effective_end_datetime > getdate(), 'A', 'T')  STATUS
        ,modified_user_id          LAST_MODIFIED_USER_ID
        ,modified_user_name        LAST_MODIFIED_USER_NAME
        ,modified_datetime         LAST_MODIFIED_DATE_TIME
        ,operation_type            LAST_OPERATION_TYPE
        ,effective_start_datetime  EFFECTIVE_START_DATE_TIME
        ,effective_end_datetime    EFFECTIVE_END_DATE_TIME
        --, entity_status
        --, owner_id
    from 
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from SanjelData.dbo.SeverityMatrixtype) a
    where 
        rowNum = 1
)
,es_c_extra as 
(
    select 
        e.* 
    from
        eservice_full e
        left join mdm_c m on m.TYPE_INDEX = e.TYPE_INDEX
    where 
        e.TYPE_ID in (115)
        and m.TYPE_INDEX is null
)
,mdm_b as 
(
    select
        5000000 + system_id        ID
        ,id                        TYPE_INDEX
        ,5                         TYPE_ID
        ,IsNull(name, description) DESCRIPTION
        ,version                   VERSION
        ,iif(effective_end_datetime > getdate(), 'A', 'T')  STATUS
        ,modified_user_id          LAST_MODIFIED_USER_ID
        ,modified_user_name        LAST_MODIFIED_USER_NAME
        ,modified_datetime         LAST_MODIFIED_DATE_TIME
        ,operation_type            LAST_OPERATION_TYPE
        ,effective_start_datetime  EFFECTIVE_START_DATE_TIME
        ,effective_end_datetime    EFFECTIVE_END_DATE_TIME
        --, entity_status
        --, owner_id
    from 
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from SanjelData.dbo.BlendFluidType) a
    where 
        rowNum = 1
)
,es_b_extra as 
(
    select 
        e.* 
    from
        eservice_full e
        left join mdm_b m on m.TYPE_INDEX = e.TYPE_INDEX
    where 
        e.TYPE_ID in (5)
        and m.TYPE_INDEX is null
)
,mdm_a as 
(
    select
        4000000 + system_id        ID
        ,id                        TYPE_INDEX
        ,4                         TYPE_ID
        ,IsNull(name, description) DESCRIPTION
        ,version                   VERSION
        ,iif(effective_end_datetime > getdate(), 'A', 'T')  STATUS
        ,modified_user_id          LAST_MODIFIED_USER_ID
        ,modified_user_name        LAST_MODIFIED_USER_NAME
        ,modified_datetime         LAST_MODIFIED_DATE_TIME
        ,operation_type            LAST_OPERATION_TYPE
        ,effective_start_datetime  EFFECTIVE_START_DATE_TIME
        ,effective_end_datetime    EFFECTIVE_END_DATE_TIME
        --, entity_status
        --, owner_id
    from 
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from SanjelData.dbo.AdditiveType) a
    where 
        rowNum = 1
)
,es_a_extra as 
(
    select 
        e.* 
    from 
        eservice_full e 
        left join mdm_a m on m.TYPE_INDEX = e.TYPE_INDEX
    where 
        e.TYPE_ID in (4)
        and m.TYPE_INDEX is null
)
--select * from eservice
select ID, TYPE_INDEX, TYPE_ID, DESCRIPTION, STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME
from mdm_j
    union
select ID, TYPE_INDEX, TYPE_ID, DESCRIPTION, STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME
from mdm_i
    union
select ID, TYPE_INDEX, TYPE_ID, DESCRIPTION, STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME
from mdm_h
    union
select ID, TYPE_INDEX, TYPE_ID, DESCRIPTION, STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME
from mdm_g
    union
select ID, TYPE_INDEX, TYPE_ID, DESCRIPTION, STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME
from mdm_f
    union
select ID, TYPE_INDEX, TYPE_ID, DESCRIPTION, STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME
from mdm_e
    union
select ID, TYPE_INDEX, TYPE_ID, DESCRIPTION, STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME
from es_e_extra
    union
select ID, TYPE_INDEX, TYPE_ID, DESCRIPTION, STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME
from mdm_d
    union
select ID, TYPE_INDEX, TYPE_ID, DESCRIPTION, STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME
from es_d_extra
    union
select ID, TYPE_INDEX, TYPE_ID, DESCRIPTION, STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME
from mdm_c
    union
select ID, TYPE_INDEX, TYPE_ID, DESCRIPTION, STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME
from es_c_extra
    union
select ID, TYPE_INDEX, TYPE_ID, DESCRIPTION, STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME
from mdm_b
    union
select ID, TYPE_INDEX, TYPE_ID, DESCRIPTION, STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME
from es_b_extra
    union
select ID, TYPE_INDEX, TYPE_ID, DESCRIPTION, STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME
from mdm_a
    union
select ID, TYPE_INDEX, TYPE_ID, DESCRIPTION, STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME
from es_a_extra
    union
select ID, TYPE_INDEX, TYPE_ID, DESCRIPTION, STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME
from eservice_full
where TYPE_ID not in (4, 5,115,116,117,120,121,122,123,124)
;
GO

/* Run on production on Dec 1
ALTER TABLE dbo.RPT_HSE_INCIDENT_DTL_SCTNS ADD
	HSE_POTENTIAL_SEVERITY_TYPE_ID int NULL default 0,
	HSE_POTENTIAL_SEVERITY_TYPE_NAME nvarchar(50) NULL
GO
ALTER TABLE dbo.PROGRAMS ADD PROGRAM_EXPIRY_DATE datetime2(7) NULL
GO 
ALTER TABLE dbo.RPT_HSE_INFORMATION_SCTNS ADD
	HAS_ANY_QUALITY_OBSERVATIONS_TYPE_ID int NULL default 0,
	HAS_ANY_QUALITY_OBSERVATIONS_TYPE_NAME nvarchar(50) NULL,
	QUALITY_OBSERVATION_TYPE_ID int NULL default 0,
	QUALITY_OBSERVATION_TYPE_NAME nvarchar(50) NULL,
	QUALITY_OBSERVATION_DETAILS nvarchar(2000) NULL
GO

alter table PUMP_PLUGLOADHD_SCTNS add PLUG_LOADING_HEAD_MANUFACTURER_ID int default 0;
alter table PUMP_PLUGLOADHD_SCTNS add PLUG_LOADING_HEAD_MANUFACTURER_NAME nvarchar(50);
alter table PUMP_PLUGLOADHD_SCTNS add PLUG_LOADING_HEAD_SPECIALTY_ID int default 0;
alter table PUMP_PLUGLOADHD_SCTNS add PLUG_LOADING_HEAD_SPECIALTY_NAME nvarchar(50);
alter table PUMP_PLUGLOADHD_SCTNS add SUPPLIER_ID int default 0;
alter table PUMP_PLUGLOADHD_SCTNS add SUPPLIER_NAME nvarchar(50);


alter table PUMP_TUBULAR_PLUG_SCTNS add PLUG_MANUFACTURER_ID int default 0;
alter table PUMP_TUBULAR_PLUG_SCTNS add PLUG_MANUFACTURER_NAME nvarchar(50);
GO
*/
-- Program data migration
-- set default expiry date (240 days) after generated date
UPDATE [dbo].[PROGRAMS] SET PROGRAM_EXPIRY_DATE = DATEADD(DAY, 240, PROGRAM_GENERATED_DATE)  
Go

-- it will set status 17 (expired) to all programs which expiry date is less than today
UPDATE [dbo].[PROGRAMS] SET STATUS = 17 Where GETDATE() > PROGRAM_EXPIRY_DATE 
Go
/* Run on production on Dec 1
CREATE TABLE [dbo].[PSPT_PLUGLOADHD_SCTNS](
	[ID] [int] NOT NULL,
	[ROOT_ID] [int] NULL,
	[PARENT_ID] [int] NULL,
	[IS_TOP_DRIVE] [bit] NULL,
	[SIZE_TYPE_VALUE] [float] NULL,
	[THREAD_TYPE_ID] [int] NULL,
	[SIZE_TYPE_UNIT] [nvarchar](50) NULL,
	[THREAD_TYPE_NAME] [nvarchar](50) NULL,
	[THREAD_TYPE_CATEGORY] [int] NULL,
	[TOP_DRV_SIZE_TYPE_VALUE] [float] NULL,
	[TOP_DRV_SIZE_TYPE_UNIT] [nvarchar](50) NULL,
	[TOP_DRV_THREAD_TYPE_ID] [int] NULL,
	[TOP_DRV_THREAD_TYPE_NAME] [nvarchar](50) NULL,
	[TOP_DRV_THREAD_TYPE_CATEGORY] [int] NULL,
	[VERSION] [int] NULL,
	[PLUG_LOADING_HEAD_MANUFACTURER_ID] [int] NULL,
	[PLUG_LOADING_HEAD_MANUFACTURER_NAME] [nvarchar](50) NULL,
	[PLUG_LOADING_HEAD_SPECIALTY_ID] [int] NULL,
	[PLUG_LOADING_HEAD_SPECIALTY_NAME] [nvarchar](50) NULL,
	[SUPPLIER_ID] [int] NULL,
	[SUPPLIER_NAME] [nvarchar](50) NULL,
 CONSTRAINT [PSPT_PLUGLOADHD_SCTNS_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PSPT_PLUGLOADHD_SCTNS] ADD  DEFAULT ((0)) FOR [VERSION]
GO

ALTER TABLE [dbo].[PSPT_PLUGLOADHD_SCTNS]  WITH CHECK ADD  CONSTRAINT [PSPT_PLUGLOADHD_SCTNS_ID_FK] FOREIGN KEY([PARENT_ID])
REFERENCES [dbo].[PUMPING_SERVICE_REPORTS] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[PSPT_PLUGLOADHD_SCTNS] CHECK CONSTRAINT [PSPT_PLUGLOADHD_SCTNS_ID_FK]
GO

CREATE SEQUENCE [dbo].[SEQ_PSPT_PLUGLOADHD_SCTNS] 
 AS [numeric](28, 0)
 START WITH 1000000
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999
 CACHE  20 
GO

alter table PSPT_TUBULAR_PLUG_SCTNS add PLUG_MANUFACTURER_ID int default 0;
alter table PSPT_TUBULAR_PLUG_SCTNS add PLUG_MANUFACTURER_NAME nvarchar(50);
GO

alter table [dbo].[PSPT_BLEND_SCTNS] add PILOT_TEST_ID [nvarchar](50) NULL
alter table [dbo].[PSPT_BLEND_SCTNS] add PILOT_TEST_ITERATION int NULL default 0

alter table [dbo].[PUMP_BLEND_SCTNS] add PILOT_TEST_ID [nvarchar](50) NULL
alter table [dbo].[PUMP_BLEND_SCTNS] add PILOT_TEST_ITERATION int NULL default 0

alter table [dbo].[PRG_BLEND_SCTNS] add PILOT_TEST_ID [nvarchar](50) NULL
alter table [dbo].[PRG_BLEND_SCTNS] add PILOT_TEST_ITERATION int NULL default 0

Go
*/
