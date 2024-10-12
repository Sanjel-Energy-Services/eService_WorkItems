-- Run in production already
--ALTER TABLE [SanjelCrewSchedule] ADD [Type] [int] Default 2;
--ALTER TABLE [WorkerSchedule] ADD [Type] [int] Default 2;
--ALTER TABLE [UnitSchedule] ADD [Type] [int] Default 2;
--GO
--ALTER TABLE Sanjelcrew ADD IsPrimaryCrew bit Default 0;
--GO

update SanjelCrewSchedule set Type = 2;
update [WorkerSchedule] set Type = 2;
update [UnitSchedule] set Type = 2;
Go

Update sanjelcrew set IsPrimaryCrew = 1 where effective_end_datetime > getdate();
GO

CREATE VIEW [dbo].[ActiveCrewList]
AS
SELECT crew.id
	,crew.system_id AS SystemId
	,crew.version
	,crew.modified_user_id AS ModifiedUserId
	,crew.modified_user_name AS ModifiedUserName
	,crew.modified_datetime AS ModifiedDateTime
	,crew.operation_type AS OperationType
	,crew.effective_start_datetime AS EffectiveStartDateTime
	,crew.effective_end_datetime AS EffectiveEndDateTime
	,crew.entity_status AS EntityStatus
	,crew.owner_id AS OwnerId
	,crew.name
	,crew.description
	,crew.Rotation	
	,crew.Notes
	,crew.IsPrimaryCrew
	--
	,crew.Typeid
	,crew.TypeName
	,crew.TypeDescription
	--
	,crew.WorkingServicePointid
	,crew.WorkingServicePointName
	,crew.WorkingServicePointDescription
	,crew.WorkingServicePointSystemId
	--
	,crew.HomeServicePointSystemId
	,crew.HomeServicePointName
	,crew.HomeServicePointDescription
	,crew.HomeServicePointid
	--
	,CrewWorkerSection.id AS WorkerSectionId
	,CrewWorkerSection.system_id AS WorkerSectionSystemId
	,CrewWorkerSection.version AS WorkerSectionVersion
	,CrewWorkerSection.modified_user_id AS WorkerSectionModifiedUserId
	,CrewWorkerSection.modified_user_name AS WorkerSectionModifiedUserName
	,CrewWorkerSection.modified_datetime AS WorkerSectionModifiedDateTime
	,CrewWorkerSection.operation_type AS WorkerSectionOperationType
	,CrewWorkerSection.effective_start_datetime AS WorkerSectionEffectiveStartDateTime
	,CrewWorkerSection.effective_end_datetime AS WorkerSectionEffectiveEndDateTime
	,CrewWorkerSection.entity_status AS WorkerSectionEntityStatus
	,CrewWorkerSection.owner_id AS WorkerSectionOwnerId
	,CrewWorkerSection.name AS WorkerSectionName
	,CrewWorkerSection.description AS WorkerSectionDescription
	--
	,CrewWorkerSection.SanjelCrewId
	,CrewWorkerSection.SanjelCrewName
	,CrewWorkerSection.SanjelCrewDescription
	,CrewWorkerSection.SanjelCrewSystemId
	--
	,CrewWorkerSection.WorkerId
	,CrewWorkerSection.WorkerDescription
	,CrewWorkerSection.WorkerName
	,CrewWorkerSection.WorkerSystemId
	--
	,CrewWorkerSection.CrewPositionid as CrewPositionId
	,CrewWorkerSection.CrewPositionName
	,CrewWorkerSection.CrewPositionDescription
	--
	,TruckUnitSection.id AS UnitSectionId
	,TruckUnitSection.system_id AS UnitSectionSystemId
	,TruckUnitSection.version AS UnitSectionVersion
	,TruckUnitSection.modified_user_id AS UnitSectionModifiedUserId
	,TruckUnitSection.modified_user_name AS UnitSectionModifiedUserName
	,TruckUnitSection.modified_datetime AS UnitSectionModifiedDateTime
	,TruckUnitSection.operation_type AS UnitSectionOperationType
	,TruckUnitSection.effective_start_datetime AS UnitSectionEffectiveStartDateTime
	,TruckUnitSection.effective_end_datetime AS UnitSectionEffectiveEndDateTime
	,TruckUnitSection.entity_status AS UnitSectionEntityStatus
	,TruckUnitSection.owner_id AS UnitSectionOwnerId
	,TruckUnitSection.name AS UnitSectionName
	,TruckUnitSection.description AS UnitSectionDescription
	--
	,TruckUnitSection.SanjelCrewSystemId as UnitSectionSanjelCrewSystemId
	,TruckUnitSection.SanjelCrewid as UnitSectionSanjelCrewId
	,TruckUnitSection.SanjelCrewName as UnitSectionSanjelCrewName
	,TruckUnitSection.SanjelCrewDescription as UnitSectionSanjelCrewDescription
	--
	,TruckUnitSection.TruckUnitid as TruckUnitId
	,TruckUnitSection.TruckUnitName
	,TruckUnitSection.TruckUnitDescription
	,TruckUnitSection.TruckUnitSystemId
FROM SanjelCrew AS crew
LEFT JOIN (
	SELECT *
	FROM SanjelCrewNote
	WHERE effective_end_datetime >= GETDATE()
	) AS crewNote ON crew.id = crewNote.SanjelCrewid
LEFT JOIN (
	SELECT *
	FROM SanjelCrewWorkerSection
	WHERE effective_end_datetime >= GETDATE()
	) AS CrewWorkerSection ON crew.id = CrewWorkerSection.SanjelCrewid
LEFT JOIN (
	SELECT *
	FROM SanjelCrewTruckUnitSection
	WHERE effective_end_datetime >= GETDATE()
	) AS TruckUnitSection ON crew.id = TruckUnitSection.SanjelCrewid
WHERE crew.effective_end_datetime >= GETDATE()

GO

 


CREATE VIEW [dbo].[RigJobSanjelCrewSectionList]
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

CREATE TABLE [RotationTemplate] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[ColorScheme] nvarchar(255),[OffDays] int,[RotationOrder] int,[StartDay] int,[WorkDays] int);

ALTER TABLE [WorkerSchedule] ADD [Rotationid] int NULL;
ALTER TABLE [WorkerSchedule] ADD [RotationName] [nvarchar](100) NULL;
ALTER TABLE [WorkerSchedule] ADD [RotationDescription] [nvarchar](500) NULL;


SET IDENTITY_INSERT [dbo].[RotationTemplate] ON 
GO
INSERT [dbo].[RotationTemplate] ([id], [entity_status], [owner_id], [name], [description], [ColorScheme], [OffDays], [RotationOrder], [StartDay], [WorkDays]) VALUES (1, 0, 0, N'15&6 Group 1', N'Work 15 Off 6 starts on Wednesday - Group 1', N'#8000FF', 6, 1, 3, 15)
GO
INSERT [dbo].[RotationTemplate] ([id], [entity_status], [owner_id], [name], [description], [ColorScheme], [OffDays], [RotationOrder], [StartDay], [WorkDays]) VALUES (2, 0, 0, N'15&6 Group 2', N'Work 15 Off 6 starts on Wednesday - Group 2', N'#80FF80', 6, 3, 3, 15)
GO
INSERT [dbo].[RotationTemplate] ([id], [entity_status], [owner_id], [name], [description], [ColorScheme], [OffDays], [RotationOrder], [StartDay], [WorkDays]) VALUES (3, 0, 0, N'15&6 Group 3', N'Work 15 Off 6 starts on Wednesday - Group 3', N'#FFFF80', 6, 2, 3, 15)
GO
SET IDENTITY_INSERT [dbo].[RotationTemplate] OFF
GO
-- following scripts have run on production
--alter table ProductHaulLoad add [ProgramVersion] int default 0;
--GO


--ALTER TABLE [TruckUnit] ADD [EngineType] [nvarchar](255) NULL;
--ALTER TABLE [TruckUnit] ADD [Fleet] [nvarchar](255) NULL;
--ALTER TABLE [TruckUnit] ADD [HorsePower] [nvarchar](255) NULL;
--ALTER TABLE [TruckUnit] ADD [PlungerSize] [nvarchar](255) NULL;
--ALTER TABLE [TruckUnit] ADD [PressureRating] [nvarchar](255) NULL;
/*
CREATE TABLE [DrillOrder] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[SalesProjectid] int,[SalesProjectName] [nvarchar](100) NULL,[SalesProjectDescription] [nvarchar](500) NULL,[Ordinal] int);
CREATE TABLE [JobOrder] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[DrillOrderid] int,[DrillOrderName] [nvarchar](100) NULL,[DrillOrderDescription] [nvarchar](500) NULL,[JobTypeid] int,[JobTypeName] [nvarchar](100) NULL,[JobTypeDescription] [nvarchar](500) NULL,[JobTypeSystemId] [int] Not NULL,[EstimateRevenue] float,[Ordinal] int);
CREATE TABLE [SalesProject] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[ClientCompanyid] int,[ClientCompanyName] [nvarchar](100) NULL,[ClientCompanyDescription] [nvarchar](500) NULL,[ClientCompanySystemId] [int] Not NULL,[Districtid] int,[DistrictName] [nvarchar](100) NULL,[DistrictDescription] [nvarchar](500) NULL,[DistrictSystemId] [int] Not NULL,[Rigid] int,[RigName] [nvarchar](100) NULL,[RigDescription] [nvarchar](500) NULL,[RigSystemId] [int] Not NULL,[SalesRepresentativeid] int,[SalesRepresentativeName] [nvarchar](100) NULL,[SalesRepresentativeDescription] [nvarchar](500) NULL,[SalesRepresentativeSystemId] [int] Not NULL,[ServiceLineid] int,[ServiceLineName] [nvarchar](100) NULL,[ServiceLineDescription] [nvarchar](500) NULL,[ServiceLineSystemId] [int] Not NULL,[Area] nvarchar(255),[CmdStringCount] int,[Comments] nvarchar(255),[DrillDays] int,[EndTime] datetime,[EstimatedRevenue] float,[Frequency] int,[ProgramId] nvarchar(255),[StartTime] datetime,[StringCount] int,[WellCount] int,[Status] int,[ApprovalStatus] int);
CREATE TABLE [SalesSpecialtyProduct] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[Productid] int,[ProductName] [nvarchar](100) NULL,[ProductDescription] [nvarchar](500) NULL,[ProductSystemId] [int] Not NULL,[SalesProjectid] int,[SalesProjectName] [nvarchar](100) NULL,[SalesProjectDescription] [nvarchar](500) NULL);
ALTER TABLE [RigJob] ADD [CallCrewTime] datetime;
*/

-- following need to run on PRD if eServiceOnline is not published
update SanjelDataQA.dbo.RigJob set CallCrewTime = (select CIF_CALL_CREW_DATE_TIME from eservice6QA.dbo.CALLSHEET_HEADERS cs where cs.CALL_SHEET_NUMBER = RigJob.CallSheetNumber)
where effective_end_datetime > GETDATE() and JobLifeStatus in (3,4,5,7);

select * from RigJob where effective_end_datetime > GETDATE() and JobLifeStatus in (3,4,5,7);

ALTER TABLE [ShippingLoadSheet] ADD [BulkPlantid] int NULL;
ALTER TABLE [ShippingLoadSheet] ADD [BulkPlantSystemid] int NULL;
ALTER TABLE [ShippingLoadSheet] ADD [BulkPlantName] [nvarchar](100) NULL;
ALTER TABLE [ShippingLoadSheet] ADD [BulkPlantDescription] [nvarchar](500) NULL;
ALTER TABLE [ShippingLoadSheet] ADD [EstimatedLoadTime] datetime;





-- Following schema need to created as view from eService6 data

IF EXISTS (SELECT * FROM sys.views WHERE name = 'CallSheet') DROP VIEW CallSheet
GO

CREATE VIEW [dbo].[CallSheet]
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
	cast(0 as int) as WellLocationTypeSystemId,
	cast(CSH.WLI_WELL_LOCATION_TYPE_NAME as varchar(100)) as  WellLocationTypeName,
	cast(null as varchar(500)) as WellLocationTypeDescription,
	cast(CSH.WLI_DH_WELL_LOCATION as varchar(100)) as  DownHoleWellLocation,
	cast(CSH.WLI_DH_WELL_LOCATION_TYPE_ID as int) as  DownHoleWellLocationTypeId,
	cast(0 as int) as DownHoleWellLocationTypeSystemId,
	cast(CSH.WLI_DH_WELL_LOCATION_TYPE_NAME as varchar(100)) as DownHoleWellLocationTypeName,
	cast(null as varchar(500)) as DownHoleWellLocationTypeDescription,
	cast(CSH.WLI_DIRECTION_TO_LOCATION as varchar(1000))  as  DirectionToLocation,
	cast(CSH.WLI_WELL_NAME as varchar(100))  as  WellName
from eservice6QA.dbo.CALLSHEET_HEADERS CSH 
GO


IF EXISTS (SELECT * FROM sys.views WHERE name = 'CallSheetBlendSection') DROP VIEW CallSheetBlendSection
GO
CREATE VIEW [dbo].[CallSheetBlendSection]
with view_metadata
AS
select 
	PBD.id as Id,
    cast(0 as int) as entity_status,
    cast(PBD.ROOT_ID as int) as owner_id,
    cast(null as varchar(100)) as name,
    cast(null as varchar(500)) as description,
	cast(BAMU.id as int) as BlendAmountUnitid,
	cast(BAMU.name as varchar(100)) as BlendAmountUnitName,
	cast(BAMU.description as varchar(500)) as BlendAmountUnitDescription,
	cast(BAMU.system_id as int) as BlendAmountUnitSystemId,
	cast(PBD.BLEND_CATEGORY_ID as int) as BlendCategoryid,
	cast(PBD.BLEND_CATEGORY_NAME as varchar(100)) as BlendCategoryName,
	cast(null as varchar(500)) as BlendCategoryDescription,
	cast(0 as int) as BlendCategorySystemId,
	cast(PBD.BLEND_FLUID_TYPE_ID as int) as BlendFluidTypeid,
	cast(PBD.BLEND_FLUID_TYPE_NAME as varchar(100)) as BlendFluidTypeName,
	cast(null as varchar(500)) as BlendFluidTypeDescription,
	cast(0 as int) as BlendFluidTypeSystemId,
	cast(PBD.ROOT_ID as int) as CallSheetid,
	cast(null as varchar(100)) as CallSheetName,
	cast(null as varchar(500)) as CallSheetDescription,
	cast(PBD.EVENT_NUMBER as int) as EventNumber,
	cast(PBD.NEED_FIELD_TESTING as bit) as IsNeedFieldTesting,
	cast(PBD.IS_NEED_HUAL as bit) as IsNeedHaul,
	cast(PBD.PILOT_TEST_ID as varchar(100)) as PilotTestId,
	cast(PBD.PILOT_TEST_ITERATION as int) as PilotTestIteration,
	cast(PBD.QUANTITY as float) as Quantity,
	cast(PBD.BLEND_HAULED_ON as varchar(100)) as BlendHaulOn,
	cast(PBD.DENSITY as float) as Density,
	cast(PBD.INTERVAL as int) as Interval,
	cast(PBD.IS_CLIENT_APPROVAL_REQUIRED as bit) as IsClientApprovalRequired,
	cast(PBD.ORIGINAL_QUANTITY as float) as OriginalQuantity,
	cast(PBD.MIX_WATER_REQUIREMENT as float) as MixWaterRequirement,
	cast(PBD.YIELD as float) as Yield,
	cast(PBD.SACK_WEIGHT as float) as SackWeight
from eservice6QA.dbo.PUMP_BLEND_SCTNS PBD 
Join BlendAdditiveMeasureUnit BAMU on PBD.BLEND_AMOUNT_UNIT_ABBR = BAMU.Abbreviation and BAMU.effective_end_datetime > GETDATE()
GO

IF EXISTS (SELECT * FROM sys.views WHERE name = 'CallSheetBlendAdditiveSection') DROP VIEW CallSheetBlendAdditiveSection
GO
CREATE VIEW [dbo].[CallSheetBlendAdditiveSection]
with view_metadata
AS
select 
	PBD.id as Id,
    cast(0 as int) as entity_status,
    cast(PBD.ROOT_ID as int) as owner_id,
    cast(null as varchar(100)) as name,
    cast(null as varchar(500)) as description,
	cast(PBD.ADDITION_METHOD_ID as int) as AdditionMethodid,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditionMethodName,
	cast(null as varchar(500)) as AdditionMethodDescription,
	cast(0 as int) as AdditionMethodSystemId,
	cast(BAMU.id as int) as AdditiveAmountUnitid,
	cast(BAMU.name as varchar(100)) as AdditiveAmountUnitName,
	cast(BAMU.description as varchar(500)) as AdditiveAmountUnitDescription,
	cast(BAMU.system_id as int) as AdditiveAmountUnitSystemId,
	cast(PBD.ADDITIVE_ID as int) as AdditiveTypeid,
	cast(PBD.ADDITIVE_NAME as varchar(100)) as AdditiveTypeName,
	cast(null as varchar(500)) as AdditiveTypeDescription,
	cast(0 as int) as AdditiveTypeSystemId,
	cast(PBD.PARENT_ID as int) as BlendSectionid,
	cast(null as varchar(100)) as BlendSectionName,
	cast(null as varchar(500)) as BlendSectionDescription,
	cast(PBD.PARENT_ID as int) as CallSheetBlendSectionid,
	cast(null as varchar(100)) as CallSheetBlendSectionName,
	cast(null as varchar(500)) as CallSheetBlendSectionDescription,
	cast(PBD.AMOUNT as float) as Amount,
	cast(PBD.BASE_NAME as varchar(255)) as BaseName

from eservice6QA.dbo.PUMP_BLEND_BLEND_ADDTV_SCTNS PBD 
Join BlendAdditiveMeasureUnit BAMU on PBD.AMOUNT_UNIT_ABBR = BAMU.Abbreviation and BAMU.effective_end_datetime > GETDATE()

GO

IF EXISTS (SELECT * FROM sys.views WHERE name = 'JobDesignBlendSection') DROP VIEW JobDesignBlendSection
GO
CREATE VIEW [dbo].[JobDesignBlendSection]
with view_metadata
AS
select 
	PBD.id as Id,
    cast(0 as int) as entity_status,
	cast(PBD.PARENT_ID as int) as owner_id,
    cast(null as varchar(100)) as name,
    cast(null as varchar(500)) as description,
	cast(BAMU.id as int) as BlendAmountUnitid,
	cast(BAMU.name as varchar(100)) as BlendAmountUnitName,
	cast(BAMU.description as varchar(500)) as BlendAmountUnitDescription,
	cast(BAMU.system_id as int) as BlendAmountUnitSystemId,
	cast(PBD.BLEND_CATEGORY_ID as int) as BlendCategoryid,
	cast(PBD.BLEND_CATEGORY_NAME as varchar(100)) as BlendCategoryName,
	cast(null as varchar(500)) as BlendCategoryDescription,
	cast(0 as int) as BlendCategorySystemId,
	cast(PBD.BLEND_FLUID_TYPE_ID as int) as BlendFluidTypeid,
	cast(PBD.BLEND_FLUID_TYPE_NAME as varchar(100)) as BlendFluidTypeName,
	cast(null as varchar(500)) as BlendFluidTypeDescription,
	cast(0 as int) as BlendFluidTypeSystemId,
	cast(PBD.PARENT_ID as int) as JobDesignPumpingJobSectionid,
	cast(null as varchar(100)) as JobDesignPumpingJobSectionName,
	cast(null as varchar(500)) as JobDesignPumpingJobSectionDescription,
	cast(PBD.EVENT_NUMBER as int) as EventNumber,
	cast(PBD.NEED_FIELD_TESTING as bit) as IsNeedFieldTesting,
	cast(PBD.[IS_NEED_HUAL] as bit) as IsNeedHaul,
	cast(PBD.PILOT_TEST_ID as varchar(100)) as PilotTestId,
	cast(PBD.PILOT_TEST_ITERATION as int) as PilotTestIteration,
	cast(PBD.QUANTITY as float) as Quantity,
	cast(PBD.BLEND_HAULED_ON as varchar(200)) as BlendHaulOn,
	cast(PBD.DENSITY as [float]) as Density,
	cast(PBD.INTERVAL as int) as Interval,
	cast(PBD.IS_CLIENT_APPROVAL_REQUIRED as bit) as IsClientApprovalRequired,
	cast(PBD.ORIGINAL_QUANTITY as float) as OriginalQuantity,
	cast(PBD.MIX_WATER_REQUIREMENT as float) as MixWaterRequirement,
	cast(PBD.YIELD as float) as Yield,
	cast(PBD.SACK_WEIGHT as float) as SackWeight
from eservice6QA.dbo.PRG_BLEND_SCTNS PBD 
Join BlendAdditiveMeasureUnit BAMU on PBD.BLEND_AMOUNT_UNIT_ABBR = BAMU.Abbreviation and BAMU.effective_end_datetime > GETDATE()
GO

IF EXISTS (SELECT * FROM sys.views WHERE name = 'JobDesignBlendAdditiveSection') DROP VIEW JobDesignBlendAdditiveSection
GO
CREATE VIEW [dbo].[JobDesignBlendAdditiveSection]
with view_metadata
AS
select 
	PBD.id as Id,
	cast(0 as int) as entity_status,
	cast(PARENT_ID as int) as owner_id,
    cast(null as varchar(100)) as name,
    cast(null as varchar(500)) as description,
	cast(PBD.ADDITION_METHOD_ID as int) as AdditionMethodid,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditionMethodName,
	cast(null as varchar(500)) as AdditionMethodDescription,
	cast(0 as int) as AdditionMethodSystemId,
	cast(BAMU.id as int) as AdditiveAmountUnitid,
	cast(BAMU.name as varchar(100)) as AdditiveAmountUnitName,
	cast(BAMU.description as varchar(500)) as AdditiveAmountUnitDescription,
	cast(BAMU.system_id as int) as AdditiveAmountUnitSystemId,
	cast(PBD.ADDITIVE_ID as int) as AdditiveTypeid,
	cast(PBD.ADDITIVE_NAME as varchar(100)) as AdditiveTypeName,
	cast(null as varchar(500)) as AdditiveTypeDescription,
	cast(0 as int) as AdditiveTypeSystemId,
	cast(PBD.PARENT_ID as int) as BlendSectionid,
	cast(null as varchar(100)) as BlendSectionName,
	cast(null as varchar(500)) as BlendSectionDescription,
	cast(PBD.PARENT_ID as int) as JobDesignBlendSectionid,
	cast(null as varchar(100)) as JobDesignBlendSectionName,
	cast(null as varchar(500)) as JobDesignBlendSectionDescription,
	cast(PBD.AMOUNT as float) as Amount,
	cast(PBD.BASE_NAME as varchar(100)) as BaseName
from eservice6QA.dbo.PRG_BLEND_BLEND_ADDTV_SCTNS PBD 
Join BlendAdditiveMeasureUnit BAMU on PBD.AMOUNT_UNIT_ABBR = BAMU.Abbreviation and BAMU.effective_end_datetime > GETDATE()
GO


-- Feb 15, 2023

ALTER TABLE [ThirdPartyBulkerCrew] ADD [ServicePointid] int NULL;
ALTER TABLE [ThirdPartyBulkerCrew] ADD [ServicePointSystemId] int NULL;
ALTER TABLE [ThirdPartyBulkerCrew] ADD [ServicePointName] [nvarchar](100) NULL;
ALTER TABLE [ThirdPartyBulkerCrew] ADD [ServicePointDescription] [nvarchar](500) NULL;
ALTER TABLE [ThirdPartyBulkerCrew] ADD [IsPrimaryCrew] bit;


