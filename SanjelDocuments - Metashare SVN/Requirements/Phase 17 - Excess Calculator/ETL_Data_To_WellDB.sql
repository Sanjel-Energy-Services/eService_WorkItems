Use SanjelData

drop table [wld_JobHistoryStaging];
drop table [wld_JobOpenHoleStaging];
drop table [wld_CasingHistoryStaging];
drop table [wld_JobCasingPipeStaging];

drop table [wld_CasingPipe];
drop table [wld_OpenHole];
drop table [wld_PipeSegment];
drop table [wld_Well];
drop table [wld_Wellbore];
drop table [wld_WellboreSegment];
drop table [wld_CasingHistory];

drop table [wld_WellType];
drop table [wld_WellChallenge];
drop table [wld_AerWellLicenseStaging];

-- Create new TABLESPACE

CREATE TABLE [wld_Well] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](255) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2,[DownHoleLocation] ntext,[Latitude] decimal(18,2),[Licence] nvarchar(255),[Longitude] decimal(18,2),[SurfaceLocation] ntext,[WellLocationType] int,[WellOperatorid] int,[WellOperatorName] [nvarchar](100) NULL,[WellOperatorDescription] [nvarchar](500) NULL,[WellOperatorSystemId] [int] Not NULL,[WellTypeid] int,[WellTypeName] [nvarchar](100) NULL,[WellTypeDescription] [nvarchar](500) NULL);


CREATE TABLE [wld_Wellbore] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL);

CREATE TABLE [wld_WellboreSegment] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[Excess] float,[MeasuredDepthFrom] float,[MeasuredDepthTo] float,[PumpedExcess] float,[VerticalDepthFrom] float,[VerticalDepthTo] float,[Wellid] int,[WellName] [nvarchar](255) NULL,[WellDescription] [nvarchar](500) NULL,[WellSystemId] [int] Not NULL);
CREATE TABLE [wld_PipeSegment] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[AnnularVolume] float,[InnerPipeCasingType] int,[InnerPipeOutsideDiameter] float,[Length] float,[OuterPipeCasingType] int,[OuterPipeInsideDiameter] float,[OuterPipeOutsideDiameter] float,[PipeVolume] float,[WellboreSegmentid] int,[WellboreSegmentName] [nvarchar](100) NULL,[WellboreSegmentDescription] [nvarchar](500) NULL);

CREATE TABLE [wld_CasingHistory] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[JobTypeid] int,[JobTypeName] [nvarchar](100) NULL,[JobTypeDescription] [nvarchar](500) NULL,[JobTypeSystemId] [int] Not NULL,[Wellid] int,[WellName] [nvarchar](255) NULL,[WellDescription] [nvarchar](500) NULL,[WellSystemId] [int] Not NULL,[JobDateTime] datetime,[JobNumber] int,[PumpedVolume] float,[ReturnedVolume] float,[UniqueId] nvarchar(255),[Interval] int,[DepthFrom] float,[DepthTo] float);


CREATE TABLE [wld_CasingPipe] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[CasingType] int,[InsideDiameter] float,[MeasuredDepthFrom] float,[MeasuredDepthTo] float,[OutsideDiameter] float,[TrueVerticalDepthFrom] float,[TrueVerticalDepthTo] float,[Wellid] int,[WellName] [nvarchar](255) NULL,[WellDescription] [nvarchar](500) NULL,[WellSystemId] [int] Not NULL);

CREATE TABLE [wld_OpenHole] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[MeasuredDepthFrom] float,[MeasuredDepthTo] float,[Size] float,[TrueVerticalDepthFrom] float,[TrueVerticalDepthTo] float,[Wellid] int,[WellName] [nvarchar](255) NULL,[WellDescription] [nvarchar](500) NULL,[WellSystemId] [int] Not NULL);

CREATE TABLE [wld_CasingHistoryStaging] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[CasingCategory] int,[JobUniqueId] nvarchar(255),[PumpedVolume] float,[ReturnedVolume] float,[Interval] int);

CREATE TABLE [wld_JobCasingPipeStaging] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[CasingType] int,[InsideDiameter] float,[JobUniqueId] nvarchar(255),[MeasuredDepthFrom] float,[MeasuredDepthTo] float,[Size] float);

CREATE TABLE [wld_JobHistoryStaging] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[JobDateTime] datetime,[JobNumber] int,[JobTypeId] int,[JobTypeName] nvarchar(255),[UniqueId] nvarchar(255),[WellDownHoleLocation] nvarchar(255),[WellName] nvarchar(255),[WellSurfaceLocation] nvarchar(255),[NumberOfIntervals] int,[StageDepth] float);

CREATE TABLE [wld_JobOpenHoleStaging] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[JobUniqueId] nvarchar(255),[MeasuredDepthFrom] float,[MeasuredDepthTo] float,[Size] float,[TrueVerticalDepthFrom] float,[TrueVerticalDepthTo] float);

CREATE TABLE [wld_WellChallenge] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[Comments] nvarchar(255),[MeridianFrom] int,[MeridianTo] int,[RangeFrom] int,[RangeTo] int,[TownshipFrom] int,[TownshipTo] int,[Tvd] int);
CREATE TABLE [wld_WellType] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL);
CREATE TABLE [wld_AerWellLicenseStaging] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[AerClassification] nvarchar(255),[AerFieldCenter] nvarchar(255),[DrillingOperation] nvarchar(255),[Field] nvarchar(255),[GroudElevation] float,[Licensee] nvarchar(255),[LicenseNumber] nvarchar(255),[MineralRights] nvarchar(255),[ProjectedDepth] float,[Substance] nvarchar(255),[SurfaceCoordinates] nvarchar(255),[SurfaceLocation] nvarchar(255),[TerminatingZone] nvarchar(255),[UniqueIdentifier] nvarchar(255),[WellName] nvarchar(255),[WellPurpose] nvarchar(255),[WellType] nvarchar(255),[IssueDate] datetime,[Latitude] nvarchar(255),[Longitude] nvarchar(255));

-- Move data from eService6 to SanjelData


select * from SYN_ES_jobs where  JOB_DATE_TIME > '2022-06-01' and JT_JOB_TYPE_ID in ( 1504,1505,1506,1507,1508,1533, 1538,1536);

select * from  SYN_ES_JOB_TYPES where id in ( 1504,1505,1506,1507,1508,1533, 1538,1536);

-- casing job ids
-- 1504,1505,1506,1507,1508,1533, 1538,1536

truncate table [wld_JobHistoryStaging];
truncate table [wld_JobOpenHoleStaging];
truncate table [wld_CasingHistoryStaging];
truncate table [wld_JobCasingPipeStaging];

truncate table [wld_CasingPipe];
truncate table [wld_OpenHole];
truncate table [wld_PipeSegment];
truncate table [wld_Well];
truncate table [wld_Wellbore];
truncate table [wld_WellboreSegment];
truncate table [wld_CasingHistory];


-- ETL Job Data to Staging
INSERT INTO [dbo].[wld_JobHistoryStaging]
           ([entity_status]
           ,[owner_id]
           ,[name]
           ,[description]
           ,[UniqueId]
           ,[JobDateTime]
           ,[JobTypeId]
           ,[WellSurfaceLocation]
           ,[WellName]
           ,[JobNumber]
           ,[JobTypeName]
           ,[WellDownHoleLocation]
		   ,[NumberOfIntervals]
		   ,[StageDepth]
		   )
select  0 , 0 , '' ,'' , 
JB.UNIQUE_ID, JB.JOB_DATE_TIME, JB.JT_JOB_TYPE_ID, ISNULL(JB.WLI_WELL_LOCATION, JB.WLI_DH_WELL_LOCATION), JB.WLI_WELL_NAME, JB.JOB_NUMBER, JB.JT_JOB_TYPE_NAME, ISNULL(JB.WLI_DH_WELL_LOCATION, JB.WLI_WELL_LOCATION), PSR.NUM_OF_STAGES, 
CASE PSR.NUM_OF_STAGES
	WHEN 2 THEN PDTS.DEPTH
	ELSE null
END
from SYN_ES_JOBS JB 
Join SYN_ES_SERVICE_REPORT_HEADERS SRH on JB.UNIQUE_ID = SRH.UNIQUE_ID
Join SYN_ES_PUMPING_SERVICE_REPORTS PSR on PSR.ROOT_ID = SRH.Id
Left Outer Join SYN_ES_PSPT_DOWNHOLE_TOOL_SCTNS PDTS on PDTS.ROOT_ID = SRH.Id  and PDTS.DEPTH<>0 
where  JB.JOB_DATE_TIME > '2023-06-01' and JB.JT_JOB_TYPE_ID in ( 1504,1505,1506,1507,1508,1533, 1538,1536)
and(PSR.NUM_OF_STAGES = 1 or (PSR.NUM_OF_STAGES = 2 and PDTS.DOWN_HOLE_TOOL_TYPE_ID in (11, 16)));


INSERT INTO [dbo].[wld_JobOpenHoleStaging]
           ([entity_status]
           ,[owner_id]
           ,[name]
           ,[description]
           ,[TrueVerticalDepthFrom]
           ,[Size]
           ,[MeasuredDepthFrom]
           ,[MeasuredDepthTo]
           ,[TrueVerticalDepthTo]
           ,[JobUniqueId])
select 0,0, '','',ISNULL(OH.TRUE_VERTICAL_DEPTHFROM, 0), OH.HOLE_SIZE, ISNULL(OH.DEPTHFROM, 0), ISNULL(OH.DEPTHTO, 0), ISNULL(OH.TRUE_VERTICAL_DEPTHTO, 0), SRH.UNIQUE_ID from SYN_ES_PSPT_OPEN_HOLE_SCTNS OH
join SYN_ES_SERVICE_REPORT_HEADERS SRH on OH.ROOT_ID = SRH.ID
join [dbo].wld_JobHistoryStaging JHS on SRH.UNIQUE_ID = JHS.UNIQUEID ;

-- Pumped Blends


 INSERT INTO [dbo].[wld_CasingHistoryStaging]
           ([entity_status]
           ,[owner_id]
           ,[name]
           ,[description]
           ,[CasingCategory]
           ,[JobUniqueId]
           ,[PumpedVolume]
		   ,[Interval])
select 0,0,'','',BLEND_CATEGORY_ID, SRH.UNIQUE_ID, PBS.PUMPED_VOLUME, PBS.INTERVAL
from SYN_ES_PSPT_BLEND_SCTNS PBS
join SYN_ES_SERVICE_REPORT_HEADERS SRH on PBS.ROOT_ID = SRH.ID
join [dbo].wld_JobHistoryStaging JHS on SRH.UNIQUE_ID = JHS.UNIQUEID 
where pBS.BLEND_CATEGORY_ID in (4,5,6,7,8);

select top(1000) * from SYN_ES_PSPT_DOWNHOLE_TOOL_SCTNS where down_hole_tool_type_name like 'Stage%' order by id desc;

select top(1000) * from SYN_ES_SERVICE_REPORT_HEADERS where id = 1133644

select top(1000) *
from eservice6.dbo.PSPT_BLEND_SCTNS PBS order by id desc;

-- Fluid Return
INSERT INTO [dbo].[wld_CasingHistoryStaging]
           ([entity_status]
           ,[owner_id]
           ,[name]
           ,[description]
           ,[CasingCategory]
           ,[JobUniqueId]
           ,[PumpedVolume],
		   [Interval])
select 0,0,'','',99, SRH.UNIQUE_ID, isnull(PBS.TR_FLUID_RETURN_VOLUME, 0), JHS.NumberOfIntervals - 1 
from eservice6.dbo.PUMPING_SERVICE_REPORTS PBS
join SYN_ES_SERVICE_REPORT_HEADERS SRH on PBS.ROOT_ID = SRH.ID
join [dbo].wld_JobHistoryStaging JHS on SRH.UNIQUE_ID = JHS.UNIQUEID
where PBS.TR_FUID_RETURN_TYPE_ID = 6;

INSERT INTO [dbo].[wld_JobCasingPipeStaging]
           ([entity_status]
           ,[owner_id]
           ,[name]
           ,[description]
           ,[MeasuredDepthFrom]
           ,[CasingType]
           ,[MeasuredDepthTo]
           ,[JobUniqueId]
           ,[InsideDiameter]
           ,[Size])
select 0,0, '','',ISNULL(OH.DEPTH_FROM, 0), OH.CASING_TYPE_ID, ISNULL(OH.DEPTH_TO, 0), SRH.UNIQUE_ID, ISNULL(OH.INSIDE_DIAMETER,  ROUND(SQRT(((PI()/4000000)* SQUARE(OH.PIPE_SIZE)-0.0001261*OH.WEIGHT)/(PI()/4000000)),2)), ISNULL(OH.PIPE_SIZE ,isnull(OH.OUTSIDEDIAMETER, 0))
  from SYN_ES_PSPT_PIPES_SCTNS OH
join SYN_ES_SERVICE_REPORT_HEADERS SRH on OH.ROOT_ID = SRH.ID
join [dbo].wld_JobHistoryStaging JHS on SRH.UNIQUE_ID = JHS.UNIQUEID
where OH.PIPE_TYPE = 2 and OH.PIPE_SIZE <>0 and OH.WEIGHT <>0;

delete from wld_JobCasingPipeStaging where CasingType is null;

delete from wld_JobCasingPipeStaging where MeasuredDepthTo = 0;

delete from wld_JobOpenHoleStaging where MeasuredDepthTo = 0 and TrueVerticalDepthTo = 0;



select JH.JobNumber, JH.JobTypeName, JH.JobDateTime, JH.UniqueId, JC.CasingType, JC.Size, jc.InsideDiameter from [wld_JobCasingPipeStaging] JC 
join wld_JobHistoryStaging JH on JC.JobUniqueId = JH.UniqueId
where JC.InsideDiameter = 0 or JC.CasingType is null or JC.Size=0;

select * from wld_JobOpenHoleStaging where TrueVerticalDepthTo = 0;

select * from eservice6.dbo.SERVICE_REPORT_HEADERS where UNIQUE_ID = 'da49ca15-9602-4cf0-bcab-2470c6e14327';

select * from wld_JobCasingPipeStaging where JobUniqueId ='69299d37-ec37-490a-9334-4d807fcc0f64';

select * from [wld_CasingHistoryStaging] where JobUniqueId ='69299d37-ec37-490a-9334-4d807fcc0f64';


select * from wld_JobCasingPipeStaging where CasingType is null;

select * from wld_JobCasingPipeStaging where MeasuredDepthTo = 0;

select * from wld_JobOpenHoleStaging where MeasuredDepthTo = 0 and TrueVerticalDepthTo = 0;

select * from wld_JobOpenHoleStaging;

select * from wld_well;

select * from wld_OpenHole;

select * from wld_CasingPipe;

select * from wld_CasingHistory;

select * from wld_JobHistoryStaging where WellName like 'VRN HZ 4-13-008-19w3(4-24) 260E';


select * from wld_wellboresegment;

select *  from bin order by id desc;;


select * from rigjob where rigname = 'Savanna 410';

select * from bininformation where rigid = 2496;

select * from bininformation where binid = 137 order by system_id desc;

