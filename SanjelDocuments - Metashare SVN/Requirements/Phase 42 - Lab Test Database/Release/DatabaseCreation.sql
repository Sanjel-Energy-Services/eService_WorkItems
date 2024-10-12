
/****** Object:  Table [dbo].[QualityControl]    Script Date: 2022/6/24 11:40:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sld_LabSample](
	[id] [int] NOT NULL,
	[system_id] [int] IDENTITY(1,1) NOT NULL,
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
	[ClientCompanyId] [int] NULL,
	[ClientCompanyName] [nvarchar](255) NULL,
	[OldId] [nvarchar](255) NULL,
	[MTSNumber] [nvarchar](255) NULL,
	[WellName] [nvarchar](255) NULL,
	[DateCollected] [datetime2](7) NULL,
	[SampleType] [int] NULL,
	[LoginNo] [int] NULL,
	[ServicePointName] [nvarchar](255) NULL,
	[ServicePointId] [int] NULL,
	[Quantity] [nvarchar](255) NULL,
	[Discarded] [bit] NULL,
	[LSD] [ntext] NULL,
	[HighProfile] [bit] NULL,
	[StorageLocation] [nvarchar](255) NULL,
	[Comments] [ntext] NULL,
	[SampleSource] [nvarchar](255) NULL,
	[ContainerCount] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sld_QualityControl]    Script Date: 8/11/2022 1:53:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sld_QualityControl](
	[id] [int] NOT NULL,
	[system_id] [int] IDENTITY(1,1) NOT NULL,
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
	[TenMinGelStrength] [decimal](18, 2) NULL,
	[TT40] [decimal](18, 2) NULL,
	[TT100] [decimal](18, 2) NULL,
	[ProductionWeek] [datetime2](7) NULL,
	[Density] [decimal](18, 2) NULL,
	[TenSecGelStrength] [decimal](18, 2) NULL,
	[FreeWater] [decimal](18, 2) NULL,
	[OneDay] [decimal](18, 2) NULL,
	[OldSampleId] [nvarchar](255) NULL,
	[LabSampleid] [int] NULL,
	[LabSampleSystemId] [int] NULL,
	[TestRequestType] [int] NULL,
	[Blaine] [decimal](18, 2) NULL,
	[LabSampleDescription] [nvarchar](255) NULL,
	[InitialBC] [decimal](18, 2) NULL,
	[RetainedSieve] [decimal](18, 2) NULL,
	[LabSampleName] [nvarchar](255) NULL,
	[Rheology] [decimal](18, 2) NULL,
	[SpecificGravity] [decimal](18, 2) NULL,
	[VicatInitialSet] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sld_TestIteration]    Script Date: 8/11/2022 1:53:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sld_TestIteration](
	[id] [int] NOT NULL,
	[system_id] [int] IDENTITY(1,1) NOT NULL,
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
	[SGPowder] [bit] NULL,
	[Comment] [ntext] NULL,
	[LabTestListJson] [ntext] NULL,
	[WaterSource] [int] NULL,
	[CementSource] [int] NULL,
	[CementLoginNo] [int] NULL,
	[SGSlurry] [bit] NULL,
	[Salt] [nvarchar](255) NULL,
	[PerformanceRequirement] [bit] NULL,
	[AdditiveListJson] [ntext] NULL,
	[WaterLoginNo] [int] NULL,
	[Density] [decimal](18, 2) NULL,
	[TestRequestid] [int] NULL,
	[TestRequestSystemId] [int] NULL,
	[TestRequestName] [nvarchar](100) NULL,
	[TestRequestDescription] [nvarchar](255) NULL,
	[IterationIndex] [int] NULL,
	[OldId] [nvarchar](255) NULL,
	[SaltConcentration] [decimal](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sld_TestOutput]    Script Date: 8/11/2022 1:53:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sld_TestOutput](
	[id] [int] NOT NULL,
	[system_id] [int] IDENTITY(1,1) NOT NULL,
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
	[Label] [nvarchar](255) NULL,
	[Unit] [nvarchar](255) NULL,
	[Sort] [nvarchar](255) NULL,
	[OldId] [nvarchar](255) NULL,
	[TestResultid] [int] NULL,
	[TestResultSystemId] [int] NULL,
	[TestResultName] [nvarchar](100) NULL,
	[TestResultDescription] [nvarchar](255) NULL,
	[Value] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sld_TestRequest]    Script Date: 8/11/2022 1:53:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sld_TestRequest](
	[id] [int] NOT NULL,
	[system_id] [int] IDENTITY(1,1) NOT NULL,
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
	[WaterSource] [int] NULL,
	[Status] [int] NULL,
	[RequestSource] [int] NULL,
	[TemplateBlendName] [nvarchar](255) NULL,
	[BHST] [decimal](18, 2) NULL,
	[LoadAndGo] [bit] NULL,
	[Comment] [ntext] NULL,
	[WellPressure] [decimal](18, 2) NULL,
	[ClientServiceRepresentativeEmail] [nvarchar](255) NULL,
	[RequestedOn] [datetime2](7) NULL,
	[IsOnePageReport] [bit] NULL,
	[WellSurfaceLocation] [nvarchar](255) NULL,
	[WellServicePoint] [nvarchar](255) NULL,
	[SpecificGravity] [bit] NULL,
	[TechnicalServiceRepresentative] [nvarchar](255) NULL,
	[WellTVD] [decimal](18, 2) NULL,
	[TechnicalServiceRepresentativeEmail] [nvarchar](255) NULL,
	[DateRequired] [datetime2](7) NULL,
	[CementLoginNo] [int] NULL,
	[BHCT] [decimal](18, 2) NULL,
	[ClientServiceRepresentative] [nvarchar](255) NULL,
	[WellDownholeLocation] [nvarchar](255) NULL,
	[Type] [int] NULL,
	[ClientName] [nvarchar](255) NULL,
	[OldId] [nvarchar](255) NULL,
	[WellTMD] [decimal](18, 2) NULL,
	[TemplateJobType] [nvarchar](255) NULL,
	[WaterLoginNo] [int] NULL,
	[RequestedBy] [nvarchar](255) NULL,
	[TemplateBlendBase] [nvarchar](255) NULL,
	[CementSource] [int] NULL,
	[ProgramNumber] [nvarchar](255) NULL,
	[WellName] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sld_TestResult]    Script Date: 8/11/2022 1:53:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sld_TestResult](
	[id] [int] NOT NULL,
	[system_id] [int] IDENTITY(1,1) NOT NULL,
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
	[TestIterationid] [int] NULL,
	[TestIterationSystemId] [int] NULL,
	[TestIterationName] [nvarchar](100) NULL,
	[TestIterationDescription] [nvarchar](255) NULL,
	[TestType] [int] NULL,
	[Schedule] [nvarchar](255) NULL,
	[InstrumentId] [nvarchar](255) NULL,
	[TestDateTime] [datetime2](7) NULL,
	[Deleted] [bit] NULL,
	[TestResultFileid] [int] NULL,
	[TestResultFileSystemId] [int] NULL,
	[TestResultFileName] [nvarchar](100) NULL,
	[TestResultFileDescription] [nvarchar](255) NULL,
	[Approved] [bit] NULL,
	[OldId] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sld_TestResultFile]    Script Date: 8/11/2022 1:53:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sld_TestResultFile](
	[id] [int] NOT NULL,
	[system_id] [int] IDENTITY(1,1) NOT NULL,
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
	[OldId] [nvarchar](255) NULL,
	[Content] [ntext] NULL,
	[FileName] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sld_WaterAnalysis]    Script Date: 8/11/2022 1:53:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sld_WaterAnalysis](
	[id] [int] NOT NULL,
	[system_id] [int] IDENTITY(1,1) NOT NULL,
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
	[Chloride] [decimal](18, 2) NULL,
	[IsH2SPresent] [bit] NULL,
	[Odour] [nvarchar](255) NULL,
	[RemainingVolume] [decimal](18, 2) NULL,
	[Notes] [nvarchar](255) NULL,
	[Carbonate] [decimal](18, 2) NULL,
	[LabAnalyst] [nvarchar](255) NULL,
	[Appearance] [nvarchar](255) NULL,
	[Content] [ntext] NULL,
	[OldSampleId] [nvarchar](255) NULL,
	[Iron] [decimal](18, 2) NULL,
	[Calcium] [decimal](18, 2) NULL,
	[FileName] [nvarchar](255) NULL,
	[WithinSpecs] [bit] NULL,
	[PAnalysisMethod] [nvarchar](255) NULL,
	[Sulfate] [decimal](18, 2) NULL,
	[Hydroxide] [decimal](18, 2) NULL,
	[Magnesium] [decimal](18, 2) NULL,
	[Colour] [nvarchar](255) NULL,
	[OldId] [nvarchar](255) NULL,
	[TAlkanity] [decimal](18, 2) NULL,
	[WaterSource] [nvarchar](255) NULL,
	[DateAnalyzed] [datetime2](7) NULL,
	[LabSampleName] [nvarchar](255) NULL,
	[LabSampleSystemId] [int] NULL,
	[PH] [decimal](18, 2) NULL,
	[Bicarbonate] [decimal](18, 2) NULL,
	[SpecificGravity] [decimal](18, 2) NULL,
	[SalesRep] [nvarchar](255) NULL,
	[Sodium] [decimal](18, 2) NULL,
	[LabSampleDescription] [nvarchar](255) NULL,
	[PAlkanity] [decimal](18, 2) NULL,
	[LabSampleid] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


CREATE VIEW [dbo].[sld_LabDatabaseView]
AS
SELECT   dbo.sld_TestRequest.TemplateJobType AS JobType, dbo.sld_TestRequest.ProgramNumber, 
                TestIteration_1.IterationIndex AS VersionId, dbo.sld_TestRequest.TemplateBlendName AS BlendName, 
                dbo.sld_TestRequest.TemplateBlendBase AS BlendBase, dbo.sld_TestRequest.BHCT, dbo.sld_TestRequest.BHST, 
                dbo.sld_TestRequest.ClientName, TestIteration_1.AdditiveListJson AS Additives, TestIteration_1.Density, 
                dbo.sld_TestRequest.id, dbo.sld_TestRequest.Type, dbo.sld_TestResult.TestDateTime AS Date, TestIteration_1.OldId AS IterationId,
                    (SELECT   Value
                     FROM      dbo.sld_TestOutput
                     WHERE   (TestResultid = dbo.sld_TestResult.id) AND (Label = 'TT40')) AS TT40,
                    (SELECT   Value
                     FROM      dbo.sld_TestOutput AS TestOutput_4
                     WHERE   (TestResultid = dbo.sld_TestResult.id) AND (Label = 'TT100')) AS TT100,
                    (SELECT   Value
                     FROM      dbo.sld_TestOutput AS TestOutput_3
                     WHERE   (TestResultid = dbo.sld_TestResult.id) AND (Label = 'Fluid Loss')) AS FluidLoss,
                    (SELECT   Value
                     FROM      dbo.sld_TestOutput AS TestOutput_2
                     WHERE   (TestResultid = dbo.sld_TestResult.id) AND (Label = 'Free Water Angle')) AS FreeWaterAngle,
                    (SELECT   Value
                     FROM      dbo.sld_TestOutput AS TestOutput_1
                     WHERE   (TestResultid = dbo.sld_TestResult.id) AND (Label = 'Free Water')) AS FreeWater, 0 AS entity_status, 
                1 AS owner_id, '' AS name, '' AS description
FROM      dbo.sld_TestRequest INNER JOIN
                dbo.sld_TestIteration AS TestIteration_1 ON dbo.sld_TestRequest.id = TestIteration_1.TestRequestid INNER JOIN
                dbo.sld_TestResult ON TestIteration_1.id = dbo.sld_TestResult.TestIterationid
WHERE   (dbo.sld_TestRequest.Status = 2) AND (dbo.sld_TestRequest.Type <> 2)
GO

INSERT INTO [dbo].[sld_TestRequest]
           ([id]
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
           ,[WaterSource]
           ,[Status]
           ,[RequestSource]
           ,[TemplateBlendName]
           ,[BHST]
           ,[LoadAndGo]
           ,[Comment]
           ,[WellPressure]
           ,[ClientServiceRepresentativeEmail]
           ,[RequestedOn]
           ,[IsOnePageReport]
           ,[WellSurfaceLocation]
           ,[WellServicePoint]
           ,[SpecificGravity]
           ,[TechnicalServiceRepresentative]
           ,[WellTVD]
           ,[TechnicalServiceRepresentativeEmail]
           ,[DateRequired]
           ,[CementLoginNo]
           ,[BHCT]
           ,[ClientServiceRepresentative]
           ,[WellDownholeLocation]
           ,[Type]
           ,[ClientName]
           ,[OldId]
           ,[WellTMD]
           ,[TemplateJobType]
           ,[WaterLoginNo]
           ,[RequestedBy]
           ,[TemplateBlendBase]
           ,[CementSource]
           ,[ProgramNumber]
           ,[WellName])
     VALUES
           (73,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);

GO