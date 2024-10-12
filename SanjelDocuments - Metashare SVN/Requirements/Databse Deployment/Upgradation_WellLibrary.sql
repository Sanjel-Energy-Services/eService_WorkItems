USE [SanjelData]
GO

/****** Object:  View [dbo].[RigJobSanjelCrewSectionList]    Script Date: 2023/8/18 15:15:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--create TABLE
CREATE TABLE [CasingHistoryStaging] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[CasingCategory] int,[JobUniqueId] nvarchar(255),[PumpedVolume] float,[ReturnedVolume] float);
CREATE TABLE [JobCasingPipeStaging] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[CasingType] int,[InsideDiameter] float,[JobUniqueId] nvarchar(255),[MeasuredDepthFrom] float,[MeasuredDepthTo] float,[Size] float);
CREATE TABLE [JobHistoryStaging] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[JobDateTime] datetime,[JobNumber] int,[JobTypeId] int,[JobTypeName] nvarchar(255),[UniqueId] nvarchar(255),[WellDownHoleLocation] nvarchar(255),[WellName] nvarchar(255),[WellSurfaceLocation] nvarchar(255));
CREATE TABLE [JobOpenHoleStaging] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[JobUniqueId] nvarchar(255),[MeasuredDepthFrom] float,[MeasuredDepthTo] float,[Size] float,[TrueVerticalDepthFrom] float,[TrueVerticalDepthTo] float);
CREATE TABLE [CasingHistory] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[JobDateTime] datetime,[JobNumber] int,[JobTypeId] int,[JobTypeName] nvarchar(255),[PumpedVolume] float,[ReturnedVolume] float,[UniqueId] nvarchar(255));
CREATE TABLE [GeneralWellLocation] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[WellLocationType] int);
CREATE TABLE [GeoWellLocation] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[DegreesLat] int,[WellLocationType] int,[MinutesLat] int,[SecondsLat] float,[DirectionLat] nvarchar(255),[DegreesLong] int,[MinutesLong] int,[SecondsLong] float,[DirectionLong] nvarchar(255));
CREATE TABLE [NTSWellLocation] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[LocationExceptionCode] nvarchar(255),[WellLocationType] int,[QuartUnits] nvarchar(255),[Units] nvarchar(255),[Blocks] nvarchar(255),[Sheets] int,[Subdivisions] nvarchar(255),[MapSheets] int,[EventSequenceCode] nvarchar(255));
CREATE TABLE [TorrenWellLocation] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[LocationExceptionCode] nvarchar(255),[WellLocationType] int,[LSD] int,[Section] int,[Township] int,[Range] int,[MeridianDirection] nvarchar(255),[Meridian] int,[MeridianSuffix] nvarchar(255),[EventSequenceCode] nvarchar(255));
CREATE TABLE [UsaWellLocation] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[DirectionOne] nvarchar(255),[WellLocationType] int,[DirectionTwo] nvarchar(255),[DirectionThree] nvarchar(255),[Section] int,[Township] int,[TownshipDirection] nvarchar(255),[Range] int,[RangeDirection] nvarchar(255));
CREATE TABLE [WellLocation] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[WellLocationType] int);
CREATE TABLE [PipeSegment] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[AnnularVolume] float,[InnerPipeCasingType] int,[InnerPipeOutsideDiameter] float,[Length] float,[OuterPipeCasingType] int,[OuterPipeInsideDiameter] float,[OuterPipeOutsideDiameter] float,[PipeVolume] float,[WellboreSegmentid] int,[WellboreSegmentName] [nvarchar](100) NULL,[WellboreSegmentDescription] [nvarchar](500) NULL);
CREATE TABLE [Wellbore] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL);
CREATE TABLE [WellboreSegment] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[Wellid] int,[WellName] [nvarchar](100) NULL,[WellDescription] [nvarchar](500) NULL,[WellSystemId] [int] Not NULL,[Excess] float,[MeasuredDepthFrom] float,[MeasuredDepthTo] float,[PumpedExcess] float,[VerticalDepthFrom] float,[VerticalDepthTo] float);
CREATE TABLE [WellChallenge] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[Comments] nvarchar(255),[MeridianFrom] int,[MeridianTo] int,[RangeFrom] int,[RangeTo] int,[TownshipFrom] int,[TownshipTo] int,[Tvd] int);
CREATE TABLE [CasingPipe] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[Wellid] int,[WellName] [nvarchar](100) NULL,[WellDescription] [nvarchar](500) NULL,[WellSystemId] [int] Not NULL,[CasingType] int,[InsideDiameter] float,[MeasuredDepthFrom] float,[MeasuredDepthTo] float,[OutsideDiameter] float,[TrueVerticalDepthFrom] float,[TrueVerticalDepthTo] float);
CREATE TABLE [OpenHole] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[Wellid] int,[WellName] [nvarchar](100) NULL,[WellDescription] [nvarchar](500) NULL,[WellSystemId] [int] Not NULL,[MeasuredDepthFrom] float,[MeasuredDepthTo] float,[Size] float,[TrueVerticalDepthFrom] float,[TrueVerticalDepthTo] float);
GO
--modify TABLE
--EXEC sp_rename 'Well.WellLocationTypeid', 'WellLocationType', 'COLUMN';
--ALTER TABLE Well DROP COLUMN WellLocationTypeSystemId;
--ALTER TABLE Well DROP COLUMN WellLocationTypeDescription;
--ALTER TABLE Well DROP COLUMN WellLocationTypeName;
ALTER TABLE RigJob ADD WellLocationType int;
Go
update RigJob set WellLocationType = WellLocationTypeid;
GO

--EXEC sp_rename 'RigJob.WellLocationTypeid', 'WellLocationType', 'COLUMN';
--ALTER TABLE RigJob DROP COLUMN WellLocationTypeSystemId;
--ALTER TABLE RigJob DROP COLUMN WellLocationTypeDescription;
--ALTER TABLE RigJob DROP COLUMN WellLocationTypeName;
ALTER TABLE Well  ADD WellLocationType int;
GO
update Well set WellLocationType = WellLocationTypeid;
GO


DROP TABLE [BlendSample];
GO

CREATE TABLE [BlendSample] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[ProductHaulLoadid] int,[ProductHaulLoadName] [nvarchar](100) NULL,[ProductHaulLoadDescription] [nvarchar](500) NULL,[ProductHaulLoadSystemId] [int] Not NULL,[DateCollected] datetime,[SampleBarCode] nvarchar(255),[Amount] float,[AmountUnit] nvarchar(255),[CutIndex] int,[SampleIndex] int,[ContainerCount] int,[Comments] nvarchar(255),[BulkPlantId] int,[StorageId] int,[StorageName] nvarchar(255),[SampleType] nvarchar(255));
GO

--modify VIEW
ALTER VIEW [dbo].[RigJobSanjelCrewSectionList]
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

	,rigJob.WellLocationType
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
