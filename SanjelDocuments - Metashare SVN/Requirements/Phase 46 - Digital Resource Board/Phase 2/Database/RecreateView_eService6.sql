---Update !!!---------------------------
USE [eservice6UAT]
GO
---Update !!!---------------------------

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TYPE_VALUES'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TYPE_VALUES'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SCM_PLC_LOG'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SCM_PLC_LOG'
GO
/****** Object:  View [dbo].[WorkType]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[WorkType]
GO
/****** Object:  View [dbo].[VEHICLE_TYPES]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[VEHICLE_TYPES]
GO
/****** Object:  View [dbo].[VEHICLE_SUB_TYPES]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[VEHICLE_SUB_TYPES]
GO
/****** Object:  View [dbo].[V_SCM_PLC_PROCESSED_JOBS_Azure]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[V_SCM_PLC_PROCESSED_JOBS_Azure]
GO
/****** Object:  View [dbo].[V_SCM_PLC_LOG_Azure]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[V_SCM_PLC_LOG_Azure]
GO
/****** Object:  View [dbo].[V_Job_Performance]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[V_Job_Performance]
GO
/****** Object:  View [dbo].[TYPE_VALUES]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[TYPE_VALUES]
GO
/****** Object:  View [dbo].[TRUCK_UNITS]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[TRUCK_UNITS]
GO
/****** Object:  View [dbo].[SERVICE_POINTS]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[SERVICE_POINTS]
GO
/****** Object:  View [dbo].[SCM_PLC_LOG]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[SCM_PLC_LOG]
GO
/****** Object:  View [dbo].[SANJEL_COMPANIES]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[SANJEL_COMPANIES]
GO
/****** Object:  View [dbo].[RIGS]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[RIGS]
GO
/****** Object:  View [dbo].[PROVINCE_STATES]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[PROVINCE_STATES]
GO
/****** Object:  View [dbo].[PRODUCTS]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[PRODUCTS]
GO
/****** Object:  View [dbo].[JobRole]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[JobRole]
GO
/****** Object:  View [dbo].[JOB_TYPES]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[JOB_TYPES]
GO
/****** Object:  View [dbo].[EMPLOYEES]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[EMPLOYEES]
GO
/****** Object:  View [dbo].[DrillingCompanies]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[DrillingCompanies]
GO
/****** Object:  View [dbo].[COUNTRIES]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[COUNTRIES]
GO
/****** Object:  View [dbo].[CONTRACTOR_COMPANIES]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[CONTRACTOR_COMPANIES]
GO
/****** Object:  View [dbo].[COMPANIES_WITH_TYPES]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[COMPANIES_WITH_TYPES]
GO
/****** Object:  View [dbo].[COMPANIES]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[COMPANIES]
GO
/****** Object:  View [dbo].[CLIENT_CONSULTANTS]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[CLIENT_CONSULTANTS]
GO
/****** Object:  View [dbo].[BONUS_POSITIONS]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[BONUS_POSITIONS]
GO
/****** Object:  View [dbo].[BLEND_RECIPE_CHEMICAL_ITEMS]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[BLEND_RECIPE_CHEMICAL_ITEMS]
GO
/****** Object:  View [dbo].[BLEND_RECIPE]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[BLEND_RECIPE]
GO
/****** Object:  View [dbo].[BLEND_CHEMICALS]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[BLEND_CHEMICALS]
GO
/****** Object:  View [dbo].[BINS]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[BINS]
GO
/****** Object:  View [dbo].[BIN_TYPES]    Script Date: 2/22/2023 5:42:05 PM ******/
DROP VIEW [dbo].[BIN_TYPES]
GO
/****** Object:  View [dbo].[BIN_TYPES]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BIN_TYPES] AS 
    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
        from SYN_SD_BinType
    )
    select
        id                          ID,
        description                 DESCRIPTION,
        version                     VERSION,
        CAST(modified_user_id as int)   LAST_MODIFIED_USER_ID,
        modified_user_name          LAST_MODIFIED_USER_NAME,
        modified_datetime           LAST_MODIFIED_DATE_TIME,
        operation_type              LAST_OPERATION_TYPE,
        effective_start_datetime    EFFECTIVE_START_DATE_TIME,
        effective_end_datetime      EFFECTIVE_END_DATE_TIME
    from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[BINS]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[BINS] AS 
    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
        from SYN_SD_Bin
    )
    select
        id                          ID,
        name                        BIN_NUMBER,
        NULL                        CAPACITY,       
        description                 DESCRIPTION,
        HomeServicePointid          DISTRICT_ID,    
        NULL                        ACQUIRED_DATE,  
        'A'                         STATUS,         
        BinTypeid                   BIN_TYPE_ID,
        version                     VERSION,
        CAST(modified_user_id as int)   LAST_MODIFIED_USER_ID,
        modified_user_name          LAST_MODIFIED_USER_NAME,
        modified_datetime           LAST_MODIFIED_DATE_TIME,
        operation_type              LAST_OPERATION_TYPE,
        effective_start_datetime    EFFECTIVE_START_DATE_TIME,
        effective_end_datetime      EFFECTIVE_END_DATE_TIME
    from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[BLEND_CHEMICALS]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[BLEND_CHEMICALS] AS 
    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
        from SYN_SD_BlendChemical
    )
    select  
        id                          ID,
        name                        NAME,
        description                 DESCRIPTION,
        ProductId                   PRODUCT_ID,
        ProductName                 PRODUCT_NAME,
        BlendRecipeId               BLEND_RECIPE_ID,
        BlendRecipeName             BLEND_RECIPE_NAME,
        IsBaseEligible              IS_BASE_BLEND_ELIGIBLE,
        BaseBlendTypeId             BLEND_FLUID_TYPE_ID,
        BaseBlendTypeName           BLEND_FLUID_TYPE_NAME,
        IsAdditiveEligible          IS_ADDITIVE_ELIGIBLE,
        AdditiveTypeId              ADDITIVE_TYPE_ID,
        AdditiveTypeName            ADDITIVE_TYPE_NAME,
        SpecificGravity             SPECIFIC_GRAVITY,
        MixWater                    MIX_WATER,
        Yield                       YIELD,
        Density                     DENSITY,
        IsThixotropic               IS_THIXOTROPIC,
        BagSize                     BAGSIZE,
        AERCode                     AERCODE,
        version                     VERSION,
        modified_user_id            LAST_MODIFIED_USER_ID,
        modified_user_name          LAST_MODIFIED_USER_NAME,
        modified_datetime           LAST_MODIFIED_DATE_TIME,
        operation_type              LAST_OPERATION_TYPE,
        effective_start_datetime    EFFECTIVE_START_DATE_TIME,
        effective_end_datetime      EFFECTIVE_END_DATE_TIME,
        BlendPrimaryCategoryId      BLEND_PRI_CAT_ID,
        BlendPrimaryCategoryName    BLEND_PRI_CAT_NAME
    from orderedRecords where rowNum = 1
GO
/****** Object:  View [dbo].[BLEND_RECIPE]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[BLEND_RECIPE] AS 
    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
        from SYN_SD_BlendRecipe
    )
    select  
        id                          ID,
        name                        NAME,
        version                     VERSION,
        modified_user_id            LAST_MODIFIED_USER_ID,
        modified_user_name          LAST_MODIFIED_USER_NAME,
        modified_datetime           LAST_MODIFIED_DATE_TIME,
        operation_type              LAST_OPERATION_TYPE,
        effective_start_datetime    EFFECTIVE_START_DATE_TIME,
        effective_end_datetime      EFFECTIVE_END_DATE_TIME
    from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[BLEND_RECIPE_CHEMICAL_ITEMS]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[BLEND_RECIPE_CHEMICAL_ITEMS] AS 
    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
        from SYN_SD_BlendChemicalSection
    )
    select  
        id                          ID,
        owner_id                    ROOT_ID,
        owner_id                    PARENT_ID,
        BlendChemicalId             BLEND_CHEMICAL_ID,
        Amount                      AMOUNT,
        IsBaseBlend                 IS_BASE_BLEND,
        AdditionMethodId            ADDITION_METHOD,
        AdditiveBlendMethodId       ADDITIVE_BLEND_METHOD,
        UnitName                    UNIT_NAME,
        case 
            when UnitName = 'Percent' then '%'
            when UnitName = 'Cubic Meters' then 'm3'
            else ''
        end                         UNIT_ABBR,
        version                     VERSION,
        modified_user_id            LAST_MODIFIED_USER_ID,
        modified_user_name          LAST_MODIFIED_USER_NAME,
        modified_datetime           LAST_MODIFIED_DATE_TIME,
        operation_type              LAST_OPERATION_TYPE,
        effective_start_datetime    EFFECTIVE_START_DATE_TIME,
        effective_end_datetime      EFFECTIVE_END_DATE_TIME,
        BlendChemicalName           BLEND_CHEMICAL_NAME
    from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[BONUS_POSITIONS]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[BONUS_POSITIONS] AS 
    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
        from SYN_SD_BonusPosition
    )
    select
        id                          ID,
        description                 DESCRIPTION,
        ServiceLineid               SERVICE_LINE_ID,
        version                     VERSION,
        CAST(modified_user_id as int)   LAST_MODIFIED_USER_ID,
        modified_user_name          LAST_MODIFIED_USER_NAME,
        modified_datetime           LAST_MODIFIED_DATE_TIME,
        operation_type              LAST_OPERATION_TYPE,
        effective_start_datetime    EFFECTIVE_START_DATE_TIME,
        effective_end_datetime      EFFECTIVE_END_DATE_TIME
    from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[CLIENT_CONSULTANTS]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[CLIENT_CONSULTANTS] AS 
    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * 
        from SYN_SD_ClientConsultant
    )
    select
        id                          ID,
        name                        NAME,
        Cell                        CELL,
        Phone2                      PHONE2,
        Email                       EMAIL,
        Clientid                    CLIENT_ID,
        CAST(modified_user_id as int)   LAST_MODIFIED_USER_ID,
        modified_user_name          LAST_MODIFIED_USER_NAME,
        modified_datetime           LAST_MODIFIED_DATE_TIME,
        operation_type              LAST_OPERATION_TYPE,
        effective_start_datetime    EFFECTIVE_START_DATE_TIME,
        effective_end_datetime      EFFECTIVE_END_DATE_TIME,
        version                     VERSION,
        WorkShiftid                 WORK_SHIFT_TYPE_ID,
        WorkShiftName               WORK_SHIFT_TYPE_NAME
    from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[COMPANIES]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[COMPANIES] AS 
    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
        from SYN_SD_ClientCompany
    )
    select
        id                              ID,
        name                            NAME,
        AddressStreet                   ADDRESS_STREET,
        AddressStreet2                  ADDRESS_STREET2,
        AddressStreet3                  ADDRESS_STREET3,
        AddressStreet4                  ADDRESS_STREET4,
        AddressCity                     ADDRESS_CITY,
        AddressPostalCode               ADDRESS_POSTAL_ZIP,
        AddressProvinceOrStateid        ADDRESS_PROV_STATE_ID,
        BillingAddressStreet            BILLING_ADDRESS_STREET,
        BillingAddressStreet2           BILLING_ADDRESS_STREET2,
        BillingAddressStreet3           BILLING_ADDRESS_STREET3,
        BillingAddressStreet4           BILLING_ADDRESS_STREET4,
        BillingAddressCity              BILLING_ADDRESS_CITY,
        BillingAddressPostalCode        BILLING_ADDRESS_POSTAL_ZIP,
        BillingAddressProvinceOrStateid BILLING_ADDRESS_PROV_STATE_ID,
        NULL                                RIG_PREFIX,                     --??? not always NULL in eService 
        version                         VERSION,
        CAST(modified_user_id as int)   LAST_MODIFIED_USER_ID,
        modified_user_name              LAST_MODIFIED_USER_NAME,
        modified_datetime               LAST_MODIFIED_DATE_TIME,
        operation_type                  LAST_OPERATION_TYPE,
        effective_start_datetime        EFFECTIVE_START_DATE_TIME,
        effective_end_datetime          EFFECTIVE_END_DATE_TIME,
        IsCODCustomer                   IS_COD_CUSTOMER,
        SanjelCompanyid                 SANJEL_COMPANY_ID,
        ShortName                       SHORT_NAME
    from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[COMPANIES_WITH_TYPES]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[COMPANIES_WITH_TYPES] AS 

    select distinct
        id COMPANY_ID
        ,1 TYPE_ID
        ,1 VERSION
    from SYN_SD_ClientCompany
    union
    select distinct
        id COMPANY_ID
        ,2 TYPE_ID
        ,1 VERSION
    from SYN_SD_ClientCompany
;
GO
/****** Object:  View [dbo].[CONTRACTOR_COMPANIES]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[CONTRACTOR_COMPANIES] AS 
    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * 
        from SYN_SD_ContractorCompany
    )
    select
        Id                          ID,
        name                        NAME,
        version                     VERSION,
        CAST(modified_user_id as int)   LAST_MODIFIED_USER_ID,
        modified_user_name          LAST_MODIFIED_USER_NAME,
        modified_datetime           LAST_MODIFIED_DATE_TIME,
        operation_type              LAST_OPERATION_TYPE,
        effective_start_datetime    EFFECTIVE_START_DATE_TIME,
        effective_end_datetime      EFFECTIVE_END_DATE_TIME
    from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[COUNTRIES]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[COUNTRIES] AS 
    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
        from SYN_SD_Country
    )
    select
        id                          ID,
        ISOAlpha2                   ISO,
        name                        NAME,
        ISOAlpha3                   ISO3,
        ISONumber                   NUMCODE,
        PercentFuelSurcharge        SURCHARGE_PERCENT,  
        CAST(modified_user_id as int)   LAST_MODIFIED_USER_ID,
        modified_user_name          LAST_MODIFIED_USER_NAME,
        modified_datetime           LAST_MODIFIED_DATE_TIME,
        operation_type              LAST_OPERATION_TYPE,
        effective_start_datetime    EFFECTIVE_START_DATE_TIME,
        effective_end_datetime      EFFECTIVE_END_DATE_TIME,
        1                           IS_IN_SERVICE,              --??? 1/0 in eService
        version                     VERSION,
        0                           HAS_COUNTY                  --??? 1/0 in eService
    from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[DrillingCompanies]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[DrillingCompanies] AS 
    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
        from SYN_SD_DrillingCompany
    )
    select
        id                              ID,
        name                            NAME,
        AddressStreet                   ADDRESS_STREET,
        AddressStreet2                  ADDRESS_STREET2,
        AddressStreet3                  ADDRESS_STREET3,
        AddressStreet4                  ADDRESS_STREET4,
        AddressCity                     ADDRESS_CITY,
        AddressPostalCode               ADDRESS_POSTAL_ZIP,
        AddressProvinceOrStateid        ADDRESS_PROV_STATE_ID,
        BillingAddressStreet            BILLING_ADDRESS_STREET,
        BillingAddressStreet2           BILLING_ADDRESS_STREET2,
        BillingAddressStreet3           BILLING_ADDRESS_STREET3,
        BillingAddressStreet4           BILLING_ADDRESS_STREET4,
        BillingAddressCity              BILLING_ADDRESS_CITY,
        BillingAddressPostalCode        BILLING_ADDRESS_POSTAL_ZIP,
        BillingAddressProvinceOrStateid BILLING_ADDRESS_PROV_STATE_ID,
        NULL                                RIG_PREFIX,                     --??? not always NULL in eService
        version                         VERSION,
        CAST(modified_user_id as int)   LAST_MODIFIED_USER_ID,
        modified_user_name              LAST_MODIFIED_USER_NAME,
        modified_datetime               LAST_MODIFIED_DATE_TIME,
        operation_type                  LAST_OPERATION_TYPE,
        effective_start_datetime        EFFECTIVE_START_DATE_TIME,
        effective_end_datetime          EFFECTIVE_END_DATE_TIME,
        IsCODCustomer                   IS_COD_CUSTOMER,
        SanjelCompanyid                 SANJEL_COMPANY_ID,
        ShortName                       SHORT_NAME
    from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[EMPLOYEES]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[EMPLOYEES] AS 

    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By EmployeeNumber ORDER BY Version desc) as rowNum, *
        from SYN_SD_Employee
    )
    select
        r.id                        ID
        ,r.FirstName                FIRST_NAME
        ,NULL                       MIDDLE_NAME
        ,r.LastName                 LAST_NAME
            --,e.WORK_PHONE               WORK_PHONE
        ,NULL                        WORK_PHONE
        ,NULL                       WORK_FAX
        ,NULL                       DIRECT_PHONE
        ,NULL                       DIRECT_FAX
        ,NULL                       HOME_PHONE
        ,NULL                       HOME_FAX
            --,e.CELL                     CELL
        ,NULL                       CELL
        ,NULL                       PAGER
        --, a.WorkEmail                EMAIL
        ,r.WorkEmail                EMAIL
        ,NULL                       PERCENT_EARN
        ,r.ServicePointId           DISTRICT_ID
        ,r.ServiceLineid            SERVICE_LINE_ID
        ,r.BonusPositionid          DEFAULT_BONUS_POSITION_ID
            --,IsNull(a.Status, 'A')      STATUS
            ,case when r.effective_end_datetime > getdate() then 'A' else 'T' end  STATUS
        ,r.modified_user_id         LAST_MODIFIED_USER_ID
        ,r.modified_user_name       LAST_MODIFIED_USER_NAME
        ,r.modified_datetime        LAST_MODIFIED_DATE_TIME
        ,r.operation_type           LAST_OPERATION_TYPE
        ,r.effective_start_datetime EFFECTIVE_START_DATE_TIME
        ,r.effective_end_datetime   EFFECTIVE_END_DATE_TIME
        ,r.version                  VERSION
        ,r.PreferedFirstName        PREFER_FIRST_NAME
        ,r.EmployeeNumber           EMPLOYEE_NUMBER
    from 
        orderedRecords r 
    where rowNum = 1
;
GO
/****** Object:  View [dbo].[JOB_TYPES]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[JOB_TYPES] AS 
    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
        from SYN_SD_JobType
    )
    select
        id                          ID,
        description                 DESCRIPTION,
        ServiceLineid               SERVICE_LINE_ID,
        case when getdate() between effective_start_datetime and effective_end_datetime then 'A' else 'T' end STATUS,           --???
        version                     VERSION,
        CAST(modified_user_id as int)   LAST_MODIFIED_USER_ID,
        modified_user_name          LAST_MODIFIED_USER_NAME,
        modified_datetime           LAST_MODIFIED_DATE_TIME,
        operation_type              LAST_OPERATION_TYPE,
        effective_start_datetime    EFFECTIVE_START_DATE_TIME,
        effective_end_datetime      EFFECTIVE_END_DATE_TIME,
        name                        NAME
    from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[JobRole]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[JobRole] AS 
    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
        from SYN_SD_JobRole
    )
    select
        id                          ID,
        description                 DESCRIPTION,
        version                     VERSION,
        CAST(modified_user_id as int)   LAST_MODIFIED_USER_ID,
        modified_user_name          LAST_MODIFIED_USER_NAME,
        modified_datetime           LAST_MODIFIED_DATE_TIME,
        operation_type              LAST_OPERATION_TYPE,
        effective_start_datetime    EFFECTIVE_START_DATE_TIME,
        effective_end_datetime      EFFECTIVE_END_DATE_TIME,
        name                        NAME
    from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[PRODUCTS]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PRODUCTS] AS 
    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
        from SYN_SD_Product
    )
    select  
        id                          ID,
        name                        NAME,
        description                 DESCRIPTION,
        InventoryNumber             INVENTORY_NUMBER,
        PriceCode                   PRICE_CODE,
        version                     VERSION,
        modified_user_id            LAST_MODIFIED_USER_ID,
        modified_user_name          LAST_MODIFIED_USER_NAME,
        modified_datetime           LAST_MODIFIED_DATE_TIME,
        operation_type              LAST_OPERATION_TYPE,
        effective_start_datetime    EFFECTIVE_START_DATE_TIME,
        effective_end_datetime      EFFECTIVE_END_DATE_TIME
    from orderedRecords where rowNum = 1
GO
/****** Object:  View [dbo].[PROVINCE_STATES]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PROVINCE_STATES] AS 
    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
        from SYN_SD_ProvinceOrState
    )
    select
        id                          ID,
        Code                        CODE,
        name                        NAME,
        Countryid                   COUNTRY_ID,
        Capital                     CAPITAL,
        PercentSalesSurcharge       SURCHARGE_PERCENT,
        version                     VERSION,
        CAST(modified_user_id as int)   LAST_MODIFIED_USER_ID,
        modified_user_name          LAST_MODIFIED_USER_NAME,
        modified_datetime           LAST_MODIFIED_DATE_TIME,
        operation_type              LAST_OPERATION_TYPE,
        effective_start_datetime    EFFECTIVE_START_DATE_TIME,
        effective_end_datetime      EFFECTIVE_END_DATE_TIME
    from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[RIGS]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[RIGS] AS 
    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
        from SYN_SD_Rig
    )
    select
        id                          ID,
        name                        NAME,
        RigNumber                   RIG_NO,
        DrillingCompanyid           DRILLINGCOMPANY_ID,
        DrillingCompanyName         DRILLINGCOMPANY_NAME,
        Status                      STATUS,             
        IsServiceRig                IS_SERVICE_RIG,
        IsDeleted                   IS_DELETED,
        IsTopDrive                  IS_TOP_DRIVE,
        cast(SizeName as float)     SIZE_TYPE_VALUE,    
        NULL                        SIZE_TYPE_UNIT,     
        RigSizeid                   RIG_SIZE_TYPE_ID,
        RigSizeName                 RIG_SIZE_TYPE_NAME,
        ThreadTypeid                THREAD_TYPE_ID,
        ThreadTypeName              THREAD_TYPE_NAME,   --?? does not match for some recs 
        --version                       VERSION,
        version + iif (IsNull(IsDeleted, 0) <> 0, 1, 0) VERSION, 
        CAST(modified_user_id as int)   LAST_MODIFIED_USER_ID,
        modified_user_name          LAST_MODIFIED_USER_NAME,
        --modified_datetime         LAST_MODIFIED_DATE_TIME,
        iif(IsNull(IsDeleted, 0) <> 0, '2022-08-04 14:30:00', modified_datetime) LAST_MODIFIED_DATE_TIME,
        operation_type              LAST_OPERATION_TYPE,
        --effective_start_datetime  EFFECTIVE_START_DATE_TIME,
        iif(IsNull(IsDeleted, 0) <> 0, '2022-08-04 14:30:00', effective_start_datetime) EFFECTIVE_START_DATE_TIME,
        --effective_end_datetime        EFFECTIVE_END_DATE_TIME,
        iif(IsNull(IsDeleted, 0) <> 0, '2022-08-04 14:30:00', effective_end_datetime) EFFECTIVE_END_DATE_TIME,
        IsProjectRig                IS_PROJECT_RIG
    from orderedRecords 
    where 
        OperationSiteType=1 
        and rowNum = 1
        --and id in (2170, 2171, 2172)
        ;
GO
/****** Object:  View [dbo].[SANJEL_COMPANIES]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[SANJEL_COMPANIES] AS 
    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
        from SYN_SD_SanjelCompany
    )
    select
        id                          ID,
        name                        NAME,
        Countryid                   COUNTRY_ID,
        version                     VERSION,
        CAST(modified_user_id as int)   LAST_MODIFIED_USER_ID,
        modified_user_name          LAST_MODIFIED_USER_NAME,
        modified_datetime           LAST_MODIFIED_DATE_TIME,
        operation_type              LAST_OPERATION_TYPE,
        effective_start_datetime    EFFECTIVE_START_DATE_TIME,
        effective_end_datetime      EFFECTIVE_END_DATE_TIME
    from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[SCM_PLC_LOG]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[SCM_PLC_LOG]
AS
SELECT
	Id, 
	ProcessingDateTime, 
	JobNumber, 
	UnitNumbers, 
	DataStartTime, 
	DataEndTime, 
	PackSize, 
	HasStartingFullRecord, 
	JobUniqueId, 
	ComputerName, 
	FileName, 
	JsonData, 
	AttachmentJobUniqueId, 
	AttachmentJobNumber, 
    SurfaceLocation, 
	DownHoleLocation, 
	Status, 
	ClientCompany, 
	JobType, 
	ClientRep, 
	Supervisor, 
	WellName, 
	ServicePoint, 
	JobDateTime, 
	Version, 
	MonitorStartTime, 
	MonitorEndTime, 
	eServiceExpressVersion, 
	JobStartTime, 
    JobEndTime, 
	TimeZone
FROM            
	dbo.SYN_PLC_SCM_PLC_LOG AS SCM_PLC_LOG_1
GO
/****** Object:  View [dbo].[SERVICE_POINTS]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[SERVICE_POINTS] AS 
    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
        from SYN_SD_ServicePoint
    )
    select
        id                          ID,
        name                        NAME,
        version                     VERSION,
        CAST(modified_user_id as int)   LAST_MODIFIED_USER_ID,
        modified_user_name          LAST_MODIFIED_USER_NAME,
        modified_datetime           LAST_MODIFIED_DATE_TIME,
        operation_type              LAST_OPERATION_TYPE,
        effective_start_datetime    EFFECTIVE_START_DATE_TIME,
        effective_end_datetime      EFFECTIVE_END_DATE_TIME
    from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[TRUCK_UNITS]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[TRUCK_UNITS] AS 
    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
        from SYN_SD_TruckUnit
    )
    select
        id                          ID,
        left(UnitNumber, 8)                 UNIT_NUMBER,        
        ServicePointid              DISTRICT_ID,         
        Id                          VEHICLE_ID,         
        NULL                        TRUCK_UNIT_TYPE_ID, 
        version                     VERSION,
        CAST(modified_user_id as int)   LAST_MODIFIED_USER_ID,
        modified_user_name          LAST_MODIFIED_USER_NAME,
        modified_datetime           LAST_MODIFIED_DATE_TIME,
        operation_type              LAST_OPERATION_TYPE,
        effective_start_datetime    EFFECTIVE_START_DATE_TIME,
        effective_end_datetime      EFFECTIVE_END_DATE_TIME,
        UnitMainTypeid              UNIT_MAIN_TYPE_ID,
        UnitSubTypeid               UNIT_SUB_TYPE_ID
    from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[TYPE_VALUES]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[TYPE_VALUES]
AS

-- This view does the following :
-- 1. Pulls BlendFluidType (TYPE_ID=5) and AdditiveType (TYPE_ID=4) data from SanjelData MD database
-- 2, Identifies BlendFluidType and AdditiveType old records that are in eService table (eservice6.dbo.TYPE_VALUES originally, renamed to TYPE_VALUES_ConvertedToView) but not in MD
-- 3. Union all records from steps 1 & 2 and, also, all other (not BlendFluidType or AdditiveType) records from TYPE_VALUES_ConvertedToView

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
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from SYN_SD_PlugLoadingHeadSpecialty) a
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
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from SYN_SD_PlugManufacture) a
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
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from SYN_SD_PlugLoadingHeadManufacture) a
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
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from SYN_SD_QualityObservationType) a
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
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from SYN_SD_PotentialSeverity) a
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
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from SYN_SD_PerformanceMetric) a
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
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from SYN_SD_IncidentType) a
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
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from SYN_SD_SeverityMatrixtype) a
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
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from SYN_SD_BlendFluidType) a
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
        (select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * from SYN_SD_AdditiveType) a
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
where TYPE_ID not in (4, 5,120,121,122,123,124,115,116,117)
;
GO
/****** Object:  View [dbo].[V_Job_Performance]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Job_Performance]
AS 

select 
    j.job_number
    , j.unique_id as job_unique_id
    , j.business_unit as business_unit_id
    ,case j.business_unit when 0 then 'Canada' when 1 then 'USA' end as business_unit_name
    , h.time_created_on_server
    , j.job_date_time
    , j.service_line_type as service_line_type_id
    , case j.service_line_type
            when 1 then 'Coiled Tubing'
            when 2 then 'Pumping'
            when 3 then 'Fracturing'
            when 4 then 'Nitrogen'
    end as service_line_type_name 
    , j.jt_district_id              as district_id
    , sd.name                       as district_name
    , sp.id                         as service_point_id
    , sp.name                       as service_point_name
    , c.company_id                  as client_id
    , c.company_name                as client_name
    , rtrim(ltrim (j.wli_well_location))    as location
    , j.jt_job_type_name            as job_type 
        
    -- charge method
    , cm.billing_service_line_id   as main_billing_service_line_id
    , cm.billing_service_line_name as main_billing_service_line_name
    , cm.discount                  as discount_percent
     
    -- hse info HI
    , hi.hi_has_incident_on_job
    , hi.hi_comment_for_incident           
    , hi.hi_has_delay_by_cust
    , hi.hi_num_delay_hours_by_cust     
    , hi.hi_comment_for_delay_by_cust
     
    -- hse detail HD
    , hd.hd_nonproductive_time_mins
    , hd.hd_client_reaction_advice 
    , hd.hd_events_leading_to_incident
    , hd.hd_immediate_actions_taken
    , hd.hd_detailed_incident_desc
    , hd.hd_brief_incident_desc
    , hd.hd_time_of_occurrence
    , hd.hd_unit_number
    , hd.hd_incident_type  
    , case when hi.hi_has_incident_on_job = 'No' then
                -1
        else
                --case when regexp_like (hd.hd_severity_matrix_id, '[[:digit:]]') then
                --    to_number (hd.hd_severity_matrix_id)
                CAST(IsNull(hd.hd_severity_matrix_id, '-99') AS int)
        end                                                 as hd_severity_matrix_id 
    , IsNull (hd.hd_severity_matrix_desc, 'No Incident')    as hd_severity_matrix_desc            
    , IsNull (hd.hd_severity_matrix_full, 'No Incident')    as hd_severity_matrix_full 
    , hd.hd_performance_metric
   	, h.comments_general
from 
    eservice6.dbo.jobs j
    inner join eservice6.dbo.service_tickets st           on j.job_number = st.service_ticket_number and j.unique_id = st.unique_id
    inner join eservice6.dbo.service_report_headers h     on j.job_number = h.job_number and j.unique_id = h.unique_id
    inner join eservice6.dbo.stkt_chrg_mthd_dsct_sctns cm on st.id = cm.parent_id and cm.is_main_service_line_name = 'Yes' 
    inner join eservice6.dbo.jb_company_info_sctns c      on j.id = c.root_id and c.is_client = 1       
    inner join eservice6.dbo.sanjel_districts sd          on j.jt_district_id = sd.id
    inner join eservice6.dbo.service_points sp            on j.jt_service_point_id = sp.id
    inner join
    (
        select r.id                             as hi_id
            , r.root_id                        as hi_root_id  
            , r.has_incident_on_job_type_name  as hi_has_incident_on_job
            , r.comment_for_incident_on_job    as hi_comment_for_incident
            , r.has_delay_by_cust_type_name    as hi_has_delay_by_cust
            , r.num_of_delay_hours_by_customer as hi_num_delay_hours_by_cust
            , r.comment_for_delay_by_customer  as hi_comment_for_delay_by_cust
        from eservice6.dbo.rpt_hse_information_sctns r
    ) hi /* hse info */ on h.id = hi.hi_root_id
    left outer join
    (
    select x.parent_id                     as hd_parent_id
            , x.nonproductivetime             as hd_nonproductive_time_mins
            , x.client_reaction_advice_notify as hd_client_reaction_advice 
            , x.events_leading_upto_incident  as hd_events_leading_to_incident
            , x.immediate_actions_taken       as hd_immediate_actions_taken
            , x.detailed_incident_description as hd_detailed_incident_desc
            , x.brief_incident_description    as hd_brief_incident_desc
            , x.timeofoccurance               as hd_time_of_occurrence
            , x.truck_unit_number             as hd_unit_number
            , x.hse_incident_type_name        as hd_incident_type
            , substring (x.hse_severity_matrix_type_name, 1, 1) as hd_severity_matrix_id
            , rtrim(ltrim (substring (x.hse_severity_matrix_type_name, 5, len (x.hse_severity_matrix_type_name)))) as hd_severity_matrix_desc              
            , x.hse_severity_matrix_type_name as hd_severity_matrix_full 
            , x.hse_perform_metric_type_name  as hd_performance_metric
        from eservice6.dbo.rpt_hse_incident_dtl_sctns x
    ) hd /* hse details */ on hi.hi_id = hd.hd_parent_id
;

GO
/****** Object:  View [dbo].[V_SCM_PLC_LOG_Azure]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[V_SCM_PLC_LOG_Azure]
AS 

select * FROM [SANJELVM01.DATABASE.WINDOWS.NET].[TestDB].[dbo].[SCM_PLC_LOG]


GO
/****** Object:  View [dbo].[V_SCM_PLC_PROCESSED_JOBS_Azure]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[V_SCM_PLC_PROCESSED_JOBS_Azure]
AS 

select *
FROM [SANJELVM01.DATABASE.WINDOWS.NET].[TestDB].[dbo].[SCM_PLC_PROCESSED_JOBS]


GO
/****** Object:  View [dbo].[VEHICLE_SUB_TYPES]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VEHICLE_SUB_TYPES] AS 
    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
        from SYN_SD_UnitSubType
    )
    select
        id                          ID,
        UnitMainTypeid              VEHICLE_TYPE_ID,
        name                        VEHICLE_SUB_TYPE_NAME,
        version                     VERSION,
        CAST(modified_user_id as int)   LAST_MODIFIED_USER_ID,
        modified_user_name          LAST_MODIFIED_USER_NAME,
        modified_datetime           LAST_MODIFIED_DATE_TIME,
        operation_type              LAST_OPERATION_TYPE,
        effective_start_datetime    EFFECTIVE_START_DATE_TIME,
        effective_end_datetime      EFFECTIVE_END_DATE_TIME
    from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[VEHICLE_TYPES]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VEHICLE_TYPES] AS 
    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
        from SYN_SD_UnitMainType
    )
    select
        id                          ID,
        description                 DESCRIPTION, 
        version                     VERSION,
        CAST(modified_user_id as int)   LAST_MODIFIED_USER_ID,
        modified_user_name          LAST_MODIFIED_USER_NAME,
        modified_datetime           LAST_MODIFIED_DATE_TIME,
        operation_type              LAST_OPERATION_TYPE,
        effective_start_datetime    EFFECTIVE_START_DATE_TIME,
        effective_end_datetime      EFFECTIVE_END_DATE_TIME
    from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[WorkType]    Script Date: 2/22/2023 5:42:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[WorkType] AS 
    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
        from SYN_SD_WorkType
    )
    select
        id                          ID,
        description                 DESCRIPTION,
        version                     VERSION,
        CAST(modified_user_id as int)   LAST_MODIFIED_USER_ID,
        modified_user_name          LAST_MODIFIED_USER_NAME,
        modified_datetime           LAST_MODIFIED_DATE_TIME,
        operation_type              LAST_OPERATION_TYPE,
        effective_start_datetime    EFFECTIVE_START_DATE_TIME,
        effective_end_datetime      EFFECTIVE_END_DATE_TIME,
        name                        NAME
    from orderedRecords where rowNum = 1;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SCM_PLC_LOG_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SCM_PLC_LOG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SCM_PLC_LOG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TYPE_VALUES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TYPE_VALUES'
GO
