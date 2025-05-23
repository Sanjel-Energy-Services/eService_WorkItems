USE [SanjelData_KwZrh6_1]
GO
/****** Object:  Table [dbo].[PayEntry]    Script Date: 3/8/2021 5:18:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayEntry](
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
	[PayTypeid] [int] NULL,
	[ServiceLineid] [int] NULL,
	[ServiceLineSystemId] [int] NULL,
	[EmployeeName] [nvarchar](255) NULL,
	[EmployeeSystemId] [int] NULL,
	[WorkTypeName] [nvarchar](255) NULL,
	[WorkTypeSystemId] [int] NULL,
	[PayPositionid] [int] NULL,
	[EmployeeDescription] [nvarchar](255) NULL,
	[PayPeriodDescription] [nvarchar](255) NULL,
	[WorkAssignmentid] [int] NULL,
	[WorkAssignmentSystemId] [int] NULL,
	[PaySummaryTypeid] [int] NULL,
	[PayTypeDescription] [nvarchar](255) NULL,
	[JobRevenue] [float] NULL,
	[WorkTypeDescription] [nvarchar](255) NULL,
	[StandyHour] [float] NULL,
	[HomeServicePointid] [int] NULL,
	[HomeServicePointSystemId] [int] NULL,
	[PayPeriodid] [int] NULL,
	[HomeServicePointName] [nvarchar](255) NULL,
	[Status] [int] NULL,
	[PayAreaDescription] [nvarchar](255) NULL,
	[UniqueId] [nvarchar](255) NULL,
	[PaySummaryTypeName] [nvarchar](255) NULL,
	[WorkingServicePointDescription] [nvarchar](255) NULL,
	[WorkingServicePointSystemId] [int] NULL,
	[JobProvinceid] [int] NULL,
	[JobProvinceSystemId] [int] NULL,
	[JobProvinceDescription] [nvarchar](255) NULL,
	[IsTwoWay] [bit] NULL,
	[JobUniqueId] [nvarchar](255) NULL,
	[JobDate] [datetime2](7) NULL,
	[ServiceLineDescription] [nvarchar](255) NULL,
	[WorkAssignmentDescription] [nvarchar](255) NULL,
	[PayAreaName] [nvarchar](255) NULL,
	[PayTypeName] [nvarchar](255) NULL,
	[ClientCompanyid] [int] NULL,
	[ClientCompanySystemId] [int] NULL,
	[LoadQuantity] [float] NULL,
	[WorkingServicePointid] [int] NULL,
	[ClientCompanyDescription] [nvarchar](255) NULL,
	[Employeeid] [int] NULL,
	[TravelTime] [float] NULL,
	[ServiceLineName] [nvarchar](255) NULL,
	[PayPositionDescription] [nvarchar](255) NULL,
	[WorkAssignmentName] [nvarchar](255) NULL,
	[PayPositionName] [nvarchar](255) NULL,
	[WorkDescription] [ntext] NULL,
	[MtsNumber] [nvarchar](255) NULL,
	[JobProvinceName] [nvarchar](255) NULL,
	[ClientCompanyName] [nvarchar](255) NULL,
	[JobNumber] [nvarchar](255) NULL,
	[Amount] [float] NULL,
	[PaySummaryTypeDescription] [nvarchar](255) NULL,
	[PayPeriodName] [nvarchar](255) NULL,
	[WorkTypeid] [int] NULL,
	[HomeServicePointDescription] [nvarchar](255) NULL,
	[WorkingServicePointName] [nvarchar](255) NULL,
	[PayAreaid] [int] NULL,
	[TravelDistance] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaySummaryType]    Script Date: 3/8/2021 5:18:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaySummaryType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayType]    Script Date: 3/8/2021 5:18:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[PaySummaryTypeDescription] [nvarchar](255) NULL,
	[PaySummaryTypeid] [int] NULL,
	[PaySummaryTypeName] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkAssignment]    Script Date: 3/8/2021 5:18:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkAssignment](
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
	[LoadQuantity] [int] NULL,
	[WorkingServicePointid] [int] NULL,
	[WorkingServicePointSystemId] [int] NULL,
	[StandbyHours] [float] NULL,
	[PayAreaDescription] [nvarchar](255) NULL,
	[WorkLocation] [nvarchar](255) NULL,
	[PayAreaid] [int] NULL,
	[HrPositionName] [nvarchar](255) NULL,
	[HrPositionSystemId] [int] NULL,
	[JobProvinceName] [nvarchar](255) NULL,
	[JobProvinceSystemId] [int] NULL,
	[JobRevenue] [float] NULL,
	[WorkTypeDescription] [nvarchar](255) NULL,
	[WorkTypeSystemId] [int] NULL,
	[EndTime] [datetime2](7) NULL,
	[ServiceLineDescription] [nvarchar](255) NULL,
	[ServiceLineSystemId] [int] NULL,
	[ClientCompanyid] [int] NULL,
	[ClientCompanySystemId] [int] NULL,
	[Status] [int] NULL,
	[HrPositionDescription] [nvarchar](255) NULL,
	[ClientCompanyName] [nvarchar](255) NULL,
	[JobRoleid] [int] NULL,
	[JobRoleSystemId] [int] NULL,
	[TravelDistance] [float] NULL,
	[HomeServicePointid] [int] NULL,
	[HomeServicePointSystemId] [int] NULL,
	[JobProvinceDescription] [nvarchar](255) NULL,
	[SourceId] [int] NULL,
	[EmployeeName] [nvarchar](255) NULL,
	[EmployeeSystemId] [int] NULL,
	[IsTwoWay] [bit] NULL,
	[IsCrewEfficiency] [bit] NULL,
	[JobNumber] [nvarchar](255) NULL,
	[ServiceLineName] [nvarchar](255) NULL,
	[WorkingHours] [float] NULL,
	[MtsNumber] [nvarchar](255) NULL,
	[JobRoleName] [nvarchar](255) NULL,
	[HomeServicePointName] [nvarchar](255) NULL,
	[WorkingServicePointDescription] [nvarchar](255) NULL,
	[HomeServicePointDescription] [nvarchar](255) NULL,
	[HrPositionid] [int] NULL,
	[JobProvinceid] [int] NULL,
	[JobRoleDescription] [nvarchar](255) NULL,
	[ServiceLineid] [int] NULL,
	[JobUniqueId] [nvarchar](255) NULL,
	[IsMultipleWellProject] [bit] NULL,
	[WorkTypeid] [int] NULL,
	[JobDateTime] [datetime2](7) NULL,
	[Employeeid] [int] NULL,
	[StartTime] [datetime2](7) NULL,
	[TravelTime] [float] NULL,
	[PayAreaName] [nvarchar](255) NULL,
	[EmployeeDescription] [nvarchar](255) NULL,
	[WorkTypeName] [nvarchar](255) NULL,
	[WorkingServicePointName] [nvarchar](255) NULL,
	[ClientCompanyDescription] [nvarchar](255) NULL,
	[WorkDescription] [ntext] NULL,
	[JobFlag] [int] NULL,
	[IsEligibleStandby] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO