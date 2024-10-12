-- Prepare reference data

-- This values are for non-versioned master data only.
-- ##LAST_MODIFIED_DATE_TIME## -- GETDATE()
-- ##EFFECTIVE_START_DATE_TIME## -- GETDATE()
-- ##VERSION## --1

-- Above values only needs to be replaecd with initial vaules for the first time production release, after the release copy the values to script	   
		   
Use [##SanjelData##]
GO

CREATE TABLE [RemedialObjective] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL);
GO

SET IDENTITY_INSERT [##SanjelData##].[dbo].[RemedialObjective] ON 
GO
INSERT [##SanjelData##].[dbo].[RemedialObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (0, 0, 0, N'', N'')
GO
INSERT [##SanjelData##].[dbo].[RemedialObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (1, 0, 0, N'SCVF repair', N'SCVF repair')
GO
INSERT [##SanjelData##].[dbo].[RemedialObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (2, 0, 0, N'Gas migration repair', N'Gas migration repair')
GO
INSERT [##SanjelData##].[dbo].[RemedialObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (3, 0, 0, N'Abandonment', N'Abandonment')
GO
INSERT [##SanjelData##].[dbo].[RemedialObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (4, 0, 0, N'Water shut-off', N'Water shut-off')
GO
INSERT [##SanjelData##].[dbo].[RemedialObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (5, 0, 0, N'Casing repair', N'Casing repair')
GO
INSERT [##SanjelData##].[dbo].[RemedialObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (6, 0, 0, N'Shoe squeeze', N'Shoe squeeze')
GO
INSERT [##SanjelData##].[dbo].[RemedialObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (7, 0, 0, N'TOL squeeze', N'TOL squeeze')
GO
INSERT [##SanjelData##].[dbo].[RemedialObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (8, 0, 0, N'Zone isolation', N'Zone isolation')
GO
SET IDENTITY_INSERT [##SanjelData##].[dbo].[RemedialObjective] OFF
GO
SET IDENTITY_INSERT [##SanjelData##].[dbo].[WellObjective] ON 
GO
INSERT [##SanjelData##].[dbo].[WellObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (0, 0, 0, N'', N'')
GO
INSERT [##SanjelData##].[dbo].[WellObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (1, 0, 0, N'', N'')
GO
INSERT [##SanjelData##].[dbo].[WellObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (2, 0, 0, N'Oil', N'Oil')
GO
INSERT [##SanjelData##].[dbo].[WellObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (3, 0, 0, N'Water', N'Water')
GO
INSERT [##SanjelData##].[dbo].[WellObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (4, 0, 0, N'SAGD', N'SAGD')
GO
INSERT [##SanjelData##].[dbo].[WellObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (5, 0, 0, N'Carbon Dioxide', N'Carbon Dioxide')
GO
INSERT [##SanjelData##].[dbo].[WellObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (6, 0, 0, N'CCUS', N'CCUS')
GO
INSERT [##SanjelData##].[dbo].[WellObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (7, 0, 0, N'Gas', N'Gas')
GO
INSERT [##SanjelData##].[dbo].[WellObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (8, 0, 0, N'Other', N'Other')
GO
INSERT [##SanjelData##].[dbo].[WellObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (9, 0, 0, N'CCS', N'CCS')
GO
INSERT [##SanjelData##].[dbo].[WellObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (10, 0, 0, N'Acid', N'Acid')
GO
INSERT [##SanjelData##].[dbo].[WellObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (11, 0, 0, N'Waste', N'Waste')
GO
INSERT [##SanjelData##].[dbo].[WellObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (12, 0, 0, N'Helium', N'Helium')
GO
INSERT [##SanjelData##].[dbo].[WellObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (13, 0, 0, N'Potash', N'Potash')
GO
INSERT [##SanjelData##].[dbo].[WellObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (14, 0, 0, N'Geothermal', N'Geothermal')
GO
INSERT [##SanjelData##].[dbo].[WellObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (15, 0, 0, N'Hydrogen', N'Hydrogen')
GO
INSERT [##SanjelData##].[dbo].[WellObjective] ([id], [entity_status], [owner_id], [name], [description]) VALUES (16, 0, 0, N'Lithium', N'Lithium')
GO
SET IDENTITY_INSERT [##SanjelData##].[dbo].[WellObjective] OFF
GO
SET IDENTITY_INSERT [##SanjelData##].[dbo].[WellType] ON 
GO
INSERT [##SanjelData##].[dbo].[WellType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (0, 0, 0, N'', N'')
GO
INSERT [##SanjelData##].[dbo].[WellType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (1, 0, 0, N'Producer', N'Producer')
GO
INSERT [##SanjelData##].[dbo].[WellType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (2, 0, 0, N'Injector', N'Injector')
GO
INSERT [##SanjelData##].[dbo].[WellType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (3, 0, 0, N'Disposal', N'Disposal')
GO
INSERT [##SanjelData##].[dbo].[WellType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (4, 0, 0, N'Observation', N'Observation')
GO
INSERT [##SanjelData##].[dbo].[WellType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (5, 0, 0, N'Core Hole', N'Core Hole')
GO
SET IDENTITY_INSERT [##SanjelData##].[dbo].[WellType] OFF
GO


USE [##eService6##]
GO

-- Add new column for Entity Change
Alter Table [##eService6##].[dbo].[PROGRAMS] Add WELL_TYPE_ID Integer;
Alter Table [##eService6##].[dbo].[PROGRAMS] Add WELL_TYPE_NAME nvarchar(255);
Alter Table [##eService6##].[dbo].[PROGRAMS] Add WELL_OBJECTIVE_ID Integer;
Alter Table [##eService6##].[dbo].[PROGRAMS] Add WELL_OBJECTIVE_NAME nvarchar(255);
Alter Table [##eService6##].[dbo].[PROGRAMS] Add REMEDIAL_OBJECTIVE_ID Integer;
Alter Table [##eService6##].[dbo].[PROGRAMS] Add REMEDIAL_OBJECTIVE_NAME nvarchar(255);


Alter Table [##eService6##].[dbo].[PRG_PUMPING_JOB_SECTIONS]  Add WELL_OBJECTIVE_ID Integer;
Alter Table [##eService6##].[dbo].[PRG_PUMPING_JOB_SECTIONS]  Add WELL_OBJECTIVE_NAME nvarchar(255);


Alter Table [##eService6##].[dbo].[PROGRAMS]  Add [SALES_FORECAST_NUMBER] [nvarchar](255) NULL
Alter Table [##eService6##].[dbo].[PROGRAMS]  Add [ITERATION] nvarchar(255) NULL
GO

UPDATE [##eService6##].[dbo].[TYPE_VALUES_ConvertedToView] SET [EFFECTIVE_END_DATE_TIME]=GETDATE(), version = version+1,  LAST_MODIFIED_DATE_TIME = GETDATE() WHERE [TYPE_ID] = 84 
GO

CREATE SYNONYM [dbo].[SYN_SD_RemedialObjective] FOR [##SanjelData##].[dbo].[RemedialObjective]
GO


-- Update type_values VIEW

USE [##eService6##]
GO

DROP VIEW [dbo].[TYPE_VALUES]
GO

/****** Object:  View [dbo].[TYPE_VALUES]    Script Date: 6/28/2023 12:27:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
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
where TYPE_ID not in (4, 5,120,121,122,123,124,115,116,117, 84, 119, 125)
;

GO

-- WellLocation Upgrade
USE [SanjelDataUAT]
GO

ALTER TABLE [RigJob] ADD [WellLocationType] [int] NULL;
GO

Update RigJob Set WellLocationType = WellLocationTypeid;
Go

/****** Object:  View [dbo].[CallSheet]    Script Date: 9/11/2023 9:48:44 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[CallSheet]
with view_metadata
AS
select 
	CSH.id as id,
    cast(0 as int) as entity_status,
	cast(0 as int) as owner_id,
    cast(null as varchar(100)) as name,
    cast(null as varchar(500)) as description,
	cast(CSH.CALL_SHEET_NUMBER as int) as CallSheetNumber,
	cast(CSH.STATUS as int) as status,
	cast(CSH.CIF_CALLOUT_DATETIME as datetime2(7)) as CallDateTime,
	cast(CSH.CIF_CALL_CREW_DATE_TIME as datetime2(7)) as CallCrewDateTime,
	cast(CSH.CIF_REQUESTED_DATE_TIME as datetime2(7)) as RequestedDateTime,
	cast(CSH.[FC_IS_EXPECTED_TIME_ON_LOC] as bit) as IsExpectedTimeOnLocation,
	cast(CSH.CIF_IS_THIS_CALL_MADE as bit) as IsThisCallMade,
	cast(CSH.[FC_ALERT_DATE_TIME] as datetime2(7)) as AlertDateTime,
	cast(CSH.[CIF_CALLOUT_CONSULTANT] as varchar(100)) as CalloutConsultant,
	cast(CSH.CIF_CALLOUT_CONSULTANT_CELL as varchar(30))  as  CalloutConsultantCellNumber,
	cast(CSH.CIF_CALLOUT_CONSULTANT_EMAIL as varchar(100))  as  CalloutConsultantEmail,
	cast(CSH.CIF_IS_LOAD_AND_GO as bit)  as  IsLoadAndGo,
	cast(CSH.WLI_WELL_LOCATION as nvarchar(100))  as  WellLocation,
	cast(CSH.WLI_WELL_LOCATION_TYPE_ID as int)  as  WellLocationTypeId,
	cast(CSH.WLI_WELL_LOCATION_TYPE_ID as int)  as  WellLocationType,
	cast(0 as int) as WellLocationTypeSystemId,
	cast(CSH.WLI_WELL_LOCATION_TYPE_NAME as varchar(100)) as  WellLocationTypeName,
	cast(null as varchar(500)) as WellLocationTypeDescription,
	cast(CSH.WLI_DH_WELL_LOCATION as varchar(100)) as  DownHoleWellLocation,
	cast(CSH.WLI_DH_WELL_LOCATION_TYPE_ID as int) as  DownHoleWellLocationTypeId,
	cast(0 as int) as DownHoleWellLocationTypeSystemId,
	cast(CSH.WLI_DH_WELL_LOCATION_TYPE_NAME as varchar(100)) as DownHoleWellLocationTypeName,
	cast(null as varchar(500)) as DownHoleWellLocationTypeDescription,
	cast(CSH.WLI_DIRECTION_TO_LOCATION as varchar(1000))  as  DirectionToLocation,
	cast(CSH.WLI_WELL_NAME as varchar(100))  as  WellName,
	cast(CSH.FC_EXPECTED_TIME_ON_LOC as datetime2(7)) as ExpectedOnLocationTime,
	cast(CSH.JD_SERVICE_POINT_ID as int) as ServicePointid,
	cast(0 as int) as ServicePointSystemId,
	cast(CSH.JD_SERVICE_POINT_NAME as varchar(100)) as ServicePointName,
	cast(null as varchar(500)) as ServicePointDescription
	from dbo.[SYN_ES_CALLSHEET_HEADERS] CSH where CSH.STATUS in (1,2,5) and CSH.FC_EXPECTED_TIME_ON_LOC > DateADD(Day, -7, GETDATE());
GO

/****** Object:  View [dbo].[RigJobSanjelCrewSectionList]    Script Date: 9/11/2023 9:50:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[RigJobSanjelCrewSectionList]
AS
SELECT  distinct
	 crewSection.id
	,crewSection.SanjelCrewid AS crewId,
	crewSection.effective_end_datetime AS crewsectionEffective_end_datetime
	--
	,rigJob.Rigid
	,rigJob.RigName
	,rigJob.RigDescription
	,rigJob.RigSystemId

	,rigJob.ClientCompanyid
	,rigJob.ClientCompanyName
	,rigJob.ClientCompanyDescription
	,rigJob.ClientCompanySystemId

	,rigJob.JobTypeid
	,rigJob.JobTypeName
	,rigJob.JobTypeDescription
	,rigJob.JobTypeSystemId

	,rigJob.ServicePointid
	,rigJob.ServicePointName
	,rigJob.ServicePointDescription
	,rigJob.ServicePointSystemId

	,rigJob.ClientConsultant1id
	,rigJob.ClientConsultant1Name
	,rigJob.ClientConsultant1Description
	,rigJob.ClientConsultant1SystemId

	,rigJob.ClientConsultant2id
	,rigJob.ClientConsultant2Name
	,rigJob.ClientConsultant2Description
	,rigJob.ClientConsultant2SystemId

	,rigJob.WellLocationType
	,rigJob.WellLocationTypeid
	,rigJob.WellLocationTypeName
	,rigJob.WellLocationTypeDescription
	,rigJob.WellLocationTypeSystemId


	,rigJob.id as rigJobId
	,rigJob.system_id
	,rigJob.version
	,rigJob.modified_user_id
	,rigJob.modified_user_name
	,rigJob.modified_datetime
	,rigJob.operation_type
	,rigJob.effective_start_datetime
	,rigJob.effective_end_datetime
	,rigJob.entity_status
	,rigJob.owner_id
	,rigJob.name
	,rigJob.description
	,rigJob.WellLocation
	,rigJob.IsProjectRig
	,rigJob.CallSheetId
	,rigJob.IsListed
	,rigJob.IsDownholeLocation
	,rigJob.JobNumber
	,rigJob.RigStatus
	,rigJob.IsHighProfile
	,rigJob.Directions
	,rigJob.IsNeedBins
	,rigJob.ProgramId
	,rigJob.Notes
	,rigJob.SurfaceLocation
	,rigJob.JobDateTime
	,rigJob.JobUniqueId
	,rigJob.IsServiceRig
	,rigJob.CallSheetNumber
	,rigJob.JobLifeStatus
	,rigJob.IsCoDCleared
	,rigJob.JobAlertId
	,rigJob.ClientCompanyShortName
	,rigJob.RiskMatrix
	,rigJob.ProgramRevision
	,rigJob.MaxProgramRevision
	,rigJob.Latitude
	,rigJob.Longitude
	,rigJob.PumperCount
	,rigJob.PreJobTesting
	,rigJob.JobDuration
FROM (select * FROM RigJobSanjelCrewSection where entity_status = 0 and effective_end_datetime>GETDATE()) AS crewSection
INNER JOIN RigJob AS rigJob ON RigJobid = rigJob.id
 
GO


