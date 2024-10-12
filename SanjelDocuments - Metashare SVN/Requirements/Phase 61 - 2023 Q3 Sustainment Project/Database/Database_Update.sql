--https://github.com/orgs/Sanjel-Energy-Services/projects/22/views/1?pane=issue&itemId=38531160

Use [##SanjelData##]
Go
CREATE TABLE [hse_IncidentTypePerformanceMetric] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[IncidentTypeid] int,[IncidentTypeName] [nvarchar](100) NULL,[IncidentTypeDescription] [nvarchar](500) NULL,[IncidentTypeSystemId] [int] Not NULL,[PerformanceMetricid] int,[PerformanceMetricName] [nvarchar](100) NULL,[PerformanceMetricDescription] [nvarchar](500) NULL,[PerformanceMetricSystemId] [int] Not NULL);

CREATE TABLE [hse_PrimaryIncident] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL);

CREATE TABLE [hse_PrimaryIncidentActualSeverity] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[ActualSeverityid] int,[ActualSeverityName] [nvarchar](100) NULL,[ActualSeverityDescription] [nvarchar](500) NULL,[ActualSeveritySystemId] [int] Not NULL,[PrimaryIncidentid] int,[PrimaryIncidentName] [nvarchar](100) NULL,[PrimaryIncidentDescription] [nvarchar](500) NULL);

CREATE TABLE [hse_PrimaryIncidentIncidentType] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[IncidentTypeid] int,[IncidentTypeName] [nvarchar](100) NULL,[IncidentTypeDescription] [nvarchar](500) NULL,[IncidentTypeSystemId] [int] Not NULL,[PrimaryIncidentid] int,[PrimaryIncidentName] [nvarchar](100) NULL,[PrimaryIncidentDescription] [nvarchar](500) NULL);

Go

USE SanjelData
GO
EXEC  sp_rename N'IncidentType',N'hse_IncidentType';
GO
EXEC  sp_rename N'PerformanceMetric',N'hse_PerformanceMetric';
GO
EXEC  sp_rename N'PotentialSeverity',N'hse_PotentialSeverity';
GO
EXEC  sp_rename N'QualityObservationType',N'hse_QualityObservationType';
GO
EXEC  sp_rename N'SeverityMatrixtype',N'hse_SeverityMatrixtype';
GO

USE [##eservice6##]
GO

/****** Object:  Synonym [dbo].[SYN_SD_IncidentType]    Script Date: 2023/9/14 13:57:29 ******/
CREATE SYNONYM [dbo].[SYN_SD_IncidentTypePerformanceMetric] FOR [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric]
GO
CREATE SYNONYM [dbo].[SYN_SD_PrimaryIncident] FOR [SanjelData].[dbo].[hse_PrimaryIncident]
GO
CREATE SYNONYM [dbo].[SYN_SD_PrimaryIncidentActualSeverity] FOR [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity]
GO
CREATE SYNONYM [dbo].[SYN_SD_PrimaryIncidentIncidentType] FOR [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType]
GO

/****** Object:  Synonym [dbo].[SYN_SD_IncidentType]    Script Date: 2023/9/14 13:57:29 ******/
DROP SYNONYM [dbo].[SYN_SD_IncidentType]
GO

/****** Object:  Synonym [dbo].[SYN_SD_IncidentType]    Script Date: 2023/9/14 13:57:29 ******/
CREATE SYNONYM [dbo].[SYN_SD_IncidentType] FOR [SanjelData].[dbo].[hse_IncidentType]
GO

/****** Object:  Synonym [dbo].[SYN_SD_PerformanceMetric]    Script Date: 2023/9/14 13:57:29 ******/
DROP SYNONYM [dbo].[SYN_SD_PerformanceMetric]
GO

/****** Object:  Synonym [dbo].[SYN_SD_PerformanceMetric]    Script Date: 2023/9/14 13:57:29 ******/
CREATE SYNONYM [dbo].[SYN_SD_PerformanceMetric] FOR [SanjelData].[dbo].[hse_PerformanceMetric]
GO

/****** Object:  Synonym [dbo].[SYN_SD_PotentialSeverity]    Script Date: 2023/9/14 14:03:55 ******/
DROP SYNONYM [dbo].[SYN_SD_PotentialSeverity]
GO

/****** Object:  Synonym [dbo].[SYN_SD_PotentialSeverity]    Script Date: 2023/9/14 14:03:55 ******/
CREATE SYNONYM [dbo].[SYN_SD_PotentialSeverity] FOR [SanjelData].[dbo].[hse_PotentialSeverity]
GO

/****** Object:  Synonym [dbo].[SYN_SD_QualityObservationType]    Script Date: 2023/9/14 14:05:07 ******/
DROP SYNONYM [dbo].[SYN_SD_QualityObservationType]
GO

/****** Object:  Synonym [dbo].[SYN_SD_QualityObservationType]    Script Date: 2023/9/14 14:05:07 ******/
CREATE SYNONYM [dbo].[SYN_SD_QualityObservationType] FOR [SanjelData].[dbo].[hse_QualityObservationType]
GO

/****** Object:  Synonym [dbo].[SYN_SD_SeverityMatrixtype]    Script Date: 2023/9/14 14:05:54 ******/
DROP SYNONYM [dbo].[SYN_SD_SeverityMatrixtype]
GO

/****** Object:  Synonym [dbo].[SYN_SD_SeverityMatrixtype]    Script Date: 2023/9/14 14:05:54 ******/
CREATE SYNONYM [dbo].[SYN_SD_SeverityMatrixtype] FOR [SanjelData].[dbo].[hse_SeverityMatrixtype]
GO



--View
USE [eservice6]
GO

/****** Object:  View [dbo].[PrimaryIncident_ActualSeverity]    Script Date: 2023/9/14 16:20:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PrimaryIncident_ActualSeverity] AS 

	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY id desc) as rowNum, *
		from dbo.SYN_SD_PrimaryIncidentActualSeverity
	)
	select 	
	   [id]
      ,[entity_status]
	  , 1 as [Version]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[ActualSeverityid]
      ,[ActualSeverityName]
      ,[ActualSeverityDescription]
      ,[ActualSeveritySystemId]
      ,[PrimaryIncidentid]
      ,[PrimaryIncidentName]
      ,[PrimaryIncidentDescription]
	from orderedRecords where rowNum = 1;
GO

CREATE VIEW [dbo].[PrimaryIncident_IncidentType] AS 

	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY id desc) as rowNum, *
		from dbo.SYN_SD_PrimaryIncidentIncidentType
	)
	select 	
	  [id]
      ,[entity_status]
	  , 1 as [Version]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[IncidentTypeid]
      ,[IncidentTypeName]
      ,[IncidentTypeDescription]
      ,[IncidentTypeSystemId]
      ,[PrimaryIncidentid]
      ,[PrimaryIncidentName]
      ,[PrimaryIncidentDescription]
	from orderedRecords where rowNum = 1;
GO


CREATE VIEW [dbo].[IncidentType_PerformanceMetric] AS 

	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY id desc) as rowNum, *
		from dbo.SYN_SD_IncidentTypePerformanceMetric
	)
	select 	
		[id]
      ,[entity_status]
	  , 1 as [Version]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[IncidentTypeid]
      ,[IncidentTypeName]
      ,[IncidentTypeDescription]
      ,[IncidentTypeSystemId]
      ,[PerformanceMetricid]
      ,[PerformanceMetricName]
      ,[PerformanceMetricDescription]
      ,[PerformanceMetricSystemId]
	from orderedRecords where rowNum = 1;
GO




-- This view does the following :
-- 1. Pulls BlendFluidType (TYPE_ID=5) and AdditiveType (TYPE_ID=4) data from MDM database
-- 2, Identifies BlendFluidType and AdditiveType old records that are in eService table (dbo.TYPE_VALUES originally, renamed to TYPE_VALUES_ConvertedToView) but not in MD
-- 3. Union all records from steps 1 & 2 and, also, all other (not BlendFluidType or AdditiveType) records from TYPE_VALUES_ConvertedToView



CREATE VIEW [dbo].[TYPE_VALUES]
AS

with
eservice_full as 
(
    select * from dbo.TYPE_VALUES_ConvertedToView
)
,mdm_126 as 
(
    select
        6128000 + id        ID
        ,id                        TYPE_INDEX
        ,126                         TYPE_ID
        ,IsNull(name, description) DESCRIPTION
        ,##VERSION##                   VERSION
        ,'A'  STATUS
        ,0          LAST_MODIFIED_USER_ID
        ,'MDM'        LAST_MODIFIED_USER_NAME
        ,##LAST_MODIFIED_DATE_TIME##         LAST_MODIFIED_DATE_TIME
        ,1            LAST_OPERATION_TYPE
        ,##EFFECTIVE_START_DATE_TIME##  EFFECTIVE_START_DATE_TIME
        ,'9999-12-31 23:59:59.0000000'    EFFECTIVE_END_DATE_TIME
        --, entity_status
        --, owner_id
    from dbo.SYN_SD_PrimaryIncident
)
,mdm_m as 
(
    select
        6127000 + id        ID
        ,id                        TYPE_INDEX
        ,125                         TYPE_ID
        ,IsNull(name, description) DESCRIPTION
        ,##VERSION##                   VERSION
        ,'A'  STATUS
        ,0          LAST_MODIFIED_USER_ID
        ,'MDM'        LAST_MODIFIED_USER_NAME
        ,##LAST_MODIFIED_DATE_TIME##         LAST_MODIFIED_DATE_TIME
        ,1            LAST_OPERATION_TYPE
        ,##EFFECTIVE_START_DATE_TIME##  EFFECTIVE_START_DATE_TIME
        ,'9999-12-31 23:59:59.0000000'    EFFECTIVE_END_DATE_TIME
        --, entity_status
        --, owner_id
    from dbo.SYN_SD_RemedialObjective
)
,mdm_l as 
(
    select
        6126000 + id        ID
        ,id                        TYPE_INDEX
        ,119                         TYPE_ID
        ,IsNull(name, description) DESCRIPTION
        ,##VERSION##                   VERSION
        ,'A'  STATUS
        ,0          LAST_MODIFIED_USER_ID
        ,'MDM'        LAST_MODIFIED_USER_NAME
        ,##LAST_MODIFIED_DATE_TIME##         LAST_MODIFIED_DATE_TIME
        ,1            LAST_OPERATION_TYPE
        ,##EFFECTIVE_START_DATE_TIME##  EFFECTIVE_START_DATE_TIME
        ,'9999-12-31 23:59:59.0000000'    EFFECTIVE_END_DATE_TIME
        --, entity_status
        --, owner_id
    from dbo.SYN_SD_WellObjective
)
,mdm_k as 
(
    select
        6125000 + id        ID
        ,id                        TYPE_INDEX
        ,84                         TYPE_ID
        ,IsNull(name, description) DESCRIPTION
        ,##VERSION##                   VERSION
        ,'A'  STATUS
        ,0          LAST_MODIFIED_USER_ID
        ,'MDM'        LAST_MODIFIED_USER_NAME
        ,##LAST_MODIFIED_DATE_TIME##         LAST_MODIFIED_DATE_TIME
        ,1            LAST_OPERATION_TYPE
        ,##EFFECTIVE_START_DATE_TIME##  EFFECTIVE_START_DATE_TIME
        ,'9999-12-31 23:59:59.0000000'    EFFECTIVE_END_DATE_TIME
        --, entity_status
        --, owner_id
    from dbo.SYN_SD_WellType
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
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from dbo.SYN_SD_PlugLoadingHeadSpecialty) a
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
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from dbo.SYN_SD_PlugManufacture) a
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
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from dbo.SYN_SD_PlugLoadingHeadManufacture) a
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
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from dbo.SYN_SD_QualityObservationType) a
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
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from dbo.SYN_SD_PotentialSeverity) a
    where 
        rowNum = 1
)
,mdm_117 as 
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
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from dbo.SYN_SD_PerformanceMetric) a
    where 
        rowNum = 1
)
,es_117_extra as 
(
    select 
        e.* 
    from
        eservice_full e
        left join mdm_117 m on m.TYPE_INDEX = e.TYPE_INDEX
    where 
        e.TYPE_ID in (117)
        and m.TYPE_INDEX is null
)
,mdm_116 as 
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
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from dbo.SYN_SD_IncidentType) a
    where 
        rowNum = 1
)
,es_116_extra as 
(
    select 
        e.* 
    from
        eservice_full e
        left join mdm_116 m on m.TYPE_INDEX = e.TYPE_INDEX
    where 
        e.TYPE_ID in (116)
        and m.TYPE_INDEX is null
)
,mdm_115 as 
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
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from dbo.SYN_SD_SeverityMatrixtype) a
    where 
        rowNum = 1
)
,es_115_extra as 
(
    select 
        e.* 
    from
        eservice_full e
        left join mdm_115 m on m.TYPE_INDEX = e.TYPE_INDEX
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
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from dbo.SYN_SD_BlendFluidType) a
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
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from dbo.SYN_SD_AdditiveType) a
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
from mdm_126
 union
select ID, TYPE_INDEX, TYPE_ID, DESCRIPTION, STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME
from mdm_m
    union
select ID, TYPE_INDEX, TYPE_ID, DESCRIPTION, STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME
from mdm_l
    union
select ID, TYPE_INDEX, TYPE_ID, DESCRIPTION, STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME
from mdm_k
    union
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
from mdm_117
    union
select ID, TYPE_INDEX, TYPE_ID, DESCRIPTION, STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME
from es_117_extra
    union
select ID, TYPE_INDEX, TYPE_ID, DESCRIPTION, STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME
from mdm_116
    union
select ID, TYPE_INDEX, TYPE_ID, DESCRIPTION, STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME
from es_116_extra
    union
select ID, TYPE_INDEX, TYPE_ID, DESCRIPTION, STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME
from mdm_115
    union
select ID, TYPE_INDEX, TYPE_ID, DESCRIPTION, STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME
from es_115_extra
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
where TYPE_ID not in (4, 5,120,121,122,123,124,115,116,117, 84, 119, 125,126)
;
GO

--modify TABLE
ALTER TABLE [dbo].[RPT_HSE_INCIDENT_DTL_SCTNS] ADD [HSE_PRIMARYINCIDENT_TYPE_ID] [int] NULL;
GO
ALTER TABLE [dbo].[RPT_HSE_INCIDENT_DTL_SCTNS] ADD [HSE_PRIMARYINCIDENT_TYPE_NAME] nvarchar(2000) NULL;
GO
