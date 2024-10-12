USE [master]
GO
/****** Object:  Database [PlcDataStaging]    Script Date: 7/11/2024 9:53:54 PM ******/
CREATE DATABASE [PlcDataStaging]
GO
 
USE [PlcDataStaging]
GO
/****** Object:  Table [dbo].[PlcData]    Script Date: 7/11/2024 9:53:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlcData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[JSON] [nvarchar](max) NULL,
	[TimeStamp] [datetime2](7) NULL,
	[UnitID] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [PlcDataStaging] SET  READ_WRITE 
GO