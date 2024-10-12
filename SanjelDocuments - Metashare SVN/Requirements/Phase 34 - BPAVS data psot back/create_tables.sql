USE [SanjelData]
GO
Drop Table [dbo].[BlendLog];
GO
Drop Table [dbo].[BlendCut];
GO
Drop Table [dbo].[CutDetail];
GO
Drop Table [dbo].[BlendTransfer];
GO
/****** Object:  Table [dbo].[BlendCut]    Script Date: 10/19/2021 5:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlendCut](
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
	[SequenceNumber] [int] NULL,
	[BlendTemp] [float] NULL,
	[ProductHaulLoadId] [int] NULL,
	[TargetWeight] [float] NULL,
	[StartTime] [datetime2](7) NULL,
	[ActualWeight] [float] NULL,
	[TransferCount] [int] NULL,
	[EndTime] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlendLog]    Script Date: 10/19/2021 5:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlendLog](
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
	[SampleNumber] [nvarchar](255) NULL,
	[LoadSheetNumber] [nvarchar](255) NULL,
	[CallSheetNumber] [int] NULL,
	[EndTime] [datetime2](7) NULL,
	[StoragePod1Total] [float] NULL,
	[BulkPlantOperator] [nvarchar](255) NULL,
	[ClientVersionStamp] [nvarchar](255) NULL,
	[StoragePod3Total] [float] NULL,
	[TotalBlendTime] [float] NULL,
	[StartTime] [datetime2](7) NULL,
	[CurrentLocation] [nvarchar](255) NULL,
	[BlendServicePointName] [nvarchar](255) NULL,
	[StoragePod4Total] [float] NULL,
	[ProductHaulLoadId] [int] NULL,
	[MtsNumber] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
	[ClientCompany] [nvarchar](255) NULL,
	[StoragePod2Total] [float] NULL,
	[TransferDate] [datetime2](7) NULL,
	[ClientSystemStamp] [nvarchar](255) NULL,
	[BlendDate] [datetime2](7) NULL,
	[BlendServicePointId] [int] NULL,
	[BlendTemp] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlendSample]    Script Date: 10/19/2021 5:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlendSample](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[Label] [nvarchar](255) NULL,
	[DateTime] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlendTransfer]    Script Date: 10/19/2021 5:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlendTransfer](
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
	[TargetPod4Weight] [float] NULL,
	[BlendTemp] [float] NULL,
	[TotalTransferWeight] [float] NULL,
	[BlendServicePointId] [int] NULL,
	[TargetLocation] [nvarchar](255) NULL,
	[StartTime] [datetime2](7) NULL,
	[TargetPod1Weight] [float] NULL,
	[EndTime] [datetime2](7) NULL,
	[TargetPod3Weight] [float] NULL,
	[TransferDate] [datetime2](7) NULL,
	[ProductHaulLoadId] [int] NULL,
	[SourcePod1Weight] [float] NULL,
	[TargetPod2Weight] [float] NULL,
	[SourcePod2Weight] [float] NULL,
	[SourcePod4Weight] [float] NULL,
	[MtsNumber] [nvarchar](255) NULL,
	[BlendServicePointName] [nvarchar](255) NULL,
	[SourceLocation] [nvarchar](255) NULL,
	[SourcePod3Weight] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CutDetail]    Script Date: 10/19/2021 5:31:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CutDetail](
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
	[BlendChemicalName] [nvarchar](255) NULL,
	[LotNumber] [nvarchar](255) NULL,
	[BlendCutid] [int] NULL,
	[BlendCutSystemId] [int] NULL,
	[BlendCutName] [nvarchar](100) NULL,
	[BlendCutDescription] [nvarchar](255) NULL,
	[SourceLocation] [nvarchar](255) NULL,
	[StartTime] [datetime2](7) NULL,
	[SequenceNumber] [int] NULL,
	[BlendChemicalId] [int] NULL,
	[TargetWeight] [float] NULL,
	[ReportedWeight] [float] NULL,
	[StopTime] [datetime2](7) NULL,
	[ActualWeight] [float] NULL
) ON [PRIMARY]
GO
