USE [WellDB]
GO

/****** Object:  Table [dbo].[ClientContact]    Script Date: 11/2/2020 10:52:38 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ClientContact](
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
	[CellNumber] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[PhoneNumber] [nvarchar](255) NULL
) ON [PRIMARY]
GO


-- Nov 10. Add ClientName & JobTitle
alter table clientContact add [ClientName] [nvarchar](255) NULL;
alter table clientContact add [JobTitle] [nvarchar](255) NULL;