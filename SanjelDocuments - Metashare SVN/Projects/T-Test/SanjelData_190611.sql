-- 2019/05/28

CREATE TABLE SanjelData.[dbo].[BinNote] (
[id] int NOT NULL ,
[system_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[modified_user_id] int NULL ,
[modified_user_name] nvarchar(50) NULL ,
[modified_datetime] datetime2(7) NULL ,
[operation_type] int NULL ,
[effective_start_datetime] datetime2(7) NULL ,
[effective_end_datetime] datetime2(7) NULL ,
[entity_status] int NULL ,
[owner_id] int NULL ,
[name] nvarchar(100) NULL ,
[description] nvarchar(500) NULL ,
[Binid] int NULL ,
[BinName] nvarchar(255) NULL ,
[BinDescription] nvarchar(255) NULL ,
[BinSystemId] int NULL 
);

ALTER TABLE SanjelData.[dbo].[Bin] DROP COLUMN [WorkingServicePointName];

ALTER TABLE SanjelData.[dbo].[Bin] DROP COLUMN [WorkingServicePointid];

ALTER TABLE SanjelData.[dbo].[Bin] DROP COLUMN [BinStatus];

ALTER TABLE SanjelData.[dbo].[Bin] DROP COLUMN [WorkingServicePointSystemId];

ALTER TABLE SanjelData.[dbo].[Bin] DROP COLUMN [WorkingServicePointDescription];

ALTER TABLE SanjelData.[dbo].[RigBinSection] ADD [WorkingServicePointid] int NULL ;

ALTER TABLE SanjelData.[dbo].[RigBinSection] ADD [WorkingServicePointSystemId] int NULL ;

ALTER TABLE SanjelData.[dbo].[RigBinSection] ADD [WorkingServicePointDescription] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE SanjelData.[dbo].[RigBinSection] ADD [WorkingServicePointName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ;

ALTER TABLE SanjelData.[dbo].[RigBinSection] ADD [RigBinSectionStatus] int NULL ;

UPDATE SanjelData.dbo.RigBinSection SET RigBinSectionStatus=1;

UPDATE SanjelData.dbo.RigBinSection SET WorkingServicePointid=r.ServicePointid,WorkingServicePointSystemId=r.ServicePointSystemId,
WorkingServicePointName=r.ServicePointName,WorkingServicePointDescription=r.ServicePointDescription FROM SanjelData.dbo.RigBinSection rb,
(SELECT Rigid,ServicePointid,ServicePointSystemId,ServicePointName,ServicePointDescription FROM SanjelData.dbo.RigJob WHERE IsListed=1 and JobLifeStatus<>1 and Rigid IN
(SELECT DISTINCT Rigid FROM SanjelData.dbo.RigBinSection))r WHERE rb.Rigid=r.Rigid;