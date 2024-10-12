--SanjelCompany - eservice6.dbo.SANJEL_COMPANIES
EXEC sp_rename 'dbo.SANJEL_COMPANIES', 'SANJEL_COMPANIES_ConvertedToView';
GO
CREATE VIEW [dbo].[SANJEL_COMPANIES] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from SanjelData.dbo.SanjelCompany
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


--ServicePoint - eservice6.dbo.SERVICE_POINTS
EXEC sp_rename 'dbo.SERVICE_POINTS', 'SERVICE_POINTS_ConvertedToView';
GO
CREATE VIEW [dbo].[SERVICE_POINTS] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from SanjelData.dbo.ServicePoint
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

--BonusPosition - eservice6.dbo.BONUS_POSITIONS
EXEC sp_rename 'dbo.BONUS_POSITIONS', 'BONUS_POSITIONS_ConvertedToView';
GO
CREATE VIEW [dbo].[BONUS_POSITIONS] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from SanjelData.dbo.BonusPosition
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

--JobType - eservice6.dbo.JOB_TYPES
EXEC sp_rename 'dbo.JOB_TYPES', 'JOB_TYPES_ConvertedToView';
GO
CREATE VIEW [dbo].[JOB_TYPES] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from SanjelData.dbo.JobType
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

--Bin - eservice6.dbo.BINS
EXEC sp_rename 'dbo.BINS', 'BINS_ConvertedToView';
GO
CREATE VIEW [dbo].[BINS] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from SanjelData.dbo.Bin
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

--Country - eservice6.dbo.COUNTRIES
EXEC sp_rename 'dbo.COUNTRIES', 'COUNTRIES_ConvertedToView';
GO
CREATE VIEW [dbo].[COUNTRIES] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from SanjelData.dbo.Country
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

--ProvinceOrState - eservice6.dbo.PROVINCE_STATES
EXEC sp_rename 'dbo.PROVINCE_STATES', 'PROVINCE_STATES_ConvertedToView';
GO
CREATE VIEW [dbo].[PROVINCE_STATES] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from SanjelData.dbo.ProvinceOrState
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

--BinType - eservice6.dbo.BIN_TYPES
EXEC sp_rename 'dbo.BIN_TYPES', 'BIN_TYPES_ConvertedToView';
GO
CREATE VIEW [dbo].[BIN_TYPES] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from SanjelData.dbo.BinType
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

--UnitMainType - eservice6.dbo.VEHICLE_TYPES
EXEC sp_rename 'dbo.VEHICLE_TYPES', 'VEHICLE_TYPES_ConvertedToView';
GO
CREATE VIEW [dbo].[VEHICLE_TYPES] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from SanjelData.dbo.UnitMainType
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

--UnitSubtype - eservice6.dbo.VEHICLE_SUB_TYPES
EXEC sp_rename 'dbo.VEHICLE_SUB_TYPES', 'VEHICLE_SUB_TYPES_ConvertedToView';
GO
CREATE VIEW [dbo].[VEHICLE_SUB_TYPES] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from SanjelData.dbo.UnitSubType
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

--TruckUnit - eservice6.dbo.TRUCK_UNITS
EXEC sp_rename 'dbo.TRUCK_UNITS', 'TRUCK_UNITS_ConvertedToView';
GO
CREATE VIEW [dbo].[TRUCK_UNITS] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from SanjelData.dbo.TruckUnit
	)
	select
		id							ID,
		UnitNumber					UNIT_NUMBER,		
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


--ContractorCompany - eservice6.dbo.CONTRACTOR_COMPANIES
EXEC sp_rename 'dbo.CONTRACTOR_COMPANIES', 'CONTRACTOR_COMPANIES_ConvertedToView';
GO
CREATE VIEW [dbo].[CONTRACTOR_COMPANIES] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * 
		from SanjelData.dbo.ContractorCompany
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

--ClientConsultant - eservice6.dbo.CLIENT_CONSULTANTS
EXEC sp_rename 'dbo.CLIENT_CONSULTANTS', 'CLIENT_CONSULTANTS_ConvertedToView';
GO
CREATE VIEW [dbo].[CLIENT_CONSULTANTS] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * 
		from SanjelData.dbo.ClientConsultant
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

--Rig - eservice6.dbo.RIGS
EXEC sp_rename 'dbo.RIGS', 'RIGS_ConvertedToView';
GO
CREATE VIEW [dbo].[RIGS] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from SanjelData.dbo.Rig
	)
	select
		id							ID,
		name						NAME,
		RigNumber					RIG_NO,
		DrillingCompanyid			DRILLINGCOMPANY_ID,
		DrillingCompanyName			DRILLINGCOMPANY_NAME,
		StatusId					STATUS,				
		IsServiceRig				IS_SERVICE_RIG,
		IsDeleted					IS_DELETED,
		IsTopDrive					IS_TOP_DRIVE,
		cast(SizeName as float)		SIZE_TYPE_VALUE,	
		NULL						SIZE_TYPE_UNIT,		
		RigSizeid					RIG_SIZE_TYPE_ID,
		RigSizeName					RIG_SIZE_TYPE_NAME,
		ThreadTypeid				THREAD_TYPE_ID,
		ThreadTypeName				THREAD_TYPE_NAME,	--?? does not match for some recs 
		version						VERSION,
		CAST(modified_user_id as int)	LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME,
		IsProjectRig				IS_PROJECT_RIG
	from orderedRecords where rowNum = 1;
GO

--DrillingCompany - eservice6.dbo.COMPANIES – Code change is needed to load up Drilling Companies
EXEC sp_rename 'dbo.COMPANIES', 'COMPANIES_ConvertedToView';
GO
CREATE VIEW [dbo].[DrillingCompanies] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from SanjelData.dbo.DrillingCompany
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






/**************************** Not ready yet ***********************/ 


--Serviceline - eservice6.dbo.SERVICE_LINES
EXEC sp_rename 'dbo.SERVICE_LINES', 'SERVICE_LINES_ConvertedToView';
GO
CREATE VIEW [dbo].[SERVICE_LINES] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from SanjelData.dbo.ServiceLine
	)
	select
		id							ID,
		description					DESCRIPTION,
		name						NAME,
		NULL							IS_BILLING_SERVICELINE,	--??? not NULL in eService
		NULL							IS_LEAD_SERVICELINE,	--??? not NULL in eService
		NULL							SERVICELINE_TYPE,		--??? not NULL in eService
		NULL							PARENT_ID,				--??? not NULL in eService
		version						VERSION,
		CAST(modified_user_id as int)	LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME
	from orderedRecords where rowNum = 1;
GO

--ClientCompany - eservice6.dbo.COMPANIES – Code Change is needed to eliminate company type
EXEC sp_rename 'dbo.COMPANIES', 'COMPANIES_ConvertedToView';
GO
CREATE VIEW [dbo].[COMPANIES] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from SanjelData.dbo.ClientCompany
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

--Employee - eservice6.dbo.EMPLOYEES
EXEC sp_rename 'dbo.EMPLOYEES', 'EMPLOYEES_ConvertedToView';
GO
CREATE VIEW [dbo].[EMPLOYEES] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from SanjelData.dbo.Employee
	)
	select
		Id							ID,
		FirstName					FIRST_NAME,
		MiddleName					MIDDLE_NAME,
		LastName					LAST_NAME,
		NULL							WORK_PHONE,					--???
		NULL							WORK_FAX,					--???
		NULL							DIRECT_PHONE,				--???
		NULL							DIRECT_FAX,					--???
		NULL							HOME_PHONE,					--???
		NULL							HOME_FAX,					--???
		NULL							CELL,						--???
		NULL							PAGER,						--???
		NULL							EMAIL,						--???
		NULL							PERCENT_EARN,				--???
		ServicePointid				DISTRICT_ID,
		ServiceLineid				SERVICE_LINE_ID,
		BonusPositionid				DEFAULT_BONUS_POSITION_ID,
		NULL							STATUS,						--???
		CAST(modified_user_id as int)	LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME
		version						VERSION,
		PreferedFirstName			PREFER_FIRST_NAME,
		EmployeeNumber				EMPLOYEE_NUMBER
	from orderedRecords where rowNum = 1;
GO






/*
 
New

•	DrillingCompany - eservice6.dbo.SANJEL_COMPANIES – Code change is needed to load up Drilling Companies

Table to View

•	SanjelCompany - eservice6.dbo.SANJEL_COMPANIES
•	ServicePoint - eservice6.dbo.SERVICE_POINTS
•	BonusPosition - eservice6.dbo.BONUS_POSITIONS
•	JobType - eservice6.dbo.JOB_TYPES
•	Bin - eservice6.dbo.BINS
•	Country - eservice6.dbo.COUNTRIES
•	ProvinceOrState - eservice6.dbo.PROVINCE_STATES
•	BinType - eservice6.dbo.BIN_TYPES
•	UnitMainType - eservice6.dbo.VEHICLE_TYPES
•	UnitSubtype - eservice6.dbo.VEHICLE_SUB_TYPES
•	Rig - eservice6.dbo.RIGS
•	ClientConsultant - eservice6.dbo.CLIENT_CONSULTANTS
•	TruckUnit - eservice6.dbo.TRUCK_UNITS
•	Serviceline - eservice6.dbo.SERVICE_LINES
•	ClientCompany - eservice6.dbo.SANJEL_COMPANIES – Code Change is needed to eliminate company type
•	Employee - eservice6.dbo.EMPLOYEES
•	ContractorCompany - eservice6.dbo.CONTRACTOR_COMPANIES


Common Types not map for now

•	RigSizeType - 
•	RigSize - 
•	ShiftType - 

Enum Tupes Not map for now

•	WellLocationType -  
•	MeasureUnitType - 
•	MeasureUnitSystem - 
  
*/ 
