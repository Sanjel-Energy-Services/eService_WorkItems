USE [SanjelData]
GO
/****** Object:  Table [dbo].[wfr_AssignedPlan]    Script Date: 3/22/2022 2:33:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wfr_AssignedPlan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[AssignedToName] [nvarchar](255) NULL,
	[AssignedToSystemId] [int] NULL,
	[ApprovedByDescription] [nvarchar](255) NULL,
	[ApprovedBySystemId] [int] NULL,
	[AssignedToid] [int] NULL,
	[ApprovedByid] [int] NULL,
	[DistrictManagerName] [nvarchar](255) NULL,
	[DistrictManagerSystemId] [int] NULL,
	[AssignedToDescription] [nvarchar](255) NULL,
	[ApprovalSentDateTime] [datetime2](7) NULL,
	[DistrictManagerDescription] [nvarchar](255) NULL,
	[PlanDescription] [nvarchar](255) NULL,
	[Planid] [int] NULL,
	[IsActive] [bit] NULL,
	[CompletedDateTime] [datetime2](7) NULL,
	[PlanName] [nvarchar](255) NULL,
	[ApprovedDateTime] [datetime2](7) NULL,
	[DateAssigned] [datetime2](7) NULL,
	[DistrictManagerid] [int] NULL,
	[ApprovedByName] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wfr_AssignedPlanComment]    Script Date: 3/22/2022 2:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wfr_AssignedPlanComment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[AssignedPlanName] [nvarchar](255) NULL,
	[AssignedPlanid] [int] NULL,
	[AssignedPlanDescription] [nvarchar](255) NULL,
	[CreatedByid] [int] NULL,
	[CreatedBySystemId] [int] NULL,
	[Comments] [ntext] NULL,
	[CreatedByDescription] [nvarchar](255) NULL,
	[CreatedByName] [nvarchar](255) NULL,
	[CreatedDateTime] [datetime2](7) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wfr_AssignedPlanItem]    Script Date: 3/22/2022 2:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wfr_AssignedPlanItem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[SignedOffByName] [nvarchar](255) NULL,
	[SignedOffBySystemId] [int] NULL,
	[LMSCertificate] [ntext] NULL,
	[CompletedByName] [nvarchar](255) NULL,
	[CompletedBySystemId] [int] NULL,
	[PlanItemStatus] [int] NULL,
	[SignedOffByid] [int] NULL,
	[CompletedByDescription] [nvarchar](255) NULL,
	[SignedOffDateTime] [datetime2](7) NULL,
	[CompletedDateTime] [datetime2](7) NULL,
	[SignedOffByDescription] [nvarchar](255) NULL,
	[CompletedByid] [int] NULL,
	[IsRquiredForProfessional] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wfr_AssignedPlanMentor]    Script Date: 3/22/2022 2:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wfr_AssignedPlanMentor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[AssignedByid] [int] NULL,
	[AssignedBySystemId] [int] NULL,
	[Mentorid] [int] NULL,
	[MentorSystemId] [int] NULL,
	[AssignedPlanid] [int] NULL,
	[AssignedPlanName] [nvarchar](255) NULL,
	[MentorDescription] [nvarchar](255) NULL,
	[AssignedByDescription] [nvarchar](255) NULL,
	[AssignedByName] [nvarchar](255) NULL,
	[AssignedPlanDescription] [nvarchar](255) NULL,
	[MentorName] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wfr_AssignedPlanNotification]    Script Date: 3/22/2022 2:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wfr_AssignedPlanNotification](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[AssignedPlanDescription] [nvarchar](255) NULL,
	[SentToName] [nvarchar](255) NULL,
	[SentToSystemId] [int] NULL,
	[SentByDescription] [nvarchar](255) NULL,
	[SentBySystemId] [int] NULL,
	[AssignedPlanName] [nvarchar](255) NULL,
	[SentByid] [int] NULL,
	[Notification] [ntext] NULL,
	[SentToid] [int] NULL,
	[SentToDescription] [nvarchar](255) NULL,
	[AssignedPlanid] [int] NULL,
	[SentByName] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wfr_PayType]    Script Date: 3/22/2022 2:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wfr_PayType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[PaySummaryTypeName] [nvarchar](255) NULL,
	[PaySummaryTypeDescription] [nvarchar](255) NULL,
	[PaySummaryTypeid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wfr_Plan]    Script Date: 3/22/2022 2:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wfr_Plan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[CreatedByDescription] [nvarchar](255) NULL,
	[CreatedBySystemId] [int] NULL,
	[PlanTypeDescription] [nvarchar](255) NULL,
	[CreatedByid] [int] NULL,
	[PlanTypeName] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
	[PlanTypeid] [int] NULL,
	[CreatedOn] [datetime2](7) NULL,
	[CreatedByName] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wfr_PlanItem]    Script Date: 3/22/2022 2:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wfr_PlanItem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[IsLMSItem] [bit] NULL,
	[IsActive] [bit] NULL,
	[CreatedByid] [int] NULL,
	[CreatedBySystemId] [int] NULL,
	[CreatedByName] [nvarchar](255) NULL,
	[DocumentLink] [ntext] NULL,
	[Details] [ntext] NULL,
	[LMSCourseId] [ntext] NULL,
	[Planid] [int] NULL,
	[CreatedByDescription] [nvarchar](255) NULL,
	[CreatedOn] [datetime2](7) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wfr_PlanType]    Script Date: 3/22/2022 2:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wfr_PlanType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL
) ON [PRIMARY]
GO
