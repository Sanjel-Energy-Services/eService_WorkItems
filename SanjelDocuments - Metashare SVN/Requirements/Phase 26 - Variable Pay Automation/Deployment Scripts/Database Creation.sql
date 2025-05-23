USE [SanjelData]
GO

drop table BaseVariablePaySchedule;
drop table BTrainPaySchedule;
drop table ChemVanPaySchedule;
drop table CrewEfficiencyBonusPaySchedule;
drop table ExtendTravelPaySchedule;
drop table EXTLPaySchedule;
drop table HotShotPaySchedule;
drop table JobRole;
drop table PayArea;
drop table PayEntry;
drop table PayPeriod;
drop table PayPeriodSummary;
drop table PayPosition;
drop table PayPositionMapping;
drop table PayrollExportMapping;
drop table PaySummary;
drop table PayType;
drop table ProductHaulPaySchedule;
drop table RTBAPaySchedule;
drop table SelfLoadPaySchedule;
drop table StandbyPaySchedule;
drop table WorkAssignment;
drop table WorkType;
GO

USE [SanjelData_KwZrh6_1]
GO
/****** Object:  Table [dbo].[BaseVariablePaySchedule]    Script Date: 3/18/2021 11:44:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaseVariablePaySchedule](
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
	[PayPositionid] [int] NULL,
	[RevenueStart] [float] NULL,
	[PayPositionName] [nvarchar](255) NULL,
	[PayPositionDescription] [nvarchar](255) NULL,
	[RevenueEnd] [float] NULL,
	[PayAreaid] [int] NULL,
	[BaseAmount] [float] NULL,
	[Percentage] [float] NULL,
	[PayAreaDescription] [nvarchar](255) NULL,
	[PayAreaName] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BTrainPaySchedule]    Script Date: 3/18/2021 11:44:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTrainPaySchedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[PerKmRate] [float] NULL,
	[MinKm] [float] NULL,
	[PayLoadRate] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChemVanPaySchedule]    Script Date: 3/18/2021 11:44:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChemVanPaySchedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[PerKmRate] [float] NULL,
	[PerLoadRate] [float] NULL,
	[MinKm] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CrewEfficiencyBonusPaySchedule]    Script Date: 3/18/2021 11:44:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CrewEfficiencyBonusPaySchedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[PayAsPositionName] [nvarchar](255) NULL,
	[PayRatio] [float] NULL,
	[PayAsPositionDescription] [nvarchar](255) NULL,
	[PayAsPositionid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExtendTravelPaySchedule]    Script Date: 3/18/2021 11:44:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExtendTravelPaySchedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[KmThreshold] [float] NULL,
	[HourThreshold] [float] NULL,
	[BaseRate] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EXTLPaySchedule]    Script Date: 3/18/2021 11:44:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EXTLPaySchedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[PayPositionid] [int] NULL,
	[PayPositionDescription] [nvarchar](255) NULL,
	[PayPositionName] [nvarchar](255) NULL,
	[HourlyRate] [float] NULL,
	[HourThreshold] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotShotPaySchedule]    Script Date: 3/18/2021 11:44:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotShotPaySchedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[PerKmRate] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobRole]    Script Date: 3/18/2021 11:44:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobRole](
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
	[description] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayArea]    Script Date: 3/18/2021 11:44:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayArea](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayEntry]    Script Date: 3/18/2021 11:44:56 AM ******/
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
	[Employeeid] [int] NULL,
	[EmployeeSystemId] [int] NULL,
	[ServiceLineid] [int] NULL,
	[ServiceLineSystemId] [int] NULL,
	[HomeServicePointid] [int] NULL,
	[HomeServicePointSystemId] [int] NULL,
	[PayTypeName] [nvarchar](255) NULL,
	[PayPositionDescription] [nvarchar](255) NULL,
	[PaySummaryTypeName] [nvarchar](255) NULL,
	[MtsNumber] [nvarchar](255) NULL,
	[JobProvinceName] [nvarchar](255) NULL,
	[JobProvinceSystemId] [int] NULL,
	[HomeServicePointDescription] [nvarchar](255) NULL,
	[Status] [int] NULL,
	[Amount] [float] NULL,
	[PaySummaryTypeDescription] [nvarchar](255) NULL,
	[JobRevenue] [float] NULL,
	[ClientCompanyName] [nvarchar](255) NULL,
	[ClientCompanySystemId] [int] NULL,
	[JobNumber] [nvarchar](255) NULL,
	[WorkingServicePointName] [nvarchar](255) NULL,
	[WorkingServicePointSystemId] [int] NULL,
	[PayTypeid] [int] NULL,
	[StandyHour] [float] NULL,
	[PayPositionid] [int] NULL,
	[JobUniqueId] [nvarchar](255) NULL,
	[WorkTypeName] [nvarchar](255) NULL,
	[WorkTypeSystemId] [int] NULL,
	[WorkAssignmentName] [nvarchar](255) NULL,
	[WorkAssignmentSystemId] [int] NULL,
	[WorkTypeDescription] [nvarchar](255) NULL,
	[EmployeeName] [nvarchar](255) NULL,
	[PayPeriodid] [int] NULL,
	[JobProvinceDescription] [nvarchar](255) NULL,
	[ServiceLineName] [nvarchar](255) NULL,
	[EmployeeDescription] [nvarchar](255) NULL,
	[ClientCompanyDescription] [nvarchar](255) NULL,
	[WorkAssignmentid] [int] NULL,
	[WorkingServicePointDescription] [nvarchar](255) NULL,
	[PayAreaDescription] [nvarchar](255) NULL,
	[JobDate] [datetime2](7) NULL,
	[PayPeriodName] [nvarchar](255) NULL,
	[PayAreaName] [nvarchar](255) NULL,
	[JobProvinceid] [int] NULL,
	[ClientCompanyid] [int] NULL,
	[HomeServicePointName] [nvarchar](255) NULL,
	[PayPositionName] [nvarchar](255) NULL,
	[WorkDescription] [ntext] NULL,
	[PaySummaryTypeid] [int] NULL,
	[TravelTime] [float] NULL,
	[PayAreaid] [int] NULL,
	[IsTwoWay] [bit] NULL,
	[WorkAssignmentDescription] [nvarchar](255) NULL,
	[WorkTypeid] [int] NULL,
	[PayTypeDescription] [nvarchar](255) NULL,
	[PayPeriodDescription] [nvarchar](255) NULL,
	[TravelDistance] [float] NULL,
	[WorkingServicePointid] [int] NULL,
	[LoadQuantity] [float] NULL,
	[ServiceLineDescription] [nvarchar](255) NULL,
	[UniqueId] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayPeriod]    Script Date: 3/18/2021 11:44:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayPeriod](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[PayDate] [datetime2](7) NULL,
	[StartDate] [datetime2](7) NULL,
	[Status] [int] NULL,
	[EndDate] [datetime2](7) NULL,
	[DueDate] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayPeriodSummary]    Script Date: 3/18/2021 11:44:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayPeriodSummary](
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
	[ServiceLineid] [int] NULL,
	[ServiceLineSystemId] [int] NULL,
	[ServicePointDescription] [nvarchar](255) NULL,
	[ServicePointSystemId] [int] NULL,
	[UniqueId] [nvarchar](255) NULL,
	[ServicePointid] [int] NULL,
	[ServiceLineDescription] [nvarchar](255) NULL,
	[ServicePointName] [nvarchar](255) NULL,
	[PayPeriodDescription] [nvarchar](255) NULL,
	[ServiceLineName] [nvarchar](255) NULL,
	[Amount] [float] NULL,
	[PayPeriodid] [int] NULL,
	[PayPeriodName] [nvarchar](255) NULL,
	[Status] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayPosition]    Script Date: 3/18/2021 11:44:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayPosition](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[ServiceLineDescription] [nvarchar](255) NULL,
	[ServiceLineSystemId] [int] NULL,
	[ServiceLineid] [int] NULL,
	[ServiceLineName] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayPositionMapping]    Script Date: 3/18/2021 11:44:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayPositionMapping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[PayPositionName] [nvarchar](255) NULL,
	[HrPositionid] [int] NULL,
	[HrPositionSystemId] [int] NULL,
	[HrPositionName] [nvarchar](255) NULL,
	[JobRoleDescription] [nvarchar](255) NULL,
	[JobRoleSystemId] [int] NULL,
	[JobRoleid] [int] NULL,
	[JobRoleName] [nvarchar](255) NULL,
	[HrPositionDescription] [nvarchar](255) NULL,
	[PayPositionid] [int] NULL,
	[PayPositionDescription] [nvarchar](255) NULL,
	[ServiceLineDescription] [nvarchar](255) NULL,
	[ServiceLineSystemId] [int] NULL,
	[ServiceLineName] [nvarchar](255) NULL,
	[ServiceLineid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayrollExportMapping]    Script Date: 3/18/2021 11:44:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayrollExportMapping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[ServiceLineName] [nvarchar](255) NULL,
	[ServiceLineSystemId] [int] NULL,
	[PaySummaryTypeName] [nvarchar](255) NULL,
	[PaySummaryTypeDescription] [nvarchar](255) NULL,
	[EarningCode] [nvarchar](255) NULL,
	[ServiceLineDescription] [nvarchar](255) NULL,
	[PaySummaryTypeid] [int] NULL,
	[PayrollDescription] [nvarchar](255) NULL,
	[ServiceLineid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaySummary]    Script Date: 3/18/2021 11:44:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaySummary](
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
	[ServicePointid] [int] NULL,
	[ServicePointSystemId] [int] NULL,
	[EmployeeDescription] [nvarchar](255) NULL,
	[EmployeeSystemId] [int] NULL,
	[EmployeeName] [nvarchar](255) NULL,
	[Status] [int] NULL,
	[ServiceLineDescription] [nvarchar](255) NULL,
	[ServiceLineSystemId] [int] NULL,
	[StandbyAmount] [float] NULL,
	[ServicePointName] [nvarchar](255) NULL,
	[UniqueId] [nvarchar](255) NULL,
	[BaseVariablePayAmount] [float] NULL,
	[MealAllowance] [float] NULL,
	[ServiceLineid] [int] NULL,
	[PayPeriodDescription] [nvarchar](255) NULL,
	[SumOfOVPP] [float] NULL,
	[Employeeid] [int] NULL,
	[ServicePointDescription] [nvarchar](255) NULL,
	[TotalAmount] [float] NULL,
	[PayPeriodName] [nvarchar](255) NULL,
	[ServiceLineName] [nvarchar](255) NULL,
	[PayPeriodid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaySummaryType]    Script Date: 3/18/2021 11:44:57 AM ******/
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
/****** Object:  Table [dbo].[PayType]    Script Date: 3/18/2021 11:44:57 AM ******/
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
	[PaySummaryTypeid] [int] NULL,
	[PaySummaryTypeDescription] [nvarchar](255) NULL,
	[PaySummaryTypeName] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductHaulPaySchedule]    Script Date: 3/18/2021 11:44:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductHaulPaySchedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[PayAreaid] [int] NULL,
	[PerHaulRate] [float] NULL,
	[PerKmRate] [float] NULL,
	[PayAreaDescription] [nvarchar](255) NULL,
	[PayAreaName] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RTBAPaySchedule]    Script Date: 3/18/2021 11:44:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RTBAPaySchedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[BaseRate] [float] NULL,
	[KmThreshold] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SelfLoadPaySchedule]    Script Date: 3/18/2021 11:44:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SelfLoadPaySchedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[PerLoadRate] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StandbyPaySchedule]    Script Date: 3/18/2021 11:44:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StandbyPaySchedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[PayPositionid] [int] NULL,
	[HourThreshold] [float] NULL,
	[PayPositionDescription] [nvarchar](255) NULL,
	[PayPositionName] [nvarchar](255) NULL,
	[HoulyRate] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkAssignment]    Script Date: 3/18/2021 11:44:57 AM ******/
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
/****** Object:  Table [dbo].[WorkType]    Script Date: 3/18/2021 11:44:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkType](
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
	[description] [nvarchar](500) NULL
) ON [PRIMARY]
GO
