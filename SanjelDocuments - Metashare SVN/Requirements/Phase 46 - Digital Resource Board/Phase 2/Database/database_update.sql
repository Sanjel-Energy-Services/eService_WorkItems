-- Run in production already
--ALTER TABLE [SanjelCrewSchedule] ADD [Type] [int] Default 2;
--ALTER TABLE [WorkerSchedule] ADD [Type] [int] Default 2;
--ALTER TABLE [UnitSchedule] ADD [Type] [int] Default 2;
--GO
--ALTER TABLE Sanjelcrew ADD IsPrimaryCrew bit Default 0;
--GO

-- following update has been solved by default value;
/*update SanjelCrewSchedule set Type = 2;
update [WorkerSchedule] set Type = 2;
update [UnitSchedule] set Type = 2;
Go
*/
/*
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
/* Run on PRD already
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

*/
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
/*update SanjelDataUAT.dbo.RigJob set CallCrewTime = (select CIF_CALL_CREW_DATE_TIME from eservice6UAT.dbo.CALLSHEET_HEADERS cs where cs.CALL_SHEET_NUMBER = RigJob.CallSheetNumber)
where effective_end_datetime > GETDATE() and JobLifeStatus in (3,4,5,7);

select * from RigJob where effective_end_datetime > GETDATE() and JobLifeStatus in (3,4,5,7);
*/
/*run on PRD already
ALTER TABLE [ShippingLoadSheet] ADD [BulkPlantid] int NULL;
ALTER TABLE [ShippingLoadSheet] ADD [BulkPlantSystemid] int NULL;
ALTER TABLE [ShippingLoadSheet] ADD [BulkPlantName] [nvarchar](100) NULL;
ALTER TABLE [ShippingLoadSheet] ADD [BulkPlantDescription] [nvarchar](500) NULL;
ALTER TABLE [ShippingLoadSheet] ADD [EstimatedLoadTime] datetime;
*/



/*
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
	cast(CSH.WLI_WELL_NAME as varchar(100))  as  WellName,
	cast(CSH.FC_EXPECTED_TIME_ON_LOC as datetime2(7)) as ExpectedOnLocationTime
	from dbo.[SYN_ES_CALLSHEET_HEADERS] CSH 
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
from SYN_ES_PUMP_BLEND_SCTNS PBD 
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
	cast(PBD.ADDITION_METHOD_ID - 1 as int) as AdditiveBlendMethodid,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditiveBlendMethodName,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditiveBlendMethodDescription,
	cast(0 as int) as AdditiveBlendMethodSystemId,
	cast(PBD.ADDITION_METHOD_ID - 1 as int) as AdditionMethodid,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditionMethodName,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditionMethodDescription,
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

from dbo.SYN_ES_PUMP_BLEND_BLEND_ADDTV_SCTNS PBD 
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
from SYN_ES_PRG_BLEND_SCTNS PBD 
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
	cast(PBD.ADDITION_METHOD_ID -1 as int) as AdditiveBlendMethodid,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditiveBlendMethodName,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditiveBlendMethodDescription,
	cast(0 as int) as AdditiveBlendMethodSystemId,
	cast(PBD.ADDITION_METHOD_ID - 1 as int) as AdditionMethodid,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditionMethodName,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditionMethodDescription,
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
from dbo.SYN_ES_PRG_BLEND_BLEND_ADDTV_SCTNS PBD 
Join BlendAdditiveMeasureUnit BAMU on PBD.AMOUNT_UNIT_ABBR = BAMU.Abbreviation and BAMU.effective_end_datetime > GETDATE()
GO


-- Feb 15, 2023
/*run on PRD already
ALTER TABLE [ThirdPartyBulkerCrew] ADD [ServicePointid] int NULL Default 0;
ALTER TABLE [ThirdPartyBulkerCrew] ADD [ServicePointSystemId] int NULL Default 0;
ALTER TABLE [ThirdPartyBulkerCrew] ADD [ServicePointName] [nvarchar](100) NULL;
ALTER TABLE [ThirdPartyBulkerCrew] ADD [ServicePointDescription] [nvarchar](500) NULL;
ALTER TABLE [ThirdPartyBulkerCrew] ADD [IsPrimaryCrew] bit Default 1;
*/
-- Feb 22, 2023

--CREATE TABLE [BulkerCrewLog] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2,[SanjelCrewid] int,[SanjelCrewName] [nvarchar](100) NULL,[SanjelCrewDescription] [nvarchar](500) NULL,[SanjelCrewSystemId] [int] Not NULL,[ThirdPartyBulkerCrewid] int,[ThirdPartyBulkerCrewName] [nvarchar](100) NULL,[ThirdPartyBulkerCrewDescription] [nvarchar](500) NULL,[ThirdPartyBulkerCrewSystemId] [int] Not NULL,[CrewStatus] int,[LastOffDutyTime] datetime,[LastUpdatedTime] datetime);
-- BlendShippingFacade should be a view 
/*
CREATE TABLE [BlendShippingFacade] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[BlendAmountUnitid] int,[BlendAmountUnitName] [nvarchar](100) NULL,[BlendAmountUnitDescription] [nvarchar](500) NULL,[BlendAmountUnitSystemId] [int] Not NULL,[BlendCategroryid] int,[BlendCategroryName] [nvarchar](100) NULL,[BlendCategroryDescription] [nvarchar](500) NULL,[BlendCategrorySystemId] [int] Not NULL,[BlendFluidTypeid] int,[BlendFluidTypeName] [nvarchar](100) NULL,[BlendFluidTypeDescription] [nvarchar](500) NULL,[BlendFluidTypeSystemId] [int] Not NULL,[BlendSectionId] int,[CallSheetId] int,[OnLocationTonnage] float,[ProgramId] nvarchar(255),[StatusCode] nvarchar(255),[TotalTonnage] float);
*/
/*
ALTER TABLE [ShippingLoadSheet] ADD [BlendSectionId] int NULL Default 0;

IF EXISTS (SELECT * FROM sys.views WHERE name = 'BlendShippingFacade') DROP VIEW BlendShippingFacade
GO
CREATE VIEW [dbo].[BlendShippingFacade]
with view_metadata
AS
select
cast(CBS.id as int) as id,
cast(0 as int) as entity_status,
cast(0 as int) as owner_id,
cast((CBS.BlendFluidTypeName + ' + Additives')as varchar(100)) as name,
(CBS.BlendFluidTypeName + CAST((SELECT ' + ', CAST(Amount as DECIMAL(5,2)) as [text()], AdditiveAmountUnitDescription as [text()], ' ', AdditiveTypeName as [text()] FROM CallSheetBlendAdditiveSection where CallSheetBlendSectionid=SLS.BlendSectionId order by AdditiveTypeName FOR XML PATH(''), TYPE) AS NVARCHAR(400)))
 as description,
cast(CBS.CallSheetid as int) as CallSheetId,
cast(CBS.id as int) as BlendSectionId,
cast(CBS.BlendCategoryid as int) as BlendCategoryId,
cast(CBS.BlendCategorySystemId as int) as BlendCategorySystemId,
cast(CBS.BlendCategoryName as nvarchar(100)) as BlendCategoryName,
cast(CBS.BlendCategoryDescription as nvarchar(500)) as BlendCategoryDescription,
cast(CBS.BlendFluidTypeid as int) as BlendFluidTypeid,
cast(CBS.BlendFluidTypeSystemId as int) as BlendFluidTypeSystemId,
cast(CBS.BlendFluidTypeName as nvarchar(100)) as BlendFluidTypeName,
cast(CBS.BlendFluidTypeDescription as nvarchar(500)) as BlendFluidTypeDescription,
cast(CBS.BlendAmountUnitid as int) as BlendAmountUnitid,
cast(CBS.BlendAmountUnitSystemId as int) as BlendAmountUnitSystemId,
cast(CBS.BlendAmountUnitName as nvarchar(100)) as BlendAmountUnitName,
cast(CBS.BlendAmountUnitDescription as nvarchar(500)) as BlendAmountUnitDescription,
cast(null as nvarchar(500)) as ProgramId,
cast(CBS.Quantity as float) as TotalTonnage,
cast(CASE WHEN SLS.OnLocationTonnage is null THEN 0 ELSE SLS.OnLocationTonnage/1000 END as float) as OnLocationTonnage,
cast(CASE WHEN SLS.ScheduledTonnage is null THEN '#FF0000'
WHEN SLS.ScheduledTonnage < (CBS.Quantity*1000) THEN '#FFBF00'
WHEN SLS.OnLocationTonnage > (CBS.Quantity*1000) THEN '#00FF00'
WHEN (SLS.ScheduledTonnage > (CBS.Quantity*1000))  THEN '#FFFF00'
ELSE '' 
END
as nvarchar(10)) as StatusCode
from CallSheetBlendSection CBS
join 
(select CallSheetId, 
	BlendSectionId,  
	SUM(CASE WHEN ShippingStatus = 3 THEN LoadAmount END) as OnLocationTonnage, 
	SUM(CASE WHEN ShippingStatus = 1 THEN LoadAmount END) as ScheduledTonnage 
	from ShippingLoadSheet where callsheetid <>0 and effective_end_datetime>GETDATE() group by CallSheetId, BlendSectionId) SLS 
on CBS.CallSheetId=SLS.CallSheetId and CBS.Id = SLS.BlendSectionId;
GO

IF OBJECT_ID(N'dbo.JobDesignPumpingJobSection', N'V') IS NOT NULL  
   DROP VIEW [dbo].[JobDesignPumpingJobSection];  
GO
CREATE VIEW [dbo].[JobDesignPumpingJobSection]
with view_metadata
AS
select 
    cast(PPJS.ID as int)                as ID,
    cast(0 as int)                      as entity_status,
    cast(PPJS.ROOT_ID as int)           as owner_id,
    cast(null as nvarchar(100))       as name,
    cast(null as nvarchar(500))       as description,
	PPJS.id as system_id, 
cast(1 as int) as version,
0 as [modified_user_id],
null as [modified_user_name],
cast(GETDATE() as datetime2) as [modified_datetime],
cast (0 as int) as [operation_type],
cast(GETDATE() as datetime2) as [effective_start_datetime],
cast('9999-12-31 23:59:59.0000000' as datetime2) as [effective_end_datetime],
    --cast(8 as int)                        as JobDurationOld,
    --cast(iif(IsNull(PPJS.NUM_OF_STAGES - 1, 0) = 0, IsNull(r.PrepDuration, 0) + IsNull(r.PumpingDuration, 0) + IsNull(r.PostJobDuration, 0), 8) as int) as JobDuration, -- just a test before PPJS.PUMPING_DURATION added to the table
    --cast(iif(IsNull(PPJS.PUMPING_DURATION, 0) = 0, IsNull(r.PrepDuration, 0) + IsNull(r.PumpingDuration, 0) + IsNull(r.PostJobDuration, 0), 8) as int) as JobDuration,
    cast(iif(IsNull(PPJS.PUMPING_DURATION, 0) = 0, IsNull(r.PrepDuration, 0) + IsNull(r.PumpingDuration, 0) + IsNull(r.PostJobDuration, 0), PPJS.PUMPING_DURATION) as int) as JobDuration,
    cast(isnull(PPJS.RISK_MATRIX, 0) as float) as RiskMatrix,
    --cast(1 as int)                        as PumperCount,
    cast(iif(IsNull(PPJS.PUMPER_COUNT, 0) = 0, 1, PPJS.PUMPER_COUNT) as int)    as PumperCount,
    PPJS.ROOT_ID                        as JobDesignid,
    cast(0 as int)                      as JobDesignSystemId,
    cast(null as nvarchar(100))       as JobDesignName,
    cast(null as nvarchar(500))       as JobDesignDescription,
    cast(PPJS.JD_JOB_TYPE_ID as int)    as JobTypeid,
    cast(0 as int)                      as JobTypeSystemId,
    cast(null as nvarchar(500))       as JobTypeDescription,
    cast(PPJS.JD_JOB_TYPE_NAME as nvarchar(500)) as JobTypeName
from 
    SYN_ES_PRG_PUMPING_JOB_SECTIONS PPJS
    --left join dbo.JobTimeReport r on r.JobTypeid = cast(PPJS.JD_JOB_TYPE_ID as int) and r.PumperCount = cast(1 as int)
    left join dbo.JobTimeReport r on r.JobTypeid = cast(PPJS.JD_JOB_TYPE_ID as int) and r.PumperCount = cast(iif(IsNull(PPJS.PUMPER_COUNT, 0) = 0, 1, PPJS.PUMPER_COUNT) as int)
;

GO

CREATE SYNONYM [dbo].[SYN_ES_PRG_CHRG_MTHD_DSCT_SCTNS] FOR [eservice6UAT].[dbo].[PRG_CHRG_MTHD_DSCT_SCTNS]
GO

IF OBJECT_ID(N'dbo.[JobDesign]', N'V') IS NOT NULL  
   DROP VIEW [dbo].[JobDesign];  
GO
CREATE VIEW [dbo].[JobDesign]
AS
select 
	PRG.id as id,
	0 as entity_status,
	0 as owner_id,
	null as name,
	null as description,
	PRG.id as system_id, 
	cast(1 as int) as version,
	0 as modified_user_id,
	null as modified_user_name,
	cast(PRG.LAST_MODIFIED_DATE_TIME as datetime2) as modified_datetime,
	PRG.LAST_OPERATION_TYPE as operation_type,
	cast(PRG.EFFECTIVE_START_DATE_TIME as datetime2) as effective_start_datetime,
	cast(PRG.EFFECTIVE_END_DATE_TIME as datetime2) as effective_end_datetime,
	1 as PumperCount,
	PCIS.COMPANY_ID as ClientCompanyid,
	0 as ClientCompanySystemId,
	PCIS.COMPANY_NAME as ClientCompanyName,
	PCIS.COMPANY_NAME as ClientCompanyDescription,
	COM.SHORT_NAME as ClientCompanyShortName,
	cast(0 as bit) as PreJobTesting,
	PRG.JD_SERVICE_POINT_ID as ServicePointid,
	0 as ServicePointSystemId,
	JD_SERVICE_POINT_NAME as ServicePointName,
	JD_SERVICE_POINT_NAME as ServicePointDescription,
	WLI_RIG_ID as Rigid,
	0 as RigSystemId,
	WLI_RIG_NAME as RigName,
	WLI_RIG_NAME as RigDescription,
	ESTIMATE_START_DATE as JobDateTime,
	PROGRAM_ID as ProgramId,
	cast(8 as int) as JobDuration,
	cast(0 as float) as RiskMatrix,
	cast(null as nvarchar(100)) as JobTypeName,
	cast(null as nvarchar(500)) as JobTypeDescription,
	cast(0 as int) as JobTypeid,
	cast(0 as int) as JobTypeSystemId,
	REVISION_DESCRIPTION as RevisionDescription,
	WLI_WELL_LOCATION as SurfaceLocation,
	Revision as Revision,
	Well_Count as WellCount,
	WLI_DH_WELL_LOCATION as WellLocation,
	cast(isnull(Is_Multiple_Well, 0) as bit) as IsMultipleWell,
	PROGRAM_GENERATED_DATE as ProgramGeneratedDate,
	CHRG.TRAVEL_BASE_CHARGE as TravelBaseCharge
from 
	SYN_ES_programs PRG 
	inner join SYN_ES_PRG_COMPANY_INFO_SCTNS PCIS on PCIS.ROOT_ID = PRG.id
	inner join SYN_ES_COMPANIES COM on COM.Id = PCIS.COMPANY_ID
	inner join SYN_ES_PRG_CHRG_MTHD_DSCT_SCTNS CHRG on CHRG.ROOT_ID=PRG.id
where 
	PCIS.IS_CLIENT = 1
GO

ALTER TABLE [JobBase] ADD [TravelBaseCharge] float NULL Default 0;
ALTER TABLE [EstimateJob] ADD [TravelBaseCharge] float NULL Default 0;
ALTER TABLE [RigJob] ADD [TravelBaseCharge] float NULL Default 0;
GO

ALTER TABLE [SalesProject] ADD [ProgramRevision] int NULL Default 0;
ALTER TABLE [DrillOrder] ADD [ProgramId] nvarchar(255);
ALTER TABLE [DrillOrder] ADD [ProgramRevision] int NULL Default 0;
ALTER TABLE [JobOrder] ADD [ProgramId] nvarchar(255);
ALTER TABLE [JobOrder] ADD [Revision] int NULL Default 0;
Go

ALTER TABLE [SalesProject] ADD [ConsultingCompanyid] int NULL Default 0;
ALTER TABLE [SalesProject] ADD [ConsultingCompanySystemId] int NULL Default 0;
ALTER TABLE [SalesProject] ADD [ConsultingCompanyName] [nvarchar](100) NULL;
ALTER TABLE [SalesProject] ADD [ConsultingCompanyDescription] [nvarchar](500) NULL;
ALTER TABLE [SalesProject] ADD [TechincalRepresentativeid] int NULL Default 0;
ALTER TABLE [SalesProject] ADD [TechincalRepresentativeSystemId] int NULL Default 0;
ALTER TABLE [SalesProject] ADD [TechincalRepresentativeName] [nvarchar](100) NULL;
ALTER TABLE [SalesProject] ADD [TechincalRepresentativeDescription] [nvarchar](500) NULL;


EXEC sp_rename 'dbo.SalesProject.FREQUENCY', 'DaysToDrillWell', 'COLUMN';
GO

ALTER TABLE [SalesProject] ADD [Status] int NULL Default 0;
ALTER TABLE [SalesProject] ADD [ApprovalStatus] int NULL Default 0;
GO

-- Mar 20, 2023
ALTER TABLE [BlendUnloadSheet] ADD [BaseTonnage] FLOAT;
ALTER TABLE [BlendUnloadSheet] ADD [BaseTonnageUnitid] int NULL;
ALTER TABLE [BlendUnloadSheet] ADD [BaseTonnageUnitSystemId] int NULL;
ALTER TABLE [BlendUnloadSheet] ADD [BaseTonnageUnitName] [nvarchar](100) NULL;
ALTER TABLE [BlendUnloadSheet] ADD [BaseTonnageUnitDescription] [nvarchar](500) NULL;
ALTER TABLE [BlendUnloadSheet] ADD [UnloadAmountUnitid] int NULL;
ALTER TABLE [BlendUnloadSheet] ADD [UnloadAmountUnitSystemId] int NULL;
ALTER TABLE [BlendUnloadSheet] ADD [UnloadAmountUnitName] [nvarchar](100) NULL;
ALTER TABLE [BlendUnloadSheet] ADD [UnloadAmountUnitDescription] [nvarchar](500) NULL;

ALTER TABLE [PodLoad] ADD [BaseTonnage] FLOAT;
ALTER TABLE [PodLoad] ADD [BaseTonnageUnitid] int NULL;
ALTER TABLE [PodLoad] ADD [BaseTonnageUnitSystemId] int NULL;
ALTER TABLE [PodLoad] ADD [BaseTonnageUnitName] [nvarchar](100) NULL;
ALTER TABLE [PodLoad] ADD [BaseTonnageUnitDescription] [nvarchar](500) NULL;
ALTER TABLE [PodLoad] ADD [LoadAmountUnitid] int NULL;
ALTER TABLE [PodLoad] ADD [LoadAmountUnitSystemId] int NULL;
ALTER TABLE [PodLoad] ADD [LoadAmountUnitName] [nvarchar](100) NULL;
ALTER TABLE [PodLoad] ADD [LoadAmountUnitDescription] [nvarchar](500) NULL;

ALTER TABLE [ProductHaulLoad] ADD [TotalTonnageUnitid] int NULL;
ALTER TABLE [ProductHaulLoad] ADD [TotalTonnageUnitSystemId] int NULL;
ALTER TABLE [ProductHaulLoad] ADD [TotalTonnageUnitName] [nvarchar](100) NULL;
ALTER TABLE [ProductHaulLoad] ADD [TotalTonnageUnitDescription] [nvarchar](500) NULL;

ALTER TABLE [ShippingLoadSheet] ADD [BaseAmount] FLOAT;
ALTER TABLE [ShippingLoadSheet] ADD [BaseAmountUnitid] int NULL;
ALTER TABLE [ShippingLoadSheet] ADD [BaseAmountUnitSystemId] int NULL;
ALTER TABLE [ShippingLoadSheet] ADD [BaseAmountUnitName] [nvarchar](100) NULL;
ALTER TABLE [ShippingLoadSheet] ADD [BaseAmountUnitDescription] [nvarchar](500) NULL;
ALTER TABLE [ShippingLoadSheet] ADD [LoadAmountUnitid] int NULL;
ALTER TABLE [ShippingLoadSheet] ADD [LoadAmountUnitSystemId] int NULL;
ALTER TABLE [ShippingLoadSheet] ADD [LoadAmountUnitName] [nvarchar](100) NULL;
ALTER TABLE [ShippingLoadSheet] ADD [LoadAmountUnitDescription] [nvarchar](500) NULL;
ALTER TABLE [ShippingLoadSheet] ADD [Rigid] int NULL;
ALTER TABLE [ShippingLoadSheet] ADD [RigSystemId] int NULL;
ALTER TABLE [ShippingLoadSheet] ADD [RigDescription] [nvarchar](500) NULL;

ALTER TABLE [DrillOrder] ADD [IsPrimary] bit;
ALTER TABLE [JobOrder] ADD [Iteration] int NULL;

ALTER TABLE [SalesProject] ADD [SalesProjectId] nvarchar(255);
GO

ALTER TABLE [DrillOrder] ADD [WellCount] int NULL;
GO

ALTER TABLE [ShippingLoadSheet] ADD [ServicePointid] int NULL Default 0;
ALTER TABLE [ShippingLoadSheet] ADD [ServicePointSystemId] int NULL Default 0;
ALTER TABLE [ShippingLoadSheet] ADD [ServicePointName] [nvarchar](100) NULL;
ALTER TABLE [ShippingLoadSheet] ADD [ServicePointDescription] [nvarchar](500) NULL;
GO

-- Mar 30

CREATE TABLE [sld_TestData] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[Type] int,[StoragePath] nvarchar(255),[StorageProtocol] nvarchar(255),[TestResultid] int,[TestResultName] [nvarchar](100) NULL,[TestResultDescription] [nvarchar](500) NULL,[TestResultSystemId] [int] Not NULL);
ALTER TABLE [sld_TestOutput] ADD [BooleanValue] bit;
ALTER TABLE [sld_TestOutput] ADD [StringValue] [nvarchar](Max) NULL;
ALTER TABLE [sld_TestResult] ADD [Comments] [nvarchar](Max) NULL;
ALTER TABLE [BinLoadHistory] ADD [TimeStamp] datetime NULL;

-- Apr 3

ALTER TABLE [ClientCompany] ADD [Status] int Default 0;
ALTER TABLE [DrillingCompany] ADD [Status] int Default 0;
ALTER TABLE [Company] ADD [Status] int Default 0;

CREATE TABLE [SalesProjectUpdateHistory] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[SalesProjectid] int,[SalesProjectName] [nvarchar](100) NULL,[SalesProjectDescription] [nvarchar](500) NULL,[FieldName] nvarchar(255),[TimeStamp] datetime);

CREATE TABLE [SalesProjectStatusHistory] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[SalesProjectid] int,[SalesProjectName] [nvarchar](100) NULL,[SalesProjectDescription] [nvarchar](500) NULL,[IsDeleted] bit,[Status] int,[TimeStamp] datetime);

ALTER TABLE [SalesProject] ADD [StringsWell] int Default 0;
ALTER TABLE [SalesProject] ADD [JobTypesWell] int Default 0;


-- Blend Shipping Facade performance optimization
-- Old Script backup

DROP VIEW [dbo].[BlendProgress]
GO

CREATE VIEW [dbo].[BlendProgress]
AS
select PHL.CallSheetId as CallSheetId,
	PHL.BlendSectionId as BlendSectionId,
	SUM(CASE WHEN SL.ShippingStatus = 3 THEN SL.LoadAmount END) as OnLocationTonnage, 
	SUM(CASE WHEN PHL.ProductHaulLoadLifeStatus = 1 THEN BaseAmount END) as ScheduledTonnage,
	SUM(CASE WHEN PHL.ProductHaulLoadLifeStatus in (3, 4) THEN LoadAmount END) as BlendingTonnage
	from ProductHaulLoad PHL 
	join ShippingLoadSheet SL on PHL.Id = SL.ProductHaulLoadid
	where PHL.callsheetid <>0 and SL.effective_end_datetime>GETDATE() and PHL.effective_end_datetime>getdate() group by PHL.CallSheetId, PHL.BlendSectionId
GO

DROP VIEW [dbo].[BlendShippingFacade]
GO

CREATE VIEW [dbo].[BlendShippingFacade]
with view_metadata
AS
select
cast(CBS.id as int) as id,
cast(0 as int) as entity_status,
cast(0 as int) as owner_id,
cast((CBS.BlendFluidTypeName + ' + Additives')as varchar(100)) as name,
(CBS.BlendFluidTypeName + CAST((SELECT ' + ', CONVERT(DECIMAL(10,2),ISNULL(Amount, 0.00)), AdditiveAmountUnitDescription as [text()], ' ', AdditiveTypeName as [text()] FROM CallSheetBlendAdditiveSection where CallSheetBlendSectionid=SLS.BlendSectionId order by AdditiveTypeName FOR XML PATH(''), TYPE) AS NVARCHAR(400)))
 as description,
cast(CBS.CallSheetid as int) as CallSheetId,
cast(CBS.id as int) as BlendSectionId,
cast(CBS.BlendCategoryid as int) as BlendCategoryId,
cast(CBS.BlendCategorySystemId as int) as BlendCategorySystemId,
cast(CBS.BlendCategoryName as nvarchar(100)) as BlendCategoryName,
cast(CBS.BlendCategoryDescription as nvarchar(500)) as BlendCategoryDescription,
cast(CBS.BlendFluidTypeid as int) as BlendFluidTypeid,
cast(CBS.BlendFluidTypeSystemId as int) as BlendFluidTypeSystemId,
cast(CBS.BlendFluidTypeName as nvarchar(100)) as BlendFluidTypeName,
cast(CBS.BlendFluidTypeDescription as nvarchar(500)) as BlendFluidTypeDescription,
cast(CBS.BlendAmountUnitid as int) as BlendAmountUnitid,
cast(CBS.BlendAmountUnitSystemId as int) as BlendAmountUnitSystemId,
cast(CBS.BlendAmountUnitName as nvarchar(100)) as BlendAmountUnitName,
cast(CBS.BlendAmountUnitDescription as nvarchar(500)) as BlendAmountUnitDescription,
cast(null as nvarchar(500)) as ProgramId,
cast(CBS.Quantity as float) as TotalTonnage,
cast(CASE WHEN SLS.OnLocationTonnage is null THEN 0 ELSE SLS.OnLocationTonnage/1000 END as float) as OnLocationTonnage,
cast(CASE 
WHEN SLS.OnLocationTonnage >= (CBS.Quantity*1000) THEN '#00FF00'
WHEN SLS.ScheduledTonnage is null and SLS.OnLocationTonnage is null and SLS.BlendingTonnage is null THEN '#FF0000'
WHEN SLS.ScheduledTonnage is not null and SLS.OnLocationTonnage is null and SLS.BlendingTonnage is null THEN '#FFFF00'
--WHEN SLS.ScheduledTonnage is not null and SLS.OnLocationTonnage is null and SLS.BlendingTonnage is not null THEN '#FFBF00'
--WHEN SLS.ScheduledTonnage is null  and SLS.OnLocationTonnage is not null and SLS.BlendingTonnage is null and SLS.OnLocationTonnage < (CBS.Quantity*1000) THEN '#FFBF00'
--WHEN SLS.ScheduledTonnage is null  and SLS.OnLocationTonnage is not null and SLS.BlendingTonnage is not null and (SLS.BlendingTonnage + SLS.OnLocationTonnage) < (CBS.Quantity*1000) THEN '#FFBF00'
--WHEN SLS.ScheduledTonnage is not null  and SLS.OnLocationTonnage is not null and SLS.BlendingTonnage is null and (SLS.ScheduledTonnage + SLS.OnLocationTonnage) < (CBS.Quantity*1000) THEN '#FFBF00'
--WHEN SLS.ScheduledTonnage is not null  and SLS.OnLocationTonnage is not null and SLS.BlendingTonnage is not null and (SLS.ScheduledTonnage + SLS.OnLocationTonnage + SLS.BlendingTonnage) < (CBS.Quantity*1000) THEN '#FFBF00'
WHEN (SLS.ScheduledTonnage >= (CBS.Quantity*1000))  THEN '#FFFF00'
ELSE '#FFBF00' 
END
as nvarchar(10)) as StatusCode
from CallSheetBlendSection CBS
left outer join [BlendProgress] SLS
on CBS.CallSheetId=SLS.CallSheetId and CBS.Id = SLS.BlendSectionId where CBS.IsNeedHaul = 1 or SLS.CallSheetId is not null;
GO
*/
USE [SanjelData]
GO

/****** Object:  View [dbo].[CallSheet]    Script Date: 4/18/2023 11:13:21 AM ******/
DROP VIEW [dbo].[CallSheet]
GO

/****** Object:  View [dbo].[CallSheet]    Script Date: 4/18/2023 11:13:21 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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
	cast(CSH.WLI_WELL_NAME as varchar(100))  as  WellName,
	cast(CSH.FC_EXPECTED_TIME_ON_LOC as datetime2(7)) as ExpectedOnLocationTime
	from dbo.[SYN_ES_CALLSHEET_HEADERS] CSH 
GO

USE [SanjelData]
GO

/****** Object:  View [dbo].[CallSheetBlendAdditiveSection]    Script Date: 4/18/2023 11:13:37 AM ******/
DROP VIEW [dbo].[CallSheetBlendAdditiveSection]
GO

/****** Object:  View [dbo].[CallSheetBlendAdditiveSection]    Script Date: 4/18/2023 11:13:37 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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
	cast(PBD.ADDITION_METHOD_ID - 1 as int) as AdditiveBlendMethodid,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditiveBlendMethodName,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditiveBlendMethodDescription,
	cast(0 as int) as AdditiveBlendMethodSystemId,
	cast(PBD.ADDITION_METHOD_ID - 1 as int) as AdditionMethodid,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditionMethodName,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditionMethodDescription,
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

from dbo.SYN_ES_PUMP_BLEND_BLEND_ADDTV_SCTNS PBD 
Join BlendAdditiveMeasureUnit BAMU on PBD.AMOUNT_UNIT_ABBR = BAMU.Abbreviation and BAMU.effective_end_datetime > GETDATE()

GO

USE [SanjelData]
GO

/****** Object:  View [dbo].[CallSheetBlendSection]    Script Date: 4/18/2023 11:13:53 AM ******/
DROP VIEW [dbo].[CallSheetBlendSection]
GO

/****** Object:  View [dbo].[CallSheetBlendSection]    Script Date: 4/18/2023 11:13:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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
	cast(PBD.BLEND_CATEGORY_NAME as varchar(100)) as BlendCategoryDescription,
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
from SYN_ES_PUMP_BLEND_SCTNS PBD 
Join BlendAdditiveMeasureUnit BAMU on PBD.BLEND_AMOUNT_UNIT_ABBR = BAMU.Abbreviation and BAMU.effective_end_datetime > GETDATE()
GO


-- Updated script for beter perfomance. Call sheet within 30 days. All related blend information limited to call sheets

USE [SanjelData]
GO

/****** Object:  View [dbo].[CallSheet]    Script Date: 4/18/2023 11:15:00 AM ******/
DROP VIEW [dbo].[CallSheet]
GO

/****** Object:  View [dbo].[CallSheet]    Script Date: 4/18/2023 11:15:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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
	cast(CSH.WLI_WELL_NAME as varchar(100))  as  WellName,
	cast(CSH.FC_EXPECTED_TIME_ON_LOC as datetime2(7)) as ExpectedOnLocationTime
	from dbo.[SYN_ES_CALLSHEET_HEADERS] CSH where CSH.STATUS in (1,2,5) and CSH.GENERATED_DATETIME > DateADD(MONTH, -1, GETDATE());
GO

/****** Object:  View [dbo].[CallSheetBlendSection]    Script Date: 4/18/2023 11:15:35 AM ******/
DROP VIEW [dbo].[CallSheetBlendSection]
GO

/****** Object:  View [dbo].[CallSheetBlendSection]    Script Date: 4/18/2023 11:15:35 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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
	cast(PBD.BLEND_CATEGORY_NAME as varchar(100)) as BlendCategoryDescription,
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
from SYN_ES_PUMP_BLEND_SCTNS PBD 
Join BlendAdditiveMeasureUnit BAMU on PBD.BLEND_AMOUNT_UNIT_ABBR = BAMU.Abbreviation and BAMU.effective_end_datetime > GETDATE()
Join CallSheet CS on PBD.ROOT_ID = CS.ID
GO

/****** Object:  View [dbo].[CallSheetBlendAdditiveSection]    Script Date: 4/18/2023 11:16:06 AM ******/
DROP VIEW [dbo].[CallSheetBlendAdditiveSection]
GO

/****** Object:  View [dbo].[CallSheetBlendAdditiveSection]    Script Date: 4/18/2023 11:16:06 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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
	cast(PBD.ADDITION_METHOD_ID - 1 as int) as AdditiveBlendMethodid,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditiveBlendMethodName,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditiveBlendMethodDescription,
	cast(0 as int) as AdditiveBlendMethodSystemId,
	cast(PBD.ADDITION_METHOD_ID - 1 as int) as AdditionMethodid,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditionMethodName,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditionMethodDescription,
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

from dbo.SYN_ES_PUMP_BLEND_BLEND_ADDTV_SCTNS PBD 
Join BlendAdditiveMeasureUnit BAMU on PBD.AMOUNT_UNIT_ABBR = BAMU.Abbreviation and BAMU.effective_end_datetime > GETDATE()
Join CallSheet CS on PBD.ROOT_ID = CS.ID
GO

-- Set all existing company status as Active.

  update ClientCompany set status = 1;
  
-- Apr 21 MDM Changes

EXEC sp_rename 'dbo.BulkerCrewLog.LastOffDutyTime', 'EnrouteTime', 'COLUMN';
GO

ALTER TABLE [DrillOrder] ADD [SalesProjectSystemId] int NULL Default 0;
Go
ALTER TABLE [SalesProjectStatusHistory] ADD [SalesProjectSystemId] int NULL Default 0;
Go
ALTER TABLE [SalesProjectUpdateHistory] ADD [SalesProjectSystemId] int NULL Default 0;
Go
ALTER TABLE [SalesSpecialtyProduct] ADD [SalesProjectSystemId] int NULL Default 0;
Go


Drop TABLE SalesProject;
GO

CREATE TABLE [SalesProject] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2,[ClientCompanyid] int,[ClientCompanyName] [nvarchar](100) NULL,[ClientCompanyDescription] [nvarchar](500) NULL,[ClientCompanySystemId] [int] Not NULL,[ConsultingCompanyid] int,[ConsultingCompanyName] [nvarchar](100) NULL,[ConsultingCompanyDescription] [nvarchar](500) NULL,[ConsultingCompanySystemId] [int] Not NULL,[Districtid] int,[DistrictName] [nvarchar](100) NULL,[DistrictDescription] [nvarchar](500) NULL,[DistrictSystemId] [int] Not NULL,[Rigid] int,[RigName] [nvarchar](100) NULL,[RigDescription] [nvarchar](500) NULL,[RigSystemId] [int] Not NULL,[SalesRepresentativeid] int,[SalesRepresentativeName] [nvarchar](100) NULL,[SalesRepresentativeDescription] [nvarchar](500) NULL,[SalesRepresentativeSystemId] [int] Not NULL,[ServiceLineid] int,[ServiceLineName] [nvarchar](100) NULL,[ServiceLineDescription] [nvarchar](500) NULL,[ServiceLineSystemId] [int] Not NULL,[TechincalRepresentativeid] int,[TechincalRepresentativeName] [nvarchar](100) NULL,[TechincalRepresentativeDescription] [nvarchar](500) NULL,[TechincalRepresentativeSystemId] [int] Not NULL,[Area] nvarchar(255),[JobTypesWell] int,[Comments] nvarchar(255),[DrillDays] int,[EndTime] datetime,[EstimatedRevenue] float,[DaysToDrillWell] int,[ProgramId] nvarchar(255),[StartTime] datetime,[StringsWell] int,[WellCount] int,[Status] int,[ApprovalStatus] int,[ProgramRevision] int,[SalesProjectId] nvarchar(255));
GO

CREATE TABLE [EntityUid] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[EntityPrefix] nvarchar(255),[EntityType] nvarchar(255),[Sequence] int,[Year] int);
Go

-- DRB 2.1 RELEASE
update sanjelcrew set HomeServicePointid = workingServicepointid, HomeServicePointName = WorkingServicePointName where HomeServicePointName is null and effective_end_datetime > getdate();
Go
EXEC sp_rename 'dbo.BulkerCrewLog.LastOffDutyTime', 'EnrouteTime', 'COLUMN';
GO

-- Apr 27, 2023 - Sales Project updates

Drop TABLE SalesProject;
GO

CREATE TABLE [SalesProject] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2,[ClientCompanyid] int,[ClientCompanyName] [nvarchar](100) NULL,[ClientCompanyDescription] [nvarchar](500) NULL,[ClientCompanySystemId] [int] Not NULL,[ConsultingCompanyid] int,[ConsultingCompanyName] [nvarchar](100) NULL,[ConsultingCompanyDescription] [nvarchar](500) NULL,[ConsultingCompanySystemId] [int] Not NULL,[Districtid] int,[DistrictName] [nvarchar](100) NULL,[DistrictDescription] [nvarchar](500) NULL,[DistrictSystemId] [int] Not NULL,[Rigid] int,[RigName] [nvarchar](100) NULL,[RigDescription] [nvarchar](500) NULL,[RigSystemId] [int] Not NULL,[SalesRepresentativeid] int,[SalesRepresentativeName] [nvarchar](100) NULL,[SalesRepresentativeDescription] [nvarchar](500) NULL,[SalesRepresentativeSystemId] [int] Not NULL,[ServiceLineid] int,[ServiceLineName] [nvarchar](100) NULL,[ServiceLineDescription] [nvarchar](500) NULL,[ServiceLineSystemId] [int] Not NULL,[TechincalRepresentativeid] int,[TechincalRepresentativeName] [nvarchar](100) NULL,[TechincalRepresentativeDescription] [nvarchar](500) NULL,[TechincalRepresentativeSystemId] [int] Not NULL,[Area] nvarchar(255),[JobTypesWell] int,[Comments] nvarchar(255),[DrillDays] int,[EndTime] datetime,[EstimatedRevenue] float,[DaysToDrillWell] int,[ProgramId] nvarchar(255),[StartTime] datetime,[StringsWell] int,[WellCount] int,[Status] int,[ApprovalStatus] int,[ProgramRevision] int,[SalesProjectUid] nvarchar(255),[BidProgramNumber] nvarchar(255),[BidProgramRevision] nvarchar(255),[RepresentativeProgramRevision] nvarchar(255),[RepresentativeProgramNumber] nvarchar(255));
Go

CREATE TRIGGER [dbo].[TR_SalesProject_StatusChange] ON [dbo].[SalesProject]
        AFTER INSERT --, UPDATE, DELETE
    AS
        BEGIN
                
            --Process updated records
            INSERT INTO SalesProjectStatusHistory (
                [SalesProjectid],
                [SalesProjectName],
                [SalesProjectDescription],
                [IsDeleted],
                [Status],
                [TimeStamp]
            )
            SELECT
                i.[id],
                i.[name],
                i.[description],
                i.entity_status,
                i.[Status],
                GetDate()
            FROM 
                Inserted i 
            WHERE 
                i.[Status] not in (
                        SELECT TOP 1 h.[Status] 
                        FROM SalesProjectStatusHistory h 
                        WHERE h.SalesProjectid = i.Id
                        ORDER BY h.[TimeStamp] DESC
                )
                     or (i.entity_status = 1)
            ;
        END;
GO

ALTER TABLE [dbo].[SalesProject] ENABLE TRIGGER [TR_SalesProject_StatusChange]
GO
/* Production - May 9
CREATE TABLE [BlendChemicalFunction] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[BlendCategoryid] int,[BlendCategoryName] [nvarchar](100) NULL,[BlendCategoryDescription] [nvarchar](500) NULL,[BlendCategorySystemId] [int] Not NULL,[BlendChemicalid] int,[BlendChemicalName] [nvarchar](100) NULL,[BlendChemicalDescription] [nvarchar](500) NULL,[BlendChemicalSystemId] [int] Not NULL,[AdditiveFunction] int,[Ordinal] int);
CREATE TABLE [SpecialtyProduct] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[BlendChemicalid] int,[BlendChemicalName] [nvarchar](100) NULL,[BlendChemicalDescription] [nvarchar](500) NULL,[BlendChemicalSystemId] [int] Not NULL,[ServicePointid] int,[ServicePointName] [nvarchar](100) NULL,[ServicePointDescription] [nvarchar](500) NULL,[ServicePointSystemId] [int] Not NULL);
GO

-- May 4, 2023

DROP VIEW [dbo].[CallSheet]
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
	cast(CSH.WLI_WELL_NAME as varchar(100))  as  WellName,
	cast(CSH.FC_EXPECTED_TIME_ON_LOC as datetime2(7)) as ExpectedOnLocationTime,
	cast(CSH.JD_SERVICE_POINT_ID as int) as ServicePointid,
	cast(0 as int) as ServicePointSystemId,
	cast(CSH.JD_SERVICE_POINT_NAME as varchar(100)) as ServicePointName,
	cast(null as varchar(500)) as ServicePointDescription
	from dbo.[SYN_ES_CALLSHEET_HEADERS] CSH where CSH.STATUS in (1,2,5) and CSH.GENERATED_DATETIME > DateADD(Day, -30, GETDATE());
GO

DROP VIEW [dbo].[BlendProgress]
GO

CREATE VIEW [dbo].[BlendProgress]
AS
select PHL.CallSheetId as CallSheetId,
	PHL.BlendSectionId as BlendSectionId,
	SUM(CASE WHEN SL.ShippingStatus = 3 THEN SL.LoadAmount END) as OnLocationTonnage, 
	SUM(CASE WHEN PHL.ProductHaulLoadLifeStatus = 1 THEN BaseAmount END) as ScheduledTonnage,
	SUM(CASE WHEN PHL.ProductHaulLoadLifeStatus in (3, 4) THEN LoadAmount END) as BlendingTonnage
	from ProductHaulLoad PHL 
	join ShippingLoadSheet SL on PHL.Id = SL.ProductHaulLoadid
	where PHL.callsheetid <>0 and SL.effective_end_datetime>GETDATE() and PHL.effective_end_datetime>getdate() group by PHL.CallSheetId, PHL.BlendSectionId
GO

DROP VIEW [dbo].[BlendShippingFacade]
GO

CREATE VIEW [dbo].[BlendShippingFacade]
with view_metadata
AS
select
cast(CBS.id as int) as id,
cast(0 as int) as entity_status,
cast(0 as int) as owner_id,
cast((CBS.BlendFluidTypeName + ' + Additives')as varchar(100)) as name,
(CBS.BlendFluidTypeName + CAST((SELECT ' + ', CONVERT(DECIMAL(10,2),ISNULL(Amount, 0.00)), AdditiveAmountUnitDescription as [text()], ' ', AdditiveTypeName as [text()] FROM CallSheetBlendAdditiveSection where CallSheetBlendSectionid=SLS.BlendSectionId order by AdditiveTypeName FOR XML PATH(''), TYPE) AS NVARCHAR(400)))
 as description,
cast(CBS.CallSheetid as int) as CallSheetId,
cast(CBS.id as int) as BlendSectionId,
cast(CBS.BlendCategoryid as int) as BlendCategoryId,
cast(CBS.BlendCategorySystemId as int) as BlendCategorySystemId,
cast(CBS.BlendCategoryName as nvarchar(100)) as BlendCategoryName,
cast(CBS.BlendCategoryDescription as nvarchar(500)) as BlendCategoryDescription,
cast(CBS.BlendFluidTypeid as int) as BlendFluidTypeid,
cast(CBS.BlendFluidTypeSystemId as int) as BlendFluidTypeSystemId,
cast(CBS.BlendFluidTypeName as nvarchar(100)) as BlendFluidTypeName,
cast(CBS.BlendFluidTypeDescription as nvarchar(500)) as BlendFluidTypeDescription,
cast(CBS.BlendAmountUnitid as int) as BlendAmountUnitid,
cast(CBS.BlendAmountUnitSystemId as int) as BlendAmountUnitSystemId,
cast(CBS.BlendAmountUnitName as nvarchar(100)) as BlendAmountUnitName,
cast(CBS.BlendAmountUnitDescription as nvarchar(500)) as BlendAmountUnitDescription,
cast(null as nvarchar(500)) as ProgramId,
cast(CBS.Quantity as float) as TotalTonnage,
cast(CASE WHEN SLS.OnLocationTonnage is null THEN 0 ELSE SLS.OnLocationTonnage/1000 END as float) as OnLocationTonnage,
cast(CASE 
WHEN SLS.OnLocationTonnage >= (CBS.Quantity*1000) THEN '#00FF00'
WHEN SLS.ScheduledTonnage is null and SLS.OnLocationTonnage is null and SLS.BlendingTonnage is null THEN '#FF0000'
WHEN SLS.ScheduledTonnage is not null and SLS.OnLocationTonnage is null and SLS.BlendingTonnage is null THEN '#FFFF00'
--WHEN SLS.ScheduledTonnage is not null and SLS.OnLocationTonnage is null and SLS.BlendingTonnage is not null THEN '#FFBF00'
--WHEN SLS.ScheduledTonnage is null  and SLS.OnLocationTonnage is not null and SLS.BlendingTonnage is null and SLS.OnLocationTonnage < (CBS.Quantity*1000) THEN '#FFBF00'
--WHEN SLS.ScheduledTonnage is null  and SLS.OnLocationTonnage is not null and SLS.BlendingTonnage is not null and (SLS.BlendingTonnage + SLS.OnLocationTonnage) < (CBS.Quantity*1000) THEN '#FFBF00'
--WHEN SLS.ScheduledTonnage is not null  and SLS.OnLocationTonnage is not null and SLS.BlendingTonnage is null and (SLS.ScheduledTonnage + SLS.OnLocationTonnage) < (CBS.Quantity*1000) THEN '#FFBF00'
--WHEN SLS.ScheduledTonnage is not null  and SLS.OnLocationTonnage is not null and SLS.BlendingTonnage is not null and (SLS.ScheduledTonnage + SLS.OnLocationTonnage + SLS.BlendingTonnage) < (CBS.Quantity*1000) THEN '#FFBF00'
WHEN (SLS.ScheduledTonnage >= (CBS.Quantity*1000))  THEN '#FFFF00'
ELSE '#FFBF00' 
END
as nvarchar(10)) as StatusCode,
CS.ServicePointid as ServicePointid,
CS.ServicePointSystemId as ServicePointSystemId,
CS.ServicePointName as ServicePointName,
CS.ServicePointDescription as ServicePointDescription
from CallSheetBlendSection CBS
left outer join [BlendProgress] SLS on CBS.CallSheetId=SLS.CallSheetId and CBS.Id = SLS.BlendSectionId 
join [CallSheet] CS on CBS.CallSheetid = CS.Id
where CBS.IsNeedHaul = 1 or SLS.CallSheetId is not null;
GO

DROP TABLE [DrillOrder];
GO
CREATE TABLE [DrillOrder] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[SalesProjectid] int,[SalesProjectName] [nvarchar](100) NULL,[SalesProjectDescription] [nvarchar](500) NULL,[SalesProjectSystemId] [int] Not NULL,[Ordinal] int,[ProgramId] nvarchar(255),[ProgramRevision] int,[IsMainProgram] bit,[WellCount] int,[IsBid] int);
GO

Drop TABLE SalesProject;
GO

CREATE TABLE [SalesProject] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2,[ClientCompanyid] int,[ClientCompanyName] [nvarchar](100) NULL,[ClientCompanyDescription] [nvarchar](500) NULL,[ClientCompanySystemId] [int] Not NULL,[ConsultingCompanyid] int,[ConsultingCompanyName] [nvarchar](100) NULL,[ConsultingCompanyDescription] [nvarchar](500) NULL,[ConsultingCompanySystemId] [int] Not NULL,[Districtid] int,[DistrictName] [nvarchar](100) NULL,[DistrictDescription] [nvarchar](500) NULL,[DistrictSystemId] [int] Not NULL,[Engineerid] int,[EngineerName] [nvarchar](100) NULL,[EngineerDescription] [nvarchar](500) NULL,[EngineerSystemId] [int] Not NULL,[Rigid] int,[RigName] [nvarchar](100) NULL,[RigDescription] [nvarchar](500) NULL,[RigSystemId] [int] Not NULL,[SalesRepresentativeid] int,[SalesRepresentativeName] [nvarchar](100) NULL,[SalesRepresentativeDescription] [nvarchar](500) NULL,[SalesRepresentativeSystemId] [int] Not NULL,[ServiceLineid] int,[ServiceLineName] [nvarchar](100) NULL,[ServiceLineDescription] [nvarchar](500) NULL,[ServiceLineSystemId] [int] Not NULL,[Area] nvarchar(255),[JobTypesWell] int,[Comments] nvarchar(255),[DrillDays] int,[EndTime] datetime,[EstimatedRevenue] float,[DaysToDrillWell] int,[ProgramNumber] nvarchar(255),[StartTime] datetime,[StringsWell] int,[WellCount] int,[Status] int,[ApprovalStatus] int,[ProgramRevision] int,[SalesProjectUid] nvarchar(255),[RepresentativeProgramRevision] nvarchar(255),[RepresentativeProgramNumber] nvarchar(255),[RigStatus] int);
GO

CREATE TRIGGER [dbo].[TR_SalesProject_StatusChange] ON [dbo].[SalesProject]
        AFTER INSERT --, UPDATE, DELETE
    AS
        BEGIN
                
            --Process updated records
            INSERT INTO SalesProjectStatusHistory (
                [SalesProjectid],
                [SalesProjectName],
                [SalesProjectDescription],
                [IsDeleted],
                [Status],
                [TimeStamp]
            )
            SELECT
                i.[id],
                i.[name],
                i.[description],
                i.entity_status,
                i.[Status],
                GetDate()
            FROM 
                Inserted i 
            WHERE 
                i.[Status] not in (
                        SELECT TOP 1 h.[Status] 
                        FROM SalesProjectStatusHistory h 
                        WHERE h.SalesProjectid = i.Id
                        ORDER BY h.[TimeStamp] DESC
                )
                     or (i.entity_status = 1)
            ;
        END;
GO
ALTER TABLE [dbo].[SalesProject] ENABLE TRIGGER [TR_SalesProject_StatusChange]
GO
DROP VIEW [dbo].[JobDesign]
GO

CREATE VIEW [dbo].[JobDesign]
AS
select 
	PRG.id as id,
	0 as entity_status,
	0 as owner_id,
	null as name,
	null as description,
	PRG.id as system_id, 
	cast(1 as int) as version,
	0 as modified_user_id,
	null as modified_user_name,
	cast(PRG.LAST_MODIFIED_DATE_TIME as datetime2) as modified_datetime,
	PRG.LAST_OPERATION_TYPE as operation_type,
	cast(PRG.EFFECTIVE_START_DATE_TIME as datetime2) as effective_start_datetime,
	cast(PRG.EFFECTIVE_END_DATE_TIME as datetime2) as effective_end_datetime,
	1 as PumperCount,
	PCIS.COMPANY_ID as ClientCompanyid,
	0 as ClientCompanySystemId,
	PCIS.COMPANY_NAME as ClientCompanyName,
	PCIS.COMPANY_NAME as ClientCompanyDescription,
	COM.SHORT_NAME as ClientCompanyShortName,
	cast(0 as bit) as PreJobTesting,
	PRG.JD_SERVICE_POINT_ID as ServicePointid,
	0 as ServicePointSystemId,
	JD_SERVICE_POINT_NAME as ServicePointName,
	JD_SERVICE_POINT_NAME as ServicePointDescription,
	WLI_RIG_ID as Rigid,
	0 as RigSystemId,
	WLI_RIG_NAME as RigName,
	WLI_RIG_NAME as RigDescription,
	ESTIMATE_START_DATE as JobDateTime,
	PROGRAM_ID as ProgramId,
	cast(8 as int) as JobDuration,
	cast(0 as float) as RiskMatrix,
	cast(null as nvarchar(100)) as JobTypeName,
	cast(null as nvarchar(500)) as JobTypeDescription,
	cast(0 as int) as JobTypeid,
	cast(0 as int) as JobTypeSystemId,
	REVISION_DESCRIPTION as RevisionDescription,
	WLI_WELL_LOCATION as SurfaceLocation,
	Revision as Revision,
	Well_Count as WellCount,
	WLI_DH_WELL_LOCATION as WellLocation,
	cast(isnull(Is_Multiple_Well, 0) as bit) as IsMultipleWell,
	PROGRAM_GENERATED_DATE as ProgramGeneratedDate,
	CHRG.TRAVEL_BASE_CHARGE as TravelBaseCharge,
	Is_Bid_Program as IsBidProgram, 
	cast(PROGRAM_EXPIRY_DATE as datetime2) as ProgramExpiryDate
from 
	SYN_ES_programs PRG 
	inner join SYN_ES_PRG_COMPANY_INFO_SCTNS PCIS on PCIS.ROOT_ID = PRG.id
	inner join SYN_ES_COMPANIES COM on COM.Id = PCIS.COMPANY_ID
	inner join SYN_ES_PRG_CHRG_MTHD_DSCT_SCTNS CHRG on CHRG.ROOT_ID=PRG.id
where 
	PCIS.IS_CLIENT = 1
GO

DROP VIEW [dbo].[JobDesignPumpingJobSection]
GO

CREATE VIEW [dbo].[JobDesignPumpingJobSection]
with view_metadata
AS
select 
    cast(PPJS.ID as int)                as ID,
    cast(0 as int)                      as entity_status,
    cast(PPJS.ROOT_ID as int)           as owner_id,
    cast(null as nvarchar(100))       as name,
    cast(null as nvarchar(500))       as description,
	PPJS.id as system_id, 
cast(1 as int) as version,
0 as [modified_user_id],
null as [modified_user_name],
DATEADD(day, -1, CAST(GETDATE() AS datetime2)) as [modified_datetime],
cast (0 as int) as [operation_type],
DATEADD(day, -1, CAST(GETDATE() AS datetime2)) as [effective_start_datetime],
cast('9999-12-31 23:59:59.0000000' as datetime2) as [effective_end_datetime],
    --cast(8 as int)                        as JobDurationOld,
    --cast(iif(IsNull(PPJS.NUM_OF_STAGES - 1, 0) = 0, IsNull(r.PrepDuration, 0) + IsNull(r.PumpingDuration, 0) + IsNull(r.PostJobDuration, 0), 8) as int) as JobDuration, -- just a test before PPJS.PUMPING_DURATION added to the table
    --cast(iif(IsNull(PPJS.PUMPING_DURATION, 0) = 0, IsNull(r.PrepDuration, 0) + IsNull(r.PumpingDuration, 0) + IsNull(r.PostJobDuration, 0), 8) as int) as JobDuration,
    cast(iif(IsNull(PPJS.PUMPING_DURATION, 0) = 0, IsNull(r.PrepDuration, 0) + IsNull(r.PumpingDuration, 0) + IsNull(r.PostJobDuration, 0), PPJS.PUMPING_DURATION) as int) as JobDuration,
    cast(isnull(PPJS.RISK_MATRIX, 0) as float) as RiskMatrix,
    --cast(1 as int)                        as PumperCount,
    cast(iif(IsNull(PPJS.PUMPER_COUNT, 0) = 0, 1, PPJS.PUMPER_COUNT) as int)    as PumperCount,
    PPJS.ROOT_ID                        as JobDesignid,
    cast(0 as int)                      as JobDesignSystemId,
    cast(null as nvarchar(100))       as JobDesignName,
    cast(null as nvarchar(500))       as JobDesignDescription,
    cast(PPJS.JD_JOB_TYPE_ID as int)    as JobTypeid,
    cast(0 as int)                      as JobTypeSystemId,
    cast(null as nvarchar(500))       as JobTypeDescription,
    cast(PPJS.JD_JOB_TYPE_NAME as nvarchar(500)) as JobTypeName,
    cast(PPJS.EXECUTION_ORDER as int) as ExecutionOrder
from 
    SYN_ES_PRG_PUMPING_JOB_SECTIONS PPJS
    --left join dbo.JobTimeReport r on r.JobTypeid = cast(PPJS.JD_JOB_TYPE_ID as int) and r.PumperCount = cast(1 as int)
    left join dbo.JobTimeReport r on r.JobTypeid = cast(PPJS.JD_JOB_TYPE_ID as int) and r.PumperCount = cast(iif(IsNull(PPJS.PUMPER_COUNT, 0) = 0, 1, PPJS.PUMPER_COUNT) as int)
;
GO

CREATE TABLE [RemedialObjective] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL);
GO
*/

-- May 8

/*ALTER TABLE [SanjelCrew] ADD [ServiceLineid] int NULL Default 0;
ALTER TABLE [SanjelCrew] ADD [ServiceLineSystemId] int NULL Default 0;
ALTER TABLE [SanjelCrew] ADD [ServiceLineName] [nvarchar](100) NULL;
ALTER TABLE [SanjelCrew] ADD [ServiceLineDescription] [nvarchar](500) NULL;
ALTER TABLE [SanjelCrew] ADD [IsDeleted] bit Default 0;

ALTER TABLE [EstimateJob] ADD [SalesProjectUid] [nvarchar](255) NULL;
ALTER TABLE [RigJob] ADD [SalesProjectUid] [nvarchar](255) NULL;

ALTER TABLE [SalesProject] ADD [WellLocation] [nvarchar](255) NULL;
*/
/*
DROP VIEW [dbo].[JobDesign]
GO

CREATE VIEW [dbo].[JobDesign]
AS
select 
	PRG.id as id,
	0 as entity_status,
	0 as owner_id,
	null as name,
	null as description,
	PRG.id as system_id, 
	cast(1 as int) as version,
	0 as modified_user_id,
	null as modified_user_name,
	cast(PRG.LAST_MODIFIED_DATE_TIME as datetime2) as modified_datetime,
	PRG.LAST_OPERATION_TYPE as operation_type,
	cast(PRG.EFFECTIVE_START_DATE_TIME as datetime2) as effective_start_datetime,
	cast(PRG.EFFECTIVE_END_DATE_TIME as datetime2) as effective_end_datetime,
	1 as PumperCount,
	PCIS.COMPANY_ID as ClientCompanyid,
	0 as ClientCompanySystemId,
	PCIS.COMPANY_NAME as ClientCompanyName,
	PCIS.COMPANY_NAME as ClientCompanyDescription,
	COM.SHORT_NAME as ClientCompanyShortName,
	cast(0 as bit) as PreJobTesting,
	PRG.JD_SERVICE_POINT_ID as ServicePointid,
	0 as ServicePointSystemId,
	JD_SERVICE_POINT_NAME as ServicePointName,
	JD_SERVICE_POINT_NAME as ServicePointDescription,
	WLI_RIG_ID as Rigid,
	0 as RigSystemId,
	WLI_RIG_NAME as RigName,
	WLI_RIG_NAME as RigDescription,
	ESTIMATE_START_DATE as JobDateTime,
	PROGRAM_ID as ProgramId,
	cast(8 as int) as JobDuration,
	cast(0 as float) as RiskMatrix,
	cast(null as nvarchar(100)) as JobTypeName,
	cast(null as nvarchar(500)) as JobTypeDescription,
	cast(0 as int) as JobTypeid,
	cast(0 as int) as JobTypeSystemId,
	REVISION_DESCRIPTION as RevisionDescription,
	WLI_WELL_LOCATION as SurfaceLocation,
	Revision as Revision,
	Well_Count as WellCount,
	WLI_DH_WELL_LOCATION as WellLocation,
	cast(isnull(Is_Multiple_Well, 0) as bit) as IsMultipleWell,
	PROGRAM_GENERATED_DATE as ProgramGeneratedDate,
	CHRG.TRAVEL_BASE_CHARGE as TravelBaseCharge,
	Is_Bid_Program as IsBidProgram, 
	cast(PROGRAM_EXPIRY_DATE as datetime2) as ProgramExpiryDate,
	cast(null as nvarchar(100)) as SalesProjectUid
from 
	SYN_ES_programs PRG 
	inner join SYN_ES_PRG_COMPANY_INFO_SCTNS PCIS on PCIS.ROOT_ID = PRG.id
	inner join SYN_ES_COMPANIES COM on COM.Id = PCIS.COMPANY_ID
	inner join SYN_ES_PRG_CHRG_MTHD_DSCT_SCTNS CHRG on CHRG.ROOT_ID=PRG.id
where 
	PCIS.IS_CLIENT = 1
GO


CREATE TABLE [RigWorkReport] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[FromJobTypeid] int,[FromJobTypeName] [nvarchar](100) NULL,[FromJobTypeDescription] [nvarchar](500) NULL,[FromJobTypeSystemId] [int] Not NULL,[Rigid] int,[RigName] [nvarchar](100) NULL,[RigDescription] [nvarchar](500) NULL,[RigSystemId] [int] Not NULL,[ServicePointid] int,[ServicePointName] [nvarchar](100) NULL,[ServicePointDescription] [nvarchar](500) NULL,[ServicePointSystemId] [int] Not NULL,[ToJobTypeid] int,[ToJobTypeName] [nvarchar](100) NULL,[ToJobTypeDescription] [nvarchar](500) NULL,[JobCount] int,[MaxTime] int,[MedianTime] int,[MinTime] int);


-- May 11

Drop TABLE CREATE TABLE [SalesProject]
GO

CREATE TABLE [SalesProject] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2,[ClientCompanyid] int,[ClientCompanyName] [nvarchar](100) NULL,[ClientCompanyDescription] [nvarchar](500) NULL,[ClientCompanySystemId] [int] Not NULL,[ConsultingCompanyid] int,[ConsultingCompanyName] [nvarchar](100) NULL,[ConsultingCompanyDescription] [nvarchar](500) NULL,[ConsultingCompanySystemId] [int] Not NULL,[Districtid] int,[DistrictName] [nvarchar](100) NULL,[DistrictDescription] [nvarchar](500) NULL,[DistrictSystemId] [int] Not NULL,[Engineerid] int,[EngineerName] [nvarchar](100) NULL,[EngineerDescription] [nvarchar](500) NULL,[EngineerSystemId] [int] Not NULL,[Rigid] int,[RigName] [nvarchar](100) NULL,[RigDescription] [nvarchar](500) NULL,[RigSystemId] [int] Not NULL,[SalesRepresentativeid] int,[SalesRepresentativeName] [nvarchar](100) NULL,[SalesRepresentativeDescription] [nvarchar](500) NULL,[SalesRepresentativeSystemId] [int] Not NULL,[ServiceLineid] int,[ServiceLineName] [nvarchar](100) NULL,[ServiceLineDescription] [nvarchar](500) NULL,[ServiceLineSystemId] [int] Not NULL,[Area] nvarchar(255),[JobTypesWell] int,[Comments] nvarchar(255),[DrillDays] int,[EndTime] datetime,[EstimatedRevenue] float,[DaysToDrillWell] int,[StartTime] datetime,[StringsWell] int,[WellCount] int,[Status] int,[ApprovalStatus] int,[SalesProjectUid] nvarchar(255),[RepresentativeProgramRevision] nvarchar(255),[RepresentativeProgramNumber] nvarchar(255),[RigStatus] int,[WellLocation] nvarchar(255));

CREATE TRIGGER [dbo].[TR_SalesProject_StatusChange] ON [dbo].[SalesProject]
        AFTER INSERT --, UPDATE, DELETE
    AS
        BEGIN
                
            --Process updated records
            INSERT INTO SalesProjectStatusHistory (
                [SalesProjectid],
                [SalesProjectName],
                [SalesProjectDescription],
                [IsDeleted],
                [Status],
                [TimeStamp]
            )
            SELECT
                i.[id],
                i.[name],
                i.[description],
                i.entity_status,
                i.[Status],
                GetDate()
            FROM 
                Inserted i 
            WHERE 
                i.[Status] not in (
                        SELECT TOP 1 h.[Status] 
                        FROM SalesProjectStatusHistory h 
                        WHERE h.SalesProjectid = i.Id
                        ORDER BY h.[TimeStamp] DESC
                )
                     or (i.entity_status = 1)
            ;
        END;
GO
ALTER TABLE [dbo].[SalesProject] ENABLE TRIGGER [TR_SalesProject_StatusChange]
GO

ALTER TABLE DrillOrder ALTER COLUMN IsBid bit;
GO

Drop TABLE RigWorkReport;
GO

CREATE TABLE [RigWorkReport] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[FromJobTypeid] int,[FromJobTypeName] [nvarchar](100) NULL,[FromJobTypeDescription] [nvarchar](500) NULL,[FromJobTypeSystemId] [int] Not NULL,[Rigid] int,[RigName] [nvarchar](100) NULL,[RigDescription] [nvarchar](500) NULL,[RigSystemId] [int] Not NULL,[ServicePointid] int,[ServicePointName] [nvarchar](100) NULL,[ServicePointDescription] [nvarchar](500) NULL,[ServicePointSystemId] [int] Not NULL,[ToJobTypeid] int,[ToJobTypeName] [nvarchar](100) NULL,[ToJobTypeDescription] [nvarchar](500) NULL,[ToJobTypeSystemId] [int] Not NULL,[JobCount] int,[MaxTime] int,[MedianTime] int,[MinTime] int);
GO

-- May 15

Drop VIEW [dbo].[ActiveCrewList]
Go

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
	,crew.IsDeleted
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
	,crew.ServiceLineSystemId
	,crew.ServiceLineName
	,crew.ServiceLineDescription
	,crew.ServiceLineid
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
*/

-- May 23, Update product haul status for crew status change.

-- Update all assigned assignment to scheduled.
update rigjobsanjelcrewsection set rigjobcrewsectionstatus = 2 where system_id in 
(
select RJSCS.system_id from rigjobsanjelcrewsection RJSCS
join producthaul PH on RJSCS.ProductHaulId = PH.Id 
where RJSCS.rigjobcrewsectionstatus = 1 and RJSCS.effective_end_datetime> Getdate() and PH.ProductHaulLifeStatus = 2 and PH.effective_end_datetime> Getdate()
);

-- Update all on location product hauls' assignments off duty
update rigjobsanjelcrewsection set rigjobcrewsectionstatus = 6 where system_id in 
(
select RJSCS.system_id from rigjobsanjelcrewsection RJSCS
join producthaul PH on RJSCS.ProductHaulId = PH.Id 
where RJSCS.rigjobcrewsectionstatus = 1 and RJSCS.effective_end_datetime> Getdate() and PH.ProductHaulLifeStatus = 4 and PH.effective_end_datetime> Getdate()
);

-- Jun 7, Add Toreance Factor to BlendChemical 

ALTER TABLE [BlendChemical] ADD [ToleranceFactor] float NULL;

-- Fix third party crew data
update contractorcompany set effective_end_datetime = getdate() where id in (11, 10, 9, 8, 7, 6, 5, 4, 3, 2);


SET IDENTITY_INSERT [dbo].[ContractorCompany] ON 
GO
INSERT [dbo].[ContractorCompany] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (1, 1, 1, 0, NULL, CAST(N'2018-01-30T00:00:00.0000000' AS DateTime2), 1, CAST(N'2018-01-30T00:00:00.0000000' AS DateTime2), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2), 0, 0, N'Total Transload', N'Total Transload Services')
GO
INSERT [dbo].[ContractorCompany] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (12, 12, 1, 0, NULL, CAST(N'2023-06-15T15:16:25.6600000' AS DateTime2), 1, CAST(N'2023-06-15T15:16:25.6600000' AS DateTime2), CAST(N'9999-12-31T23:59:59.0000000' AS DateTime2), 0, 0, N'Living Sky', N'Living Sky Transport Inc.')
GO
INSERT [dbo].[ContractorCompany] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (13, 13, 1, 0, NULL, CAST(N'2023-06-15T15:18:01.1970000' AS DateTime2), 1, CAST(N'2023-06-15T15:18:01.1970000' AS DateTime2), CAST(N'9999-12-31T23:59:59.0000000' AS DateTime2), 0, 0, N'Courage', N'Courage Oilfield Services Ltd')
GO
INSERT [dbo].[ContractorCompany] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (14, 14, 1, 0, NULL, CAST(N'2023-06-15T15:18:15.7270000' AS DateTime2), 1, CAST(N'2023-06-15T15:18:15.7270000' AS DateTime2), CAST(N'9999-12-31T23:59:59.0000000' AS DateTime2), 0, 0, N'Cascade', N'Cascade Carriers LP')
GO
INSERT [dbo].[ContractorCompany] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (15, 15, 1, 0, NULL, CAST(N'2023-06-15T15:18:29.6030000' AS DateTime2), 1, CAST(N'2023-06-15T15:18:29.6030000' AS DateTime2), CAST(N'9999-12-31T23:59:59.0000000' AS DateTime2), 0, 0, N'Komat', N'Komat Drilling Ltd')
GO
INSERT [dbo].[ContractorCompany] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (16, 16, 1, 0, NULL, CAST(N'2023-06-15T15:19:36.8300000' AS DateTime2), 1, CAST(N'2023-06-15T15:19:36.8300000' AS DateTime2), CAST(N'9999-12-31T23:59:59.0000000' AS DateTime2), 0, 0, N'Shane Evans', N'Shane Evans Trucking')
GO

update thirdpartybulkercrew set ContractorCompanyid = 12 where  ContractorCompanyName = 'Living Sky' and effective_end_datetime > getdate();
update thirdpartybulkercrew set ContractorCompanyid = 13 where  ContractorCompanyName = 'Courage' and effective_end_datetime > getdate();
update thirdpartybulkercrew set ContractorCompanyid = 14 where  ContractorCompanyName = 'Cascade' and effective_end_datetime > getdate();
update thirdpartybulkercrew set ContractorCompanyid = 15 where  ContractorCompanyName = 'Komat' and effective_end_datetime > getdate();
GO