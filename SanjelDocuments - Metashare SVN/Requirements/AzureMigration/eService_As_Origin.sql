CREATE MASTER KEY ENCRYPTION BY PASSWORD='Credentials123!'

CREATE DATABASE SCOPED CREDENTIAL AppCredential WITH IDENTITY = 'RemoteVisitor', SECRET='S@nj3l160601';

 --DROP DATABASE SCOPED CREDENTIAL AppCredential;

CREATE EXTERNAL DATA SOURCE SanjelData
WITH
(
TYPE=RDBMS,
LOCATION='esevice-azure-test-dbserver01.database.windows.net', -- Change the servername for your server name.
DATABASE_NAME='SanjelData',
CREDENTIAL= AppCredential
);



select * from dbo.bin_azure;

CREATE EXTERNAL TABLE BIN_Azure (
	[id] [int] NOT NULL,
	[system_id] [int]  NOT NULL,
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
	[BinTypeSystemId] [int] NULL,
	[HomeServicePointDescription] [nvarchar](255) NULL,
	[BinTypeName] [nvarchar](255) NULL,
	[BinTypeDescription] [nvarchar](255) NULL,
	[BinTypeid] [int] NULL,
	[HomeServicePointid] [int] NULL,
	[HomeServicePointName] [nvarchar](255) NULL,
	[HomeServicePointSystemId] [int] NULL
) WITH
(
DATA_SOURCE=SanjelData,
SCHEMA_NAME='dbo',
OBJECT_NAME = 'BIN'
);


CREATE EXTERNAL TABLE [BinType_Azure](
	[id] [int] NOT NULL,
	[system_id] [int] NOT NULL,
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
	[description] [nvarchar](500) NULL
) WITH
(
DATA_SOURCE=SanjelData,
SCHEMA_NAME='dbo',
OBJECT_NAME = 'BINTYPE'
);
GO

drop external table BinType_Azure;



CREATE EXTERNAL TABLE [dbo].[BlendChemical_Azure](
	[id] [int] NOT NULL,
	[system_id] [int] NOT NULL,
	[version] [int] NULL,
	[modified_user_id] [int] NULL,
	[modified_user_name] [nvarchar](50) NULL,
	[modified_datetime] [datetime2](7) NULL,
	[operation_type] [int] NULL,
	[effective_start_datetime] [datetime2](7) NULL,
	[effective_end_datetime] [datetime2](7) NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](500) NULL,
	[ProductSystemId] [int] NULL,
	[BlendRecipeName] [nvarchar](255) NULL,
	[ProductDescription] [nvarchar](255) NULL,
	[IsBaseEligible] [bit] NULL,
	[AdditiveTypeName] [nvarchar](255) NULL,
	[BlendPrimaryCategoryId] [int] NULL,
	[MixWater] [float] NULL,
	[AdditiveTypeId] [int] NULL,
	[BaseBlendTypeSystemId] [int] NULL,
	[BlendRecipeId] [int] NULL,
	[AERCode] [nvarchar](255) NULL,
	[BaseBlendTypeDescription] [nvarchar](255) NULL,
	[BlendRecipeDescription] [nvarchar](255) NULL,
	[BagSize] [float] NULL,
	[BlendPrimaryCategorySystemId] [int] NULL,
	[BlendRecipeSystemId] [int] NULL,
	[BaseBlendTypeName] [nvarchar](255) NULL,
	[Yield] [float] NULL,
	[BlendPrimaryCategoryDescription] [nvarchar](255) NULL,
	[IsThixotropic] [bit] NULL,
	[BlendPrimaryCategoryName] [nvarchar](255) NULL,
	[BaseBlendTypeId] [int] NULL,
	[SpecificGravity] [float] NULL,
	[IsAdditiveEligible] [bit] NULL,
	[ProductName] [nvarchar](255) NULL,
	[AdditiveTypeDescription] [nvarchar](255) NULL,
	[Density] [float] NULL,
	[AdditiveTypeSystemId] [int] NULL,
	[ProductId] [int] NULL
) WITH
(
DATA_SOURCE=SanjelData,
SCHEMA_NAME='dbo',
OBJECT_NAME = 'BlendChemical'
);


CREATE EXTERNAL TABLE [dbo].[BlendRecipe_Azure](
	[id] [int] NOT NULL,
	[system_id] [int] NOT NULL,
	[version] [int] NULL,
	[modified_user_id] [int] NULL,
	[modified_user_name] [nvarchar](50) NULL,
	[modified_datetime] [datetime2](7) NULL,
	[operation_type] [int] NULL,
	[effective_start_datetime] [datetime2](7) NULL,
	[effective_end_datetime] [datetime2](7) NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](500) NULL
) WITH
(
DATA_SOURCE=SanjelData,
SCHEMA_NAME='dbo',
OBJECT_NAME = 'BlendRecipe'
);



CREATE EXTERNAL TABLE [dbo].[BlendChemicalSection_Azure](
	[id] [int] NOT NULL,
	[system_id] [int]  NOT NULL,
	[version] [int] NULL,
	[modified_user_id] [int] NULL,
	[modified_user_name] [nvarchar](50) NULL,
	[modified_datetime] [datetime2](7) NULL,
	[operation_type] [int] NULL,
	[effective_start_datetime] [datetime2](7) NULL,
	[effective_end_datetime] [datetime2](7) NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](500) NULL,
	[UnitDescription] [nvarchar](255) NULL,
	[AdditionMethodName] [nvarchar](255) NULL,
	[BlendRecipeName] [nvarchar](255) NULL,
	[AdditionMethodDescription] [nvarchar](255) NULL,
	[BlendRecipeSystemId] [int] NULL,
	[Amount] [float] NULL,
	[BlendRecipeId] [int] NULL,
	[IsBaseBlend] [bit] NULL,
	[AdditiveBlendMethodDescription] [nvarchar](255) NULL,
	[BlendChemicalDescription] [nvarchar](255) NULL,
	[AdditiveBlendMethodName] [nvarchar](255) NULL,
	[UnitSystemId] [int] NULL,
	[BlendChemicalName] [nvarchar](255) NULL,
	[UnitName] [nvarchar](255) NULL,
	[BlendChemicalId] [int] NULL,
	[BlendChemicalSystemId] [int] NULL,
	[UnitId] [int] NULL,
	[BlendRecipeDescription] [nvarchar](255) NULL,
	[AdditiveBlendMethodSystemId] [int] NULL,
	[AdditiveBlendMethodId] [int] NULL,
	[AdditionMethodId] [int] NULL,
	[AdditionMethodSystemId] [int] NULL
) WITH
(
DATA_SOURCE=SanjelData,
SCHEMA_NAME='dbo',
OBJECT_NAME = 'BlendChemicalSection'
);
GO

CREATE EXTERNAL TABLE [dbo].[BonusPosition_Azure](
	[id] [int] NOT NULL,
	[system_id] [int] NOT NULL,
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
	[ServiceLineName] [nvarchar](255) NULL,
	[ServiceLineSystemId] [int] NULL,
	[ServiceLineDescription] [nvarchar](255) NULL,
	[ServiceLineid] [int] NULL
) WITH
(
DATA_SOURCE=SanjelData,
SCHEMA_NAME='dbo',
OBJECT_NAME = 'BonusPosition'
);
GO

CREATE EXTERNAL TABLE [dbo].[ClientConsultant_Azure](
	[id] [int] NOT NULL,
	[system_id] [int] NOT NULL,
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
	[ClientDescription] [nvarchar](255) NULL,
	[WorkShiftid] [int] NULL,
	[Clientid] [int] NULL,
	[WorkShiftName] [nvarchar](255) NULL,
	[ClientSystemId] [int] NULL,
	[Email] [nvarchar](255) NULL,
	[Cell] [nvarchar](255) NULL,
	[Phone2] [nvarchar](255) NULL,
	[WorkShiftDescription] [nvarchar](255) NULL,
	[ClientName] [nvarchar](255) NULL,
	[WorkShiftSystemId] [int] NULL
) WITH
(
DATA_SOURCE=SanjelData,
SCHEMA_NAME='dbo',
OBJECT_NAME = 'ClientConsultant'
);
GO


CREATE EXTERNAL TABLE [dbo].[ClientCompany_Azure](
	[id] [int] NOT NULL,
	[system_id] [int] NOT NULL,
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
	[BillingAddressProvinceOrStateSystemId] [int] NULL,
	[BillingAddressPostalCode] [nvarchar](255) NULL,
	[BillingAddressStreet3] [nvarchar](255) NULL,
	[AddressProvinceOrStateSystemId] [int] NULL,
	[AddressProvinceOrStateName] [nvarchar](255) NULL,
	[AddressProvinceOrStateid] [int] NULL,
	[BillingAddressStreet4] [nvarchar](255) NULL,
	[BillingAddressStreet] [nvarchar](255) NULL,
	[SanjelCompanyid] [int] NULL,
	[SanjelCompanyName] [nvarchar](255) NULL,
	[BillingAddressProvinceOrStateDescription] [nvarchar](255) NULL,
	[AddressStreet4] [nvarchar](255) NULL,
	[AddressStreet3] [nvarchar](255) NULL,
	[AddressProvinceOrStateDescription] [nvarchar](255) NULL,
	[BillingAddressStreet2] [nvarchar](255) NULL,
	[IsCODCustomer] [bit] NULL,
	[SanjelCompanySystemId] [int] NULL,
	[ShortName] [nvarchar](255) NULL,
	[AddressStreet] [nvarchar](255) NULL,
	[BillingAddressCity] [nvarchar](255) NULL,
	[BillingAddressProvinceOrStateid] [int] NULL,
	[AddressCity] [nvarchar](255) NULL,
	[AddressPostalCode] [nvarchar](255) NULL,
	[BillingAddressProvinceOrStateName] [nvarchar](255) NULL,
	[AddressStreet2] [nvarchar](255) NULL,
	[SanjelCompanyDescription] [nvarchar](255) NULL
) WITH
(
DATA_SOURCE=SanjelData,
SCHEMA_NAME='dbo',
OBJECT_NAME = 'ClientCompany'
);
GO

CREATE EXTERNAL TABLE [dbo].[ContractorCompany_Azure](
	[id] [int] NOT NULL,
	[system_id] [int]  NOT NULL,
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
	[description] [nvarchar](500) NULL
) WITH
(
DATA_SOURCE=SanjelData,
SCHEMA_NAME='dbo',
OBJECT_NAME = 'ContractorCompany'
);
GO


CREATE EXTERNAL TABLE [dbo].[Country_Azure](
	[id] [int] NOT NULL,
	[system_id] [int]  NOT NULL,
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
	[ISOAlpha2] [nvarchar](255) NULL,
	[ISONumber] [nvarchar](255) NULL,
	[PercentFuelSurcharge] [float] NULL,
	[ISOAlpha3] [nvarchar](255) NULL
) WITH
(
DATA_SOURCE=SanjelData,
SCHEMA_NAME='dbo',
OBJECT_NAME = 'Country'
);
GO



CREATE EXTERNAL TABLE [dbo].[DrillingCompany_Azure](
	[id] [int] NOT NULL,
	[system_id] [int] NOT NULL,
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
	[BillingAddressPostalCode] [nvarchar](255) NULL,
	[BillingAddressProvinceOrStateid] [int] NULL,
	[AddressCity] [nvarchar](255) NULL,
	[BillingAddressStreet4] [nvarchar](255) NULL,
	[BillingAddressProvinceOrStateName] [nvarchar](255) NULL,
	[BillingAddressStreet3] [nvarchar](255) NULL,
	[AddressPostalCode] [nvarchar](255) NULL,
	[ShortName] [nvarchar](255) NULL,
	[BillingAddressStreet] [nvarchar](255) NULL,
	[AddressStreet2] [nvarchar](255) NULL,
	[SanjelCompanyid] [int] NULL,
	[AddressStreet] [nvarchar](255) NULL,
	[SanjelCompanySystemId] [int] NULL,
	[AddressProvinceOrStateName] [nvarchar](255) NULL,
	[BillingAddressProvinceOrStateDescription] [nvarchar](255) NULL,
	[AddressStreet3] [nvarchar](255) NULL,
	[BillingAddressStreet2] [nvarchar](255) NULL,
	[AddressProvinceOrStateid] [int] NULL,
	[SanjelCompanyName] [nvarchar](255) NULL,
	[SanjelCompanyDescription] [nvarchar](255) NULL,
	[BillingAddressProvinceOrStateSystemId] [int] NULL,
	[IsCODCustomer] [bit] NULL,
	[AddressProvinceOrStateDescription] [nvarchar](255) NULL,
	[BillingAddressCity] [nvarchar](255) NULL,
	[AddressProvinceOrStateSystemId] [int] NULL,
	[AddressStreet4] [nvarchar](255) NULL
) WITH
(
DATA_SOURCE=SanjelData,
SCHEMA_NAME='dbo',
OBJECT_NAME = 'DrillingCompany'
);
GO

CREATE EXTERNAL TABLE [dbo].[Employee_Azure](
	[id] [int] NOT NULL,
	[system_id] [int]  NOT NULL,
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
	[MiddleName] [nvarchar](255) NULL,
	[ServicePointid] [int] NULL,
	[ServiceLineName] [nvarchar](255) NULL,
	[ServiceLineid] [int] NULL,
	[EmployeeNumber] [nvarchar](255) NULL,
	[ServicePointSystemId] [int] NULL,
	[PreferedFirstName] [nvarchar](255) NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[ServiceLineSystemId] [int] NULL,
	[ServicePointName] [nvarchar](255) NULL,
	[ServiceLineDescription] [nvarchar](255) NULL,
	[ServicePointDescription] [nvarchar](255) NULL,
	[BonusPositionid] [int] NULL,
	[BonusPositionSystemId] [int] NULL,
	[BonusPositionName] [nvarchar](255) NULL,
	[BonusPositionDescription] [nvarchar](255) NULL
) WITH
(
DATA_SOURCE=SanjelData,
SCHEMA_NAME='dbo',
OBJECT_NAME = 'Employee'
);
GO

CREATE EXTERNAL TABLE [dbo].[JobType_Azure](
	[id] [int] NOT NULL,
	[system_id] [int] NOT NULL,
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
	[ServiceLineDescription] [nvarchar](255) NULL,
	[ServiceLineSystemId] [int] NULL,
	[ServiceLineid] [int] NULL,
	[ServiceLineName] [nvarchar](255) NULL
) WITH
(
DATA_SOURCE=SanjelData,
SCHEMA_NAME='dbo',
OBJECT_NAME = 'JobType'
);
GO

CREATE EXTERNAL TABLE [dbo].[Product_Azure](
	[id] [int] NOT NULL,
	[system_id] [int]  NOT NULL,
	[version] [int] NULL,
	[modified_user_id] [int] NULL,
	[modified_user_name] [nvarchar](50) NULL,
	[modified_datetime] [datetime2](7) NULL,
	[operation_type] [int] NULL,
	[effective_start_datetime] [datetime2](7) NULL,
	[effective_end_datetime] [datetime2](7) NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](500) NULL,
	[PriceCode] [int] NULL,
	[IsFreightCostIncluded] [bit] NULL,
	[IsThirdPartyProvided] [bit] NULL,
	[InventoryNumber] [nvarchar](255) NULL
) WITH
(
DATA_SOURCE=SanjelData,
SCHEMA_NAME='dbo',
OBJECT_NAME = 'Product'
);
GO


CREATE EXTERNAL TABLE [dbo].[ProvinceOrState_Azure](
	[id] [int] NOT NULL,
	[system_id] [int] NOT NULL,
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
	[CountryDescription] [nvarchar](255) NULL,
	[CountryName] [nvarchar](255) NULL,
	[Code] [nvarchar](255) NULL,
	[CountrySystemId] [int] NULL,
	[Countryid] [int] NULL,
	[Capital] [nvarchar](255) NULL,
	[PercentSalesSurcharge] [float] NULL
) WITH
(
DATA_SOURCE=SanjelData,
SCHEMA_NAME='dbo',
OBJECT_NAME = 'ProvinceOrState'
);
GO

/****** Object:  Table [dbo].[Rig]    Script Date: 2/24/2020 10:57:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE EXTERNAL TABLE [dbo].[Rig_Azure](
	[id] [int] NOT NULL,
	[system_id] [int]  NOT NULL,
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
	[IsTopDrive] [bit] NULL,
	[ThreadTypeName] [nvarchar](255) NULL,
	[ThreadTypeSystemId] [int] NULL,
	[Sizeid] [int] NULL,
	[DrillingCompanyid] [int] NULL,
	[SizeDescription] [nvarchar](255) NULL,
	[SizeName] [nvarchar](255) NULL,
	[RigSizeSystemId] [int] NULL,
	[ThreadTypeid] [int] NULL,
	[DrillingCompanyName] [nvarchar](255) NULL,
	[RigNumber] [nvarchar](255) NULL,
	[RigSizeDescription] [nvarchar](255) NULL,
	[DrillingCompanySystemId] [int] NULL,
	[IsServiceRig] [bit] NULL,
	[SizeSystemId] [int] NULL,
	[Status] [int] NULL,
	[IsProjectRig] [bit] NULL,
	[RigSizeName] [nvarchar](255) NULL,
	[DrillingCompanyDescription] [nvarchar](255) NULL,
	[ThreadTypeDescription] [nvarchar](255) NULL,
	[RigSizeid] [int] NULL,
	[IsDeleted] [bit] NULL
) WITH
(
DATA_SOURCE=SanjelData,
SCHEMA_NAME='dbo',
OBJECT_NAME = 'Rig'
);
GO

CREATE EXTERNAL TABLE [dbo].[SanjelCompany_Azure](
	[id] [int] NOT NULL,
	[system_id] [int]  NOT NULL,
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
	[CountryName] [nvarchar](255) NULL,
	[CountrySystemId] [int] NULL,
	[Countryid] [int] NULL,
	[CountryDescription] [nvarchar](255) NULL
) WITH
(
DATA_SOURCE=SanjelData,
SCHEMA_NAME='dbo',
OBJECT_NAME = 'SanjelCompany'
);
GO

/****** Object:  Table [dbo].[ServicePoint]    Script Date: 2/24/2020 10:59:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE EXTERNAL TABLE [dbo].[ServicePoint_Azure](
	[id] [int] NOT NULL,
	[system_id] [int] NOT NULL,
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
	[description] [nvarchar](500) NULL
) WITH
(
DATA_SOURCE=SanjelData,
SCHEMA_NAME='dbo',
OBJECT_NAME = 'ServicePoint'
);
GO

/****** Object:  Table [dbo].[TruckUnit]    Script Date: 2/24/2020 11:01:27 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE EXTERNAL TABLE [dbo].[TruckUnit_Azure](
	[id] [int] NOT NULL,
	[system_id] [int]  NOT NULL,
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
	[UnitMainTypeName] [nvarchar](255) NULL,
	[ServicePointName] [nvarchar](255) NULL,
	[UnitSubTypeName] [nvarchar](255) NULL,
	[UnitMainTypeSystemId] [int] NULL,
	[ServicePointDescription] [nvarchar](255) NULL,
	[UnitSubTypeid] [int] NULL,
	[ServicePointSystemId] [int] NULL,
	[UnitMainTypeDescription] [nvarchar](255) NULL,
	[UnitNumber] [nvarchar](255) NULL,
	[UnitMainTypeid] [int] NULL,
	[UnitSubTypeSystemId] [int] NULL,
	[ServicePointid] [int] NULL,
	[UnitSubTypeDescription] [nvarchar](255) NULL,
	[UnitSbsId] [nvarchar](50) NULL,
	[UnitMainTypeSbsId] [nvarchar](50) NULL,
	[UnitSubTypeSbsId] [nvarchar](50) NULL,
	[ServicePointSbsId] [nvarchar](50) NULL
) WITH
(
DATA_SOURCE=SanjelData,
SCHEMA_NAME='dbo',
OBJECT_NAME = 'TruckUnit'
);
GO

CREATE EXTERNAL TABLE [dbo].[UnitSubType_Azure](
	[id] [int] NOT NULL,
	[system_id] [int] NOT NULL,
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
	[UnitMainTypeDescription] [nvarchar](255) NULL,
	[UnitMainTypeName] [nvarchar](255) NULL,
	[UnitMainTypeSystemId] [int] NULL,
	[UnitMainTypeid] [int] NULL,
	[UnitMainTypeSbsId] [nvarchar](50) NULL,
	[UnitSubTypeSbsId] [nvarchar](50) NULL
) WITH
(
DATA_SOURCE=SanjelData,
SCHEMA_NAME='dbo',
OBJECT_NAME = 'UnitSubType'
);
GO


CREATE EXTERNAL TABLE [dbo].[UnitMainType_Azure](
	[id] [int] NOT NULL,
	[system_id] [int] NOT NULL,
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
	[UnitMainTypeSbsId] [nvarchar](50) NULL
) WITH
(
DATA_SOURCE=SanjelData,
SCHEMA_NAME='dbo',
OBJECT_NAME = 'UnitMainType'
);
GO


-- Create Views

CREATE VIEW [dbo].[BINS] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from Bin_Azure
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

CREATE VIEW [dbo].[BIN_TYPES] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from BinType_Azure
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

CREATE VIEW [dbo].[BLEND_CHEMICALS] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from BlendChemical_Azure
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
	from orderedRecords where rowNum = 1;

	GO

CREATE VIEW [dbo].[BLEND_RECIPE] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from BlendRecipe_Azure
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

CREATE VIEW [dbo].[BLEND_RECIPE_CHEMICAL_ITEMS] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from BlendChemicalSection_Azure
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

CREATE VIEW [dbo].[BONUS_POSITIONS] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from BonusPosition_Azure
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

CREATE VIEW [dbo].[CLIENT_CONSULTANTS] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * 
		from ClientConsultant_Azure
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

CREATE VIEW [dbo].[COMPANIES] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from ClientCompany_Azure
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

CREATE VIEW [dbo].[COMPANIES_WITH_TYPES] AS 

	select distinct
		id COMPANY_ID
		,1 TYPE_ID
		,1 VERSION
	from ClientCompany_Azure
	union
	select distinct
		id COMPANY_ID
		,2 TYPE_ID
		,1 VERSION
	from ClientCompany_Azure
;

GO

CREATE VIEW [dbo].[CONTRACTOR_COMPANIES] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, * 
		from ContractorCompany_Azure
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

CREATE VIEW [dbo].[COUNTRIES] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from Country_Azure
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


CREATE VIEW [dbo].[DrillingCompanies] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from DrillingCompany_Azure
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


CREATE VIEW [dbo].[EMPLOYEES] AS 

    with orderedRecords as (
        select ROW_NUMBER() OVER (Partition By EmployeeNumber ORDER BY Version desc) as rowNum, *
        from Employee_Azure
    )
    select
        r.id                        ID
        ,r.FirstName                FIRST_NAME
        ,NULL                       MIDDLE_NAME
        ,r.LastName                 LAST_NAME
			,e.WORK_PHONE               WORK_PHONE
        --,NULL                        WORK_PHONE
        ,NULL                       WORK_FAX
        ,NULL                       DIRECT_PHONE
        ,NULL                       DIRECT_FAX
        ,NULL                       HOME_PHONE
        ,NULL                       HOME_FAX
			,e.CELL                     CELL
        --,NULL                       CELL
        ,NULL                       PAGER
        ,	a.WorkEmail                EMAIL
        ,NULL                       PERCENT_EARN
        ,r.ServicePointId           DISTRICT_ID
        ,r.ServiceLineid            SERVICE_LINE_ID
        ,r.BonusPositionid          DEFAULT_BONUS_POSITION_ID
			,IsNull(a.Status, 'A')      STATUS
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
        left join [Sanjel27\DW].SESI_MasterDB.dbo.EmployeesToEService a on a.EmployeeNumber = r.EmployeeNumber
        left join dbo.EMPLOYEES_ConvertedToView e on e.EMPLOYEE_NUMBER = r.EmployeeNumber
    where rowNum = 1
;

GO


CREATE VIEW [dbo].[JOB_TYPES] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from JobType_Azure
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


CREATE VIEW [dbo].[PRODUCTS] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from Product_Azure
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
	from orderedRecords where rowNum = 1;

	GO

CREATE VIEW [dbo].[PROVINCE_STATES] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from ProvinceOrState_Azure
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


CREATE VIEW [dbo].[RIGS] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from Rig_Azure
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


CREATE VIEW [dbo].[SANJEL_COMPANIES] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from SanjelCompany_Azure
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


CREATE VIEW [dbo].[SERVICE_POINTS] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from ServicePoint_Azure
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


CREATE VIEW [dbo].[TRUCK_UNITS] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from TruckUnit_Azure
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


CREATE VIEW [dbo].[VEHICLE_SUB_TYPES] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from UnitSubType_Azure
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


CREATE VIEW [dbo].[VEHICLE_TYPES] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from UnitMainType_Azure
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




	drop view COMPANIES_View;
	drop view COMPANIES_WITH_TYPES_view;