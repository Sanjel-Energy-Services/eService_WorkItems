-- Recreate new tables with latest genereated scripts
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'DrillOrder') DROP TABLE [dbo].[DrillOrder]
Go
CREATE TABLE [DrillOrder] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[SalesProjectid] int,[SalesProjectName] [nvarchar](100) NULL,[SalesProjectDescription] [nvarchar](500) NULL,[Ordinal] int,[ProgramId] nvarchar(255),[ProgramRevision] int,[IsPrimary] bit);
GO
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'JobOrder') DROP TABLE [dbo].[JobOrder]
Go
CREATE TABLE [JobOrder] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[DrillOrderid] int,[DrillOrderName] [nvarchar](100) NULL,[DrillOrderDescription] [nvarchar](500) NULL,[JobTypeid] int,[JobTypeName] [nvarchar](100) NULL,[JobTypeDescription] [nvarchar](500) NULL,[JobTypeSystemId] [int] Not NULL,[EstimateRevenue] float,[Ordinal] int,[Iteration] int);
GO
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'SalesProject') DROP TABLE [dbo].[SalesProject]
Go
CREATE TABLE [SalesProject] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[ClientCompanyid] int,[ClientCompanyName] [nvarchar](100) NULL,[ClientCompanyDescription] [nvarchar](500) NULL,[ClientCompanySystemId] [int] Not NULL,[ConsultingCompanyid] int,[ConsultingCompanyName] [nvarchar](100) NULL,[ConsultingCompanyDescription] [nvarchar](500) NULL,[ConsultingCompanySystemId] [int] Not NULL,[Districtid] int,[DistrictName] [nvarchar](100) NULL,[DistrictDescription] [nvarchar](500) NULL,[DistrictSystemId] [int] Not NULL,[Rigid] int,[RigName] [nvarchar](100) NULL,[RigDescription] [nvarchar](500) NULL,[RigSystemId] [int] Not NULL,[SalesRepresentativeid] int,[SalesRepresentativeName] [nvarchar](100) NULL,[SalesRepresentativeDescription] [nvarchar](500) NULL,[SalesRepresentativeSystemId] [int] Not NULL,[ServiceLineid] int,[ServiceLineName] [nvarchar](100) NULL,[ServiceLineDescription] [nvarchar](500) NULL,[ServiceLineSystemId] [int] Not NULL,[TechincalRepresentativeid] int,[TechincalRepresentativeName] [nvarchar](100) NULL,[TechincalRepresentativeDescription] [nvarchar](500) NULL,[TechincalRepresentativeSystemId] [int] Not NULL,[Area] nvarchar(255),[CmdStringCount] int,[Comments] nvarchar(255),[DrillDays] int,[EndTime] datetime,[EstimatedRevenue] float,[DaysToDrillWell] int,[ProgramId] nvarchar(255),[StartTime] datetime,[StringCount] int,[WellCount] int,[Status] int,[ApprovalStatus] int,[ProgramRevision] int,[SalesProjectId] nvarchar(255));
GO
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'SalesSpecialtyProduct') DROP TABLE [dbo].[SalesSpecialtyProduct]
Go
CREATE TABLE [SalesSpecialtyProduct] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[Productid] int,[ProductName] [nvarchar](100) NULL,[ProductDescription] [nvarchar](500) NULL,[ProductSystemId] [int] Not NULL,[SalesProjectid] int,[SalesProjectName] [nvarchar](100) NULL,[SalesProjectDescription] [nvarchar](500) NULL);
GO
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'ShippingLoadSheet') DROP TABLE [dbo].[ShippingLoadSheet]
Go
CREATE TABLE [ShippingLoadSheet] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2,[BaseAmountUnitid] int,[BaseAmountUnitName] [nvarchar](100) NULL,[BaseAmountUnitDescription] [nvarchar](500) NULL,[BaseAmountUnitSystemId] [int] Not NULL,[BulkPlantid] int,[BulkPlantName] [nvarchar](100) NULL,[BulkPlantDescription] [nvarchar](500) NULL,[BulkPlantSystemId] [int] Not NULL,[LoadAmountUnitid] int,[LoadAmountUnitName] [nvarchar](100) NULL,[LoadAmountUnitDescription] [nvarchar](500) NULL,[LoadAmountUnitSystemId] [int] Not NULL,[ProductHaulid] int,[ProductHaulName] [nvarchar](100) NULL,[ProductHaulDescription] [nvarchar](500) NULL,[ProductHaulSystemId] [int] Not NULL,[ProductHaulLoadid] int,[ProductHaulLoadName] [nvarchar](100) NULL,[ProductHaulLoadDescription] [nvarchar](500) NULL,[ProductHaulLoadSystemId] [int] Not NULL,[Rigid] int,[RigName] [nvarchar](100) NULL,[RigDescription] [nvarchar](500) NULL,[RigSystemId] [int] Not NULL,[SourceStorageid] int,[SourceStorageName] [nvarchar](100) NULL,[SourceStorageDescription] [nvarchar](500) NULL,[SourceStorageSystemId] [int] Not NULL,[BlendDescription] nvarchar(255),[BlendTestStatus] int,[CallSheetId] int,[CallSheetNumber] int,[ClientName] nvarchar(255),[ClientRepresentative] nvarchar(255),[Destination] nvarchar(255),[ExpectedOnLocationTime] datetime,[IsGoWithCrew] bit,[LoadAmount] float,[OnLocationTime] datetime,[ProgramId] nvarchar(255),[ShippingStatus] int,[EstimatedLoadTime] datetime,[BlendSectionId] int,[BaseAmount] float);
Go
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'PodLoad') DROP TABLE [dbo].[PodLoad]
Go
CREATE TABLE [PodLoad] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2,[BaseTonnageUnitid] int,[BaseTonnageUnitName] [nvarchar](100) NULL,[BaseTonnageUnitDescription] [nvarchar](500) NULL,[BaseTonnageUnitSystemId] [int] Not NULL,[LoadAmountUnitid] int,[LoadAmountUnitName] [nvarchar](100) NULL,[LoadAmountUnitDescription] [nvarchar](500) NULL,[LoadAmountUnitSystemId] [int] Not NULL,[ProductHaulid] int,[ProductHaulName] [nvarchar](100) NULL,[ProductHaulDescription] [nvarchar](500) NULL,[ProductHaulSystemId] [int] Not NULL,[ShippingLoadSheetid] int,[ShippingLoadSheetName] [nvarchar](100) NULL,[ShippingLoadSheetDescription] [nvarchar](500) NULL,[ShippingLoadSheetSystemId] [int] Not NULL,[LoadAmount] float,[PodIndex] int,[BaseTonnage] float);
GO
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'BlendUnloadSheet') DROP TABLE [dbo].[BlendUnloadSheet]
Go
CREATE TABLE [BlendUnloadSheet] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2,[BaseTonnageUnitid] int,[BaseTonnageUnitName] [nvarchar](100) NULL,[BaseTonnageUnitDescription] [nvarchar](500) NULL,[BaseTonnageUnitSystemId] [int] Not NULL,[DestinationStorageid] int,[DestinationStorageName] [nvarchar](100) NULL,[DestinationStorageDescription] [nvarchar](500) NULL,[DestinationStorageSystemId] [int] Not NULL,[ShippingLoadSheetid] int,[ShippingLoadSheetName] [nvarchar](100) NULL,[ShippingLoadSheetDescription] [nvarchar](500) NULL,[ShippingLoadSheetSystemId] [int] Not NULL,[UnloadAmountUnitid] int,[UnloadAmountUnitName] [nvarchar](100) NULL,[UnloadAmountUnitDescription] [nvarchar](500) NULL,[UnloadAmountUnitSystemId] [int] Not NULL,[UnloadAmount] float,[BaseTonnage] float);
GO

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'BulkerCrewLog') DROP TABLE [dbo].[BulkerCrewLog]
Go
CREATE TABLE [BulkerCrewLog] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2,[SanjelCrewid] int,[SanjelCrewName] [nvarchar](100) NULL,[SanjelCrewDescription] [nvarchar](500) NULL,[SanjelCrewSystemId] [int] Not NULL,[ThirdPartyBulkerCrewid] int,[ThirdPartyBulkerCrewName] [nvarchar](100) NULL,[ThirdPartyBulkerCrewDescription] [nvarchar](500) NULL,[ThirdPartyBulkerCrewSystemId] [int] Not NULL,[CrewStatus] int,[LastOffDutyTime] datetime,[LastUpdatedTime] datetime);
GO
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
    cast(PPJS.JD_JOB_TYPE_NAME as nvarchar(500)) as JobTypeName
from 
    SYN_ES_PRG_PUMPING_JOB_SECTIONS PPJS
    --left join dbo.JobTimeReport r on r.JobTypeid = cast(PPJS.JD_JOB_TYPE_ID as int) and r.PumperCount = cast(1 as int)
    left join dbo.JobTimeReport r on r.JobTypeid = cast(PPJS.JD_JOB_TYPE_ID as int) and r.PumperCount = cast(iif(IsNull(PPJS.PUMPER_COUNT, 0) = 0, 1, PPJS.PUMPER_COUNT) as int)
;

GO
ALTER TABLE [JobBase] ADD [TravelBaseCharge] float NULL Default 0;
ALTER TABLE [EstimateJob] ADD [TravelBaseCharge] float NULL Default 0;
ALTER TABLE [RigJob] ADD [TravelBaseCharge] float NULL Default 0;
GO

ALTER TABLE [ProductHaulLoad] ADD [TotalTonnageUnitid] int NULL;
ALTER TABLE [ProductHaulLoad] ADD [TotalTonnageUnitSystemId] int NULL;
ALTER TABLE [ProductHaulLoad] ADD [TotalTonnageUnitName] [nvarchar](100) NULL;
ALTER TABLE [ProductHaulLoad] ADD [TotalTonnageUnitDescription] [nvarchar](500) NULL;
GO



-- Assume Views of CallSheet, CallSheetBlendSection, CallSheetBlendAdditiveSection, JobDesignBlendSection, JobDesignBlendAdditiveSection, JobDesingPumpingJobSection are the latest

-- Data Preparation

eServiceOnline Deployment Script

1.Data Cleanup

1.1 Cleanup the product haul load stay as BlendCompleted but the associated call sheet is completed as on location

-- select * from ProductHaulLoad where effective_end_datetime > GETDATE() and ProductHaulLoadLifeStatus = 4 order by system_id desc;


http://localhost:44703/DataCleanUp/SetBlendCompletedProductHaulLoadOnLocationForCompletedJob

1.2 Cleanup the product haul load stay as scheduled but the associated call sheet is completed as on location

--select * from ProductHaulLoad where effective_end_datetime > GETDATE() and ProductHaulLoadLifeStatus = 1 order by system_id desc;
http://localhost:44703/DataCleanUp/SetScheduledProductHaulLoadOnLocationForCompletedJob

1.3 Delete the product haul load stay as scheduled but the associated call sheet is canceled

http://localhost:44703/DataCleanUp/SetScheduledProductHaulLoadDeletedForCancelledJob


1.4 Set Product Haul on location if all loads are on location
http://localhost:44703/DataCleanUp/SetProductHaulOnLocationIfAllLoadsOnLocation



2. Populate Shipping Load Sheet
http://localhost:44703/DataCleanUp/RefactorProductHualAndProductHualLoad


-- !!! blendsection id is not assigned, need fix --
--update ShippingLoadSheet set BlendSectionId = (select PHL.BlendSectionId from ProductHaulLoad PHL where PHL.CallSheetid = CallSheetId and ProductHaulLoadId= PHL.Id and PHL.effective_end_datetime > GETDATE());


New permission: BulkPlantIndex
Description: Online Use Case: Bulk Plant Board Access

3. Populate crew name in new format
http://localhost:44703/DataPrep/TestFormatAllCrews



-- Run with DRB P2 release

Update sanjelcrew set IsPrimaryCrew = 1 where effective_end_datetime > getdate();
GO

update SanjelDataUAT.dbo.RigJob set CallCrewTime = (select CIF_CALL_CREW_DATE_TIME from [dbo].[SYN_ES_CALLSHEET_HEADERS] cs where cs.CALL_SHEET_NUMBER = RigJob.CallSheetNumber)
where effective_end_datetime > GETDATE() and JobLifeStatus in (3,4,5,7);

-- Get latest employee rotation data and use data pre to populate

