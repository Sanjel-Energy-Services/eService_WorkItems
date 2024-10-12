USE [eservice6]
GO
/****** Object:  View [dbo].[SERVICE_POINTS]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SERVICE_POINTS]') AND type in (N'U'))
DROP TABLE [dbo].[SERVICE_POINTS]
GO
CREATE VIEW [dbo].[SERVICE_POINTS] AS 

	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from dbo.SYN_SD_ServicePoint
	)
	select
		id							ID,
		name						NAME,
		version						VERSION,
		CAST(modified_user_id as int)	LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME
	from orderedRecords where rowNum = 1;
GO

/****** Object:  View [dbo].[BIN_TYPES]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BIN_TYPES]') AND type in (N'U'))
DROP TABLE [dbo].[BIN_TYPES]
GO
CREATE VIEW [dbo].[BIN_TYPES] AS 

	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from dbo.SYN_SD_BinType
	)
	select
		id							ID,
		description					DESCRIPTION,
		version						VERSION,
		CAST(modified_user_id as int)	LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME
	from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[BINS]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BINS]') AND type in (N'U'))
DROP TABLE [dbo].[BINS]
GO
CREATE VIEW [dbo].[BINS] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from dbo.SYN_SD_Bin
	)
	select
		id							ID,
		name						BIN_NUMBER,
		NULL						CAPACITY,		
		description					DESCRIPTION,
		HomeServicePointid			DISTRICT_ID, 	
		NULL						ACQUIRED_DATE,	
		'A'							STATUS, 		
		BinTypeid					BIN_TYPE_ID,
		version						VERSION,
		CAST(modified_user_id as int)	LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME
	from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[BLEND_CHEMICALS]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BLEND_CHEMICALS]') AND type in (N'U'))
DROP TABLE [dbo].[BLEND_CHEMICALS]
GO
CREATE VIEW [dbo].[BLEND_CHEMICALS] AS 

	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from dbo.SYN_SD_BlendChemical
		where effective_end_datetime > getdate()
	)
	select 	
		id							ID,
		name						NAME,
		description					DESCRIPTION,
		ProductId					PRODUCT_ID,
		ProductName					PRODUCT_NAME,
		BlendRecipeId				BLEND_RECIPE_ID,
		BlendRecipeName				BLEND_RECIPE_NAME,
		IsBaseEligible				IS_BASE_BLEND_ELIGIBLE,
		BaseBlendTypeId				BLEND_FLUID_TYPE_ID,
		BaseBlendTypeName			BLEND_FLUID_TYPE_NAME,
		IsAdditiveEligible			IS_ADDITIVE_ELIGIBLE,
		AdditiveTypeId				ADDITIVE_TYPE_ID,
		AdditiveTypeName			ADDITIVE_TYPE_NAME,
		SpecificGravity				SPECIFIC_GRAVITY,
		MixWater					MIX_WATER,
		Yield						YIELD,
		Density						DENSITY,
		IsThixotropic				IS_THIXOTROPIC,
		BagSize						BAGSIZE,
		AERCode						AERCODE,
		version						VERSION,
		modified_user_id			LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME,
		BlendPrimaryCategoryId		BLEND_PRI_CAT_ID,
		BlendPrimaryCategoryName	BLEND_PRI_CAT_NAME
	from orderedRecords where rowNum = 1
GO
/****** Object:  View [dbo].[BLEND_RECIPE]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BLEND_RECIPE]') AND type in (N'U'))
DROP TABLE [dbo].[BLEND_RECIPE]
GO
CREATE VIEW [dbo].[BLEND_RECIPE] AS 

	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from dbo.SYN_SD_BlendRecipe
	)
	select 	
		id							ID,
		name						NAME,
		version						VERSION,
		modified_user_id			LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME
	from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[BLEND_RECIPE_CHEMICAL_ITEMS]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BLEND_RECIPE_CHEMICAL_ITEMS]') AND type in (N'U'))
DROP TABLE [dbo].[BLEND_RECIPE_CHEMICAL_ITEMS]
GO
CREATE VIEW [dbo].[BLEND_RECIPE_CHEMICAL_ITEMS] AS 

	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from dbo.SYN_SD_BlendChemicalSection
		where effective_end_datetime > getdate()
	)
	select 	
		id							ID,
		owner_id					ROOT_ID,
		owner_id					PARENT_ID,
		BlendChemicalId				BLEND_CHEMICAL_ID,
		Amount						AMOUNT,
		IsBaseBlend					IS_BASE_BLEND,
		AdditionMethodId			ADDITION_METHOD,
		AdditiveBlendMethodId		ADDITIVE_BLEND_METHOD,
		UnitName					UNIT_NAME,
		case 
			when UnitName = 'Percent' then '%'
			when UnitName = 'Cubic Meters' then 'm3'
			else ''
		end 						UNIT_ABBR,
		version						VERSION,
		modified_user_id			LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME,
		BlendChemicalName			BLEND_CHEMICAL_NAME
	from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[BONUS_POSITIONS]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BONUS_POSITIONS]') AND type in (N'U'))
DROP TABLE [dbo].[BONUS_POSITIONS]
GO
CREATE VIEW [dbo].[BONUS_POSITIONS] AS 

	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from dbo.SYN_SD_BonusPosition
	)
	select
		id							ID,
		description					DESCRIPTION,
		ServiceLineid				SERVICE_LINE_ID,
		version						VERSION,
		CAST(modified_user_id as int)	LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME
	from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[CLIENT_CONSULTANTS]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CLIENT_CONSULTANTS]') AND type in (N'U'))
DROP TABLE [dbo].[CLIENT_CONSULTANTS]
GO
CREATE VIEW [dbo].[CLIENT_CONSULTANTS] AS 

	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * 
		from dbo.SYN_SD_ClientConsultant
	)
	select
		id							ID,
		name						NAME,
		Cell						CELL,
		Phone2						PHONE2,
		Email						EMAIL,
		Clientid					CLIENT_ID,
		CAST(modified_user_id as int)	LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME,
		version						VERSION,
		WorkShiftid					WORK_SHIFT_TYPE_ID,
		WorkShiftName				WORK_SHIFT_TYPE_NAME
	from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[COMPANIES]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[COMPANIES]') AND type in (N'U'))
DROP TABLE [dbo].[COMPANIES]
GO
CREATE VIEW [dbo].[COMPANIES] AS 

	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from dbo.SYN_SD_ClientCompany
	)
	select
		id								ID,
		name							NAME,
		AddressStreet					ADDRESS_STREET,
		AddressStreet2					ADDRESS_STREET2,
		AddressStreet3					ADDRESS_STREET3,
		AddressStreet4					ADDRESS_STREET4,
		AddressCity						ADDRESS_CITY,
		AddressPostalCode				ADDRESS_POSTAL_ZIP,
		AddressProvinceOrStateid		ADDRESS_PROV_STATE_ID,
		BillingAddressStreet			BILLING_ADDRESS_STREET,
		BillingAddressStreet2			BILLING_ADDRESS_STREET2,
		BillingAddressStreet3			BILLING_ADDRESS_STREET3,
		BillingAddressStreet4			BILLING_ADDRESS_STREET4,
		BillingAddressCity				BILLING_ADDRESS_CITY,
		BillingAddressPostalCode		BILLING_ADDRESS_POSTAL_ZIP,
		BillingAddressProvinceOrStateid	BILLING_ADDRESS_PROV_STATE_ID,
		NULL								RIG_PREFIX,						--??? not always NULL in eService 
		version							VERSION,
		CAST(modified_user_id as int)	LAST_MODIFIED_USER_ID,
		modified_user_name				LAST_MODIFIED_USER_NAME,
		modified_datetime				LAST_MODIFIED_DATE_TIME,
		operation_type					LAST_OPERATION_TYPE,
		effective_start_datetime		EFFECTIVE_START_DATE_TIME,
		effective_end_datetime			EFFECTIVE_END_DATE_TIME,
		IsCODCustomer					IS_COD_CUSTOMER,
		SanjelCompanyid					SANJEL_COMPANY_ID,
		ShortName						SHORT_NAME
	from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[COMPANIES_WITH_TYPES]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[COMPANIES_WITH_TYPES]') AND type in (N'U'))
DROP TABLE [dbo].[COMPANIES_WITH_TYPES]
GO
CREATE VIEW [dbo].[COMPANIES_WITH_TYPES] AS 

	select distinct
		id COMPANY_ID
		,1 TYPE_ID
		,1 VERSION
	from dbo.SYN_SD_ClientCompany
	union
	select distinct
		id COMPANY_ID
		,2 TYPE_ID
		,1 VERSION
	from dbo.SYN_SD_ClientCompany
;
GO
/****** Object:  View [dbo].[CONTRACTOR_COMPANIES]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CONTRACTOR_COMPANIES]') AND type in (N'U'))
DROP TABLE [dbo].[CONTRACTOR_COMPANIES]
GO

CREATE VIEW [dbo].[CONTRACTOR_COMPANIES] AS 

	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * 
		from dbo.SYN_SD_ContractorCompany
	)
	select
		Id							ID,
		name						NAME,
		version						VERSION,
		CAST(modified_user_id as int)	LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME
	from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[COUNTRIES]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[COUNTRIES]') AND type in (N'U'))
DROP TABLE [dbo].[COUNTRIES]
GO
CREATE VIEW [dbo].[COUNTRIES] AS 

	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from dbo.SYN_SD_Country
	)
	select
		id							ID,
		ISOAlpha2					ISO,
		name						NAME,
		ISOAlpha3					ISO3,
		ISONumber					NUMCODE,
		PercentFuelSurcharge		SURCHARGE_PERCENT,	
		CAST(modified_user_id as int)	LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME,
		1							IS_IN_SERVICE,				--??? 1/0 in eService
		version						VERSION,
		0							HAS_COUNTY					--??? 1/0 in eService
	from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[DrillingCompanies]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DrillingCompanies]') AND type in (N'U'))
DROP TABLE [dbo].[DrillingCompanies]
GO
CREATE VIEW [dbo].[DrillingCompanies] AS 

	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from dbo.SYN_SD_DrillingCompany
	)
	select
		id								ID,
		name							NAME,
		AddressStreet					ADDRESS_STREET,
		AddressStreet2					ADDRESS_STREET2,
		AddressStreet3					ADDRESS_STREET3,
		AddressStreet4					ADDRESS_STREET4,
		AddressCity						ADDRESS_CITY,
		AddressPostalCode				ADDRESS_POSTAL_ZIP,
		AddressProvinceOrStateid		ADDRESS_PROV_STATE_ID,
		BillingAddressStreet			BILLING_ADDRESS_STREET,
		BillingAddressStreet2			BILLING_ADDRESS_STREET2,
		BillingAddressStreet3			BILLING_ADDRESS_STREET3,
		BillingAddressStreet4			BILLING_ADDRESS_STREET4,
		BillingAddressCity				BILLING_ADDRESS_CITY,
		BillingAddressPostalCode		BILLING_ADDRESS_POSTAL_ZIP,
		BillingAddressProvinceOrStateid	BILLING_ADDRESS_PROV_STATE_ID,
		NULL								RIG_PREFIX,						--??? not always NULL in eService
		version							VERSION,
		CAST(modified_user_id as int)	LAST_MODIFIED_USER_ID,
		modified_user_name				LAST_MODIFIED_USER_NAME,
		modified_datetime				LAST_MODIFIED_DATE_TIME,
		operation_type					LAST_OPERATION_TYPE,
		effective_start_datetime		EFFECTIVE_START_DATE_TIME,
		effective_end_datetime			EFFECTIVE_END_DATE_TIME,
		IsCODCustomer					IS_COD_CUSTOMER,
		SanjelCompanyid					SANJEL_COMPANY_ID,
		ShortName						SHORT_NAME
	from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[EMPLOYEES]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPLOYEES]') AND type in (N'U'))
DROP TABLE [dbo].[EMPLOYEES]
GO

CREATE VIEW [dbo].[EMPLOYEES] AS 

    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By EmployeeNumber ORDER BY Version desc) as rowNum, *
        from dbo.SYN_SD_Employee
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
        --,	a.WorkEmail                EMAIL
        ,r.WorkEmail				EMAIL
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
        --left join SYN_MD_EmployeesToEService a on a.EmployeeNumber = r.EmployeeNumber
        --left join dbo.EMPLOYEES_ConvertedToView e on e.EMPLOYEE_NUMBER = r.EmployeeNumber
    where rowNum = 1
;


GO
/****** Object:  View [dbo].[JOB_TYPES]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JOB_TYPES]') AND type in (N'U'))
DROP TABLE [dbo].[JOB_TYPES]
GO
CREATE VIEW [dbo].[JOB_TYPES] AS 

	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from dbo.SYN_SD_JobType
	)
	select
		id							ID,
		description					DESCRIPTION,
		ServiceLineid				SERVICE_LINE_ID,
		case when getdate() between effective_start_datetime and effective_end_datetime then 'A' else 'T' end STATUS,			--???
		version						VERSION,
		CAST(modified_user_id as int)	LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME,
		name						NAME
	from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[JobRole]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JobRole]') AND type in (N'U'))
DROP TABLE [dbo].[JobRole]
GO

CREATE VIEW [dbo].[JobRole] AS 

	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from dbo.SYN_SD_JobRole
	)
	select
		id							ID,
		description					DESCRIPTION,
		version						VERSION,
		CAST(modified_user_id as int)	LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME,
		name						NAME
	from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[PRODUCTS]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PRODUCTS]') AND type in (N'U'))
DROP TABLE [dbo].[PRODUCTS]
GO
CREATE VIEW [dbo].[PRODUCTS] AS 

	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from dbo.SYN_SD_Product
	)
	select 	
		id							ID,
		name						NAME,
		description					DESCRIPTION,
		InventoryNumber				INVENTORY_NUMBER,
		PriceCode					PRICE_CODE,
		version						VERSION,
		modified_user_id			LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME
	from orderedRecords where rowNum = 1
GO
/****** Object:  View [dbo].[PROVINCE_STATES]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PROVINCE_STATES]') AND type in (N'U'))
DROP TABLE [dbo].[PROVINCE_STATES]
GO
CREATE VIEW [dbo].[PROVINCE_STATES] AS 

	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from dbo.SYN_SD_ProvinceOrState
	)
	select
		id							ID,
		Code						CODE,
		name						NAME,
		Countryid					COUNTRY_ID,
		Capital						CAPITAL,
		PercentSalesSurcharge		SURCHARGE_PERCENT,
		version						VERSION,
		CAST(modified_user_id as int)	LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME
	from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[RIGS]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RIGS]') AND type in (N'U'))
DROP TABLE [dbo].[RIGS]
GO
CREATE VIEW [dbo].[RIGS] AS 

	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from dbo.SYN_SD_Rig
	)
	select
		id							ID,
		name						NAME,
		RigNumber					RIG_NO,
		DrillingCompanyid			DRILLINGCOMPANY_ID,
		DrillingCompanyName			DRILLINGCOMPANY_NAME,
		Status						STATUS,				
		IsServiceRig				IS_SERVICE_RIG,
		IsDeleted					IS_DELETED,
		IsTopDrive					IS_TOP_DRIVE,
		cast(SizeName as float)		SIZE_TYPE_VALUE,	
		NULL						SIZE_TYPE_UNIT,		
		RigSizeid					RIG_SIZE_TYPE_ID,
		RigSizeName					RIG_SIZE_TYPE_NAME,
		ThreadTypeid				THREAD_TYPE_ID,
		ThreadTypeName				THREAD_TYPE_NAME,	--?? does not match for some recs 
		--version						VERSION,
		version + iif (IsNull(IsDeleted, 0) <> 0, 1, 0) VERSION, 
		CAST(modified_user_id as int)	LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		--modified_datetime			LAST_MODIFIED_DATE_TIME,
        iif(IsNull(IsDeleted, 0) <> 0, '2022-08-04 14:30:00', modified_datetime) LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		--effective_start_datetime	EFFECTIVE_START_DATE_TIME,
        iif(IsNull(IsDeleted, 0) <> 0, '2022-08-04 14:30:00', effective_start_datetime) EFFECTIVE_START_DATE_TIME,
		--effective_end_datetime		EFFECTIVE_END_DATE_TIME,
        iif(IsNull(IsDeleted, 0) <> 0, '2022-08-04 14:30:00', effective_end_datetime) EFFECTIVE_END_DATE_TIME,
		IsProjectRig				IS_PROJECT_RIG
	from orderedRecords 
	where 
		OperationSiteType=1 
		and rowNum = 1
		--and id in (2170, 2171, 2172)
		;
GO
/****** Object:  View [dbo].[SANJEL_COMPANIES]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SANJEL_COMPANIES]') AND type in (N'U'))
DROP TABLE [dbo].[SANJEL_COMPANIES]
GO
CREATE VIEW [dbo].[SANJEL_COMPANIES] AS 

	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from dbo.SYN_SD_SanjelCompany
	)
	select
		id							ID,
		name						NAME,
		Countryid					COUNTRY_ID,
		version						VERSION,
		CAST(modified_user_id as int)	LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME
	from orderedRecords where rowNum = 1;
GO


/****** Object:  View [dbo].[TRUCK_UNITS]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TRUCK_UNITS]') AND type in (N'U'))
DROP TABLE [dbo].[TRUCK_UNITS]
GO
CREATE VIEW [dbo].[TRUCK_UNITS] AS 

	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from dbo.SYN_SD_TruckUnit
	)
	select
		id							ID,
		left(UnitNumber, 8)					UNIT_NUMBER,		
		ServicePointid				DISTRICT_ID,		 
		Id							VEHICLE_ID,			
		NULL						TRUCK_UNIT_TYPE_ID,	
		version						VERSION,
		CAST(modified_user_id as int)	LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME,
		UnitMainTypeid				UNIT_MAIN_TYPE_ID,
		UnitSubTypeid				UNIT_SUB_TYPE_ID
	from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[TYPE_VALUES]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




-- This view does the following :
-- 1. Pulls BlendFluidType (TYPE_ID=5) and AdditiveType (TYPE_ID=4) data from MDM database
-- 2, Identifies BlendFluidType and AdditiveType old records that are in eService table (dbo.TYPE_VALUES originally, renamed to TYPE_VALUES_ConvertedToView) but not in MD
-- 3. Union all records from steps 1 & 2 and, also, all other (not BlendFluidType or AdditiveType) records from TYPE_VALUES_ConvertedToView
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TYPE_VALUES]') AND type in (N'U'))
DROP TABLE [dbo].[TYPE_VALUES]
GO
CREATE VIEW [dbo].[TYPE_VALUES]
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

/****** Object:  View [dbo].[VEHICLE_SUB_TYPES]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VEHICLE_SUB_TYPES]') AND type in (N'U'))
DROP TABLE [dbo].[VEHICLE_SUB_TYPES]
GO
CREATE VIEW [dbo].[VEHICLE_SUB_TYPES] AS 

	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from dbo.SYN_SD_UnitSubType
	)
	select
		id							ID,
		UnitMainTypeid				VEHICLE_TYPE_ID,
		name						VEHICLE_SUB_TYPE_NAME,
		version						VERSION,
		CAST(modified_user_id as int)	LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME
	from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[VEHICLE_TYPES]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VEHICLE_TYPES]') AND type in (N'U'))
DROP TABLE [dbo].[VEHICLE_TYPES]
GO
CREATE VIEW [dbo].[VEHICLE_TYPES] AS 

	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from dbo.SYN_SD_UnitMainType
	)
	select
		id							ID,
		description					DESCRIPTION, 
		version						VERSION,
		CAST(modified_user_id as int)	LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME
	from orderedRecords where rowNum = 1;
GO
/****** Object:  View [dbo].[WorkType]    Script Date: 5/23/2023 10:23:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkType]') AND type in (N'U'))
DROP TABLE [dbo].[WorkType]
GO
CREATE VIEW [dbo].[WorkType] AS 

	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from dbo.SYN_SD_WorkType
	)
	select
		id							ID,
		description					DESCRIPTION,
		version						VERSION,
		CAST(modified_user_id as int)	LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME,
		name						NAME
	from orderedRecords where rowNum = 1;
GO
