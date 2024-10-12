USE master;  
GO  
ALTER DATABASE WellDB  
COLLATE SQL_Latin1_General_CP1_CI_AS ;  
GO  


SELECT name, collation_name  
FROM sys.databases  
WHERE name = N'WellDB';  
GO  

USE WellDB;

ALTER TABLE dbo.CasingHistory ALTER COLUMN name  nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.CasingHistory ALTER COLUMN description  nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.CasingHistory ALTER COLUMN UniqueId  nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.CasingHistory ALTER COLUMN JobTypeName  nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
GO

ALTER TABLE dbo.CasingHistoryStaging ALTER COLUMN name  nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.CasingHistoryStaging ALTER COLUMN description  nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.CasingHistoryStaging ALTER COLUMN JobUniqueId  nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
GO

ALTER TABLE dbo.CasingPipe ALTER COLUMN name  nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.CasingPipe ALTER COLUMN description  nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
GO

ALTER TABLE dbo.JobCasingPipeStaging ALTER COLUMN name  nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.JobCasingPipeStaging ALTER COLUMN description  nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.JobCasingPipeStaging ALTER COLUMN JobUniqueId  nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
GO

ALTER TABLE dbo.JobHistoryStaging ALTER COLUMN name  nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.JobHistoryStaging ALTER COLUMN description  nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.JobHistoryStaging ALTER COLUMN UniqueId  nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.JobHistoryStaging ALTER COLUMN WellSurfaceLocation  nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.JobHistoryStaging ALTER COLUMN WellName  nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.JobHistoryStaging ALTER COLUMN JobTypeName  nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.JobHistoryStaging ALTER COLUMN WellDownHoleLocation  nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
GO  

ALTER TABLE dbo.JobOpenHoleStaging ALTER COLUMN name  nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.JobOpenHoleStaging ALTER COLUMN description  nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.JobOpenHoleStaging ALTER COLUMN JobUniqueId  nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
GO

ALTER TABLE dbo.OpenHole ALTER COLUMN name  nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.OpenHole ALTER COLUMN description  nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
GO

ALTER TABLE dbo.PipeSegment ALTER COLUMN name  nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.PipeSegment ALTER COLUMN description  nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
GO

ALTER TABLE dbo.Well ALTER COLUMN name  nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.Well ALTER COLUMN description  nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.Well ALTER COLUMN DownHoleLocation  nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.Well ALTER COLUMN SurfaceLocation  nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
GO

ALTER TABLE dbo.Wellbore ALTER COLUMN name  nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.Wellbore ALTER COLUMN description  nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
GO

ALTER TABLE dbo.WellboreSegment ALTER COLUMN name  nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.WellboreSegment ALTER COLUMN description  nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
GO

ALTER TABLE dbo.WellChallenge ALTER COLUMN name  nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.WellChallenge ALTER COLUMN description  nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
ALTER TABLE dbo.WellChallenge ALTER COLUMN Comments  nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL;  
GO
