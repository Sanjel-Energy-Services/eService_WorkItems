
-- 2019/05/13

ALTER TABLE SanjelData.[dbo].[AdditionMethod] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE SanjelData.[dbo].[AdditiveBlendMethod] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE SanjelData.[dbo].[AdditiveType] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE SanjelData.[dbo].[BlendAdditiveMeasureUnit] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE SanjelData.[dbo].[BlendChemical] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE SanjelData.[dbo].[BlendChemicalSection] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE SanjelData.[dbo].[BlendFluidType] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE SanjelData.[dbo].[BlendPrimaryCategory] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE SanjelData.[dbo].[BlendRecipe] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE SanjelData.[dbo].[MeasureUnitSystem] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE SanjelData.[dbo].[MeasureUnitType] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE SanjelData.[dbo].[Product] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE SanjelData.[dbo].[PurchasePrice] ALTER COLUMN [modified_user_id] int ;



CREATE TABLE SanjelData.[dbo].[ProvinceOrState] (
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
[CountryDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[CountryName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Code] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[CountrySystemId] int NULL ,
[Countryid] int NULL ,
[Capital] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[PercentSalesSurcharge] float(53) NULL 
)
;

CREATE TABLE SanjelData.[dbo].[UnitMainType] (
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
 
CREATE TABLE SanjelData.[dbo].[UnitSubType] (
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
[UnitMainTypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[UnitMainTypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[UnitMainTypeSystemId] int NULL ,
[UnitMainTypeid] int NULL 
)
;

CREATE TABLE SanjelData.[dbo].[ServiceLine] (
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

CREATE TABLE SanjelData.[dbo].[ServicePoint] (
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

CREATE TABLE SanjelData.[dbo].[ShiftType] (
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

CREATE TABLE SanjelData.[dbo].[ThreadType] (
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

CREATE TABLE SanjelData.[dbo].[SanjelCompany] (
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
[CountryName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[CountrySystemId] int NULL ,
[Countryid] int NULL ,
[CountryDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;

CREATE TABLE SanjelData.[dbo].[RigSize] (
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
[Value] float(53) NULL ,
[Unitid] int NULL ,
[UnitSystemId] int NULL ,
[UnitName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[UnitDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;

CREATE TABLE SanjelData.[dbo].[RigSizeType] (
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


CREATE TABLE SanjelData.[dbo].[BinType] (
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

CREATE TABLE SanjelData.[dbo].[BlendCategory] (
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

CREATE TABLE SanjelData.[dbo].[BonusPosition] (
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
[ServiceLineName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ServiceLineSystemId] int NULL ,
[ServiceLineDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ServiceLineid] int NULL 
)
;

CREATE TABLE SanjelData.[dbo].[CallSheet] (
[id] int NOT NULL IDENTITY(1,1) ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;

CREATE TABLE SanjelData.[dbo].[ClientCompany] (
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
[BillingAddressProvinceOrStateSystemId] int NULL ,
[BillingAddressPostalCode] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BillingAddressStreet3] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[AddressProvinceOrStateSystemId] int NULL ,
[AddressProvinceOrStateName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[AddressProvinceOrStateid] int NULL ,
[BillingAddressStreet4] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BillingAddressStreet] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SanjelCompanyid] int NULL ,
[SanjelCompanyName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BillingAddressProvinceOrStateDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[AddressStreet4] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[AddressStreet3] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[AddressProvinceOrStateDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BillingAddressStreet2] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[IsCODCustomer] bit NULL ,
[SanjelCompanySystemId] int NULL ,
[ShortName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[AddressStreet] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BillingAddressCity] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BillingAddressProvinceOrStateid] int NULL ,
[AddressCity] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[AddressPostalCode] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BillingAddressProvinceOrStateName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[AddressStreet2] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SanjelCompanyDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;

CREATE TABLE SanjelData.[dbo].[ClientConsultant] (
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
[ClientDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[WorkShiftid] int NULL ,
[Clientid] int NULL ,
[WorkShiftName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ClientSystemId] int NULL ,
[Email] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Cell] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Phone2] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[WorkShiftDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ClientName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[WorkShiftSystemId] int NULL 
)
;

CREATE TABLE SanjelData.[dbo].[ContractorCompany] (
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

CREATE TABLE SanjelData.[dbo].[Country] (
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
[ISOAlpha2] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ISONumber] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[PercentFuelSurcharge] float(53) NULL ,
[ISOAlpha3] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;

CREATE TABLE SanjelData.[dbo].[CrewPosition] (
[id] int NOT NULL IDENTITY(1,1) ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;

CREATE TABLE SanjelData.[dbo].[Bin] (
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
[BinTypeSystemId] int NULL ,
[HomeServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BinTypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BinTypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BinTypeid] int NULL ,
[HomeServicePointid] int NULL ,
[HomeServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[HomeServicePointSystemId] int NULL ,
[WorkingServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[WorkingServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BinStatus] int NULL ,
[WorkingServicePointid] int NULL ,
[WorkingServicePointSystemId] int NULL 
)
;


CREATE TABLE SanjelData.[dbo].[CrewScheduleType] (
[id] int NOT NULL IDENTITY(1,1) ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;

CREATE TABLE SanjelData.[dbo].[CrewType] (
[id] int NOT NULL IDENTITY(1,1) ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;

CREATE TABLE SanjelData.[dbo].[DrillingCompany] (
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
[BillingAddressPostalCode] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BillingAddressProvinceOrStateid] int NULL ,
[AddressCity] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BillingAddressStreet4] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BillingAddressProvinceOrStateName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BillingAddressStreet3] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[AddressPostalCode] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ShortName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BillingAddressStreet] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[AddressStreet2] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SanjelCompanyid] int NULL ,
[AddressStreet] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SanjelCompanySystemId] int NULL ,
[AddressProvinceOrStateName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BillingAddressProvinceOrStateDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[AddressStreet3] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BillingAddressStreet2] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[AddressProvinceOrStateid] int NULL ,
[SanjelCompanyName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SanjelCompanyDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BillingAddressProvinceOrStateSystemId] int NULL ,
[IsCODCustomer] bit NULL ,
[AddressProvinceOrStateDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BillingAddressCity] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[AddressProvinceOrStateSystemId] int NULL ,
[AddressStreet4] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;

CREATE TABLE SanjelData.[dbo].[TruckUnit] (
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
[UnitMainTypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[UnitSubTypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[UnitMainTypeSystemId] int NULL ,
[ServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[UnitSubTypeid] int NULL ,
[ServicePointSystemId] int NULL ,
[UnitMainTypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[UnitNumber] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[UnitMainTypeid] int NULL ,
[UnitSubTypeSystemId] int NULL ,
[ServicePointid] int NULL ,
[UnitSubTypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;

CREATE TABLE SanjelData.[dbo].[TruckUnitNote] (
[version] int NULL ,
[modified_datetime] datetime2(7) NULL ,
[TruckUnitName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[TruckUnitDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[id] int NOT NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[TruckUnitSystemId] int NULL ,
[name] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[TruckUnitid] int NULL ,
[entity_status] int NULL ,
[operation_type] int NULL ,
[modified_user_id] int NULL ,
[modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[owner_id] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[system_id] int NOT NULL IDENTITY(1,1) 
)
;

CREATE TABLE SanjelData.[dbo].[Employee] (
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
[MiddleName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ServicePointid] int NULL ,
[ServiceLineName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ServiceLineid] int NULL ,
[EmployeeNumber] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ServicePointSystemId] int NULL ,
[PreferedFirstName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[FirstName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[LastName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ServiceLineSystemId] int NULL ,
[ServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ServiceLineDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BonusPositionid] int NULL ,
[BonusPositionSystemId] int NULL ,
[BonusPositionName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BonusPositionDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;

CREATE TABLE SanjelData.[dbo].[EmployeeNote] (
[name] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[version] int NULL ,
[id] int NOT NULL ,
[operation_type] int NULL ,
[modified_user_id] int NULL ,
[EmployeeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[EmployeeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[entity_status] int NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Employeeid] int NULL ,
[owner_id] int NULL ,
[EmployeeSystemId] int NULL ,
[modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[effective_start_datetime] datetime2(7) NULL 
)
;

CREATE TABLE SanjelData.[dbo].[EmployeeProfile] (
[EmployeeSystemId] int NULL ,
[owner_id] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[EmployeeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[name] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[EmployeeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[version] int NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[entity_status] int NULL ,
[id] int NOT NULL ,
[modified_user_id] int NULL ,
[modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Employeeid] int NULL 
)
;

CREATE TABLE SanjelData.[dbo].[WellLocationType] (
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

CREATE TABLE SanjelData.[dbo].[JobType] (
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
[ServiceLineDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ServiceLineSystemId] int NULL ,
[ServiceLineid] int NULL ,
[ServiceLineName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;

CREATE TABLE SanjelData.[dbo].[ProductHaul] (
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
[CrewSystemId] int NULL ,
[Crewid] int NULL ,
[IsGoWithCrew] bit NULL ,
[IsThirdParty] bit NULL ,
[ProductHaulLifeStatus] int NULL ,
[TractorUnitName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Comments] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BulkUnitDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[TractorUnitid] int NULL ,
[ThirdPartyUnitNumber] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Driver2SystemId] int NULL ,
[Driver2Name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BulkUnitid] int NULL ,
[DriverDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BulkUnitSystemId] int NULL ,
[CrewName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[TractorUnitSystemId] int NULL ,
[ContractorCompanySystemId] int NULL ,
[Driverid] int NULL ,
[ContractorCompanyDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[DriverSystemId] int NULL ,
[DriverName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SupplierContactName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[TractorUnitDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BulkUnitName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ContractorCompanyName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SupplierContactNumber] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[CrewDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ContractorCompanyid] int NULL ,
[Driver2Description] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Driver2id] int NULL ,
[Scheduleid] int NULL ,
[EstimatedLoadTime] datetime2(7) NULL ,
[EstimatedTravelTime] float(53) NULL ,
[ScheduleSystemId] int NULL ,
[ScheduleName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ScheduleDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;

CREATE TABLE SanjelData.[dbo].[ProductHaulLoad] (
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
[OnLocationTime] datetime2(7) NULL ,
[BlendSectionId] int NULL ,
[JobTypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[JobDate] datetime2(7) NULL ,
[JobTypeSystemId] int NULL ,
[BlendCategorySystemId] int NULL ,
[TotalBlendWeight] float(53) NULL ,
[BlendChemicalName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[JobTypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[CustomerSystemId] int NULL ,
[ServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ProductHaulid] int NULL ,
[BlendCategoryName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[CustomerName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ExpectedOnLocationTime] datetime2(7) NULL ,
[ProductHaulSystemId] int NULL ,
[BlendCategoryid] int NULL ,
[Comments] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BlendChemicalid] int NULL ,
[Binid] int NULL ,
[ServicePointid] int NULL ,
[BlendCategoryDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BinDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[MixWater] float(53) NULL ,
[BlendChemicalDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[CallSheetNumber] int NULL ,
[ServicePointSystemId] int NULL ,
[CustomerDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BlendChemicalSystemId] int NULL ,
[IsTotalBlendTonnage] bit NULL ,
[BinName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[LoadSheetSerialNumber] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ProductHaulLoadLifeStatus] int NULL ,
[WellLocation] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BinSystemId] int NULL ,
[ProductHaulName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[IsGoWithCrew] bit NULL ,
[Customerid] int NULL ,
[ProductHaulDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BaseBlendWeight] float(53) NULL ,
[JobTypeid] int NULL 
)
;

CREATE TABLE SanjelData.[dbo].[ProductLoadSection] (
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
[ProductHaulLoadid] int NULL ,
[IsFromBase] bit NULL ,
[BlendChemicalName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BlendAdditiveMeasureUnitName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ProductHaulLoadName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BlendChemicalid] int NULL ,
[RequiredAmount] float(53) NULL ,
[BlendAdditiveMeasureUnitDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ProductHaulLoadSystemId] int NULL ,
[BlendAdditiveMeasureUnitid] int NULL ,
[AdditiveBlendMethodName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[NumberOfBags] float(53) NULL ,
[BagSize] float(53) NULL ,
[BlendChemicalSystemId] int NULL ,
[AdditiveBlendMethodid] int NULL ,
[BlendChemicalDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ProductHaulLoadDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[AdditiveBlendMethodDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[LoadedAmount] float(53) NULL ,
[AdditiveBlendMethodSystemId] int NULL ,
[BlendAdditiveMeasureUnitSystemId] int NULL 
)
;

CREATE TABLE SanjelData.[dbo].[Rig] (
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
[IsTopDrive] bit NULL ,
[ThreadTypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ThreadTypeSystemId] int NULL ,
[Sizeid] int NULL ,
[DrillingCompanyid] int NULL ,
[SizeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SizeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[RigSizeSystemId] int NULL ,
[ThreadTypeid] int NULL ,
[DrillingCompanyName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[RigNumber] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[RigSizeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[DrillingCompanySystemId] int NULL ,
[IsServiceRig] bit NULL ,
[SizeSystemId] int NULL ,
[Status] int NULL ,
[IsProjectRig] bit NULL ,
[RigSizeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[DrillingCompanyDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ThreadTypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[RigSizeid] int NULL ,
[IsDeleted] bit NULL 
)
;

CREATE TABLE SanjelData.[dbo].[RigBinSection] (
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
[RigName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BinSystemId] int NULL ,
[BinName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Binid] int NULL ,
[BinDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[RigDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Rigid] int NULL ,
[RigSystemId] int NULL 
)
;

CREATE TABLE SanjelData.[dbo].[RigJob] (
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
[WellLocation] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ClientConsultant1id] int NULL ,
[WellLocationTypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[IsProjectRig] bit NULL ,
[ServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[CallSheetId] int NULL ,
[IsListed] bit NULL ,
[ServicePointSystemId] int NULL ,
[IsDownholeLocation] bit NULL ,
[ClientCompanyid] int NULL ,
[JobNumber] int NULL ,
[RigStatus] int NULL ,
[RigName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[WellLocationTypeid] int NULL ,
[WellLocationTypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[JobTypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[IsHighProfile] bit NULL ,
[Directions] nvarchar(1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[IsNeedBins] bit NULL ,
[ProgramId] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Rigid] int NULL ,
[JobTypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Notes] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SurfaceLocation] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ClientCompanySystemId] int NULL ,
[JobDateTime] datetime2(7) NULL ,
[JobUniqueId] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[WellLocationTypeSystemId] int NULL ,
[IsServiceRig] bit NULL ,
[ServicePointid] int NULL ,
[JobTypeid] int NULL ,
[CallSheetNumber] int NULL ,
[ClientConsultant2id] int NULL ,
[JobLifeStatus] int NULL ,
[ClientCompanyName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ClientConsultant2Description] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ClientConsultant2Name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ClientConsultant1Name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[IsCoDCleared] bit NULL ,
[JobTypeSystemId] int NULL ,
[JobAlertId] int NULL ,
[ClientConsultant1Description] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ClientConsultant2SystemId] int NULL ,
[RigSystemId] int NULL ,
[ClientCompanyDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ClientConsultant1SystemId] int NULL ,
[RigDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ClientCompanyShortName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;


CREATE TABLE SanjelData.[dbo].[RigJobSanjelCrewSection] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] int NULL ,
[modified_user_name] nvarchar(50) NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) NULL ,
[description] nvarchar(500) NULL ,
[RigJobid] int NULL ,
[ProductHaulDescription] nvarchar(255) NULL ,
[SanjelCrewDescription] nvarchar(255) NULL ,
[SanjelCrewSystemId] int NULL ,
[RigJobName] nvarchar(255) NULL ,
[RigJobDescription] nvarchar(255) NULL ,
[ProductHaulName] nvarchar(255) NULL ,
[RigJobCrewSectionStatus] int NULL ,
[ProductHaulid] int NULL ,
[ProductHaulSystemId] int NULL ,
[SanjelCrewName] nvarchar(255) NULL ,
[RigJobSystemId] int NULL ,
[SanjelCrewid] int NULL 
)
;

CREATE TABLE SanjelData.[dbo].[RigJobThirdPartyBulkerCrewSection] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] int NULL ,
[modified_user_name] nvarchar(50) NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) NULL ,
[description] nvarchar(500) NULL ,
[ProductHaulDescription] nvarchar(255) NULL ,
[ThirdPartyBulkerCrewid] int NULL ,
[ProductHaulSystemId] int NULL ,
[RigJobid] int NULL ,
[ProductHaulName] nvarchar(255) NULL ,
[ThirdPartyBulkerCrewDescription] nvarchar(255) NULL ,
[ThirdPartyBulkerCrewSystemId] int NULL ,
[RigJobCrewSectionStatus] int NULL ,
[ProductHaulid] int NULL ,
[RigJobSystemId] int NULL ,
[ThirdPartyBulkerCrewName] nvarchar(255) NULL ,
[RigJobName] nvarchar(255) NULL ,
[RigJobDescription] nvarchar(255) NULL 
)
;

CREATE TABLE SanjelData.[dbo].[SanjelCrew] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] int NULL ,
[modified_user_name] nvarchar(50) NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) NULL ,
[description] nvarchar(500) NULL ,
[WorkingServicePointSystemId] int NULL ,
[TypeDescription] nvarchar(255) NULL ,
[Typeid] int NULL ,
[HomeServicePointSystemId] int NULL ,
[Rotation] nvarchar(255) NULL ,
[WorkingServicePointid] int NULL ,
[WorkingServicePointName] nvarchar(255) NULL ,
[WorkingServicePointDescription] nvarchar(255) NULL ,
[TypeName] nvarchar(255) NULL ,
[HomeServicePointName] nvarchar(255) NULL ,
[HomeServicePointDescription] nvarchar(255) NULL ,
[Notes] nvarchar(255) NULL ,
[HomeServicePointid] int NULL 
)
;

CREATE TABLE SanjelData.[dbo].[SanjelCrewNote] (
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
[name] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SanjelCrewid] int NULL ,
[SanjelCrewSystemId] int NULL ,
[SanjelCrewName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SanjelCrewDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;

CREATE TABLE SanjelData.[dbo].[SanjelCrewSchedule] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] int NULL ,
[modified_user_name] nvarchar(50) NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) NULL ,
[description] nvarchar(500) NULL ,
[WorkingServicePointSystemId] int NULL ,
[WorkingServicePointName] nvarchar(255) NULL ,
[SanjelCrewid] int NULL ,
[CrewScheduleTypeid] int NULL ,
[RigJobSanjelCrewSectionSystemId] int NULL ,
[CrewScheduleTypeDescription] nvarchar(255) NULL ,
[WorkingServicePointDescription] nvarchar(255) NULL ,
[SanjelCrewDescription] nvarchar(255) NULL ,
[RigJobSanjelCrewSectionid] int NULL ,
[CrewScheduleTypeName] nvarchar(255) NULL ,
[EndTime] datetime2(7) NULL ,
[SanjelCrewName] nvarchar(255) NULL ,
[WorkingServicePointid] int NULL ,
[RigJobSanjelCrewSectionName] nvarchar(255) NULL ,
[RigJobSanjelCrewSectionDescription] nvarchar(255) NULL ,
[StartTime] datetime2(7) NULL ,
[SanjelCrewSystemId] int NULL 
)
;

CREATE TABLE SanjelData.[dbo].[SanjelCrewTruckUnitSection] (
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
[SanjelCrewSystemId] int NULL ,
[TruckUnitid] int NULL ,
[SanjelCrewName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[TruckUnitSystemId] int NULL ,
[SanjelCrewid] int NULL ,
[SanjelCrewDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[TruckUnitDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[TruckUnitName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;

CREATE TABLE SanjelData.[dbo].[SanjelCrewWorkerSection] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] int NULL ,
[modified_user_name] nvarchar(50) NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) NULL ,
[description] nvarchar(500) NULL ,
[Workerid] int NULL ,
[SanjelCrewSystemId] int NULL ,
[WorkerDescription] nvarchar(255) NULL ,
[SanjelCrewName] nvarchar(255) NULL ,
[WorkerName] nvarchar(255) NULL ,
[WorkerSystemId] int NULL ,
[SanjelCrewid] int NULL ,
[CrewPositionDescription] nvarchar(255) NULL ,
[SanjelCrewDescription] nvarchar(255) NULL ,
[CrewPositionName] nvarchar(255) NULL ,
[CrewPositionid] int NULL 
)
;

CREATE TABLE SanjelData.[dbo].[ThirdPartyBulkerCrew] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] int NULL ,
[modified_user_name] nvarchar(50) NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) NULL ,
[description] nvarchar(500) NULL ,
[ContractorCompanyName] nvarchar(255) NULL ,
[ContractorCompanySystemId] int NULL ,
[ContractorCompanyDescription] nvarchar(255) NULL ,
[TypeDescription] nvarchar(255) NULL ,
[ContractorCompanyid] int NULL ,
[TypeName] nvarchar(255) NULL ,
[Typeid] int NULL ,
[ThirdPartyUnitNumber] nvarchar(255) NULL ,
[SupplierContactName] nvarchar(255) NULL ,
[SupplierContactNumber] nvarchar(255) NULL ,
[Notes] nvarchar(255) NULL 
)
;

CREATE TABLE SanjelData.[dbo].[ThirdPartyBulkerCrewNote] (
[ThirdPartyBulkerCrewName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[id] int NOT NULL ,
[operation_type] int NULL ,
[modified_user_id] int NULL ,
[version] int NULL ,
[modified_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[name] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[owner_id] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[ThirdPartyBulkerCrewSystemId] int NULL ,
[ThirdPartyBulkerCrewDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ThirdPartyBulkerCrewid] int NULL ,
[entity_status] int NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[system_id] int NOT NULL IDENTITY(1,1) 
)
;

CREATE TABLE SanjelData.[dbo].[ThirdPartyBulkerCrewSchedule] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] int NULL ,
[modified_user_name] nvarchar(50) NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) NULL ,
[description] nvarchar(500) NULL ,
[RigJobThirdPartyBulkerCrewSectionid] int NULL ,
[ThirdPartyBulkerCrewid] int NULL ,
[RigJobThirdPartyBulkerCrewSectionSystemId] int NULL ,
[CrewScheduleTypeid] int NULL ,
[RigJobThirdPartyBulkerCrewSectionDescription] nvarchar(255) NULL ,
[CrewScheduleTypeName] nvarchar(255) NULL ,
[ThirdPartyBulkerCrewName] nvarchar(255) NULL ,
[ThirdPartyBulkerCrewSystemId] int NULL ,
[RigJobThirdPartyBulkerCrewSectionName] nvarchar(255) NULL ,
[EndTime] datetime2(7) NULL ,
[ThirdPartyBulkerCrewDescription] nvarchar(255) NULL ,
[CrewScheduleTypeDescription] nvarchar(255) NULL ,
[StartTime] datetime2(7) NULL 
)
;

CREATE TABLE SanjelData.[dbo].[UnitOfMeasureSystemOfUnits] (
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

CREATE TABLE SanjelData.[dbo].[UnitOfMeasureType] (
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

CREATE TABLE SanjelData.[dbo].[UnitOfMeasure] (
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
[PrimaryUnitOfMeasureSystemId] int NULL ,
[UnitOfMeasureTypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[PrimaryUnitOfMeasureDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[UnitOfMeasureSystemOfUnitsDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[UnitOfMeasureSystemOfUnitsid] int NULL ,
[UnitOfMeasureTypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[UnitOfMeasureSystemOfUnitsSystemId] int NULL ,
[UnitOfMeasureTypeSystemId] int NULL ,
[UnitOfMeasureSystemOfUnitsName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BaseMultiplier] int NULL ,
[IsUseBaseMultiplier] bit NULL ,
[SecondaryUnitOfMeasureName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SecondaryUnitOfMeasureid] int NULL ,
[UnitOfMeasureTypeid] int NULL ,
[PrimaryUnitOfMeasureName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[IsCompositeUnit] bit NULL ,
[SecondaryUnitOfMeasureSystemId] int NULL ,
[SecondaryUnitOfMeasureDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[PrimaryUnitOfMeasureid] int NULL 
)
;

CREATE TABLE SanjelData.[dbo].[UnitScheduleType] (
[id] int NOT NULL IDENTITY(1,1) ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;

CREATE TABLE SanjelData.[dbo].[UnitSchedule] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] int NULL ,
[modified_user_name] nvarchar(50) NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) NULL ,
[description] nvarchar(500) NULL ,
[StartTime] datetime2(7) NULL ,
[WorkingServicePointName] nvarchar(255) NULL ,
[TruckUnitDescription] nvarchar(255) NULL ,
[UnitScheduleTypeName] nvarchar(255) NULL ,
[WorkingServicePointDescription] nvarchar(255) NULL ,
[TruckUnitid] int NULL ,
[TruckUnitSystemId] int NULL ,
[WorkingServicePointSystemId] int NULL ,
[WorkingServicePointid] int NULL ,
[UnitScheduleTypeDescription] nvarchar(255) NULL ,
[UnitScheduleTypeid] int NULL ,
[EndTime] datetime2(7) NULL ,
[TruckUnitName] nvarchar(255) NULL 
)
;

CREATE TABLE SanjelData.[dbo].[WorkerScheduleType] (
[id] int NOT NULL IDENTITY(1,1) ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;

CREATE TABLE SanjelData.[dbo].[WorkerSchedule] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] int NULL ,
[modified_user_name] nvarchar(50) NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) NULL ,
[description] nvarchar(500) NULL ,
[WorkerScheduleTypeid] int NULL ,
[WorkerScheduleTypeName] nvarchar(255) NULL ,
[WorkingServicePointSystemId] int NULL ,
[WorkerScheduleTypeDescription] nvarchar(255) NULL ,
[Workerid] int NULL ,
[EndTime] datetime2(7) NULL ,
[WorkingServicePointName] nvarchar(255) NULL ,
[StartTime] datetime2(7) NULL ,
[WorkerName] nvarchar(255) NULL ,
[WorkingServicePointDescription] nvarchar(255) NULL ,
[WorkerDescription] nvarchar(255) NULL ,
[WorkingServicePointid] int NULL ,
[WorkerSystemId] int NULL 
)
;

