SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[TYPE_VALUES]
AS


-- This view does the following :
-- 1. Pulls BlendFluidType (TYPE_ID=5) and AdditiveType (TYPE_ID=4) data from SanjelData MD database
-- 2, Identifies BlendFluidType and AdditiveType old records that are in eService table (eservice6.dbo.TYPE_VALUES originally, renamed to TYPE_VALUES_ConvertedToView) but not in MD
-- 3. Union all records from steps 1 & 2 and, also, all other (not BlendFluidType or AdditiveType) records from TYPE_VALUES_ConvertedToView

with
eservice_full as 
(
    select * from eservice6.dbo.TYPE_VALUES_ConvertedToView
)
,mdm_g as 
(
    select
        10000000 + system_id        ID
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
        9000000 + system_id        ID
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
        8000000 + system_id        ID
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
        7000000 + system_id        ID
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
        6000000 + system_id        ID
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
where TYPE_ID not in (4, 5,115,116,117)
;

