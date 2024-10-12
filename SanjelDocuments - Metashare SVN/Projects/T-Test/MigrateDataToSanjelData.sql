--Import Blend Master Data


SET IDENTITY_INSERT [SanjelData_13].[dbo].[AdditionMethod] ON
GO

INSERT INTO [SanjelData_13].[dbo].[AdditionMethod] (
            [id]
	       ,[system_id]
           ,[version]
           ,[modified_user_id]
           ,[modified_user_name]
           ,[modified_datetime]
           ,[operation_type]
           ,[effective_start_datetime]
           ,[effective_end_datetime]
           ,[entity_status]
           ,[owner_id]
           ,[name]
           ,[description])
select * from MasterDataManagement.dbo.AdditionMethod;
GO

SET IDENTITY_INSERT [SanjelData_13].[dbo].[AdditionMethod] OFF
GO


SET IDENTITY_INSERT [SanjelData_13].[dbo].[AdditiveBlendMethod] ON
GO

INSERT INTO [SanjelData_13].[dbo].[AdditiveBlendMethod] (
       [id]
      ,[system_id]
      ,[version]
      ,[modified_user_id]
      ,[modified_user_name]
      ,[modified_datetime]
      ,[operation_type]
      ,[effective_start_datetime]
      ,[effective_end_datetime]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description])
select * 
  FROM MasterDataManagement.[dbo].[AdditiveBlendMethod]
GO

SET IDENTITY_INSERT [SanjelData_13].[dbo].[AdditiveBlendMethod] OFF
GO


SET IDENTITY_INSERT [SanjelData_13].[dbo].[AdditiveType] ON
GO

Insert into [SanjelData_13].[dbo].AdditiveType
      ([id]
      ,[system_id]
      ,[version]
      ,[modified_user_id]
      ,[modified_user_name]
      ,[modified_datetime]
      ,[operation_type]
      ,[effective_start_datetime]
      ,[effective_end_datetime]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description])
SELECT *
  FROM MasterDataManagement.[dbo].[AdditiveType]
GO

SET IDENTITY_INSERT [SanjelData_13].[dbo].[AdditiveType] OFF
GO

SET IDENTITY_INSERT SanjelData_13.dbo.[BlendAdditiveMeasureUnit] ON
GO

INSERT INTO SanjelData_13.dbo.[BlendAdditiveMeasureUnit]
	   ([id]
      ,[system_id]
      ,[version]
      ,[modified_user_id]
      ,[modified_user_name]
      ,[modified_datetime]
      ,[operation_type]
      ,[effective_start_datetime]
      ,[effective_end_datetime]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[MeaureUnitTypeName]
      ,[Abbreviation]
      ,[MeaureUnitTypeDescription]
      ,[MeaureUnitTypeSystemId]
      ,[MeasureUnitSystemDescription]
      ,[MeasureUnitSystemId]
      ,[MeasureUnitSystemSystemId]
      ,[MeaureUnitTypeId]
      ,[MeasureUnitSystemName])
SELECT  *
From MasterDataManagement.dbo.BlendAdditiveMeasureUnit;

SET IDENTITY_INSERT SanjelData_13.dbo.[BlendAdditiveMeasureUnit] OFF
GO



SET IDENTITY_INSERT SanjelData_13.dbo.[BlendChemical] ON
GO

INSERT INTO SanjelData_13.dbo.[BlendChemical] (
       [id]
      ,[system_id]
      ,[version]
      ,[modified_user_id]
      ,[modified_user_name]
      ,[modified_datetime]
      ,[operation_type]
      ,[effective_start_datetime]
      ,[effective_end_datetime]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[IsThixotropic]
      ,[BlendRecipeName]
      ,[BaseBlendTypeName]
      ,[Yield]
      ,[AdditiveTypeid]
      ,[MixWater]
      ,[BlendRecipeDescription]
      ,[BlendPrimaryCategorySystemId]
      ,[AERCode]
      ,[BaseBlendTypeDescription]
      ,[AdditiveTypeSystemId]
      ,[SpecificGravity]
      ,[AdditiveTypeDescription]
      ,[ProductName]
      ,[ProductSystemId]
      ,[BaseBlendTypeSystemId]
      ,[BlendPrimaryCategoryid]
      ,[IsBaseEligible]
      ,[BlendRecipeid]
      ,[BlendRecipeSystemId]
      ,[BlendPrimaryCategoryName]
      ,[Productid]
      ,[IsAdditiveEligible]
      ,[ProductDescription]
      ,[Density]
      ,[BagSize]
      ,[BaseBlendTypeid]
      ,[AdditiveTypeName]
      ,[BlendPrimaryCategoryDescription])
SELECT  
       [id]
      ,[system_id]
      ,[version]
      ,[modified_user_id]
      ,[modified_user_name]
      ,[modified_datetime]
      ,[operation_type]
      ,[effective_start_datetime]
      ,[effective_end_datetime]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[IsThixotropic]
      ,[BlendRecipeName]
      ,[BaseBlendTypeName]
      ,[Yield]
      ,[AdditiveTypeid]
      ,[MixWater]
      ,[BlendRecipeDescription]
      ,[BlendPrimaryCategorySystemId]
      ,[AERCode]
      ,[BaseBlendTypeDescription]
      ,[AdditiveTypeSystemId]
      ,[SpecificGravity]
      ,[AdditiveTypeDescription]
      ,[ProductName]
      ,[ProductSystemId]
      ,[BaseBlendTypeSystemId]
      ,[BlendPrimaryCategoryid]
      ,[IsBaseEligible]
      ,[BlendRecipeid]
      ,[BlendRecipeSystemId]
      ,[BlendPrimaryCategoryName]
      ,[Productid]
      ,[IsAdditiveEligible]
      ,[ProductDescription]
      ,[Density]
      ,[BagSize]
      ,[BaseBlendTypeid]
      ,[AdditiveTypeName]
      ,[BlendPrimaryCategoryDescription]
From MasterDataManagement.dbo.[BlendChemical];
GO

SET IDENTITY_INSERT SanjelData_13.dbo.[BlendChemical] OFF
GO


SET IDENTITY_INSERT SanjelData_13.dbo.[BlendChemicalSection] ON
GO

INSERT INTO SanjelData_13.[dbo].[BlendChemicalSection]
           ([id]
           ,[system_id]
           ,[version]
           ,[modified_user_id]
           ,[modified_user_name]
           ,[modified_datetime]
           ,[operation_type]
           ,[effective_start_datetime]
           ,[effective_end_datetime]
           ,[entity_status]
           ,[owner_id]
           ,[name]
           ,[description]
           ,[BlendRecipeid]
           ,[AdditiveBlendMethodid]
           ,[AdditionMethodDescription]
           ,[BlendChemicalSystemId]
           ,[AdditiveBlendMethodDescription]
           ,[UnitDescription]
           ,[UnitName]
           ,[BlendRecipeName]
           ,[IsBaseBlend]
           ,[BlendChemicalDescription]
           ,[AdditiveBlendMethodSystemId]
           ,[AdditionMethodName]
           ,[Unitid]
           ,[Amount]
           ,[AdditiveBlendMethodName]
           ,[AdditionMethodSystemId]
           ,[BlendRecipeSystemId]
           ,[BlendRecipeDescription]
           ,[UnitSystemId]
           ,[BlendChemicalid]
           ,[AdditionMethodid]
           ,[BlendChemicalName])
SELECT
            [id]
           ,[system_id]
           ,[version]
           ,[modified_user_id]
           ,[modified_user_name]
           ,[modified_datetime]
           ,[operation_type]
           ,[effective_start_datetime]
           ,[effective_end_datetime]
           ,[entity_status]
           ,[owner_id]
           ,[name]
           ,[description]
           ,[BlendRecipeid]
           ,[AdditiveBlendMethodid]
           ,[AdditionMethodDescription]
           ,[BlendChemicalSystemId]
           ,[AdditiveBlendMethodDescription]
           ,[UnitDescription]
           ,[UnitName]
           ,[BlendRecipeName]
           ,[IsBaseBlend]
           ,[BlendChemicalDescription]
           ,[AdditiveBlendMethodSystemId]
           ,[AdditionMethodName]
           ,[Unitid]
           ,[Amount]
           ,[AdditiveBlendMethodName]
           ,[AdditionMethodSystemId]
           ,[BlendRecipeSystemId]
           ,[BlendRecipeDescription]
           ,[UnitSystemId]
           ,[BlendChemicalid]
           ,[AdditionMethodid]
           ,[BlendChemicalName]
From MasterDataManagement.dbo.BlendChemicalSection
GO

SET IDENTITY_INSERT SanjelData_13.dbo.[BlendChemicalSection] OFF
GO


SET IDENTITY_INSERT SanjelData_13.dbo.[BlendFluidType] ON
GO


INSERT INTO SanjelData_13.dbo.[BlendFluidType](
       [id]
      ,[system_id]
      ,[version]
      ,[modified_user_id]
      ,[modified_user_name]
      ,[modified_datetime]
      ,[operation_type]
      ,[effective_start_datetime]
      ,[effective_end_datetime]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description])
SELECT
       [id]
      ,[system_id]
      ,[version]
      ,[modified_user_id]
      ,[modified_user_name]
      ,[modified_datetime]
      ,[operation_type]
      ,[effective_start_datetime]
      ,[effective_end_datetime]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
  FROM MasterDataManagement.[dbo].[BlendFluidType]
GO

SET IDENTITY_INSERT SanjelData_13.dbo.[BlendFluidType] OFF
GO


SET IDENTITY_INSERT SanjelData_13.dbo.[BlendPrimaryCategory] ON
GO


INSERT INTO SanjelData_13.dbo.[BlendPrimaryCategory](
[id]
      ,[system_id]
      ,[version]
      ,[modified_user_id]
      ,[modified_user_name]
      ,[modified_datetime]
      ,[operation_type]
      ,[effective_start_datetime]
      ,[effective_end_datetime]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description])
SELECT
[id]
      ,[system_id]
      ,[version]
      ,[modified_user_id]
      ,[modified_user_name]
      ,[modified_datetime]
      ,[operation_type]
      ,[effective_start_datetime]
      ,[effective_end_datetime]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
FROM MasterDataManagement.[dbo].[BlendPrimaryCategory]
GO

SET IDENTITY_INSERT SanjelData_13.dbo.[BlendPrimaryCategory] OFF
GO


SET IDENTITY_INSERT SanjelData_13.dbo.[BlendRecipe] ON
GO


INSERT INTO SanjelData_13.dbo.[BlendRecipe](
       [id]
      ,[system_id]
      ,[version]
      ,[modified_user_id]
      ,[modified_user_name]
      ,[modified_datetime]
      ,[operation_type]
      ,[effective_start_datetime]
      ,[effective_end_datetime]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
)
SELECT
       [id]
      ,[system_id]
      ,[version]
      ,[modified_user_id]
      ,[modified_user_name]
      ,[modified_datetime]
      ,[operation_type]
      ,[effective_start_datetime]
      ,[effective_end_datetime]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
FROM MasterDataManagement.[dbo].[BlendRecipe]
GO

SET IDENTITY_INSERT SanjelData_13.dbo.[BlendRecipe] OFF
GO



SET IDENTITY_INSERT SanjelData_13.dbo.[Product] ON
GO


INSERT INTO SanjelData_13.dbo.[Product](
       [id]
      ,[system_id]
      ,[version]
      ,[modified_user_id]
      ,[modified_user_name]
      ,[modified_datetime]
      ,[operation_type]
      ,[effective_start_datetime]
      ,[effective_end_datetime]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[IsFreightCostIncluded]
      ,[IsThirdPartyProvided]
      ,[PriceCode]
      ,[InventoryNumber]
)
SELECT
       [id]
      ,[system_id]
      ,[version]
      ,[modified_user_id]
      ,[modified_user_name]
      ,[modified_datetime]
      ,[operation_type]
      ,[effective_start_datetime]
      ,[effective_end_datetime]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[IsFreightCostIncluded]
      ,[IsThirdPartyProvided]
      ,[PriceCode]
      ,[InventoryNumber]
FROM MasterDataManagement.[dbo].[Product]
GO

SET IDENTITY_INSERT SanjelData_13.dbo.[Product] OFF
GO


SET IDENTITY_INSERT SanjelData_13.dbo.[PurchasePrice] ON
GO


INSERT INTO SanjelData_13.dbo.[PurchasePrice](
[id]
      ,[system_id]
      ,[version]
      ,[modified_user_id]
      ,[modified_user_name]
      ,[modified_datetime]
      ,[operation_type]
      ,[effective_start_datetime]
      ,[effective_end_datetime]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[UnitId]
      ,[Price]
      ,[PriceUnit]
      ,[SbsReleasedProductId]
      ,[ServicePoint]
)
SELECT
[id]
      ,[system_id]
      ,[version]
      ,[modified_user_id]
      ,[modified_user_name]
      ,[modified_datetime]
      ,[operation_type]
      ,[effective_start_datetime]
      ,[effective_end_datetime]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[UnitId]
      ,[Price]
      ,[PriceUnit]
      ,[SbsReleasedProductId]
      ,[ServicePoint]
FROM MasterDataManagement.[dbo].[PurchasePrice]
GO

SET IDENTITY_INSERT SanjelData_13.dbo.[PurchasePrice] OFF
GO

-- Import TruckUnit data
insert into SanjelData_13.dbo.TruckUnit(
id,
UnitNumber,
ServicePointId,
UnitMainTypeid,
UnitSubtypeid,
version,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id)
select 
ID as id, 
UNIT_NUMBER as UnitNumber, 
DISTRICT_ID as ServicePointId, 
UNIT_MAIN_TYPE_ID as UnitMainTypeid, 
UNIT_SUB_TYPE_ID as  UnitSubtypeid, 
VERSION as version, 
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
0 as owner_id
from Eservice6.dbo.TRUCK_UNITS OSP where OSP.EFFECTIVE_END_DATE_TIME > GETDATE() ;


-- Import Employee data
insert into SanjelData_13.dbo.Employee(
id,
FirstName,
MiddleName,
LastName,
EmployeeNumber,
ServicePointId,
ServiceLineid,
BonusPositionid,
PreferedFirstName,
version,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id)
select 
ID as id, 
FIRST_NAME as FirstName, 
MIDDLE_NAME as MiddleName, 
LAST_NAME as LastName, 
EMPLOYEE_NUMBER as  EmployeeNumber,
DISTRICT_ID as ServicePointId, 
SERVICE_LINE_ID as ServiceLineid,
DEFAULT_BONUS_POSITION_ID as BonusPositionid,
PREFER_FIRST_NAME as  PreferedFirstName, 
VERSION as version, 
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
0 as owner_id
from Eservice6.dbo.EMPLOYEES OSP where OSP.EFFECTIVE_END_DATE_TIME > GETDATE() ;

-- Import ServicePoint data
insert into SanjelData_13.dbo.ServicePoint(
id,
name,
version,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id)
select 
ID as id, 
NAME as name, 
VERSION as version, 
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
0 as owner_id
from Eservice6.dbo.SERVICE_POINTS OSP where OSP.EFFECTIVE_END_DATE_TIME > GETDATE() ;

-- Import CrewType data
SET IDENTITY_INSERT SanjelData_13.[dbo].[CrewType] ON
GO
INSERT INTO SanjelData_13.[dbo].[CrewType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'0', N'0', N'Pumper Crew', N'Pumper Crew')
GO
GO
INSERT INTO SanjelData_13.[dbo].[CrewType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'0', N'0', N'Bulker Crew', N'Bulker Crew')
GO
GO
INSERT INTO SanjelData_13.[dbo].[CrewType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'3', N'0', N'0', N'Third Party Bulker Crew', N'Third Party Bulker Crew')
GO
GO
INSERT INTO SanjelData_13.[dbo].[CrewType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'4', N'0', N'0', N'Spare Crew', N'Spare Crew')
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[CrewType] OFF
GO

-- Import Crew data
SET IDENTITY_INSERT SanjelData_13.[dbo].[Crew] ON
GO
INSERT INTO SanjelData_13.[dbo].[Crew] ([id], [entity_status], [owner_id], [name], [description], [HomeServicePointName], [HomeServicePointSystemId], [HomeServicePointid], [WorkingServicePointSystemId], [WorkingServicePointid], [WorkingServicePointName], [Typeid], [HomeServicePointDescription], [WorkingServicePointDescription], [Notes]) VALUES (N'1', null, null, N'name', null, null, null, 69, null, 69, null, N'1', null, null, N'test')
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[Crew] OFF
GO

-- Import CrewPosition data
SET IDENTITY_INSERT SanjelData_13.[dbo].[CrewPosition] ON
GO
INSERT INTO SanjelData_13.[dbo].[CrewPosition] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'0', N'0', N'Supervisor', N'Supervisor')
GO
GO
INSERT INTO SanjelData_13.[dbo].[CrewPosition] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'0', N'0', N'Crew Member', N'Crew Member')
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[CrewPosition] OFF
GO


-- Import RigJob data
SET IDENTITY_INSERT SanjelData_13.[dbo].[RigJob] ON
GO
insert into SanjelData_13.dbo.RigJob(
id,
entity_status,
owner_id)
select 
ID as id, 
0 as ENTITY_STATUS,
0 as owner_id
from Eservice6.dbo.RIG_JOB;
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[RigJob] OFF
GO



DROP TABLE SanjelData_13.[dbo].[WorkerScheduleType]
GO
CREATE TABLE SanjelData_13.[dbo].[WorkerScheduleType] (
[id] int NOT NULL IDENTITY(1,1) ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(50) NULL ,
[description] nvarchar(500) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[WorkerScheduleType]', RESEED, 4)
GO

-- ----------------------------
-- Records of WorkerScheduleType
-- ----------------------------
SET IDENTITY_INSERT SanjelData_13.[dbo].[WorkerScheduleType] ON
GO
INSERT INTO SanjelData_13.[dbo].[WorkerScheduleType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'1', null, null, N'Sickness', N'Sickness')
GO
GO
INSERT INTO SanjelData_13.[dbo].[WorkerScheduleType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'2', null, null, N'Personal Leave', N'Personal Leave')
GO
GO
INSERT INTO SanjelData_13.[dbo].[WorkerScheduleType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'3', null, null, N'Family Emergency', N'Family Emergency')
GO
GO
INSERT INTO SanjelData_13.[dbo].[WorkerScheduleType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'4', null, null, N'Vacation', N'Vacation')
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[WorkerScheduleType] OFF
GO


DROP TABLE SanjelData_13.[dbo].[UnitScheduleType]
GO
CREATE TABLE SanjelData_13.[dbo].[UnitScheduleType] (
[id] int NOT NULL IDENTITY(1,1) ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(50) NULL ,
[description] nvarchar(500) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[UnitScheduleType]', RESEED, 4)
GO

-- ----------------------------
-- Records of UnitScheduleType
-- ----------------------------
SET IDENTITY_INSERT SanjelData_13.[dbo].[UnitScheduleType] ON
GO
INSERT INTO SanjelData_13.[dbo].[UnitScheduleType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'1', null, null, N'Maintenance', N'Maintenance')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitScheduleType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'2', null, null, N'Breakdown', N'Breakdown')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitScheduleType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'3', null, null, N'Repair', N'Repair')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitScheduleType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'4', null, null, N'Parked', N'Parked')
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[UnitScheduleType] OFF
GO

-- ----------------------------
-- Records of RigJobCrewSectionStatus
-- ----------------------------
SET IDENTITY_INSERT SanjelData_13.[dbo].[RigJobCrewSectionStatus] ON
GO
INSERT INTO SanjelData_13.[dbo].[RigJobCrewSectionStatus] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'0', N'0', N'Assigned', N'Assigned')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigJobCrewSectionStatus] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'0', N'0', N'Scheduled', N'Scheduled')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigJobCrewSectionStatus] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'3', N'0', N'0', N'Removed', N'Removed')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigJobCrewSectionStatus] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'4', N'0', N'0', N'Called', N'Called')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigJobCrewSectionStatus] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'5', N'0', N'0', N'LogOnDuty', N'LogOnDuty')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigJobCrewSectionStatus] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'6', N'0', N'0', N'LogOffDuty', N'LogOffDuty')
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[RigJobCrewSectionStatus] OFF
GO


-- Modify Crew table  2019/02/18
alter table SanjelData_13.dbo.Crew drop column CrewScheduleTypeid;

-- Import BonusPosition data  2019/02/18
alter table SanjelData_13.dbo.CrewSchedule add CrewScheduleTypeid int;

-- Table structure for BonusPosition  2019/02/18
CREATE TABLE SanjelData_13.[dbo].[BonusPosition] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) NULL ,
[modified_user_name] nvarchar(50) NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) NULL ,
[description] nvarchar(500) NULL ,
[ServiceLineName] nvarchar(255) NULL ,
[ServiceLineSystemId] int NULL ,
[ServiceLineDescription] nvarchar(255) NULL ,
[ServiceLineid] int NULL 
)

-- Import BonusPosition data  2019/02/18
insert into SanjelData_13.dbo.BonusPosition(
id,
name,
description,
ServiceLineid,
version,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id)
select 
ID as id, 
DESCRIPTION as name, 
DESCRIPTION as description, 
SERVICE_LINE_ID as ServiceLineid, 
VERSION as version, 
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
0 as owner_id
from Eservice6.dbo.BONUS_POSITIONS BP where BP.EFFECTIVE_END_DATE_TIME > GETDATE() ;

-- Modify Employee table  2019/02/18
alter table SanjelData_13.dbo.Employee add BonusPositionid int;
alter table SanjelData_13.dbo.Employee add BonusPositionSystemId int;
alter table SanjelData_13.dbo.Employee add BonusPositionName nvarchar(255);
alter table SanjelData_13.dbo.Employee add BonusPositionDescription nvarchar(255);

-- Import version data to Employee  2019/02/18
UPDATE SanjelData_13.dbo.Employee SET version = r.VERSION FROM Employee e,(SELECT * FROM Eservice6.dbo.EMPLOYEES) r WHERE e.id=r.ID;
UPDATE SanjelData_13.dbo.Employee SET version = 0 WHERE version is NULL;

-- Import UnitMainType data  2019/02/18
insert into SanjelData_13.dbo.UnitMainType(
id,
name,
description,
version,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id)
select 
ID as id, 
DESCRIPTION as name, 
DESCRIPTION as description, 
VERSION as version, 
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
0 as owner_id
from Eservice6.dbo.VEHICLE_TYPES UMT where UMT.EFFECTIVE_END_DATE_TIME > GETDATE() ;


---------------------------------------------------------------

-- Import BonusPosition/ServicePoint data to Employee  2019/02/20
UPDATE SanjelData_13.dbo.Employee SET BonusPositionid = r.DEFAULT_BONUS_POSITION_ID FROM Employee e,(SELECT * FROM Eservice6.dbo.EMPLOYEES) r WHERE e.id=r.ID;
UPDATE SanjelData_13.dbo.Employee SET BonusPositionSystemId = r.system_id,BonusPositionName = r.name,BonusPositionDescription = r.description FROM Employee e,(SELECT * FROM BonusPosition) r WHERE e.BonusPositionid=r.ID;
UPDATE SanjelData_13.dbo.Employee SET ServicePointSystemId = r.system_id,ServicePointName = r.name,ServicePointDescription = r.description FROM Employee e,(SELECT * FROM ServicePoint) r WHERE e.ServicePointid=r.ID;
UPDATE SanjelData_13.dbo.Employee SET BonusPositionid = 0 WHERE BonusPositionid is NULL;

-- Modify UnitSubType table  2019/02/20
DROP TABLE SanjelData_13.[dbo].[UnitSubtype];

CREATE TABLE SanjelData_13.[dbo].[UnitSubType] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) NULL ,
[modified_user_name] nvarchar(50) NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) NULL ,
[description] nvarchar(500) NULL ,
[UnitMainTypeDescription] nvarchar(255) NULL ,
[UnitMainTypeName] nvarchar(255) NULL ,
[UnitMainTypeSystemId] int NULL ,
[UnitMainTypeid] int NULL 
);

-- Import UnitSubType data  2019/02/20
insert into SanjelData_13.dbo.UnitSubType(
id,
name,
description,
UnitMainTypeid,
version,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id)
select 
ID as id, 
VEHICLE_SUB_TYPE_NAME as name, 
VEHICLE_SUB_TYPE_NAME as description, 
VEHICLE_TYPE_ID as UnitMainTypeid, 
VERSION as version, 
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
0 as owner_id
from Eservice6.dbo.VEHICLE_SUB_TYPES UST where UST.EFFECTIVE_END_DATE_TIME > GETDATE() ;

UPDATE SanjelData_13.dbo.UnitSubType SET UnitMainTypeSystemId = r.system_id,UnitMainTypeName = r.name,UnitMainTypeDescription = r.description FROM UnitSubType u,(SELECT * FROM UnitMainType) r WHERE u.UnitMainTypeid=r.id;

-- Modify TruckUnit table  2019/02/20
DROP TABLE SanjelData_13.[dbo].[TruckUnit];

CREATE TABLE SanjelData_13.[dbo].[TruckUnit] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) NULL ,
[modified_user_name] nvarchar(50) NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) NULL ,
[description] nvarchar(500) NULL ,
[UnitMainTypeName] nvarchar(255) NULL ,
[ServicePointName] nvarchar(255) NULL ,
[UnitSubTypeName] nvarchar(255) NULL ,
[UnitMainTypeSystemId] int NULL ,
[ServicePointDescription] nvarchar(255) NULL ,
[UnitSubTypeid] int NULL ,
[ServicePointSystemId] int NULL ,
[UnitMainTypeDescription] nvarchar(255) NULL ,
[UnitNumber] nvarchar(255) NULL ,
[UnitMainTypeid] int NULL ,
[UnitSubTypeSystemId] int NULL ,
[ServicePointid] int NULL ,
[UnitSubTypeDescription] nvarchar(255) NULL 
);

-- Import TruckUnit data  2019/02/20
insert into SanjelData_13.dbo.TruckUnit(
id,
UnitNumber,
ServicePointId,
UnitMainTypeid,
UnitSubtypeid,
version,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id)
select 
ID as id, 
UNIT_NUMBER as UnitNumber, 
DISTRICT_ID as ServicePointId, 
UNIT_MAIN_TYPE_ID as UnitMainTypeid, 
UNIT_SUB_TYPE_ID as  UnitSubtypeid, 
VERSION as version, 
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
0 as owner_id
from Eservice6.dbo.TRUCK_UNITS OSP where OSP.EFFECTIVE_END_DATE_TIME > GETDATE() ;

-- Import UnitMainType/UnitSubType/ServicePoint data to TruckUnit  2019/02/20
UPDATE SanjelData_13.dbo.TruckUnit SET UnitMainTypeSystemId = r.system_id,UnitMainTypeName = r.name,UnitMainTypeDescription = r.description FROM TruckUnit t,(SELECT * FROM UnitMainType) r WHERE t.UnitMainTypeid=r.id;
UPDATE SanjelData_13.dbo.TruckUnit SET UnitSubTypeSystemId = r.system_id,UnitSubTypeName = r.name,UnitSubTypeDescription = r.description FROM TruckUnit t,(SELECT * FROM UnitSubType) r WHERE t.UnitSubTypeid=r.id;
UPDATE SanjelData_13.dbo.TruckUnit SET ServicePointSystemId = r.system_id,ServicePointName = r.name,ServicePointDescription = r.description FROM TruckUnit t,(SELECT * FROM ServicePoint) r WHERE t.ServicePointid=r.id;


-- Rename Crew to SanjelCrew  2019/02/25
CREATE TABLE SanjelData_13.[dbo].[SanjelCrew] (
[id] int NOT NULL IDENTITY(1,1) ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[HomeServicePointid] int NULL ,
[WorkingServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[WorkingServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[WorkingServicePointid] int NULL ,
[HomeServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[HomeServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Notes] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[WorkingServicePointSystemId] int NULL ,
[HomeServicePointSystemId] int NULL ,
[Typeid] int NULL 
);

SET IDENTITY_INSERT SanjelData_13.dbo.[SanjelCrew] ON
GO

INSERT INTO SanjelData_13.[dbo].[SanjelCrew] 
			([id]
			, [entity_status]
			, [owner_id]
			, [name]
			, [description]
			, [WorkingServicePointDescription]
			, [WorkingServicePointSystemId]
			, [HomeServicePointDescription]
			, [Typeid]
			, [WorkingServicePointName]
			, [Notes]
			, [WorkingServicePointid]
			, [HomeServicePointName]
			, [HomeServicePointid]
			, [HomeServicePointSystemId])
SELECT *
  FROM [Crew];

SET IDENTITY_INSERT SanjelData_13.dbo.[SanjelCrew] OFF
GO

EXEC sp_rename 'SanjelData_13.dbo.CrewSchedule.[Crewid]', 'SanjelCrewid' , 'COLUMN';
EXEC sp_rename 'SanjelData_13.dbo.CrewTruckUnitSection.[Crewid]', 'SanjelCrewid' , 'COLUMN';
EXEC sp_rename 'SanjelData_13.dbo.CrewWorkerSection.[Crewid]', 'SanjelCrewid' , 'COLUMN';
EXEC sp_rename 'SanjelData_13.dbo.RigJobCrewSection.[Crewid]', 'SanjelCrewid' , 'COLUMN';

DROP TABLE Crew;

-- SanjelCrew inherits Crew  2019/02/25
EXEC sp_rename 'SanjelData_13.dbo.RigJobCrewSection.[SanjelCrewid]', 'Crewid' , 'COLUMN';

-- Remove the association between CrewSchedule and Crew  2019/02/25
ALTER TABLE SanjelData_13.[dbo].[CrewSchedule] DROP COLUMN [SanjelCrewid];

-- Add the association between UnitSchedule and CrewTruckUnitSectionid  2019/02/25

ALTER TABLE SanjelData_13.[dbo].[UnitSchedule] ADD [CrewTruckUnitSectionid] int NULL ;

UPDATE SanjelData_13.[dbo].[UnitSchedule] SET CrewTruckUnitSectionid = r.id FROM UnitSchedule u,(SELECT * FROM CrewTruckUnitSection) r WHERE u.TruckUnitid=r.TruckUnitid;

-- ALTER TABLE SanjelData_13.[dbo].[UnitSchedule] DROP COLUMN [TruckUnitSystemId];

-- ALTER TABLE SanjelData_13.[dbo].[UnitSchedule] DROP COLUMN [TruckUnitDescription];

-- ALTER TABLE SanjelData_13.[dbo].[UnitSchedule] DROP COLUMN [TruckUnitName];

-- ALTER TABLE SanjelData_13.[dbo].[UnitSchedule] DROP COLUMN [TruckUnitid];

-- Add the association between RigJobCrewSection and SanjelCrewid  2019/02/26
EXEC sp_rename 'SanjelData_13.dbo.RigJobCrewSection.[Crewid]', 'SanjelCrewid' , 'COLUMN';

-- Add the association between WorkerSchedule and CrewWorkerSectionid  2019/02/26
ALTER TABLE SanjelData_13.[dbo].[WorkerSchedule] ADD [CrewWorkerSectionid] int NULL ;

UPDATE SanjelData_13.dbo.WorkerSchedule SET CrewWorkerSectionid = r.id FROM WorkerSchedule w,(SELECT * FROM CrewWorkerSection) r WHERE w.Workerid=r.Workerid;

-- ALTER TABLE SanjelData_13.[dbo].[WorkerSchedule] DROP COLUMN [WorkerSystemId];

-- ALTER TABLE SanjelData_13.[dbo].[WorkerSchedule] DROP COLUMN [WorkerDescription];

-- ALTER TABLE SanjelData_13.[dbo].[WorkerSchedule] DROP COLUMN [WorkerName];

-- ALTER TABLE SanjelData_13.[dbo].[WorkerSchedule] DROP COLUMN [Workerid];

-- Make Crew version controlled  2019/02/26
-- Revised by Adam 2019/02/28

-- Step 1: 使用下面的脚本新创建SanjelCrew1表
CREATE TABLE SanjelData_13.[dbo].[SanjelCrew1] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Notes] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[WorkingServicePointid] int NULL ,
[HomeServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[WorkingServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[HomeServicePointid] int NULL ,
[WorkingServicePointSystemId] int NULL ,
[HomeServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[WorkingServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[HomeServicePointSystemId] int NULL ,
[Typeid] int NULL 
);

-- Step 2: 将SanjelCrew中的数据重新插入到新创建的SanjelCrew1表中


INSERT INTO SanjelData_13.[dbo].[SanjelCrew1] 
			([id]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[HomeServicePointid]
      ,[WorkingServicePointName]
      ,[WorkingServicePointDescription]
      ,[WorkingServicePointid]
      ,[HomeServicePointName]
      ,[HomeServicePointDescription]
      ,[Notes]
      ,[WorkingServicePointSystemId]
      ,[HomeServicePointSystemId]
      ,[Typeid])
SELECT 
[id]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[HomeServicePointid]
      ,[WorkingServicePointName]
      ,[WorkingServicePointDescription]
      ,[WorkingServicePointid]
      ,[HomeServicePointName]
      ,[HomeServicePointDescription]
      ,[Notes]
      ,[WorkingServicePointSystemId]
      ,[HomeServicePointSystemId]
      ,[Typeid]

  FROM [SanjelCrew];


-- Step 3: 更新历史数据
UPDATE SanjelData_13.dbo.SanjelCrew1 SET version=1,modified_user_id=0,modified_datetime=N'2019-01-28 15:51:16.4570000',effective_start_datetime=N'2019-01-28 15:51:16.4570000',effective_end_datetime=N'9999-12-31 23:59:59.9970000',operation_type=1;

-- Step 4: 删除旧的SanjelCrew表
Drop table SanjelData_13.dbo.SanjelCrew;

-- Step 5: 将新建表改名为SanjelCrew

EXEC sp_rename 'SanjelData_13.dbo.SanjelCrew1', 'SanjelCrew';


-- Step 6: 更新与SanjelCrew相关的表数据
ALTER TABLE SanjelData_13.[dbo].[CrewTruckUnitSection] ADD [SanjelCrewName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE SanjelData_13.[dbo].[CrewTruckUnitSection] ADD [SanjelCrewDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE SanjelData_13.[dbo].[CrewTruckUnitSection] ADD [SanjelCrewSystemId] int NULL ;

ALTER TABLE SanjelData_13.[dbo].[CrewWorkerSection] ADD [SanjelCrewDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE SanjelData_13.[dbo].[CrewWorkerSection] ADD [SanjelCrewSystemId] int NULL ;

ALTER TABLE SanjelData_13.[dbo].[CrewWorkerSection] ADD [SanjelCrewName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE SanjelData_13.[dbo].[RigJobCrewSection] ADD [SanjelCrewName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE SanjelData_13.[dbo].[RigJobCrewSection] ADD [SanjelCrewDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE SanjelData_13.[dbo].[RigJobCrewSection] ADD [SanjelCrewSystemId] int NULL ;

UPDATE SanjelData_13.dbo.CrewTruckUnitSection SET SanjelCrewSystemId = r.system_id,SanjelCrewName = r.name,SanjelCrewDescription = r.description FROM CrewTruckUnitSection t,(SELECT * FROM SanjelCrew) r WHERE t.SanjelCrewid=r.id;

UPDATE SanjelData_13.dbo.CrewWorkerSection SET SanjelCrewSystemId = r.system_id,SanjelCrewName = r.name,SanjelCrewDescription = r.description FROM CrewWorkerSection t,(SELECT * FROM SanjelCrew) r WHERE t.SanjelCrewid=r.id;

UPDATE SanjelData_13.dbo.RigJobCrewSection SET SanjelCrewSystemId = r.system_id,SanjelCrewName = r.name,SanjelCrewDescription = r.description FROM RigJobCrewSection t,(SELECT * FROM SanjelCrew) r WHERE t.SanjelCrewid=r.id;


-- Modify for ThirdPartyBulkerCrew  2019/02/27

CREATE TABLE SanjelData_13.[dbo].[ContractorCompany] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
);

CREATE TABLE SanjelData_13.[dbo].[ThirdPartyBulkerCrew] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ContractorCompanyName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ContractorCompanySystemId] int NULL ,
[ContractorCompanyid] int NULL ,
[ContractorCompanyDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SupplierContactName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SupplierContactNumber] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Typeid] int NULL ,
[Notes] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ThirdPartyUnitNumber] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
);

CREATE TABLE SanjelData_13.[dbo].[ThirdPartyBulkerCrewSchedule] (
[id] int NOT NULL IDENTITY(1,1) ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[StartTime] datetime2(7) NULL ,
[EndTime] datetime2(7) NULL ,
[CrewScheduleTypeid] int NULL ,
[RigJobCrewSectionid] int NULL 
);

ALTER TABLE SanjelData_13.[dbo].[RigJobCrewSection] ADD [ThirdPartyBulkerCrewSystemId] int NULL ;

ALTER TABLE SanjelData_13.[dbo].[RigJobCrewSection] ADD [ThirdPartyBulkerCrewName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE SanjelData_13.[dbo].[RigJobCrewSection] ADD [ThirdPartyBulkerCrewDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE SanjelData_13.[dbo].[RigJobCrewSection] ADD [ThirdPartyBulkerCrewid] int NULL ;

insert into SanjelData_13.dbo.ContractorCompany(
id,
name,
description,
version,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id)
select 
ID as id, 
NAME as name, 
NAME as description, 
VERSION as version, 
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
0 as owner_id
from Eservice6.dbo.CONTRACTOR_COMPANIES c where c.EFFECTIVE_END_DATE_TIME > GETDATE() ;


-- Add test data to ThirdPartyBulkerCrew  2019/02/27
SET IDENTITY_INSERT SanjelData_13.[dbo].[ThirdPartyBulkerCrew] ON
GO
INSERT INTO SanjelData_13.[dbo].[ThirdPartyBulkerCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [ContractorCompanyName], [ContractorCompanySystemId], [ContractorCompanyid], [ContractorCompanyDescription], [SupplierContactName], [SupplierContactNumber], [Typeid], [Notes], [ThirdPartyUnitNumber]) VALUES (N'1', N'1', N'1', null, null, N'2019-02-27 13:55:20.0170000', N'1', N'2019-02-27 13:55:20.0170000', N'2019-02-27 14:04:23.2430000', N'0', N'0', N'test third party', N'test third party', N'Crazy Train Transport Ltd.', N'3', N'3', N'Crazy Train Transport Ltd.', N'Thomas', N'111-111-1112', N'3', N'TestNotes', N'666666')
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[ThirdPartyBulkerCrew] OFF
GO

-- Update effective_end_datetime for ThirdPartyBulkerCrew test data   2019/03/07
UPDATE SanjelDataTest.dbo.ThirdPartyBulkerCrew SET effective_end_datetime=N'9999-12-31 23:59:59.0000000' WHERE id=1;

-- Add association between UnitSchedule and TruckUnit   2019/03/07

ALTER TABLE SanjelData_13.[dbo].[UnitSchedule] ADD [TruckUnitDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE SanjelData_13.[dbo].[UnitSchedule] ADD [TruckUnitid] int NULL ;

ALTER TABLE SanjelData_13.[dbo].[UnitSchedule] ADD [TruckUnitSystemId] int NULL ;

ALTER TABLE SanjelData_13.[dbo].[UnitSchedule] ADD [TruckUnitName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

UPDATE SanjelData_13.dbo.UnitSchedule SET TruckUnitid = r.TruckUnitid,TruckUnitSystemId = r.TruckUnitSystemId,TruckUnitName = r.TruckUnitName,TruckUnitDescription = r.TruckUnitDescription FROM SanjelData_13.dbo.UnitSchedule t,(SELECT * FROM SanjelData_13.dbo.CrewTruckUnitSection) r WHERE t.CrewTruckUnitSectionid=r.id;

-- Add association between WorkerSchedule and Worker   2019/03/07

ALTER TABLE SanjelData_13.[dbo].[WorkerSchedule] ADD [Workerid] int NULL ;

ALTER TABLE SanjelData_13.[dbo].[WorkerSchedule] ADD [WorkerDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE SanjelData_13.[dbo].[WorkerSchedule] ADD [WorkerName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE SanjelData_13.[dbo].[WorkerSchedule] ADD [WorkerSystemId] int NULL ;

UPDATE SanjelData_13.dbo.WorkerSchedule SET Workerid = r.Workerid,WorkerSystemId = r.WorkerSystemId,WorkerName = r.WorkerName,WorkerDescription = r.WorkerDescription FROM SanjelData_13.dbo.WorkerSchedule t,(SELECT * FROM SanjelData_13.dbo.CrewWorkerSection) r WHERE t.CrewWorkerSectionid=r.id;

-- Synchronization table structure	2019/03/27

CREATE TABLE SanjelData_13.[dbo].[Bin] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
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
[DistrictDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BinTypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BinTypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BinNumber] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BinTypeid] int NULL ,
[Districtid] int NULL ,
[DistrictName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[DistrictSystemId] int NULL 
)
;

CREATE TABLE SanjelData_13.[dbo].[BinType] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
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

CREATE TABLE SanjelData_13.[dbo].[BlendCategory] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
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

CREATE TABLE SanjelData_13.[dbo].[CallSheet] (
[id] int NOT NULL IDENTITY(1,1) ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
;

CREATE TABLE SanjelData_13.[dbo].[ClientCompany] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
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

CREATE TABLE SanjelData_13.[dbo].[ClientConsultant] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
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

CREATE TABLE SanjelData_13.[dbo].[Country] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
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

CREATE TABLE SanjelData_13.[dbo].[DrillingCompany] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
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

CREATE TABLE SanjelData_13.[dbo].[HaulBonusType] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
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

CREATE TABLE SanjelData_13.[dbo].[JobLifeStatus] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) NULL ,
[modified_user_name] nvarchar(50) NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) NULL ,
[description] nvarchar(500) NULL 
);

CREATE TABLE SanjelData_13.[dbo].[JobType] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
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

CREATE TABLE SanjelData_13.[dbo].[ProductHaul] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) NULL ,
[modified_user_name] nvarchar(50) NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) NULL ,
[description] nvarchar(500) NULL ,
[CrewSystemId] int NULL ,
[ProductHaulLifeStatusName] nvarchar(255) NULL ,
[Crewid] int NULL ,
[IsGoWithCrew] bit NULL ,
[IsThirdParty] bit NULL ,
[ProductHaulLifeStatusid] int NULL ,
[TractorUnitName] nvarchar(255) NULL ,
[Comments] nvarchar(255) NULL ,
[BulkUnitDescription] nvarchar(255) NULL ,
[TractorUnitid] int NULL ,
[ThirdPartyUnitNumber] nvarchar(255) NULL ,
[Driver2SystemId] int NULL ,
[Driver2Name] nvarchar(255) NULL ,
[BulkUnitid] int NULL ,
[ProductHaulLifeStatusSystemId] int NULL ,
[DriverDescription] nvarchar(255) NULL ,
[BulkUnitSystemId] int NULL ,
[CrewName] nvarchar(255) NULL ,
[TractorUnitSystemId] int NULL ,
[ContractorCompanySystemId] int NULL ,
[Driverid] int NULL ,
[ContractorCompanyDescription] nvarchar(255) NULL ,
[DriverSystemId] int NULL ,
[DriverName] nvarchar(255) NULL ,
[SupplierContactName] nvarchar(255) NULL ,
[TractorUnitDescription] nvarchar(255) NULL ,
[BulkUnitName] nvarchar(255) NULL ,
[ContractorCompanyName] nvarchar(255) NULL ,
[SupplierContactNumber] nvarchar(255) NULL ,
[CrewDescription] nvarchar(255) NULL ,
[ProductHaulLifeStatusDescription] nvarchar(255) NULL ,
[ContractorCompanyid] int NULL ,
[Driver2Description] nvarchar(255) NULL ,
[Driver2id] int NULL 
);

CREATE TABLE SanjelData_13.[dbo].[ProductHaulLoad] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) NULL ,
[modified_user_name] nvarchar(50) NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) NULL ,
[description] nvarchar(500) NULL ,
[OnLocationTime] datetime2(7) NULL ,
[BlendSectionId] int NULL ,
[JobTypeName] nvarchar(255) NULL ,
[JobDate] datetime2(7) NULL ,
[JobTypeSystemId] int NULL ,
[BlendCategorySystemId] int NULL ,
[TotalBlendWeight] float(53) NULL ,
[BlendChemicalName] nvarchar(255) NULL ,
[JobTypeDescription] nvarchar(255) NULL ,
[CustomerSystemId] int NULL ,
[ServicePointDescription] nvarchar(255) NULL ,
[ProductHaulid] int NULL ,
[BlendCategoryName] nvarchar(255) NULL ,
[ServicePointName] nvarchar(255) NULL ,
[CustomerName] nvarchar(255) NULL ,
[ExpectedOnLocationTime] datetime2(7) NULL ,
[ProductHaulSystemId] int NULL ,
[BlendCategoryid] int NULL ,
[Comments] nvarchar(255) NULL ,
[BlendChemicalid] int NULL ,
[Binid] int NULL ,
[ServicePointid] int NULL ,
[BlendCategoryDescription] nvarchar(255) NULL ,
[BinDescription] nvarchar(255) NULL ,
[MixWater] float(53) NULL ,
[ProductHaulLoadLifeStatusDescription] nvarchar(255) NULL ,
[BlendChemicalDescription] nvarchar(255) NULL ,
[CallSheetNumber] int NULL ,
[ProductHaulLoadLifeStatusSystemId] int NULL ,
[ServicePointSystemId] int NULL ,
[CustomerDescription] nvarchar(255) NULL ,
[BlendChemicalSystemId] int NULL ,
[IsTotalBlendTonnage] bit NULL ,
[BinName] nvarchar(255) NULL ,
[LoadSheetSerialNumber] nvarchar(255) NULL ,
[ProductHaulLoadLifeStatusid] int NULL ,
[WellLocation] nvarchar(255) NULL ,
[BinSystemId] int NULL ,
[ProductHaulName] nvarchar(255) NULL ,
[IsGoWithCrew] bit NULL ,
[Customerid] int NULL ,
[ProductHaulLoadLifeStatusName] nvarchar(255) NULL ,
[ProductHaulDescription] nvarchar(255) NULL ,
[BaseBlendWeight] float(53) NULL ,
[JobTypeid] int NULL 
);

CREATE TABLE SanjelData_13.[dbo].[ProductHaulLoadStatus] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) NULL ,
[modified_user_name] nvarchar(50) NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) NULL ,
[description] nvarchar(500) NULL 
);

CREATE TABLE SanjelData_13.[dbo].[ProductHaulStatus] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) NULL ,
[modified_user_name] nvarchar(50) NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) NULL ,
[description] nvarchar(500) NULL 
);

CREATE TABLE SanjelData_13.[dbo].[ProductLoadSection] (
[id] int NOT NULL IDENTITY(1,1) ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BlendAdditiveMeasureUnitSystemId] int NULL ,
[RequiredAmount] float(53) NULL ,
[BlendAdditiveMeasureUnitid] int NULL ,
[ProductHaulLoadName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[AdditiveBlendMethodDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ProductHaulLoadDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BagSize] float(53) NULL ,
[BlendChemicalSystemId] int NULL ,
[BlendChemicalid] int NULL ,
[AdditiveBlendMethodid] int NULL ,
[BlendChemicalName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BlendAdditiveMeasureUnitName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BlendAdditiveMeasureUnitDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[IsFromBase] bit NULL ,
[NumberOfBags] float(53) NULL ,
[AdditiveBlendMethodName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ProductHaulLoadSystemId] int NULL ,
[LoadedAmount] float(53) NULL ,
[ProductHaulLoadid] int NULL ,
[BlendChemicalDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[AdditiveBlendMethodSystemId] int NULL 
)
;

CREATE TABLE SanjelData_13.[dbo].[ProvinceOrState] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
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

CREATE TABLE SanjelData_13.[dbo].[Rig] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) NULL ,
[modified_user_name] nvarchar(50) NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) NULL ,
[description] nvarchar(500) NULL ,
[IsTopDrive] bit NULL ,
[ThreadTypeName] nvarchar(255) NULL ,
[ThreadTypeSystemId] int NULL ,
[Sizeid] int NULL ,
[StatusDescription] nvarchar(255) NULL ,
[DrillingCompanyid] int NULL ,
[SizeDescription] nvarchar(255) NULL ,
[SizeName] nvarchar(255) NULL ,
[RigSizeSystemId] int NULL ,
[ThreadTypeid] int NULL ,
[DrillingCompanyName] nvarchar(255) NULL ,
[RigNumber] nvarchar(255) NULL ,
[RigSizeDescription] nvarchar(255) NULL ,
[DrillingCompanySystemId] int NULL ,
[StatusName] nvarchar(255) NULL ,
[StatusSystemId] int NULL ,
[IsServiceRig] bit NULL ,
[SizeSystemId] int NULL ,
[Statusid] int NULL ,
[IsProjectRig] bit NULL ,
[RigSizeName] nvarchar(255) NULL ,
[DrillingCompanyDescription] nvarchar(255) NULL ,
[ThreadTypeDescription] nvarchar(255) NULL ,
[RigSizeid] int NULL ,
[IsDeleted] bit NULL 
);

CREATE TABLE SanjelData_13.[dbo].[RigBinSection] (
[id] int NOT NULL IDENTITY(1,1) ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[OffLocation] datetime2(7) NULL ,
[HaulingTime] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[VolumePumped] float(53) NULL ,
[CallSheetid] int NULL ,
[BinSystemId] int NULL ,
[BinDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[RigDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[RigName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Rigid] int NULL ,
[OnLocation] datetime2(7) NULL ,
[RigSystemId] int NULL ,
[InitialVolume] float(53) NULL ,
[BinName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Binid] int NULL 
)
;


DROP TABLE SanjelData_13.[dbo].[RigJob]

CREATE TABLE SanjelData_13.[dbo].[RigJob] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) NULL ,
[modified_user_name] nvarchar(50) NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) NULL ,
[description] nvarchar(500) NULL ,
[WellLocation] nvarchar(255) NULL ,
[ClientConsultant1id] int NULL ,
[WellLocationTypeName] nvarchar(255) NULL ,
[IsProjectRig] bit NULL ,
[JobLifeStatusName] nvarchar(255) NULL ,
[JobLifeStatusSystemId] int NULL ,
[ServicePointName] nvarchar(255) NULL ,
[CallSheetId] int NULL ,
[IsListed] bit NULL ,
[ServicePointSystemId] int NULL ,
[IsDownholeLocation] bit NULL ,
[ClientCompanyid] int NULL ,
[JobNumber] int NULL ,
[RigStatusid] int NULL ,
[RigName] nvarchar(255) NULL ,
[WellLocationTypeid] int NULL ,
[WellLocationTypeDescription] nvarchar(255) NULL ,
[JobTypeDescription] nvarchar(255) NULL ,
[IsHighProfile] bit NULL ,
[Directions] nvarchar(1000) NULL ,
[IsNeedBins] bit NULL ,
[RigStatusName] nvarchar(255) NULL ,
[ProgramId] nvarchar(255) NULL ,
[JobLifeStatusDescription] nvarchar(255) NULL ,
[Rigid] int NULL ,
[RigStatusSystemId] int NULL ,
[JobTypeName] nvarchar(255) NULL ,
[Notes] nvarchar(500) NULL ,
[SurfaceLocation] nvarchar(255) NULL ,
[ClientCompanySystemId] int NULL ,
[JobDateTime] datetime2(7) NULL ,
[JobUniqueId] nvarchar(255) NULL ,
[WellLocationTypeSystemId] int NULL ,
[IsServiceRig] bit NULL ,
[ServicePointid] int NULL ,
[JobTypeid] int NULL ,
[CallSheetNumber] int NULL ,
[ClientConsultant2id] int NULL ,
[JobLifeStatusid] int NULL ,
[ClientCompanyName] nvarchar(255) NULL ,
[ClientConsultant2Description] nvarchar(255) NULL ,
[ServicePointDescription] nvarchar(255) NULL ,
[ClientConsultant2Name] nvarchar(255) NULL ,
[ClientConsultant1Name] nvarchar(255) NULL ,
[IsCoDCleared] bit NULL ,
[JobTypeSystemId] int NULL ,
[RigStatusDescription] nvarchar(255) NULL ,
[JobAlertId] int NULL ,
[ClientConsultant1Description] nvarchar(255) NULL ,
[ClientConsultant2SystemId] int NULL ,
[RigSystemId] int NULL ,
[ClientCompanyDescription] nvarchar(255) NULL ,
[ClientConsultant1SystemId] int NULL ,
[RigDescription] nvarchar(255) NULL ,
[ClientCompanyShortName] nvarchar(255) NULL 
);




ALTER TABLE SanjelData_13.[dbo].[RigJobCrewSection] ADD [RigJobSystemId] int NULL ;

ALTER TABLE SanjelData_13.[dbo].[RigJobCrewSection] ADD [RigJobName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE SanjelData_13.[dbo].[RigJobCrewSection] ADD [RigJobDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

UPDATE SanjelData_13.dbo.RigJobCrewSection SET RigJobSystemId = r.system_id,RigJobName = r.name,RigJobDescription = r.description FROM RigJobCrewSection t,(SELECT * FROM RigJob) r WHERE t.RigJobid=r.id;

CREATE TABLE SanjelData_13.[dbo].[RigSizeType] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
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

CREATE TABLE SanjelData_13.[dbo].[RigStatus] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) NULL ,
[modified_user_name] nvarchar(50) NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) NULL ,
[description] nvarchar(500) NULL 
);

CREATE TABLE SanjelData_13.[dbo].[SanjelCompany] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
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

CREATE TABLE SanjelData_13.[dbo].[ShiftType] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
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

CREATE TABLE SanjelData_13.[dbo].[ThirdPartyUnitSection] (
[id] int NOT NULL IDENTITY(1,1) ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ThirdPartyUnitNumber] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[CrewSystemId] int NULL ,
[Crewid] int NULL ,
[CrewName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SupplierContactName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BillofLadingMTSNumber] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ProductHaulName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[CallSheetid] int NULL ,
[UnitOnLocationDateTime] datetime2(7) NULL ,
[SupplierCompanyName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ProductHaulid] int NULL ,
[UnitOffLocationDateTime] datetime2(7) NULL ,
[ProductHaulDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[CrewDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SupplierContactNumber] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ProductHaulSystemId] int NULL 
)
;

CREATE TABLE SanjelData_13.[dbo].[ThreadType] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
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

CREATE TABLE SanjelData_13.[dbo].[UnitSection] (
[id] int NOT NULL IDENTITY(1,1) ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Operator2id] int NULL ,
[TractorMainTypeid] int NULL ,
[TractorSubtypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[HaulDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SanjelDistrictid] int NULL ,
[IsProductHaul] bit NULL ,
[TractorMainTypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Operator2Name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[WorkShiftSystemId] int NULL ,
[TractorSubtypeid] int NULL ,
[OffLocationSecond] datetime2(7) NULL ,
[CrewName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Passenger2Description] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Passenger1SystemId] int NULL ,
[WorkShiftDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Passenger1Description] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Passenger1Name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[OffLocation] datetime2(7) NULL ,
[SanjelDistrictName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ActualTimeDriven] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[HaulBonusTypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[MtsNumber] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[PercentOffRoad] float(53) NULL ,
[Crewid] int NULL ,
[IsJobBonusAndMba] bit NULL ,
[Operator2SystemId] int NULL ,
[TruckUnitid] int NULL ,
[TruckUnitName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[UnitSubtypeid] int NULL ,
[Operator1SystemId] int NULL ,
[Operator1Name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[HaulBonusTypeSystemId] int NULL ,
[TruckUnitDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[CallSheetid] int NULL ,
[UnitSubtypeSystemId] int NULL ,
[TractorUnitName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[UnitMainTypeSystemId] int NULL ,
[ProductHaulSystemId] int NULL ,
[UnitMainTypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[TractorSubtypeSystemId] int NULL ,
[UnitSubtypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Operator1id] int NULL ,
[ProductHaulName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[TruckUnitSystemId] int NULL ,
[TractorUnitid] int NULL ,
[WorkShiftid] int NULL ,
[CrewSystemId] int NULL ,
[ActualDistanceDriven] float(53) NULL ,
[Passenger1id] int NULL ,
[TractorUnitDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ProductHaulDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[TractorMainTypeSystemId] int NULL ,
[TractorMainTypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[OnLocationSecond] datetime2(7) NULL ,
[OnLocation] datetime2(7) NULL ,
[HaulBonusTypeid] int NULL ,
[SanjelDistrictSystemId] int NULL ,
[TractorSubtypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Operator2Description] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Passenger2SystemId] int NULL ,
[TractorUnitSystemId] int NULL ,
[UnitSubtypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Operator1Description] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Passenger2Name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[TwowayTravelTime] float(53) NULL ,
[NumberOfPassenger] int NULL ,
[WorkShiftName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Passenger2id] int NULL ,
[HaulBonusTypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ProductHaulid] int NULL ,
[UnitMainTypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[CrewDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SanjelDistrictDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[StandbyTimeOffLocation] float(53) NULL ,
[UnitMainTypeid] int NULL 
)
;

CREATE TABLE SanjelData_13.[dbo].[ValueUnitType] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Unit] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[Value] float(53) NULL 
)
;

CREATE TABLE SanjelData_13.[dbo].[WellLocationType] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
);


-- 导数据脚本

--导入BinType数据
insert into SanjelData_13.dbo.BinType(
id,
version,
name,
description,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
select 
ID as id, 
VERSION as version, 
DESCRIPTION as name,
DESCRIPTION as  description,
LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,

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
0 as owner_id
from Eservice6.dbo.BIN_TYPES b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;


--导入bin数据
insert into SanjelData_13.dbo.Bin(
id,
version,
description,
name,
BinNumber,
BinTypeid,
Districtid,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
select 
ID as id, 
VERSION as version, 
DESCRIPTION as description,
BIN_NUMBER as  name,
BIN_NUMBER as  BinNumber,
BIN_TYPE_ID as BinTypeid,
DISTRICT_ID as Districtid,
LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,

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
0 as owner_id
from Eservice6.dbo.BINS b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;

UPDATE SanjelData_13.dbo.Bin SET DistrictSystemId = r.system_id,DistrictName = r.name,DistrictDescription = r.description FROM Bin e,(SELECT * FROM ServicePoint) r WHERE e.Districtid=r.id;
UPDATE SanjelData_13.dbo.Bin SET BinTypeSystemId = r.system_id,BinTypeName = r.name,BinTypeDescription = r.description FROM Bin e,(SELECT * FROM BinType) r WHERE e.BinTypeid=r.id;


--导入rigsizeType数据
insert into SanjelData_13.dbo.RigSizeType(
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
from Eservice6.dbo.TYPE_VALUES where type_id = 56 and EFFECTIVE_END_DATE_TIME > GETDATE();


--导入ThreadType数据
insert into SanjelData_13.dbo.ThreadType(
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
from Eservice6.dbo.TYPE_VALUES where type_id = 32 and EFFECTIVE_END_DATE_TIME > GETDATE();


--导入ValueUnitType数据
SET IDENTITY_INSERT SanjelData_13.[dbo].[ValueUnitType] ON
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'1', N'1', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, null, null)
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'2', N'2', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'60.33', N'60.33', null, N'60.33')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'3', N'3', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'73.0', N'73.0', null, N'73.0')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'4', N'4', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'88.90', N'88.90', null, N'88.90')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'5', N'5', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'114.30', N'114.30', null, N'114.30')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'6', N'6', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'139.70', N'139.70', null, N'139.70')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'7', N'7', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'177.80', N'177.80', null, N'177.80')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'8', N'8', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'219.00', N'219.00', null, N'219.00')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'9', N'9', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'244.50', N'244.50', null, N'244.50')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'10', N'10', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'273.00', N'273.00', null, N'273.00')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'11', N'11', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'298.50', N'298.50', null, N'298.50')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'12', N'12', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'339.70', N'339.70', null, N'339.70')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'13', N'13', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'406.40', N'406.40', null, N'406.40')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'14', N'14', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'50.80', N'50.80', null, N'50.80')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'15', N'15', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'76.20', N'76.20', null, N'76.20')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'16', N'16', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'101.60', N'101.60', null, N'101.60')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'17', N'17', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'193.70', N'193.70', null, N'193.70')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'18', N'18', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'127.00', N'127.00', null, N'127.00')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'19', N'19', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'168.28', N'168.28', null, N'168.28')
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[ValueUnitType] OFF
GO



--导入ShiftType数据
insert into SanjelData_13.dbo.ShiftType(
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
from Eservice6.dbo.TYPE_VALUES where type_id = 104 and EFFECTIVE_END_DATE_TIME > GETDATE();

--导入JobLifeStatus数据
SET IDENTITY_INSERT SanjelData_13.[dbo].[JobLifeStatus] ON
GO
INSERT INTO SanjelData_13.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'0', N'1', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'None', N'None')
GO
GO
INSERT INTO SanjelData_13.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'2', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Alerted', N'Alerted')
GO
GO
INSERT INTO SanjelData_13.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'3', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Pending', N'Pending')
GO
GO
INSERT INTO SanjelData_13.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'3', N'4', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Confirmed', N'Confirmed')
GO
GO
INSERT INTO SanjelData_13.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'4', N'5', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Scheduled', N'Scheduled')
GO
GO
INSERT INTO SanjelData_13.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'5', N'6', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Dispatched', N'Dispatched')
GO
GO
INSERT INTO SanjelData_13.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'6', N'7', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Canceled', N'Canceled')
GO
GO
INSERT INTO SanjelData_13.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'7', N'8', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'InProgress', N'InProgress')
GO
GO
INSERT INTO SanjelData_13.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'8', N'9', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Completed', N'Completed')
GO
GO
INSERT INTO SanjelData_13.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'9', N'10', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Deleted', N'Deleted')
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[JobLifeStatus] OFF
GO

--导入RigStatus数据
SET IDENTITY_INSERT SanjelData_13.[dbo].[RigStatus] ON
GO
INSERT INTO SanjelData_13.[dbo].[RigStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'0', N'1', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'None', N'None')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'2', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Active', N'Active')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'3', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'DownForMaintenance', N'DownForMaintenance')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'3', N'4', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'DownForHoldingEquipment', N'DownForHoldingEquipment')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'4', N'5', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'DownForWeather', N'DownForWeather')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'5', N'6', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'DownForNewLeaseOrLicenses', N'DownForNewLeaseOrLicenses')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'6', N'7', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Deactivated', N'Deactivated')
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[RigStatus] OFF
GO


--导入jobType数据
insert into SanjelData_13.dbo.jobType(
id,
version,
name,
description,
ServiceLineid,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
select 
ID as id, 
VERSION as version, 
NAME as name,
DESCRIPTION as description,
SERVICE_LINE_ID as ServiceLineid,
LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,
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
0 as owner_id
from Eservice6.dbo.JOB_TYPES b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;



--导入ClientConsultant数据
insert into SanjelData_13.dbo.ClientConsultant(
id,
version,
name,
description,
Phone2,
Email,
WorkShiftid,
WorkShiftName,
Cell,
Clientid,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
select 
ID as id, 
VERSION as version, 
NAME as name,
NAME as description,
PHONE2 as  Phone2,
EMAIL as  Email,
WORK_SHIFT_TYPE_ID as  WorkShiftid,
WORK_SHIFT_TYPE_NAME as  WorkShiftName,
CELL as  Cell,
CLIENT_ID  as Clientid,
LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,

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
0 as owner_id
from Eservice6.dbo.CLIENT_CONSULTANTS b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;

UPDATE SanjelData_13.dbo.ClientConsultant SET WorkShiftSystemId = r.system_id,WorkShiftName = r.name,WorkShiftDescription = r.description FROM ClientConsultant e,(SELECT * FROM ShiftType) r WHERE e.WorkShiftid=r.id;


--导入WellLocationType数据
SET IDENTITY_INSERT SanjelData_13.[dbo].[WellLocationType] ON
GO
INSERT INTO SanjelData_13.[dbo].[WellLocationType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'1', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'General', N'General')
GO
GO
INSERT INTO SanjelData_13.[dbo].[WellLocationType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'2', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'Geo', N'Geo')
GO
GO
INSERT INTO SanjelData_13.[dbo].[WellLocationType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'3', N'3', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'Torrent', N'Torrent')
GO
GO
INSERT INTO SanjelData_13.[dbo].[WellLocationType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'4', N'4', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'Usa', N'Usa')
GO
GO
INSERT INTO SanjelData_13.[dbo].[WellLocationType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'5', N'5', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'NTS', N'NTS')
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[WellLocationType] OFF
GO


--导入ClientCompany数据
insert into SanjelData_13.dbo.ClientCompany(
id,
version,
name,
description,
BillingAddressPostalCode,
BillingAddressProvinceOrStateid,
AddressCity,
BillingAddressStreet4,
BillingAddressStreet3,
AddressPostalCode,
ShortName,
BillingAddressStreet,
AddressStreet2,
SanjelCompanyid,
AddressStreet,
AddressStreet3,
BillingAddressStreet2,
AddressProvinceOrStateid,
IsCODCustomer,
BillingAddressCity,
AddressStreet4,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
SELECT 
ID AS id,
VERSION AS version,
NAME AS name,
NAME AS description,
BILLING_ADDRESS_POSTAL_ZIP AS BillingAddressPostalCode,
BILLING_ADDRESS_PROV_STATE_ID AS BillingAddressProvinceOrStateid,
ADDRESS_CITY AS AddressCity,
BILLING_ADDRESS_STREET4 AS BillingAddressStreet4,
BILLING_ADDRESS_STREET3 AS BillingAddressStreet3,
ADDRESS_POSTAL_ZIP AS AddressPostalCode,
SHORT_NAME AS ShortName,
BILLING_ADDRESS_STREET AS BillingAddressStreet,
ADDRESS_STREET2 AS AddressStreet2,
SANJEL_COMPANY_ID AS SanjelCompanyid,
ADDRESS_STREET AS AddressStreet,
ADDRESS_STREET3 AS AddressStreet3,
BILLING_ADDRESS_STREET2 AS BillingAddressStreet2,
ADDRESS_PROV_STATE_ID AS AddressProvinceOrStateid,
IS_COD_CUSTOMER AS IsCODCustomer,
BILLING_ADDRESS_CITY AS BillingAddressCity,
ADDRESS_STREET4 AS AddressStreet4,
LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,
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
0 as owner_id
FROM Eservice6.dbo.COMPANIES 
where Eservice6.dbo.COMPANIES.EFFECTIVE_END_DATE_TIME > GETDATE() AND ID IN
(SELECT COMPANY_ID FROM Eservice6.dbo.COMPANIES_WITH_TYPES WHERE TYPE_ID!=3);


--导入DrillingCompany数据
insert into SanjelData_13.dbo.DrillingCompany(
id,
version,
name,
description,
BillingAddressPostalCode,
BillingAddressProvinceOrStateid,
AddressCity,
BillingAddressStreet4,
BillingAddressStreet3,
AddressPostalCode,
ShortName,
BillingAddressStreet,
AddressStreet2,
SanjelCompanyid,
AddressStreet,
AddressStreet3,
BillingAddressStreet2,
AddressProvinceOrStateid,
IsCODCustomer,
BillingAddressCity,
AddressStreet4,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
SELECT 
ID AS id,
VERSION AS version,
NAME AS name,
NAME AS description,
BILLING_ADDRESS_POSTAL_ZIP AS BillingAddressPostalCode,
BILLING_ADDRESS_PROV_STATE_ID AS BillingAddressProvinceOrStateid,
ADDRESS_CITY AS AddressCity,
BILLING_ADDRESS_STREET4 AS BillingAddressStreet4,
BILLING_ADDRESS_STREET3 AS BillingAddressStreet3,
ADDRESS_POSTAL_ZIP AS AddressPostalCode,
SHORT_NAME AS ShortName,
BILLING_ADDRESS_STREET AS BillingAddressStreet,
ADDRESS_STREET2 AS AddressStreet2,
SANJEL_COMPANY_ID AS SanjelCompanyid,
ADDRESS_STREET AS AddressStreet,
ADDRESS_STREET3 AS AddressStreet3,
BILLING_ADDRESS_STREET2 AS BillingAddressStreet2,
ADDRESS_PROV_STATE_ID AS AddressProvinceOrStateid,
IS_COD_CUSTOMER AS IsCODCustomer,
BILLING_ADDRESS_CITY AS BillingAddressCity,
ADDRESS_STREET4 AS AddressStreet4,
LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,
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
0 as owner_id
FROM Eservice6.dbo.COMPANIES 
where Eservice6.dbo.COMPANIES.EFFECTIVE_END_DATE_TIME > GETDATE() AND ID IN
(SELECT COMPANY_ID FROM Eservice6.dbo.COMPANIES_WITH_TYPES WHERE TYPE_ID=3);



--导入Rig数据
insert into SanjelData_13.dbo.Rig(
id,
version,
name,
description,
DrillingCompanyid,
DrillingCompanyName,
ThreadTypeid,
IsServiceRig,
RigNumber,
IsProjectRig,
IsDeleted,
IsTopDrive,
RigSizeid,
ThreadTypeName,
Sizeid,
RigSizeName,
SizeName,
Statusid,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
select 
ID as id, 
VERSION as version, 
NAME as name,
NAME as description,
DRILLINGCOMPANY_ID as DrillingCompanyid,
DRILLINGCOMPANY_NAME as DrillingCompanyName,
THREAD_TYPE_ID as ThreadTypeid,
IS_SERVICE_RIG as IsServiceRig,
RIG_NO as RigNumber,
IS_PROJECT_RIG as IsProjectRig,
IS_DELETED as IsDeleted,
IS_TOP_DRIVE as IsTopDrive,
RIG_SIZE_TYPE_ID as RigSizeid,
THREAD_TYPE_NAME as ThreadTypeName,
0 as Sizeid,
RIG_SIZE_TYPE_NAME RigSizeName,
null as SizeName,
STATUS as Statusid,
LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,
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
0 as owner_id
from Eservice6.dbo.RIGS b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;

UPDATE SanjelData_13.dbo.Rig SET StatusSystemId = r.system_id,StatusName = r.name,StatusDescription = r.description FROM Rig e,(SELECT * FROM RigStatus) r WHERE e.Statusid=r.id;
UPDATE SanjelData_13.dbo.Rig SET DrillingCompanySystemId = r.system_id,DrillingCompanyName = r.name,DrillingCompanyDescription = r.description FROM Rig e,(SELECT * FROM DrillingCompany) r WHERE e.DrillingCompanyid=r.id;


--导入rigJob数据

alter table SanjelData_13.dbo.RigJob alter column Notes nvarchar(500);
alter table SanjelData_13.dbo.RigJob alter column Directions nvarchar(1000);
insert into SanjelData_13.dbo.RigJob(
id,
version,
JobLifeStatusid,
Rigid,
Directions,
IsListed,
Notes,
IsDownholeLocation,
ClientConsultant2id,
IsNeedBins,
JobAlertId,
IsHighProfile,
JobDateTime,
ServicePointid,
WellLocationTypeid,
CallSheetId,
CallSheetNumber,
IsCoDCleared,
ProgramId,
SurfaceLocation,
WellLocation,
JobUniqueId,
ClientConsultant1id,
JobTypeid,
ClientCompanyid,
IsServiceRig,
IsProjectRig,
RigStatusid,
ClientCompanyShortName,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
select 
ID as id, 
VERSION as version, 
JOB_LIFE_STATUS as JobLifeStatusid,
RIG_ID as Rigid,
DIRECTION as Directions,
IS_LISTED as IsListed,
NOTES as Notes,
IS_DOWNHOLE_LOCATION as IsDownholeLocation,
CLIENT_CONSULTANT2_ID as ClientConsultant2id,
IS_NEED_BIN as IsNeedBins,
JOB_ALERT_ID as JobAlertId,
IS_HIGH_PROFILE_JOB as IsHighProfile,
JOB_DATE_TIME as JobDateTime,
SERVICE_POINT_ID as ServicePointid,
WELL_LOCATION_TYPE_ID as WellLocationTypeid,
CALL_SHEET_ID as CallSheetId,
CALL_SHEET_NUMBER as CallSheetNumber,
IS_COD_CLEARED as IsCoDCleared,
PROGRAM_ID as ProgramId,
SURFACE_LOCATION as SurfaceLocation,
WELL_LOCATION as WellLocation,
JOB_UNIQUE_ID as JobUniqueId,
CLIENT_CONSULTANT1_ID  as ClientConsultant1id,
JOB_TYPE_ID as JobTypeid,
CLIENT_COMPANY_ID as ClientCompanyid,
IS_SERVICE_RIG as IsServiceRig,
IS_PROJECT_RIG as IsProjectRig,
RIG_STATUS as RigStatusid,
CLIENT_COMPANY_SHORTNAME as ClientCompanyShortName,
LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,

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
0 as owner_id
from Eservice6.dbo.RIG_JOB b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;

UPDATE SanjelData_13.dbo.RigJob SET JobTypeSystemId = r.system_id,JobTypeName = r.name,JobTypeDescription = r.description FROM RigJob e,(SELECT * FROM JobType) r WHERE e.JobTypeid=r.id;
UPDATE SanjelData_13.dbo.RigJob SET ClientConsultant1SystemId = r.system_id,ClientConsultant1Name = r.name,ClientConsultant1Description = r.description FROM RigJob e,(SELECT * FROM ClientConsultant) r WHERE e.ClientConsultant1id=r.id;
UPDATE SanjelData_13.dbo.RigJob SET ClientConsultant2SystemId = r.system_id,ClientConsultant2Name = r.name,ClientConsultant2Description = r.description FROM RigJob e,(SELECT * FROM ClientConsultant) r WHERE e.ClientConsultant2id=r.id;
UPDATE SanjelData_13.dbo.RigJob SET WellLocationTypeSystemId = r.system_id,WellLocationTypeName = r.name,WellLocationTypeDescription = r.description FROM RigJob e,(SELECT * FROM WellLocationType) r WHERE e.WellLocationTypeid=r.id;
UPDATE SanjelData_13.dbo.RigJob SET ClientCompanySystemId = r.system_id,ClientCompanyName = r.name,ClientCompanyDescription = r.description FROM RigJob e,(SELECT * FROM ClientCompany) r WHERE e.ClientCompanyid=r.id;
UPDATE SanjelData_13.dbo.RigJob SET RigSystemId = r.system_id,RigName = r.name,RigDescription = r.description FROM RigJob e,(SELECT * FROM Rig) r WHERE e.Rigid=r.id;
UPDATE SanjelData_13.dbo.RigJob SET ServicePointSystemId = r.system_id,ServicePointName = r.name,ServicePointDescription = r.description FROM RigJob e,(SELECT * FROM ServicePoint) r WHERE e.ServicePointid=r.id;
UPDATE SanjelData_13.dbo.RigJob SET JobLifeStatusSystemId = r.system_id,JobLifeStatusName = r.name,JobLifeStatusDescription = r.description FROM RigJob e,(SELECT * FROM JobLifeStatus) r WHERE e.JobLifeStatusid=r.id;
UPDATE SanjelData_13.dbo.RigJob SET RigStatusSystemId = r.system_id,RigStatusName = r.name,RigStatusDescription = r.description FROM RigJob e,(SELECT * FROM RigStatus) r WHERE e.RigStatusid=r.id;


--导入ServiceLine数据
insert into SanjelData_13.dbo.ServiceLine(
id,
version,
name,
description,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
select 
ID as id, 
VERSION as version, 
NAME as name,
DESCRIPTION as description,
LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,
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
0 as owner_id
from Eservice6.dbo.SERVICE_LINES b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;



--导入BlendCategory数据
insert into SanjelData_13.dbo.BlendCategory(
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
from Eservice6.dbo.TYPE_VALUES where type_id = 6 and DESCRIPTION is not null and EFFECTIVE_END_DATE_TIME > GETDATE();


--导入Country数据
insert into SanjelData_13.dbo.Country(
id,
version,
name,
description,
ISOAlpha2,
ISOAlpha3,
ISONumber,
PercentFuelSurcharge,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
select 
ID as id, 
VERSION as version, 
NAME as name,
NAME as description,
ISO as ISOAlpha2,
ISO3 as ISOAlpha3,
NUMCODE as ISONumber,
SURCHARGE_PERCENT as PercentFuelSurcharge,
LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,
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
0 as owner_id
from Eservice6.dbo.COUNTRIES b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;

--导入HaulBonusType数据
insert into SanjelData_13.dbo.HaulBonusType(
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
from Eservice6.dbo.TYPE_VALUES where type_id = 110 and DESCRIPTION is not null and EFFECTIVE_END_DATE_TIME > GETDATE();



--导入ProductHaulLoadStatus数据
SET IDENTITY_INSERT SanjelData_13.[dbo].[ProductHaulLoadStatus] ON
GO
INSERT INTO SanjelData_13.[dbo].[ProductHaulLoadStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'0', N'1', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Empty', N'Empty')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ProductHaulLoadStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'2', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Scheduled', N'Scheduled')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ProductHaulLoadStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'3', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'OnLocation', N'OnLocation')
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[ProductHaulLoadStatus] OFF
GO



--导入ProductHaulStatus数据
SET IDENTITY_INSERT SanjelData_13.[dbo].[ProductHaulStatus] ON
GO
INSERT INTO SanjelData_13.[dbo].[ProductHaulStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'0', N'1', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Empty', N'Empty')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ProductHaulStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'2', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Pending', N'Pending')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ProductHaulStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'3', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Scheduled', N'Scheduled')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ProductHaulStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'3', N'4', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'InProgress', N'InProgress')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ProductHaulStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'4', N'5', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'OnLocation', N'OnLocation')
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[ProductHaulStatus] OFF
GO


--导入productHaul数据
insert into SanjelData_13.dbo.productHaul(
id,
version,
Comments,
Driverid,
Driver2id,
BulkUnitid,
TractorUnitid,
IsThirdParty,
ContractorCompanyid,
ContractorCompanyName,
ThirdPartyUnitNumber,
SupplierContactName,
SupplierContactNumber,
IsGoWithCrew,
ProductHaulLifeStatusid,
Crewid,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
select 
ID as id, 
VERSION as version, 
COMMENTS as Comments,
DRIVER_ID as Driverid,
DRIVER2_ID as Driver2id,
BULK_UNIT_ID as BulkUnitid,
TRACTOR_UNIT_ID as TractorUnitid,
IS_THIRD_PARTY as IsThirdParty,
SUPPLIER_COMPANY_ID as ContractorCompanyid,
SUPPLIER_COMPANY_NAME as ContractorCompanyName,
THIRD_PARTY_UNIT_NUMBER as ThirdPartyUnitNumber,
SUPPLIER_CONTACT_NAME as SupplierContactName,
SUPPLIER_CONTACT_NUMBER as SupplierContactNumber,
IS_GO_WITH_CREW as IsGoWithCrew,
PRODUCT_HAUL_LIFE_STATUS as ProductHaulLifeStatusid,
CREW_ID as Crewid,
LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,
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
0 as owner_id
from Eservice6.dbo.PRODUCT_HAUL b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;

UPDATE SanjelData_13.dbo.productHaul SET ProductHaulLifeStatusSystemId = r.system_id,ProductHaulLifeStatusName = r.name,ProductHaulLifeStatusDescription = r.description FROM productHaul e,(SELECT * FROM ProductHaulStatus) r WHERE e.ProductHaulLifeStatusid=r.id;



--导入ProductHaulLoad数据

insert into SanjelData_13.dbo.ProductHaulLoad(
id,
version,
ExpectedOnLocationTime,
JobDate,
CallSheetNumber,
IsGoWithCrew,
ServicePointid,
JobTypeid,
BinName,
Binid,
BlendChemicalid,
IsTotalBlendTonnage,
OnLocationTime,
Comments,
ProductHaulLoadLifeStatusid,
ProductHaulid,
LoadSheetSerialNumber,
TotalBlendWeight,
BaseBlendWeight,
BlendCategoryid,
BlendSectionId,
WellLocation,
Customerid,
MixWater,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
select 
ID as id, 
VERSION as version, 
EXPECTED_ON_LOCATION_TIME as ExpectedOnLocationTime,
JOB_DATE as JobDate,
CALL_SHEET_NUMBER as CallSheetNumber,
IS_GO_WITH_CREW as IsGoWithCrew,
SERVICE_POINT_ID as ServicePointid,
JOB_TYPE_ID as JobTypeid,
BIN_NUMBER as BinName,
BIN_ID as Binid,
BASE_BLEND_CHEMICAL_ID  as BlendChemicalid,
IS_TOTAL_BLEND_TONNAGE as IsTotalBlendTonnage,
ON_LOCATION_TIME as OnLocationTime,
COMMENTS as Comments,
PRODUCT_HAUL_LOAD_LIFE_STATUS as ProductHaulLoadLifeStatusid,
ROOT_ID as ProductHaulid,
LOAD_SHEET_SERIAL_NUMBER as LoadSheetSerialNumber,
TOTAL_BLEND_WEIGHT as TotalBlendWeight,
BASE_BLEND_WEIGHT as BaseBlendWeight,
BLEND_CATEGORY_ID as BlendCategoryid,
BLEND_SECTION_ID as BlendSectionId,
WELL_LOCATION as WellLocation,
CUSTOMER_COMPANY_ID as Customerid,
MIX_WATER as MixWater,

LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,
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
ROOT_ID as owner_id
from Eservice6.dbo.PH_PRODUCT_HAUL_LOAD_SCTNS b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;

UPDATE SanjelData_13.dbo.ProductHaulLoad SET ProductHaulLoadLifeStatusid = 0 WHERE ProductHaulLoadLifeStatusid IS NULL;
UPDATE SanjelData_13.dbo.ProductHaulLoad SET ProductHaulLoadLifeStatusSystemId = r.system_id,ProductHaulLoadLifeStatusName = r.name,ProductHaulLoadLifeStatusDescription = r.description FROM ProductHaulLoad e,(SELECT * FROM ProductHaulLoadStatus) r WHERE e.ProductHaulLoadLifeStatusid=r.id;
UPDATE SanjelData_13.dbo.ProductHaulLoad SET ServicePointSystemId = r.system_id,ServicePointName = r.name,ServicePointDescription = r.description FROM ProductHaulLoad e,(SELECT * FROM ServicePoint) r WHERE e.ServicePointid=r.id;
UPDATE SanjelData_13.dbo.ProductHaulLoad SET BlendChemicalSystemId = r.system_id,BlendChemicalName = r.name,BlendChemicalDescription = r.description FROM ProductHaulLoad e,(SELECT * FROM BlendChemical) r WHERE e.BlendChemicalid=r.id;
UPDATE SanjelData_13.dbo.ProductHaulLoad SET ProductHaulSystemId = r.system_id,ProductHaulName = r.name,ProductHaulDescription = r.description FROM ProductHaulLoad e,(SELECT * FROM ProductHaul) r WHERE e.ProductHaulid=r.id;
UPDATE SanjelData_13.dbo.ProductHaulLoad SET BlendCategorySystemId = r.system_id,BlendCategoryName = r.name,BlendCategoryDescription = r.description FROM ProductHaulLoad e,(SELECT * FROM BlendCategory) r WHERE e.BlendCategoryid=r.id;
UPDATE SanjelData_13.dbo.ProductHaulLoad SET CustomerSystemId = r.system_id,CustomerName = r.name,CustomerDescription = r.description FROM ProductHaulLoad e,(SELECT * FROM ClientCompany) r WHERE e.Customerid=r.id;
UPDATE SanjelData_13.dbo.ProductHaulLoad SET JobTypeSystemId = r.system_id,JobTypeName = r.name,JobTypeDescription = r.description FROM ProductHaulLoad e,(SELECT * FROM JobType) r WHERE e.JobTypeid=r.id;
UPDATE SanjelData_13.dbo.ProductHaulLoad SET BinSystemId = r.system_id,BinName = r.name,BinDescription = r.description FROM ProductHaulLoad e,(SELECT * FROM Bin) r WHERE e.Binid=r.id;




SET IDENTITY_INSERT SanjelData_13.[dbo].[BlendAdditiveMeasureUnit] ON
GO
INSERT INTO SanjelData_13.[dbo].[BlendAdditiveMeasureUnit] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [MeaureUnitTypeName], [Abbreviation], [MeaureUnitTypeDescription], [MeaureUnitTypeSystemId], [MeasureUnitSystemDescription], [MeasureUnitSystemId], [MeasureUnitSystemSystemId], [MeaureUnitTypeId], [MeasureUnitSystemName]) VALUES (N'5', N'13', N'1', N'0', N'', N'2008-03-20 15:21:11.0000000', null, N'2016-06-01 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Kilograms', N'', N'Weight', N'kg', N'', N'28', N'', N'1', N'5', N'2', N'Metric')
GO
GO
INSERT INTO SanjelData_13.[dbo].[BlendAdditiveMeasureUnit] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [MeaureUnitTypeName], [Abbreviation], [MeaureUnitTypeDescription], [MeaureUnitTypeSystemId], [MeasureUnitSystemDescription], [MeasureUnitSystemId], [MeasureUnitSystemSystemId], [MeaureUnitTypeId], [MeasureUnitSystemName]) VALUES (N'6', N'14', N'1', N'0', N'', N'2008-03-20 15:21:11.0000000', null, N'2016-06-01 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Liters', N'', N'Volume', N'l', N'', N'29', N'', N'1', N'5', N'3', N'Metric')
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[BlendAdditiveMeasureUnit] OFF
GO


--导入ProductLoadSection数据
SET IDENTITY_INSERT SanjelData_13.[dbo].[ProductLoadSection] ON
insert into SanjelData_13.dbo.ProductLoadSection(
id,
RequiredAmount,
BlendAdditiveMeasureUnitid,
BagSize,
BlendChemicalid,
AdditiveBlendMethodid,
IsFromBase,
NumberOfBags,
LoadedAmount,
ProductHaulLoadid,
entity_status,
owner_id
)
select 
ID as id, 
REQUIRED_AMOUNT as RequiredAmount, 
5 as BlendAdditiveMeasureUnitid, 
BAG_SIZE as BagSize, 
BLEND_CHEMICAL_ID as BlendChemicalid, 
ADDITIVE_BLEND_METHOD as AdditiveBlendMethodid, 
IS_FROM_BASE as IsFromBase, 
NUMBER_OF_BAGS as NumberOfBags, 
LOADED_AMOUNT as LoadedAmount, 
PARENT_ID as ProductHaulLoadid, 
0 as ENTITY_STATUS,
ROOT_ID as owner_id
from Eservice6.dbo.PH_PRODUCT_LOAD_SCTNS;
SET IDENTITY_INSERT SanjelData_13.[dbo].[ProductLoadSection] OFF

UPDATE SanjelData_13.dbo.ProductLoadSection SET BlendAdditiveMeasureUnitSystemId = r.system_id,BlendAdditiveMeasureUnitName = r.name,BlendAdditiveMeasureUnitDescription = r.description FROM ProductLoadSection e,(SELECT * FROM BlendAdditiveMeasureUnit) r WHERE e.BlendAdditiveMeasureUnitid=r.id;
UPDATE SanjelData_13.dbo.ProductLoadSection SET BlendChemicalSystemId = r.system_id,BlendChemicalName = r.name,BlendChemicalDescription = r.description FROM ProductLoadSection e,(SELECT * FROM BlendChemical) r WHERE e.BlendChemicalid=r.id;
UPDATE SanjelData_13.dbo.ProductLoadSection SET AdditiveBlendMethodSystemId = r.system_id,AdditiveBlendMethodName = r.name,AdditiveBlendMethodDescription = r.description FROM ProductLoadSection e,(SELECT * FROM AdditiveBlendMethod) r WHERE e.AdditiveBlendMethodid=r.id;
UPDATE SanjelData_13.dbo.ProductLoadSection SET ProductHaulLoadSystemId = r.system_id,ProductHaulLoadName = r.name,ProductHaulLoadDescription = r.description FROM ProductLoadSection e,(SELECT * FROM ProductHaulLoad) r WHERE e.ProductHaulLoadid=r.id;


--导入ProvinceOrState数据
insert into SanjelData_13.dbo.ProvinceOrState(
id,
version,
name,
description,
PercentSalesSurcharge,
Countryid,
Capital,
Code,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
select 
ID as id, 
VERSION as version, 
NAME as name,
NAME as description,
SURCHARGE_PERCENT as PercentFuelSurcharge,
COUNTRY_ID as Countryid,
CAPITAL as Capital,
CODE as Code,
LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,
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
0 as owner_id
from Eservice6.dbo.PROVINCE_STATES b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;


--SanjelCompany
insert into SanjelData_13.dbo.SanjelCompany(
id,
name,
version,
Countryid,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id)
select 
ID as id, 
NAME as name, 
VERSION as version, 
COUNTRY_ID as Countryid, 
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
0 as owner_id
from Eservice6.dbo.SANJEL_COMPANIES s where s.EFFECTIVE_END_DATE_TIME > GETDATE() ;



--导入BIN_ASSIGNMENT、CSH_BIN_SCTNS到RigBinSection中
SET IDENTITY_INSERT SanjelData_13.[dbo].[RigBinSection] ON
insert into SanjelData_13.dbo.RigBinSection(
id,
Binid,
BinName,
Rigid,
RigName,
entity_status,
owner_id
)
select 
ID as id, 
BIN_ID as Binid, 
BIN_NUMBER as BinName,
RIG_ID as  Rigid,
RIG_NAME as RigName,
0 as ENTITY_STATUS,
0 as owner_id
from Eservice6.dbo.BIN_ASSIGNMENT b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;
SET IDENTITY_INSERT SanjelData_13.[dbo].[RigBinSection] OFF


SET IDENTITY_INSERT SanjelData_13.[dbo].[RigBinSection] ON
UPDATE  SanjelData_13.dbo.RigBinSection  SET
OnLocation=b.ON_LOCATION,
OffLocation=b.OFF_LOCATION,
HaulingTime=b.HAULING_TIME,
VolumePumped=b.VOLUME_PUMPED,
CallSheetid=b.ROOT_ID,
InitialVolume=b.INITIAL_VOLUME FROM SanjelData_13.dbo.RigBinSection a,
(SELECT *FROM Eservice6.dbo.CSH_BIN_SCTNS )b
WHERE b.BIN_ID=a.Binid;
SET IDENTITY_INSERT SanjelData_13.[dbo].[RigBinSection] OFF


--导入UnitSection数据
SET IDENTITY_INSERT SanjelData_13.[dbo].[UnitSection] ON
insert into SanjelData_13.dbo.UnitSection(
id,
Operator2id,
TractorMainTypeid,
SanjelDistrictid,
IsProductHaul,
TractorSubtypeid,
OffLocationSecond,
OffLocation,
ActualTimeDriven,
MtsNumber,
PercentOffRoad,
Crewid,
IsJobBonusAndMba,
TruckUnitid,
UnitSubtypeid,
CallSheetid,
Operator1id,
TractorUnitid,
ActualDistanceDriven,
Passenger1id,
OnLocationSecond,
OnLocation,
HaulBonusTypeid,
TwowayTravelTime,
NumberOfPassenger,
Passenger2id,
ProductHaulid,
StandbyTimeOffLocation,
UnitMainTypeid,
entity_status,
owner_id
)
select 
ID as id, 
OPERATOR2_ID as Operator2id, 
TRACTOR_MAIN_TYPE_ID as TractorMainTypeid, 
DISTRICT_ID as SanjelDistrictid, 
IS_PRODUCT_HAUL as IsProductHaul, 
TRACTOR_SUB_TYPE_ID as TractorSubtypeid, 
OFF_LOCATION_SECOND as OffLocationSecond, 
OFF_LOCATION as OffLocationSecond, 
ACTUAL_TIME_DRIVEN as ActualTimeDriven, 
MTS_NUMBER as MtsNumber, 
PERCENT_OFF_ROAD as PercentOffRoad, 
CREW_ID as Crewid, 
IS_JOB_BONUS_AND_MBA as IsJobBonusAndMba, 
TRUCK_UNIT_ID as TruckUnitid, 
VEHICLE_SUB_TYPE_ID as UnitSubtypeid, 
ROOT_ID as CallSheetid, 
OPERATOR1_ID as Operator1id, 
TRACTOR_UNIT_ID as TractorUnitid, 
ACTUAL_DISTANCE_DRIVEN as ActualDistanceDriven, 
PASSENGER1_ID as Passenger1id, 
ON_LOCATION_SECOND as OnLocationSecond, 
ON_LOCATION as OnLocation, 
HAUL_BONUS_TYPE_ID as HaulBonusTypeid, 
TWOWAY_TRAVEL_TIME as TwowayTravelTime, 
NUMBER_OF_PASSENGER as NumberOfPassenger, 
PASSENGER2_ID as Passenger2id, 
PRODUCT_HAUL_ID as ProductHaulid, 
STANDBY_TIME_OFFLOCATION as StandbyTimeOffLocation, 
UNIT_MAIN_TYPE_ID as UnitMainTypeid, 

0 as ENTITY_STATUS,
0 as owner_id
from Eservice6.dbo.CSH_UNIT_SCTNS;
SET IDENTITY_INSERT SanjelData_13.[dbo].[UnitSection] OFF

UPDATE SanjelData_13.dbo.UnitSection SET Operator2SystemId = r.system_id,Operator2Name = r.name,Operator2Description = r.description FROM UnitSection e,(SELECT * FROM Employee) r WHERE e.Operator2id=r.id;
UPDATE SanjelData_13.dbo.UnitSection SET TractorMainTypeSystemId = r.system_id,TractorMainTypeName = r.name,TractorMainTypeDescription = r.description FROM UnitSection e,(SELECT * FROM UnitMainType) r WHERE e.TractorMainTypeid=r.id;
UPDATE SanjelData_13.dbo.UnitSection SET SanjelDistrictSystemId = r.system_id,SanjelDistrictName = r.name,SanjelDistrictDescription = r.description FROM UnitSection e,(SELECT * FROM ServicePoint) r WHERE e.SanjelDistrictid=r.id;
UPDATE SanjelData_13.dbo.UnitSection SET TractorSubtypeSystemId = r.system_id,TractorSubtypeName = r.name,TractorSubtypeDescription = r.description FROM UnitSection e,(SELECT * FROM UnitSubType) r WHERE e.TractorSubtypeid=r.id;
UPDATE SanjelData_13.dbo.UnitSection SET TruckUnitSystemId = r.system_id,TruckUnitName = r.name,TruckUnitDescription = r.description FROM UnitSection e,(SELECT * FROM TruckUnit) r WHERE e.TruckUnitid=r.id;
UPDATE SanjelData_13.dbo.UnitSection SET UnitSubtypeSystemId = r.system_id,UnitSubtypeName = r.name,UnitSubtypeDescription = r.description FROM UnitSection e,(SELECT * FROM UnitSubType) r WHERE e.UnitSubtypeid=r.id;
UPDATE SanjelData_13.dbo.UnitSection SET Operator1SystemId = r.system_id,Operator1Name = r.name,Operator1Description = r.description FROM UnitSection e,(SELECT * FROM Employee) r WHERE e.Operator1id=r.id;
UPDATE SanjelData_13.dbo.UnitSection SET TractorUnitSystemId = r.system_id,TractorUnitName = r.name,TractorUnitDescription = r.description FROM UnitSection e,(SELECT * FROM TruckUnit) r WHERE e.TractorUnitid=r.id;
UPDATE SanjelData_13.dbo.UnitSection SET Passenger1SystemId = r.system_id,Passenger1Name = r.name,Passenger1Description = r.description FROM UnitSection e,(SELECT * FROM Employee) r WHERE e.Passenger1id=r.id;
UPDATE SanjelData_13.dbo.UnitSection SET HaulBonusTypeSystemId = r.system_id,HaulBonusTypeName = r.name,HaulBonusTypeDescription = r.description FROM UnitSection e,(SELECT * FROM HaulBonusType) r WHERE e.HaulBonusTypeid=r.id;
UPDATE SanjelData_13.dbo.UnitSection SET Passenger2SystemId = r.system_id,Passenger2Name = r.name,Passenger2Description = r.description FROM UnitSection e,(SELECT * FROM Employee) r WHERE e.Passenger2id=r.id;
UPDATE SanjelData_13.dbo.UnitSection SET ProductHaulSystemId = r.system_id,ProductHaulName = r.name,ProductHaulDescription = r.description FROM UnitSection e,(SELECT * FROM ProductHaul) r WHERE e.ProductHaulid=r.id;
UPDATE SanjelData_13.dbo.UnitSection SET UnitMainTypeSystemId = r.system_id,UnitMainTypeName = r.name,UnitMainTypeDescription = r.description FROM UnitSection e,(SELECT * FROM UnitMainType) r WHERE e.UnitMainTypeid=r.id;

--导入ThirdPartyUnitSection数据
SET IDENTITY_INSERT SanjelData_13.[dbo].[ThirdPartyUnitSection] ON
insert into SanjelData_13.dbo.ThirdPartyUnitSection(
id,
ThirdPartyUnitNumber,
Crewid,
SupplierContactName,
BillofLadingMTSNumber,
CallSheetid,
UnitOnLocationDateTime,
ProductHaulid,
SupplierCompanyName,
UnitOffLocationDateTime,
SupplierContactNumber,
entity_status,
owner_id
)
select 
ID as id,
THIRD_PARTY_UNIT_NUMBER as ThirdPartyUnitNumber,
CREW_ID as Crewid,
SUPPLIER_CONTACT_NAME as SupplierContactName,
BILL_OF_LADING_MTS_NUMBER as BillofLadingMTSNumber,
ROOT_ID as CallSheetid,
UNIT_ON_LOC_DTIME as UnitOnLocationDateTime,
PRODUCT_HAUL_ID as ProductHaulid,
SUPPLIER_COMPANY_NAME as SupplierCompanyName,
UNIT_OFF_LOC_DTIME as UnitOffLocationDateTime,
SUPPLIER_CONTACT_NUMBER as SupplierContactNumber,
0 as ENTITY_STATUS,
0 as owner_id
from Eservice6.dbo.CSH_3RD_PARTY_UNIT_SCTNS;
SET IDENTITY_INSERT SanjelData_13.[dbo].[ThirdPartyUnitSection] OFF

UPDATE SanjelData_13.dbo.ThirdPartyUnitSection SET ProductHaulSystemId = r.system_id,ProductHaulName = r.name,ProductHaulDescription = r.description FROM ThirdPartyUnitSection e,(SELECT * FROM ProductHaul) r WHERE e.ProductHaulid=r.id;


CREATE TABLE SanjelData_13.[dbo].[BinStatus] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
);



EXEC sp_rename 'SanjelData_13.dbo.Bin.[Districtid]', 'HomeServicePointid' , 'COLUMN';
EXEC sp_rename 'SanjelData_13.dbo.Bin.[DistrictName]', 'HomeServicePointName' , 'COLUMN';
EXEC sp_rename 'SanjelData_13.dbo.Bin.[DistrictSystemId]', 'HomeServicePointSystemId' , 'COLUMN';
EXEC sp_rename 'SanjelData_13.dbo.Bin.[DistrictDescription]', 'HomeServicePointDescription' , 'COLUMN';

ALTER TABLE SanjelData_13.[dbo].[Bin] ADD [WorkingServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE SanjelData_13.[dbo].[Bin] ADD [BinStatusDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE SanjelData_13.[dbo].[Bin] ADD [BinStatusName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE SanjelData_13.[dbo].[Bin] ADD [WorkingServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE SanjelData_13.[dbo].[Bin] ADD [BinStatusSystemId] int NULL ;

ALTER TABLE SanjelData_13.[dbo].[Bin] ADD [BinStatusid] int NULL ;

ALTER TABLE SanjelData_13.[dbo].[Bin] ADD [WorkingServicePointid] int NULL ;

ALTER TABLE SanjelData_13.[dbo].[Bin] ADD [WorkingServicePointSystemId] int NULL ;

UPDATE SanjelData_13.dbo.Bin SET WorkingServicePointid=HomeServicePointid,WorkingServicePointSystemId=HomeServicePointSystemId,WorkingServicePointName=HomeServicePointName,WorkingServicePointDescription=HomeServicePointDescription;


-- 2019/04/08

CREATE TABLE SanjelData_13.[dbo].[RigSize] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
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
);

--导入RigSize数据
SET IDENTITY_INSERT SanjelData_13.[dbo].[RigSize] ON
GO
INSERT INTO SanjelData_13.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'1', N'1', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, null, null)
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'2', N'2', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'60.33', N'60.33', null, N'60.33')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'3', N'3', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'73.0', N'73.0', null, N'73.0')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'4', N'4', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'88.90', N'88.90', null, N'88.90')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'5', N'5', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'114.30', N'114.30', null, N'114.30')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'6', N'6', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'139.70', N'139.70', null, N'139.70')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'7', N'7', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'177.80', N'177.80', null, N'177.80')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'8', N'8', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'219.00', N'219.00', null, N'219.00')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'9', N'9', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'244.50', N'244.50', null, N'244.50')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'10', N'10', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'273.00', N'273.00', null, N'273.00')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'11', N'11', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'298.50', N'298.50', null, N'298.50')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'12', N'12', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'339.70', N'339.70', null, N'339.70')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'13', N'13', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'406.40', N'406.40', null, N'406.40')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'14', N'14', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'50.80', N'50.80', null, N'50.80')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'15', N'15', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'76.20', N'76.20', null, N'76.20')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'16', N'16', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'101.60', N'101.60', null, N'101.60')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'17', N'17', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'193.70', N'193.70', null, N'193.70')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'18', N'18', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'127.00', N'127.00', null, N'127.00')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'19', N'19', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'168.28', N'168.28', null, N'168.28')
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[RigSize] OFF
GO

UPDATE SanjelData_13.dbo.Rig SET ThreadTypeSystemId = r.system_id,ThreadTypeName = r.name,ThreadTypeDescription = r.description FROM Rig e,(SELECT * FROM ThreadType) r WHERE e.ThreadTypeid=r.id;
UPDATE SanjelData_13.dbo.Rig SET RigSizeSystemId = r.system_id,RigSizeName = r.name,RigSizeDescription = r.description FROM Rig e,(SELECT * FROM RigSizeType) r WHERE e.RigSizeid=r.id;
UPDATE SanjelData_13.dbo.Rig SET SizeName = r.SIZE_TYPE_VALUE FROM Rig e,(SELECT * FROM Eservice6.dbo.RIGS) r WHERE e.id=r.ID;
UPDATE SanjelData_13.dbo.Rig SET SizeSystemId = r.system_id,Sizeid = r.id,SizeDescription = r.description FROM Rig e,(SELECT * FROM RigSize) r WHERE e.SizeName=r.value;


CREATE TABLE SanjelData_13.[dbo].[UnitOfMeasure] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
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

CREATE TABLE SanjelData_13.[dbo].[UnitOfMeasureSystemOfUnits] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
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

CREATE TABLE SanjelData_13.[dbo].[UnitOfMeasureType] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
);

--导入UnitOfMeasureType数据
SET IDENTITY_INSERT SanjelData_13.[dbo].[UnitOfMeasureType] ON
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'0', N'1', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Quantity', N'Quantity')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'2', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Length', N'Length')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'3', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Area', N'Area')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'3', N'4', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'LiquidVolume', N'Liquid volume')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'4', N'5', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'DryVolume', N'Dry volume')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'5', N'6', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Mass', N'Mass')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'6', N'7', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Time', N'Time')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'7', N'8', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Monetary', N'Monetary')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'8', N'9', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Temperature', N'Temperature')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'9', N'10', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Information entropy', N'InformationEntropy')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'10', N'11', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Luminance', N'Luminance')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'11', N'12', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Speed', N'Speed')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'12', N'13', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Acceleration', N'Acceleration')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'13', N'14', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Angle', N'Angle')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'14', N'15', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'SolidAngle', N'Solid angle')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'15', N'16', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Force', N'Force')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'16', N'17', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Pressure', N'Pressure or mechanical stress')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'17', N'18', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Torque', N'Torque')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'18', N'19', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Energy', N'Energy')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'19', N'20', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Power', N'Power')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'20', N'21', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'AngularMomentum', N'Angular momentum')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'21', N'22', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Capacitance', N'Capacitance')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'22', N'23', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Density', N'Density')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'23', N'24', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'ElectricCurrent', N'Electric current')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'24', N'25', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'MagneticField', N'Magnetic field')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'25', N'26', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'MagneticFlux', N'Magnetic flux')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'26', N'27', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'ElectricCharge', N'Electric charge')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'27', N'28', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'ElectricDipole', N'Electric dipole')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'28', N'29', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'ElectricPotential', N'Electric potential')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'29', N'30', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'ElectricalResistance', N'Electrical resistance')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'30', N'31', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Inductance', N'Inductance')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'31', N'32', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'DynamicViscosity', N'Dynamic viscosity')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'32', N'33', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'KinematicViscosity', N'Kinematic viscosity')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'33', N'34', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Radioactivity', N'Radioactivity')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'34', N'35', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Undefined', N'Undefined')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'100', N'36', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'SBSComposite', N'SBSComposite')
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[UnitOfMeasureType] OFF
GO


--导入UnitOfMeasureSystemOfUnits数据
SET IDENTITY_INSERT SanjelData_13.[dbo].[UnitOfMeasureSystemOfUnits] ON
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureSystemOfUnits] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'0', N'1', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'None', N'None')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureSystemOfUnits] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'2', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Metric', N'Metric units')
GO
GO
INSERT INTO SanjelData_13.[dbo].[UnitOfMeasureSystemOfUnits] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'3', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'US', N'United States customary units')
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[UnitOfMeasureSystemOfUnits] OFF
GO


--导入UnitOfMeasure数据
insert into SanjelData_13.dbo.UnitOfMeasure(
id,
version,
name,
description,
UnitOfMeasureSystemOfUnitsid,
BaseMultiplier,
IsUseBaseMultiplier,
SecondaryUnitOfMeasureid,
UnitOfMeasureTypeid,
IsCompositeUnit,
PrimaryUnitOfMeasureid,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
select 
ID as id, 
VERSION as version, 
NAME as name,
DESCRIPTION as description,
SYSTEM_OF_UNIT as UnitOfMeasureSystemOfUnitsid,
BASE_MULTIPLIER as BaseMultiplier,
IS_USE_BASE_MULTIPLIER as IsUseBaseMultiplier,
SECONDARY_UOM_ID as SecondaryUnitOfMeasureid,
UNIT_CLASS as UnitOfMeasureTypeid,
IS_COMPOSITE_UNIT as IsCompositeUnit,
PRIMARY_UOM_ID as PrimaryUnitOfMeasureid,

LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,
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
0 as owner_id
from Eservice6.dbo.UNIT_OF_MEASURE b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;

UPDATE SanjelData_13.dbo.UnitOfMeasure SET UnitOfMeasureSystemOfUnitsSystemId = r.system_id,UnitOfMeasureSystemOfUnitsName = r.name,UnitOfMeasureSystemOfUnitsDescription = r.description FROM UnitOfMeasure e,(SELECT * FROM UnitOfMeasureSystemOfUnits) r WHERE e.UnitOfMeasureSystemOfUnitsid=r.id;
UPDATE SanjelData_13.dbo.UnitOfMeasure SET SecondaryUnitOfMeasureSystemId = r.system_id,SecondaryUnitOfMeasureName = r.name,SecondaryUnitOfMeasureDescription = r.description FROM UnitOfMeasure e,(SELECT * FROM UnitOfMeasure) r WHERE e.SecondaryUnitOfMeasureid=r.id;
UPDATE SanjelData_13.dbo.UnitOfMeasure SET PrimaryUnitOfMeasureSystemId = r.system_id,PrimaryUnitOfMeasureName = r.name,PrimaryUnitOfMeasureDescription = r.description FROM UnitOfMeasure e,(SELECT * FROM UnitOfMeasure) r WHERE e.PrimaryUnitOfMeasureid=r.id;





-- 2019/04/09

CREATE TABLE SanjelData_13.[dbo].[RigJobThirdPartyBulkerCrewSection] (
[id] int NOT NULL IDENTITY(1,1) ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[RigJobName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[RigJobSystemId] int NULL ,
[ThirdPartyBulkerCrewName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[RigJobCrewSectionStatusid] int NULL ,
[ThirdPartyBulkerCrewid] int NULL ,
[ThirdPartyBulkerCrewDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ThirdPartyBulkerCrewSystemId] int NULL ,
[RigJobDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[RigJobid] int NULL 
);

ALTER TABLE SanjelData_13.[dbo].[ThirdPartyBulkerCrewSchedule] ADD [RigJobThirdPartyBulkerCrewSectionid] int NULL ;

ALTER TABLE SanjelData_13.[dbo].[ThirdPartyBulkerCrewSchedule] DROP COLUMN [RigJobCrewSectionid];

-- 2019/04/11

DROP TABLE SanjelData_13.[dbo].[HaulBonusType];

DROP TABLE SanjelData_13.[dbo].[ThirdPartyUnitSection];

DROP TABLE SanjelData_13.[dbo].[UnitSection];

ALTER TABLE SanjelData_13.[dbo].[Bin] DROP COLUMN [BinNumber];

ALTER TABLE SanjelData_13.[dbo].[RigBinSection] DROP COLUMN [OffLocation];

ALTER TABLE SanjelData_13.[dbo].[RigBinSection] DROP COLUMN [CallSheetid];

ALTER TABLE SanjelData_13.[dbo].[RigBinSection] DROP COLUMN [InitialVolume];

ALTER TABLE SanjelData_13.[dbo].[RigBinSection] DROP COLUMN [OnLocation];

ALTER TABLE SanjelData_13.[dbo].[RigBinSection] DROP COLUMN [VolumePumped];

ALTER TABLE SanjelData_13.[dbo].[RigBinSection] DROP COLUMN [HaulingTime];



-- 2019/04/22

ALTER TABLE MasterDataManagement.[dbo].[UnitSchedule] ADD [WorkingServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[UnitSchedule] ADD [WorkingServicePointSystemId] int NULL ;

ALTER TABLE MasterDataManagement.[dbo].[UnitSchedule] ADD [WorkingServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[UnitSchedule] ADD [WorkingServicePointid] int NULL ;


ALTER TABLE MasterDataManagement.[dbo].[WorkerSchedule] ADD [WorkingServicePointid] int NULL ;

ALTER TABLE MasterDataManagement.[dbo].[WorkerSchedule] ADD [WorkingServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[WorkerSchedule] ADD [WorkingServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[WorkerSchedule] ADD [WorkingServicePointSystemId] int NULL ;


ALTER TABLE MasterDataManagement.[dbo].[CrewSchedule] ADD [SanjelCrewSystemId] int NULL ;

ALTER TABLE MasterDataManagement.[dbo].[CrewSchedule] ADD [SanjelCrewid] int NULL ;

ALTER TABLE MasterDataManagement.[dbo].[CrewSchedule] ADD [WorkingServicePointSystemId] int NULL ;

ALTER TABLE MasterDataManagement.[dbo].[CrewSchedule] ADD [WorkingServicePointid] int NULL ;

ALTER TABLE MasterDataManagement.[dbo].[CrewSchedule] ADD [SanjelCrewDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[CrewSchedule] ADD [WorkingServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[CrewSchedule] ADD [WorkingServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[CrewSchedule] ADD [SanjelCrewName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

UPDATE MasterDataManagement.[dbo].CrewSchedule SET SanjelCrewid = r.SanjelCrewid FROM MasterDataManagement.[dbo].CrewSchedule e,(SELECT * FROM MasterDataManagement.[dbo].RigJobCrewSection) r WHERE e.RigJobCrewSectionid=r.id;

UPDATE MasterDataManagement.[dbo].CrewSchedule SET SanjelCrewSystemId = r.system_id,SanjelCrewName = r.name,SanjelCrewDescription = r.description FROM MasterDataManagement.[dbo].CrewSchedule e,(SELECT * FROM MasterDataManagement.[dbo].SanjelCrew) r WHERE e.SanjelCrewid=r.id;

-- 2019/04/23
ALTER TABLE MasterDataManagement.[dbo].[ProductHaul] ADD [Scheduleid] int NULL ;

ALTER TABLE MasterDataManagement.[dbo].[ProductHaul] ADD [EstimatedLoadTime] datetime2(7) NULL ;


ALTER TABLE MasterDataManagement.[dbo].[ThirdPartyBulkerCrewSchedule] ADD [ThirdPartyBulkerCrewName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[ThirdPartyBulkerCrewSchedule] ADD [ThirdPartyBulkerCrewSystemId] int NULL ;

ALTER TABLE MasterDataManagement.[dbo].[ThirdPartyBulkerCrewSchedule] ADD [ThirdPartyBulkerCrewid] int NULL ;

ALTER TABLE MasterDataManagement.[dbo].[ThirdPartyBulkerCrewSchedule] ADD [ThirdPartyBulkerCrewDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[ProductHaul] ADD [EstimatedTravelTime] float(53) NULL ;

-- 2019/04/25

-- Update third party crew description for history data
UPDATE MasterDataManagement.[dbo].ThirdPartyBulkerCrew SET description=ContractorCompanyName+' | '+ThirdPartyUnitNumber;
-- Update third party crew name for history data
UPDATE MasterDataManagement.[dbo].ThirdPartyBulkerCrew SET name=ThirdPartyUnitNumber;


-- Update crew description for history data
UPDATE MasterDataManagement.dbo.SanjelCrew SET description=name;
-- Update crew name for history data
UPDATE MasterDataManagement.dbo.SanjelCrew SET name=r.UnitNumber FROM 
MasterDataManagement.dbo.SanjelCrew s,
(SELECT b.SanjelCrewid,b.system_id,b.id,b.TruckUnitid,a.UnitNumber FROM MasterDataManagement.dbo.TruckUnit a,
(SELECT SanjelCrewid,system_id,id,TruckUnitid FROM MasterDataManagement.dbo.CrewTruckUnitSection WHERE id NOT IN(SELECT id FROM MasterDataManagement.dbo.CrewTruckUnitSection WHERE entity_status = 1))b
 WHERE a.id=b.TruckUnitid)r WHERE r.SanjelCrewid=s.id

-- 2019/04/26

EXEC sp_rename 'MasterDataManagement.dbo.CrewWorkerSection', 'SanjelCrewWorkerSection';
EXEC sp_rename 'MasterDataManagement.dbo.CrewTruckUnitSection', 'SanjelCrewTruckUnitSection';
EXEC sp_rename 'MasterDataManagement.dbo.RigJobCrewSection', 'RigJobSanjelCrewSection';
EXEC sp_rename 'MasterDataManagement.dbo.CrewSchedule', 'SanjelCrewSchedule';

EXEC sp_rename 'MasterDataManagement.dbo.SanjelCrewSchedule.[RigJobCrewSectionid]', 'RigJobSanjelCrewSectionid' , 'COLUMN';

ALTER TABLE MasterDataManagement.[dbo].[SanjelCrew] ADD [Rotation] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;


-- 2019/04/29

ALTER TABLE MasterDataManagement.[dbo].[RigJobSanjelCrewSection] ADD [ProductHaulDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[RigJobSanjelCrewSection] ADD [ProductHaulName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[RigJobSanjelCrewSection] ADD [ProductHaulid] int NULL ;

ALTER TABLE MasterDataManagement.[dbo].[RigJobSanjelCrewSection] ADD [ProductHaulSystemId] int NULL ;

ALTER TABLE MasterDataManagement.[dbo].[RigJobThirdPartyBulkerCrewSection] ADD [ProductHaulSystemId] int NULL ;

ALTER TABLE MasterDataManagement.[dbo].[RigJobThirdPartyBulkerCrewSection] ADD [ProductHaulDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[RigJobThirdPartyBulkerCrewSection] ADD [ProductHaulName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[RigJobThirdPartyBulkerCrewSection] ADD [ProductHaulid] int NULL ;

-- Update RigJobSanjelCrewSection history data
UPDATE MasterDataManagement.dbo.RigJobSanjelCrewSection SET 
ProductHaulid= r.pId, 
ProductHaulSystemId= r.system_id, 
ProductHaulName= r.name, 
ProductHaulDescription= r.description 
 FROM MasterDataManagement.dbo.RigJobSanjelCrewSection rcs,(SELECT cs.SanjelCrewid,p.id pId,p.name,p.system_id,p.description FROM MasterDataManagement.dbo.RigJobSanjelCrewSection rs, MasterDataManagement.dbo.SanjelCrewSchedule cs, MasterDataManagement.dbo.ProductHaul p
 WHERE rs.SanjelCrewid = cs.SanjelCrewid AND p.Scheduleid=cs.id AND p.IsThirdParty=0)r WHERE rcs.SanjelCrewid=r.SanjelCrewid;

-- Update RigJobThirdPartyBulkerCrewSection history data
UPDATE MasterDataManagement.dbo.RigJobThirdPartyBulkerCrewSection SET 
ProductHaulid= r.pId, 
ProductHaulSystemId= r.system_id, 
ProductHaulName= r.name, 
ProductHaulDescription= r.description 
 FROM MasterDataManagement.dbo.RigJobThirdPartyBulkerCrewSection rcs,(SELECT cs.ThirdPartyBulkerCrewid,p.id pId,p.name,p.system_id,p.description FROM MasterDataManagement.dbo.RigJobThirdPartyBulkerCrewSection rs, MasterDataManagement.dbo.ThirdPartyBulkerCrewSchedule cs, MasterDataManagement.dbo.ProductHaul p
 WHERE rs.ThirdPartyBulkerCrewid = cs.ThirdPartyBulkerCrewid AND p.Scheduleid=cs.id AND p.IsThirdParty=1)r WHERE rcs.ThirdPartyBulkerCrewid=r.ThirdPartyBulkerCrewid;

-- 2019/05/05

CREATE TABLE MasterDataManagement.[dbo].[RigJobSanjelCrewSection1] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) NULL ,
[modified_user_name] nvarchar(50) NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) NULL ,
[description] nvarchar(500) NULL ,
[SanjelCrewid] int NULL ,
[ProductHaulDescription] nvarchar(255) NULL ,
[SanjelCrewSystemId] int NULL ,
[SanjelCrewName] nvarchar(255) NULL ,
[RigJobCrewSectionStatusid] int NULL ,
[RigJobid] int NULL ,
[SanjelCrewDescription] nvarchar(255) NULL ,
[ProductHaulName] nvarchar(255) NULL ,
[RigJobDescription] nvarchar(255) NULL ,
[ProductHaulid] int NULL ,
[RigJobSystemId] int NULL ,
[RigJobName] nvarchar(255) NULL ,
[ProductHaulSystemId] int NULL 
);

INSERT INTO MasterDataManagement.[dbo].[RigJobSanjelCrewSection1] 
			([id]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[RigJobCrewSectionStatusid]
      ,[RigJobid]
      ,[SanjelCrewid]
      ,[SanjelCrewName]
      ,[SanjelCrewDescription]
      ,[SanjelCrewSystemId]
      ,[RigJobSystemId]
      ,[RigJobName]
      ,[RigJobDescription]
      ,[ProductHaulDescription]
      ,[ProductHaulName]
      ,[ProductHaulid]
      ,[ProductHaulSystemId])
SELECT 
[id]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[RigJobCrewSectionStatusid]
      ,[RigJobid]
      ,[SanjelCrewid]
      ,[SanjelCrewName]
      ,[SanjelCrewDescription]
      ,[SanjelCrewSystemId]
      ,[RigJobSystemId]
      ,[RigJobName]
      ,[RigJobDescription]
      ,[ProductHaulDescription]
      ,[ProductHaulName]
      ,[ProductHaulid]
      ,[ProductHaulSystemId]
  FROM MasterDataManagement.[dbo].[RigJobSanjelCrewSection];

UPDATE MasterDataManagement.dbo.RigJobSanjelCrewSection1 SET version=1,modified_user_id=0,modified_datetime=N'2019-01-28 15:51:16.4570000',effective_start_datetime=N'2019-01-28 15:51:16.4570000',effective_end_datetime=N'9999-12-31 23:59:59.9970000',operation_type=1;

Drop table MasterDataManagement.dbo.RigJobSanjelCrewSection;

EXEC sp_rename 'MasterDataManagement.dbo.RigJobSanjelCrewSection1', 'RigJobSanjelCrewSection';



ALTER TABLE MasterDataManagement.[dbo].[SanjelCrewSchedule] ADD [RigJobSanjelCrewSectionName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[SanjelCrewSchedule] ADD [RigJobSanjelCrewSectionSystemId] int NULL ;

ALTER TABLE MasterDataManagement.[dbo].[SanjelCrewSchedule] ADD [RigJobSanjelCrewSectionDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

UPDATE MasterDataManagement.dbo.SanjelCrewSchedule SET RigJobSanjelCrewSectionSystemId = r.system_id,RigJobSanjelCrewSectionName = r.name,RigJobSanjelCrewSectionDescription = r.description FROM SanjelCrewSchedule t,(SELECT * FROM RigJobSanjelCrewSection) r WHERE t.RigJobSanjelCrewSectionid=r.id;



CREATE TABLE [dbo].[RigJobThirdPartyBulkerCrewSection1] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] nvarchar(50) NULL ,
[modified_user_name] nvarchar(50) NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) NULL ,
[description] nvarchar(500) NULL ,
[ProductHaulSystemId] int NULL ,
[ThirdPartyBulkerCrewid] int NULL ,
[RigJobCrewSectionStatusid] int NULL ,
[ThirdPartyBulkerCrewName] nvarchar(255) NULL ,
[ProductHaulDescription] nvarchar(255) NULL ,
[RigJobid] int NULL ,
[ProductHaulName] nvarchar(255) NULL ,
[ThirdPartyBulkerCrewDescription] nvarchar(255) NULL ,
[ThirdPartyBulkerCrewSystemId] int NULL ,
[RigJobDescription] nvarchar(255) NULL ,
[ProductHaulid] int NULL ,
[RigJobSystemId] int NULL ,
[RigJobName] nvarchar(255) NULL 
);

INSERT INTO MasterDataManagement.[dbo].[RigJobThirdPartyBulkerCrewSection1] 
			([id]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[RigJobName]
      ,[RigJobSystemId]
      ,[ThirdPartyBulkerCrewName]
      ,[RigJobCrewSectionStatusid]
      ,[ThirdPartyBulkerCrewid]
      ,[ThirdPartyBulkerCrewDescription]
      ,[ThirdPartyBulkerCrewSystemId]
      ,[RigJobDescription]
      ,[RigJobid]
      ,[ProductHaulSystemId]
      ,[ProductHaulDescription]
      ,[ProductHaulName]
      ,[ProductHaulid])
SELECT 
[id]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[RigJobName]
      ,[RigJobSystemId]
      ,[ThirdPartyBulkerCrewName]
      ,[RigJobCrewSectionStatusid]
      ,[ThirdPartyBulkerCrewid]
      ,[ThirdPartyBulkerCrewDescription]
      ,[ThirdPartyBulkerCrewSystemId]
      ,[RigJobDescription]
      ,[RigJobid]
      ,[ProductHaulSystemId]
      ,[ProductHaulDescription]
      ,[ProductHaulName]
      ,[ProductHaulid]
  FROM MasterDataManagement.[dbo].[RigJobThirdPartyBulkerCrewSection];

UPDATE MasterDataManagement.dbo.RigJobThirdPartyBulkerCrewSection1 SET version=1,modified_user_id=0,modified_datetime=N'2019-01-28 15:51:16.4570000',effective_start_datetime=N'2019-01-28 15:51:16.4570000',effective_end_datetime=N'9999-12-31 23:59:59.9970000',operation_type=1;

Drop table MasterDataManagement.dbo.RigJobThirdPartyBulkerCrewSection;

EXEC sp_rename 'MasterDataManagement.dbo.RigJobThirdPartyBulkerCrewSection1', 'RigJobThirdPartyBulkerCrewSection';



ALTER TABLE MasterDataManagement.[dbo].[ThirdPartyBulkerCrewSchedule] ADD [RigJobThirdPartyBulkerCrewSectionName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[ThirdPartyBulkerCrewSchedule] ADD [RigJobThirdPartyBulkerCrewSectionSystemId] int NULL ;

ALTER TABLE MasterDataManagement.[dbo].[ThirdPartyBulkerCrewSchedule] ADD [RigJobThirdPartyBulkerCrewSectionDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

UPDATE MasterDataManagement.dbo.ThirdPartyBulkerCrewSchedule SET RigJobThirdPartyBulkerCrewSectionSystemId = r.system_id,RigJobThirdPartyBulkerCrewSectionName = r.name,RigJobThirdPartyBulkerCrewSectionDescription = r.description FROM ThirdPartyBulkerCrewSchedule t,(SELECT * FROM RigJobThirdPartyBulkerCrewSection) r WHERE t.RigJobThirdPartyBulkerCrewSectionid=r.id;

--2019/5/6 colin.ji

CREATE TABLE MasterDataManagement.[dbo].[SanjelCrewNote] (
  [id] int  NOT NULL,
  [system_id] int  IDENTITY(1,1) NOT NULL,
  [version] int  NULL,
  [modified_user_id] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [modified_datetime] datetime2(7)  NULL,
  [operation_type] int  NULL,
  [effective_start_datetime] datetime2(7)  NULL,
  [effective_end_datetime] datetime2(7)  NULL,
  [entity_status] int  NULL,
  [owner_id] int  NULL,
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [SanjelCrewid] int  NULL,
  [SanjelCrewSystemId] int  NULL,
  [SanjelCrewName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [SanjelCrewDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
);
-- 2019/5/6 Adam

SET IDENTITY_INSERT MasterDataManagement.[dbo].SanjelCrewNote ON
GO

INSERT INTO MasterDataManagement.[dbo].SanjelCrewNote(
[id],
  [system_id],
  [version],
  [modified_user_id],
  [modified_user_name],
  [modified_datetime],
  [operation_type],
  [effective_start_datetime],
  [effective_end_datetime],
  [entity_status],
  [owner_id],
  [name],
  [description],
  [SanjelCrewid],
  [SanjelCrewSystemId],
  [SanjelCrewName],
  [SanjelCrewDescription] 
  )
select 0, ROW_NUMBER() OVER (Order by modified_datetime),  1, modified_user_id, modified_user_name, modified_datetime, operation_type, effective_start_datetime, effective_end_datetime, 0, owner_id, null, notes, id, system_id, name, description from MasterDataManagement.[dbo].SanjelCrew where effective_end_datetime > GETDATE();

Go

SET IDENTITY_INSERT MasterDataManagement.[dbo].SanjelCrewNote OFF
GO

update MasterDataManagement.[dbo].SanjelCrewNote set id = system_id;

-- 2019/05/07 

ALTER TABLE MasterDataManagement.[dbo].[AdditionMethod] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[AdditiveBlendMethod] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[AdditiveType] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[Bin] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[BinStatus] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[BinType] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[BlendAdditiveMeasureUnit] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[BlendCategory] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[BlendChemical] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[BlendChemicalSection] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[BlendFluidType] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[BlendPrimaryCategory] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[BlendRecipe] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[BonusPosition] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[ClientCompany] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[ClientConsultant] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[ContractorCompany] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[Country] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[DrillingCompany] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[Employee] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[JobLifeStatus] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[JobType] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[MeasureUnitSystem] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[MeasureUnitType] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[Product] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[ProductHaul] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[ProductHaulLoad] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[ProductHaulLoadStatus] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[ProductHaulStatus] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[ProductLoadSection] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[ProvinceOrState] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[PurchasePrice] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[Rig] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[RigJob] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[RigJobSanjelCrewSection] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[RigJobThirdPartyBulkerCrewSection] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[RigSize] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[RigSizeType] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[RigStatus] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[SanjelCompany] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[SanjelCrew] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[SanjelCrewNote] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[SanjelCrewTruckUnitSection] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[SanjelCrewWorkerSection] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[ServiceLine] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[ServicePoint] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[ShiftType] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[ThirdPartyBulkerCrew] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[ThreadType] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[TruckUnit] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[UnitMainType] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[UnitOfMeasure] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[UnitOfMeasureSystemOfUnits] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[UnitOfMeasureType] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[UnitSubType] ALTER COLUMN [modified_user_id] int ;

ALTER TABLE MasterDataManagement.[dbo].[WellLocationType] ALTER COLUMN [modified_user_id] int ;


--2019/05/08 colin.ji

CREATE TABLE MasterDataManagement.[dbo].[EmployeeNote] (
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [modified_datetime] datetime2(7)  NULL,
  [effective_end_datetime] datetime2(7)  NULL,
  [version] int  NULL,
  [id] int  NOT NULL,
  [operation_type] int  NULL,
  [modified_user_id] int  NULL,
  [EmployeeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [EmployeeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [system_id] int  IDENTITY(1,1) NOT NULL,
  [entity_status] int  NULL,
  [description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Employeeid] int  NULL,
  [owner_id] int  NULL,
  [EmployeeSystemId] int  NULL,
  [modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [effective_start_datetime] datetime2(7)  NULL
);
CREATE TABLE MasterDataManagement.[dbo].[ThirdPartyBulkerCrewNote] (
  [ThirdPartyBulkerCrewName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
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
  [ThirdPartyBulkerCrewSystemId] int  NULL,
  [ThirdPartyBulkerCrewDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ThirdPartyBulkerCrewid] int  NULL,
  [entity_status] int  NULL,
  [description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [system_id] int  IDENTITY(1,1) NOT NULL
);
CREATE TABLE MasterDataManagement.[dbo].[TruckUnitNote] (
  [version] int  NULL,
  [modified_datetime] datetime2(7)  NULL,
  [TruckUnitName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [TruckUnitDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id] int  NOT NULL,
  [effective_end_datetime] datetime2(7)  NULL,
  [TruckUnitSystemId] int  NULL,
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [TruckUnitid] int  NULL,
  [entity_status] int  NULL,
  [operation_type] int  NULL,
  [modified_user_id] int  NULL,
  [modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [owner_id] int  NULL,
  [effective_start_datetime] datetime2(7)  NULL,
  [system_id] int  IDENTITY(1,1) NOT NULL
);

-- 2019/05/08

CREATE TABLE MasterDataManagement.[dbo].[RigBinSection1] (
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
[RigName] nvarchar(255) NULL ,
[BinSystemId] int NULL ,
[BinName] nvarchar(255) NULL ,
[Binid] int NULL ,
[BinDescription] nvarchar(255) NULL ,
[RigDescription] nvarchar(255) NULL ,
[Rigid] int NULL ,
[RigSystemId] int NULL 
);

INSERT INTO MasterDataManagement.[dbo].[RigBinSection1] 
			([id]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[BinSystemId]
      ,[BinDescription]
      ,[RigDescription]
      ,[RigName]
      ,[Rigid]
      ,[RigSystemId]
      ,[BinName]
      ,[Binid])
SELECT 
[id]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[BinSystemId]
      ,[BinDescription]
      ,[RigDescription]
      ,[RigName]
      ,[Rigid]
      ,[RigSystemId]
      ,[BinName]
      ,[Binid]
  FROM MasterDataManagement.[dbo].[RigBinSection];

UPDATE MasterDataManagement.dbo.RigBinSection1 SET version=1,modified_user_id=0,modified_datetime=N'2019-01-28 15:51:16.4570000',effective_start_datetime=N'2019-01-28 15:51:16.4570000',effective_end_datetime=N'9999-12-31 23:59:59.9970000',operation_type=1;

Drop table MasterDataManagement.dbo.RigBinSection;

EXEC sp_rename 'MasterDataManagement.dbo.RigBinSection1', 'RigBinSection';




CREATE TABLE MasterDataManagement.[dbo].[SanjelCrewSchedule1] (
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
[SanjelCrewid] int NULL ,
[SanjelCrewDescription] nvarchar(255) NULL ,
[RigJobSanjelCrewSectionSystemId] int NULL ,
[RigJobSanjelCrewSectionid] int NULL ,
[SanjelCrewName] nvarchar(255) NULL ,
[WorkingServicePointDescription] nvarchar(255) NULL ,
[WorkingServicePointName] nvarchar(255) NULL ,
[SanjelCrewSystemId] int NULL ,
[StartTime] datetime2(7) NULL ,
[WorkingServicePointSystemId] int NULL ,
[EndTime] datetime2(7) NULL ,
[WorkingServicePointid] int NULL ,
[RigJobSanjelCrewSectionName] nvarchar(255) NULL ,
[RigJobSanjelCrewSectionDescription] nvarchar(255) NULL ,
[CrewScheduleTypeid] int NULL 
);

INSERT INTO MasterDataManagement.[dbo].[SanjelCrewSchedule1] 
			([id]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[StartTime]
      ,[EndTime]
      ,[RigJobSanjelCrewSectionid]
      ,[CrewScheduleTypeid]
      ,[WorkingServicePointid]
      ,[WorkingServicePointName]
      ,[WorkingServicePointSystemId]
      ,[WorkingServicePointDescription]
      ,[SanjelCrewSystemId]
      ,[SanjelCrewid]
      ,[SanjelCrewDescription]
      ,[SanjelCrewName]
      ,[RigJobSanjelCrewSectionName]
      ,[RigJobSanjelCrewSectionSystemId]
      ,[RigJobSanjelCrewSectionDescription])
SELECT 
[id]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[StartTime]
      ,[EndTime]
      ,[RigJobSanjelCrewSectionid]
      ,[CrewScheduleTypeid]
      ,[WorkingServicePointid]
      ,[WorkingServicePointName]
      ,[WorkingServicePointSystemId]
      ,[WorkingServicePointDescription]
      ,[SanjelCrewSystemId]
      ,[SanjelCrewid]
      ,[SanjelCrewDescription]
      ,[SanjelCrewName]
      ,[RigJobSanjelCrewSectionName]
      ,[RigJobSanjelCrewSectionSystemId]
      ,[RigJobSanjelCrewSectionDescription]
  FROM MasterDataManagement.[dbo].[SanjelCrewSchedule];

UPDATE MasterDataManagement.dbo.SanjelCrewSchedule1 SET version=1,modified_user_id=0,modified_datetime=N'2019-01-28 15:51:16.4570000',effective_start_datetime=N'2019-01-28 15:51:16.4570000',effective_end_datetime=N'9999-12-31 23:59:59.9970000',operation_type=1;

Drop table MasterDataManagement.dbo.SanjelCrewSchedule;

EXEC sp_rename 'MasterDataManagement.dbo.SanjelCrewSchedule1', 'SanjelCrewSchedule';




CREATE TABLE MasterDataManagement.[dbo].[ThirdPartyBulkerCrewSchedule1] (
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
[RigJobThirdPartyBulkerCrewSectionSystemId] int NULL ,
[RigJobThirdPartyBulkerCrewSectionName] nvarchar(255) NULL ,
[CrewScheduleTypeid] int NULL ,
[RigJobThirdPartyBulkerCrewSectionDescription] nvarchar(255) NULL ,
[ThirdPartyBulkerCrewName] nvarchar(255) NULL ,
[StartTime] datetime2(7) NULL ,
[RigJobThirdPartyBulkerCrewSectionid] int NULL ,
[ThirdPartyBulkerCrewDescription] nvarchar(255) NULL ,
[ThirdPartyBulkerCrewid] int NULL ,
[EndTime] datetime2(7) NULL ,
[ThirdPartyBulkerCrewSystemId] int NULL 
);

INSERT INTO MasterDataManagement.[dbo].[ThirdPartyBulkerCrewSchedule1] 
			([id]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[StartTime]
      ,[EndTime]
      ,[CrewScheduleTypeid]
      ,[RigJobThirdPartyBulkerCrewSectionid]
      ,[ThirdPartyBulkerCrewName]
      ,[ThirdPartyBulkerCrewSystemId]
      ,[ThirdPartyBulkerCrewid]
      ,[ThirdPartyBulkerCrewDescription]
      ,[RigJobThirdPartyBulkerCrewSectionName]
      ,[RigJobThirdPartyBulkerCrewSectionSystemId]
      ,[RigJobThirdPartyBulkerCrewSectionDescription])
SELECT 
[id]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[StartTime]
      ,[EndTime]
      ,[CrewScheduleTypeid]
      ,[RigJobThirdPartyBulkerCrewSectionid]
      ,[ThirdPartyBulkerCrewName]
      ,[ThirdPartyBulkerCrewSystemId]
      ,[ThirdPartyBulkerCrewid]
      ,[ThirdPartyBulkerCrewDescription]
      ,[RigJobThirdPartyBulkerCrewSectionName]
      ,[RigJobThirdPartyBulkerCrewSectionSystemId]
      ,[RigJobThirdPartyBulkerCrewSectionDescription]
  FROM MasterDataManagement.[dbo].[ThirdPartyBulkerCrewSchedule];

UPDATE MasterDataManagement.dbo.ThirdPartyBulkerCrewSchedule1 SET version=1,modified_user_id=0,modified_datetime=N'2019-01-28 15:51:16.4570000',effective_start_datetime=N'2019-01-28 15:51:16.4570000',effective_end_datetime=N'9999-12-31 23:59:59.9970000',operation_type=1;

Drop table MasterDataManagement.dbo.ThirdPartyBulkerCrewSchedule;

EXEC sp_rename 'MasterDataManagement.dbo.ThirdPartyBulkerCrewSchedule1', 'ThirdPartyBulkerCrewSchedule';




CREATE TABLE MasterDataManagement.[dbo].[UnitSchedule1] (
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
[WorkingServicePointDescription] nvarchar(255) NULL ,
[TruckUnitDescription] nvarchar(255) NULL ,
[WorkingServicePointid] int NULL ,
[EndTime] datetime2(7) NULL ,
[TruckUnitid] int NULL ,
[TruckUnitName] nvarchar(255) NULL ,
[TruckUnitSystemId] int NULL ,
[WorkingServicePointName] nvarchar(255) NULL ,
[StartTime] datetime2(7) NULL ,
[WorkingServicePointSystemId] int NULL ,
[UnitScheduleTypeid] int NULL 
);

INSERT INTO MasterDataManagement.[dbo].[UnitSchedule1] 
			([id]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[StartTime]
      ,[EndTime]
      ,[UnitScheduleTypeid]
      ,[TruckUnitDescription]
      ,[TruckUnitid]
      ,[TruckUnitSystemId]
      ,[TruckUnitName]
      ,[WorkingServicePointName]
      ,[WorkingServicePointSystemId]
      ,[WorkingServicePointDescription]
      ,[WorkingServicePointid])
SELECT 
[id]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[StartTime]
      ,[EndTime]
      ,[UnitScheduleTypeid]
      ,[TruckUnitDescription]
      ,[TruckUnitid]
      ,[TruckUnitSystemId]
      ,[TruckUnitName]
      ,[WorkingServicePointName]
      ,[WorkingServicePointSystemId]
      ,[WorkingServicePointDescription]
      ,[WorkingServicePointid]
  FROM MasterDataManagement.[dbo].[UnitSchedule];

UPDATE MasterDataManagement.dbo.UnitSchedule1 SET version=1,modified_user_id=0,modified_datetime=N'2019-01-28 15:51:16.4570000',effective_start_datetime=N'2019-01-28 15:51:16.4570000',effective_end_datetime=N'9999-12-31 23:59:59.9970000',operation_type=1;

Drop table MasterDataManagement.dbo.UnitSchedule;

EXEC sp_rename 'MasterDataManagement.dbo.UnitSchedule1', 'UnitSchedule';




CREATE TABLE MasterDataManagement.[dbo].[WorkerSchedule1] (
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
[WorkerName] nvarchar(255) NULL ,
[StartTime] datetime2(7) NULL ,
[WorkingServicePointName] nvarchar(255) NULL ,
[WorkerDescription] nvarchar(255) NULL ,
[WorkingServicePointSystemId] int NULL ,
[Workerid] int NULL ,
[WorkingServicePointDescription] nvarchar(255) NULL ,
[WorkerScheduleTypeid] int NULL ,
[WorkingServicePointid] int NULL ,
[EndTime] datetime2(7) NULL ,
[WorkerSystemId] int NULL 
);

INSERT INTO MasterDataManagement.[dbo].[WorkerSchedule1] 
			([id]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[StartTime]
      ,[EndTime]
      ,[Workerid]
      ,[WorkerDescription]
      ,[WorkerScheduleTypeid]
      ,[WorkerName]
      ,[WorkerSystemId]
      ,[WorkingServicePointid]
      ,[WorkingServicePointName]
      ,[WorkingServicePointDescription]
      ,[WorkingServicePointSystemId])
SELECT 
[id]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[StartTime]
      ,[EndTime]
      ,[Workerid]
      ,[WorkerDescription]
      ,[WorkerScheduleTypeid]
      ,[WorkerName]
      ,[WorkerSystemId]
      ,[WorkingServicePointid]
      ,[WorkingServicePointName]
      ,[WorkingServicePointDescription]
      ,[WorkingServicePointSystemId]
  FROM MasterDataManagement.[dbo].[WorkerSchedule];

UPDATE MasterDataManagement.dbo.WorkerSchedule1 SET version=1,modified_user_id=0,modified_datetime=N'2019-01-28 15:51:16.4570000',effective_start_datetime=N'2019-01-28 15:51:16.4570000',effective_end_datetime=N'9999-12-31 23:59:59.9970000',operation_type=1;

Drop table MasterDataManagement.dbo.WorkerSchedule;

EXEC sp_rename 'MasterDataManagement.dbo.WorkerSchedule1', 'WorkerSchedule';



ALTER TABLE MasterDataManagement.[dbo].[ProductHaul] ADD [ScheduleSystemId] int NULL ;
ALTER TABLE MasterDataManagement.[dbo].[ProductHaul] ADD [ScheduleName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;
ALTER TABLE MasterDataManagement.[dbo].[ProductHaul] ADD [ScheduleDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;



UPDATE MasterDataManagement.dbo.ProductHaul SET ScheduleSystemId = r.system_id,ScheduleName = r.name,ScheduleDescription = r.description 
 FROM MasterDataManagement.dbo.ProductHaul p,(SELECT * FROM MasterDataManagement.dbo.SanjelCrewSchedule) r WHERE p.Scheduleid=r.id AND p.IsThirdParty=0;

UPDATE MasterDataManagement.dbo.ProductHaul SET ScheduleSystemId = r.system_id,ScheduleName = r.name,ScheduleDescription = r.description 
 FROM MasterDataManagement.dbo.ProductHaul p,(SELECT * FROM MasterDataManagement.dbo.ThirdPartyBulkerCrewSchedule) r WHERE p.Scheduleid=r.id AND p.IsThirdParty=1;

-- 2019/05/09

UPDATE MasterDataManagement.dbo.ProductHaulLoad SET ProductHaulLoadLifeStatusid=2 
 FROM MasterDataManagement.dbo.ProductHaulLoad p,(SELECT id,CallSheetNumber,JobLifeStatusid, JobLifeStatusName FROM RigJob WHERE JobLifeStatusid=8) r WHERE p.CallSheetNumber=r.CallSheetNumber;

UPDATE MasterDataManagement.[dbo].ProductHaulLoad SET ProductHaulLoadLifeStatusSystemId = r.system_id,ProductHaulLoadLifeStatusName = r.name,ProductHaulLoadLifeStatusDescription = r.description
 FROM MasterDataManagement.[dbo].ProductHaulLoad e,(SELECT * FROM MasterDataManagement.[dbo].ProductHaulLoadStatus) r WHERE e.ProductHaulLoadLifeStatusid=r.id;

Update ProductHaul set ProductHaulLifeStatusid = 4 where id in (
select distinct ProductHaulid from ProductHaulLoad where ProductHaulid in 
(
select ProductHaulid from ProductHaulLoad group by ProductHaulid having count(distinct ProductHaulLoadLifeStatusid) = 1
)
and ProductHaulLoadLifeStatusid = 2
)
;

UPDATE MasterDataManagement.[dbo].productHaul SET ProductHaulLifeStatusSystemId = r.system_id,ProductHaulLifeStatusName = r.name,ProductHaulLifeStatusDescription = r.description
 FROM MasterDataManagement.[dbo].productHaul e,(SELECT * FROM MasterDataManagement.[dbo].ProductHaulStatus) r WHERE e.ProductHaulLifeStatusid=r.id;

 
 --2019/05/13 colin.ji
 CREATE TABLE MasterDataManagement.[dbo].[EmployeeProfile] (
  [EmployeeSystemId] int  NULL,
  [owner_id] int  NULL,
  [effective_start_datetime] datetime2(7)  NULL,
  [EmployeeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [EmployeeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [version] int  NULL,
  [effective_end_datetime] datetime2(7)  NULL,
  [modified_datetime] datetime2(7)  NULL,
  [operation_type] int  NULL,
  [entity_status] int  NULL,
  [id] int  NOT NULL,
  [modified_user_id] int  NULL,
  [modified_user_name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [system_id] int  IDENTITY(1,1) NOT NULL,
  [description] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Employeeid] int  NULL
);

-- 2019/05/14

ALTER TABLE MasterDataManagement.[dbo].[RigJobSanjelCrewSection] ADD [RigJobCrewSectionStatusDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[RigJobSanjelCrewSection] ADD [RigJobCrewSectionStatusName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[RigJobThirdPartyBulkerCrewSection] ADD [RigJobCrewSectionStatusDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[RigJobThirdPartyBulkerCrewSection] ADD [RigJobCrewSectionStatusName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[SanjelCrew] ADD [TypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[SanjelCrew] ADD [TypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[SanjelCrewSchedule] ADD [CrewScheduleTypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[SanjelCrewSchedule] ADD [CrewScheduleTypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[SanjelCrewWorkerSection] ADD [CrewPositionDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[SanjelCrewWorkerSection] ADD [CrewPositionName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[ThirdPartyBulkerCrew] ADD [TypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[ThirdPartyBulkerCrew] ADD [TypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[ThirdPartyBulkerCrewSchedule] ADD [CrewScheduleTypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[ThirdPartyBulkerCrewSchedule] ADD [CrewScheduleTypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[UnitSchedule] ADD [UnitScheduleTypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[UnitSchedule] ADD [UnitScheduleTypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[WorkerSchedule] ADD [WorkerScheduleTypeName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE MasterDataManagement.[dbo].[WorkerSchedule] ADD [WorkerScheduleTypeDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;


 
UPDATE MasterDataManagement.[dbo].RigJobSanjelCrewSection SET RigJobCrewSectionStatusName = r.name,RigJobCrewSectionStatusDescription = r.description FROM MasterDataManagement.[dbo].RigJobSanjelCrewSection e,(SELECT * FROM MasterDataManagement.[dbo].RigJobCrewSectionStatus) r WHERE e.RigJobCrewSectionStatusid=r.id;

UPDATE MasterDataManagement.[dbo].RigJobThirdPartyBulkerCrewSection SET RigJobCrewSectionStatusName = r.name,RigJobCrewSectionStatusDescription = r.description FROM MasterDataManagement.[dbo].RigJobThirdPartyBulkerCrewSection e,(SELECT * FROM MasterDataManagement.[dbo].RigJobCrewSectionStatus) r WHERE e.RigJobCrewSectionStatusid=r.id;

UPDATE MasterDataManagement.[dbo].SanjelCrew SET TypeName = r.name,TypeDescription = r.description FROM MasterDataManagement.[dbo].SanjelCrew e,(SELECT * FROM MasterDataManagement.[dbo].CrewType) r WHERE e.Typeid=r.id;
 
UPDATE MasterDataManagement.[dbo].SanjelCrewSchedule SET CrewScheduleTypeName = r.name,CrewScheduleTypeDescription = r.description FROM MasterDataManagement.[dbo].SanjelCrewSchedule e,(SELECT * FROM MasterDataManagement.[dbo].CrewScheduleType) r WHERE e.CrewScheduleTypeid=r.id;
 
UPDATE MasterDataManagement.[dbo].SanjelCrewWorkerSection SET CrewPositionName = r.name,CrewPositionDescription = r.description FROM MasterDataManagement.[dbo].SanjelCrewWorkerSection e,(SELECT * FROM MasterDataManagement.[dbo].CrewPosition) r WHERE e.CrewPositionid=r.id;
  
UPDATE MasterDataManagement.[dbo].ThirdPartyBulkerCrew SET TypeName = r.name,TypeDescription = r.description FROM MasterDataManagement.[dbo].ThirdPartyBulkerCrew e,(SELECT * FROM MasterDataManagement.[dbo].CrewType) r WHERE e.Typeid=r.id;
   
UPDATE MasterDataManagement.[dbo].ThirdPartyBulkerCrewSchedule SET CrewScheduleTypeName = r.name,CrewScheduleTypeDescription = r.description FROM MasterDataManagement.[dbo].ThirdPartyBulkerCrewSchedule e,(SELECT * FROM MasterDataManagement.[dbo].CrewScheduleType) r WHERE e.CrewScheduleTypeid=r.id;
    
UPDATE MasterDataManagement.[dbo].UnitSchedule SET UnitScheduleTypeName = r.name,UnitScheduleTypeDescription = r.description FROM MasterDataManagement.[dbo].UnitSchedule e,(SELECT * FROM MasterDataManagement.[dbo].UnitScheduleType) r WHERE e.UnitScheduleTypeid=r.id;
     
UPDATE MasterDataManagement.[dbo].WorkerSchedule SET WorkerScheduleTypeName = r.name,WorkerScheduleTypeDescription = r.description FROM MasterDataManagement.[dbo].WorkerSchedule e,(SELECT * FROM MasterDataManagement.[dbo].WorkerScheduleType) r WHERE e.WorkerScheduleTypeid=r.id;
 
 
-- 2019/05/17
ALTER TABLE MasterDataManagement.[dbo].[EmployeeNote] ALTER COLUMN [name] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS ;

ALTER TABLE MasterDataManagement.[dbo].[EmployeeProfile] ALTER COLUMN [name] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS ;

ALTER TABLE MasterDataManagement.[dbo].[SanjelCrewNote] ALTER COLUMN [name] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS ;

ALTER TABLE MasterDataManagement.[dbo].[ThirdPartyBulkerCrewNote] ALTER COLUMN [name] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS ;

ALTER TABLE MasterDataManagement.[dbo].[TruckUnitNote] ALTER COLUMN [name] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS ;



-- 2019/05/22 Modify for enum


EXEC sp_rename 'MasterDataManagement.dbo.Bin.[BinStatusid]', 'BinStatus' , 'COLUMN';

ALTER TABLE MasterDataManagement.[dbo].[Bin] DROP COLUMN [BinStatusSystemId];

ALTER TABLE MasterDataManagement.[dbo].[Bin] DROP COLUMN [BinStatusDescription];

ALTER TABLE MasterDataManagement.[dbo].[Bin] DROP COLUMN [BinStatusName];

update  [SanjelData].[dbo].[Bin] set BinStatus = 0;

EXEC sp_rename 'MasterDataManagement.dbo.ProductHaul.[ProductHaulLifeStatusid]', 'ProductHaulLifeStatus' , 'COLUMN';

ALTER TABLE MasterDataManagement.[dbo].[ProductHaul] DROP COLUMN [ProductHaulLifeStatusSystemId];

ALTER TABLE MasterDataManagement.[dbo].[ProductHaul] DROP COLUMN [ProductHaulLifeStatusName];

ALTER TABLE MasterDataManagement.[dbo].[ProductHaul] DROP COLUMN [ProductHaulLifeStatusDescription];


EXEC sp_rename 'MasterDataManagement.dbo.ProductHaulLoad.[ProductHaulLoadLifeStatusid]', 'ProductHaulLoadLifeStatus' , 'COLUMN';

ALTER TABLE MasterDataManagement.[dbo].[ProductHaulLoad] DROP COLUMN [ProductHaulLoadLifeStatusSystemId];

ALTER TABLE MasterDataManagement.[dbo].[ProductHaulLoad] DROP COLUMN [ProductHaulLoadLifeStatusName];

ALTER TABLE MasterDataManagement.[dbo].[ProductHaulLoad] DROP COLUMN [ProductHaulLoadLifeStatusDescription];


EXEC sp_rename 'MasterDataManagement.dbo.Rig.[Statusid]', 'Status' , 'COLUMN';

ALTER TABLE MasterDataManagement.[dbo].[Rig] DROP COLUMN [StatusName];

ALTER TABLE MasterDataManagement.[dbo].[Rig] DROP COLUMN [StatusSystemId];

ALTER TABLE MasterDataManagement.[dbo].[Rig] DROP COLUMN [StatusDescription];


EXEC sp_rename 'MasterDataManagement.dbo.RigJob.[JobLifeStatusid]', 'JobLifeStatus' , 'COLUMN';

ALTER TABLE MasterDataManagement.[dbo].[RigJob] DROP COLUMN [JobLifeStatusName];

ALTER TABLE MasterDataManagement.[dbo].[RigJob] DROP COLUMN [JobLifeStatusDescription];

ALTER TABLE MasterDataManagement.[dbo].[RigJob] DROP COLUMN [JobLifeStatusSystemId];

EXEC sp_rename 'MasterDataManagement.dbo.RigJob.[RigStatusid]', 'RigStatus' , 'COLUMN';

ALTER TABLE MasterDataManagement.[dbo].[RigJob] DROP COLUMN [RigStatusSystemId];

ALTER TABLE MasterDataManagement.[dbo].[RigJob] DROP COLUMN [RigStatusName];

ALTER TABLE MasterDataManagement.[dbo].[RigJob] DROP COLUMN [RigStatusDescription];


EXEC sp_rename 'MasterDataManagement.dbo.RigJobSanjelCrewSection.[RigJobCrewSectionStatusid]', 'RigJobCrewSectionStatus' , 'COLUMN';

ALTER TABLE MasterDataManagement.[dbo].[RigJobSanjelCrewSection] DROP COLUMN [RigJobCrewSectionStatusDescription];

ALTER TABLE MasterDataManagement.[dbo].[RigJobSanjelCrewSection] DROP COLUMN [RigJobCrewSectionStatusName];


EXEC sp_rename 'MasterDataManagement.dbo.RigJobThirdPartyBulkerCrewSection.[RigJobCrewSectionStatusid]', 'RigJobCrewSectionStatus' , 'COLUMN';

ALTER TABLE MasterDataManagement.[dbo].[RigJobThirdPartyBulkerCrewSection] DROP COLUMN [RigJobCrewSectionStatusDescription];

ALTER TABLE MasterDataManagement.[dbo].[RigJobThirdPartyBulkerCrewSection] DROP COLUMN [RigJobCrewSectionStatusName];


DROP TABLE MasterDataManagement.[dbo].[BinStatus];

DROP TABLE MasterDataManagement.[dbo].[JobLifeStatus];

DROP TABLE MasterDataManagement.[dbo].[ProductHaulLoadStatus];

DROP TABLE MasterDataManagement.[dbo].[ProductHaulStatus];

DROP TABLE MasterDataManagement.[dbo].[RigJobCrewSectionStatus];

DROP TABLE MasterDataManagement.[dbo].[RigStatus];






















 
 
 

