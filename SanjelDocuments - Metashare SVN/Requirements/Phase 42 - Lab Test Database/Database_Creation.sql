
/****** Object:  Table [dbo].[QualityControl]    Script Date: 2022/6/24 11:40:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[QualityControl](
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
	[TT100] [decimal](18, 2) NULL,
	[TT40] [decimal](18, 2) NULL,
	[ProductionWeek] [datetime2](7) NULL,
	[TenSecGelStrength] [decimal](18, 2) NULL,
	[Density] [decimal](18, 2) NULL,
	[OldSampleId] [nvarchar](255) NULL,
	[LabSampleid] [int] NULL,
	[LabSampleSystemId] [int] NULL,
	[FreeWater] [decimal](18, 2) NULL,
	[TestRequestType] [int] NULL,
	[OneDay] [decimal](18, 2) NULL,
	[Blaine] [decimal](18, 2) NULL,
	[InitialBC] [decimal](18, 2) NULL,
	[LabSampleDescription] [nvarchar](255) NULL,
	[RetainedSieve] [decimal](18, 2) NULL,
	[LabSampleName] [nvarchar](255) NULL,
	[SpecificGravity] [decimal](18, 2) NULL,
	[Rheology] [decimal](18, 2) NULL,
	[VicatInitialSet] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestIteration]    Script Date: 2022/6/24 11:46:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TestIteration](
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
	[Comment] [ntext] NULL,
	[SGPowder] [bit] NULL,
	[LabTestListJson] [ntext] NULL,
	[CementSource] [int] NULL,
	[CementLoginNo] [int] NULL,
	[WaterSource] [int] NULL,
	[Salt] [nvarchar](255) NULL,
	[SGSlurry] [bit] NULL,
	[Density] [decimal](18, 2) NULL,
	[AdditiveListJson] [ntext] NULL,
	[WaterLoginNo] [int] NULL,
	[TestRequestid] [int] NULL,
	[TestRequestSystemId] [int] NULL,
	[TestRequestName] [nvarchar](100) NULL,
	[TestRequestDescription] [nvarchar](255) NULL,
	[IterationIndex] [int] NULL,
	[OldId] [nvarchar](255) NULL,
	[SaltConcentration] [decimal](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestOutput]    Script Date: 2022/6/24 11:45:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TestOutput](
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
/****** Object:  Table [dbo].[TestRequest]    Script Date: 2022/6/24 11:43:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TestRequest](
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
	[LoadAndGo] [bit] NULL,
	[TemplateBlendName] [nvarchar](255) NULL,
	[BHST] [decimal](18, 2) NULL,
	[RequestedOn] [datetime2](7) NULL,
	[WellPressure] [decimal](18, 2) NULL,
	[ClientServiceRepresentativeEmail] [nvarchar](255) NULL,
	[IsOnePageReport] [bit] NULL,
	[WellSurfaceLocation] [nvarchar](255) NULL,
	[SpecificGravity] [bit] NULL,
	[WellServicePoint] [nvarchar](255) NULL,
	[DateRequired] [datetime2](7) NULL,
	[TechnicalServiceRepresentative] [nvarchar](255) NULL,
	[WellTVD] [decimal](18, 2) NULL,
	[CementLoginNo] [int] NULL,
	[TechnicalServiceRepresentativeEmail] [nvarchar](255) NULL,
	[BHCT] [decimal](18, 2) NULL,
	[ClientServiceRepresentative] [nvarchar](255) NULL,
	[WellDownholeLocation] [nvarchar](255) NULL,
	[ClientName] [nvarchar](255) NULL,
	[OldId] [nvarchar](255) NULL,
	[Type] [int] NULL,
	[RequestedBy] [nvarchar](255) NULL,
	[TemplateJobType] [nvarchar](255) NULL,
	[WellTMD] [decimal](18, 2) NULL,
	[WaterLoginNo] [int] NULL,
	[CementSource] [int] NULL,
	[TemplateBlendBase] [nvarchar](255) NULL,
	[ProgramNumber] [nvarchar](255) NULL,
	[WellName] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestResult]    Script Date: 2022/6/24 11:43:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TestResult](
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
	[TestResultFileid] [int] NULL,
	[TestResultFileSystemId] [int] NULL,
	[TestResultFileName] [nvarchar](100) NULL,
	[TestResultFileDescription] [nvarchar](255) NULL,
	[OldId] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestResultFile]    Script Date: 2022/6/24 11:44:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TestResultFile](
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
/****** Object:  Table [dbo].[WaterAnalysis]    Script Date: 2022/6/24 11:39:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[WaterAnalysis](
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
	[IsH2SPresent] [bit] NULL,
	[Chloride] [decimal](18, 2) NULL,
	[Odour] [nvarchar](255) NULL,
	[RemainingVolume] [decimal](18, 2) NULL,
	[Notes] [nvarchar](255) NULL,
	[LabSampleName] [nvarchar](255) NULL,
	[LabSampleSystemId] [int] NULL,
	[Appearance] [nvarchar](255) NULL,
	[Carbonate] [decimal](18, 2) NULL,
	[LabAnalyst] [nvarchar](255) NULL,
	[OldSampleId] [nvarchar](255) NULL,
	[FileName] [nvarchar](255) NULL,
	[Content] [ntext] NULL,
	[Calcium] [decimal](18, 2) NULL,
	[WithinSpecs] [bit] NULL,
	[Iron] [decimal](18, 2) NULL,
	[PAnalysisMethod] [nvarchar](255) NULL,
	[Sulfate] [decimal](18, 2) NULL,
	[LabSampleDescription] [nvarchar](255) NULL,
	[Magnesium] [decimal](18, 2) NULL,
	[Hydroxide] [decimal](18, 2) NULL,
	[OldId] [nvarchar](255) NULL,
	[Colour] [nvarchar](255) NULL,
	[TAlkanity] [decimal](18, 2) NULL,
	[WaterSource] [nvarchar](255) NULL,
	[PH] [decimal](18, 2) NULL,
	[DateAnalyzed] [datetime2](7) NULL,
	[SpecificGravity] [decimal](18, 2) NULL,
	[SalesRep] [nvarchar](255) NULL,
	[Bicarbonate] [decimal](18, 2) NULL,
	[Sodium] [decimal](18, 2) NULL,
	[PAlkanity] [decimal](18, 2) NULL,
	[LabSampleid] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[LabSample]    Script Date: 2022/6/24 11:33:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LabSample](
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
	[ClientCompanyName] [nvarchar](255) NULL,
	[OldId] [nvarchar](255) NULL,
	[ClientCompanyId] [int] NULL,
	[MTSNumber] [nvarchar](255) NULL,
	[WellName] [nvarchar](255) NULL,
	[DateCollected] [datetime2](7) NULL,
	[SampleType] [int] NULL,
	[LoginNo] [int] NULL,
	[ServicePointName] [nvarchar](255) NULL,
	[ServicePointId] [int] NULL,
	[LSD] [ntext] NULL,
	[Quantity] [nvarchar](255) NULL,
	[Discarded] [bit] NULL,
	[HighProfile] [bit] NULL,
	[StorageLocation] [nvarchar](255) NULL,
	[Comments] [ntext] NULL,
	[ContainerCount] [nvarchar](255) NULL,
	[SampleSource] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO