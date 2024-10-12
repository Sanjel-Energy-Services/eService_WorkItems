USE [SanjelData]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 2/7/2022 2:58:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employee](
	[id] [int] NOT NULL, /*Entity unique id*/
	[system_id] [int] IDENTITY(1,1) NOT NULL, /*System generated from table sequence */
	[version] [int] NULL, /* 0 */
	[modified_user_id] [int] NULL,/* 0 */
	[modified_user_name] [nvarchar](50) NULL, /* AD username */
	[modified_datetime] [datetime2](7) NULL, /* Timestamp of record being created or updated */
	[operation_type] [int] NULL, /* 0 */
	[effective_start_datetime] [datetime2](7) NULL, /* ealier than the current timestap for transactional data */
	[effective_end_datetime] [datetime2](7) NULL, /* 9999-12-31 00:00:00.0000000, or max date time allowed */
	[entity_status] [int] NULL, /* 0 - active, 1 - inactive (soft deleted) */
	[owner_id] [int] NULL, /* 0 */
	[name] [nvarchar](100) NULL, /* record level unique identifier */ 
	[description] [nvarchar](500) NULL, /* free to use for describing the record */
	[MiddleName] [nvarchar](255) NULL,
	[ServicePointid] [int] NULL, /* Id of referenced entity */
	[ServiceLineSystemId] [int] NULL, /* System_id of referenced entity */
	[ServicePointName] [nvarchar](255) NULL, /* Name of referenced entity */
	[ServicePointDescription] [nvarchar](255) NULL,/* Description of referenced entity */
	[ServiceLineName] [nvarchar](255) NULL,
	[ServiceLineid] [int] NULL,
	[EmployeeNumber] [nvarchar](255) NULL,
	[ServicePointSystemId] [int] NULL,
	[PreferedFirstName] [nvarchar](255) NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[ServiceLineDescription] [nvarchar](255) NULL,
	[BonusPositionid] [int] NULL,
	[BonusPositionSystemId] [int] NULL,
	[BonusPositionName] [nvarchar](255) NULL,
	[BonusPositionDescription] [nvarchar](255) NULL,
	[WorkEmail] [nvarchar](255) NULL,
	[Cell] [nvarchar](255) NULL,
	[WorkPhone] [nvarchar](255) NULL,
	[PositionId] [nvarchar](255) NULL
) ON [PRIMARY]
GO


