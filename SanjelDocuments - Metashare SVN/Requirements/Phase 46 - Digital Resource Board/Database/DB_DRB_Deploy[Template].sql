
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--!!!!!!!!!!!!!!! Make sure we are connected to [Sanjel23\App] !!!!!!!!!!!!!!!
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



-- Before executing, 
-- Copy script intoto a New Query window/tab
-- Replace by Find & Replace all occurrences for following placeholders
-- 		#TargetSanjelDataDb#
-- 		#TargetEservice6Db#


-- If it is a new target database, execute first 4 manual steps below
-- And only after that, the rest of the script 




-------------- Restore [Sanjel23\App].#TargetSanjelDataDb# DB from the latest daily Prod

USE [master];
IF (EXISTS (SELECT name from sys.databases WHERE name = '#TargetSanjelDataDb#'))
    ALTER DATABASE #TargetSanjelDataDb# SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

BEGIN TRY

-- Manual step 1 - for a new database
	   USE [master];

       EXECUTE [dbo].[RestoreDbFromLastBackup ] 
          @srcBackupPath = N'\\Sanjel25\First4_Backups\SANJEL25.APP\Daily\'
         ,@srcDbName = 'SanjelData'
         ,@srcLogicalDbName = 'MasterDataManagement'
         ,@srcLogicalLogName = 'MasterDataManagement_log'
         ,@destDbMoveToPath = N'D:\Program Files\Microsoft SQL Server\MSSQL12.APP\MSSQL\DATA\'
         ,@destDbName = '#TargetSanjelDataDb#'
         ,@destLogicalDbName = '#TargetSanjelDataDb#'
         ,@destLogicalLogName = '#TargetSanjelDataDb#_log'
       ;
-- Manual step 1 - for a new database

-- Manual step 2 - for a new database
       USE [#TargetSanjelDataDb#];

       EXEC sp_change_users_login 'Auto_Fix', 'eservice6';
       EXEC sp_change_users_login 'Auto_Fix', 'LabTestingAdmin';
-- Manual step 2 - for a new database

END TRY
BEGIN CATCH
END CATCH

USE [master];
ALTER DATABASE #TargetSanjelDataDb# SET MULTI_USER;





-------------- Restore [Sanjel23\App].#TargetEservice6Db# DB from latest daily Prod

USE [master];
IF (EXISTS (SELECT name from sys.databases WHERE name = '#TargetEservice6Db#'))
    ALTER DATABASE #TargetEservice6Db# SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

BEGIN TRY

-- Manual step 3 - for a new database
	   USE [master];

       EXECUTE [dbo].[RestoreDbFromLastBackup] 
          @srcBackupPath = N'\\Sanjel25\First4_Backups\SANJEL25.APP\Daily\'
         ,@srcDbName = 'eservice6'
         ,@srcLogicalDbName = 'eservice6'
         ,@srcLogicalLogName = 'eservice6_log'
         ,@destDbMoveToPath = N'D:\Program Files\Microsoft SQL Server\MSSQL12.APP\MSSQL\DATA\'
         ,@destDbName = '#TargetEservice6Db#'
         ,@destLogicalDbName = '#TargetEservice6Db#'
         ,@destLogicalLogName = '#TargetEservice6Db#_log'
       ;
-- Manual step 3 - for a new database

-- Manual step 4 - for a new database
       USE [#TargetEservice6Db#];

       EXEC sp_change_users_login 'Auto_Fix', 'FIRST4DB_MON';
       EXEC sp_change_users_login 'Auto_Fix', 'eservice6';
       EXEC sp_change_users_login 'Auto_Fix', 'LabTestingAdmin';
-- Manual step 4 - for a new database

END TRY
BEGIN CATCH
END CATCH

USE [master];
ALTER DATABASE #TargetEservice6Db# SET MULTI_USER;






-- Rest of the script to run after dabases are refreshed






-- Configure Arcurve DRB permissions

--Before executing script
--      1. Make sure the proper DB is used (USE <DbName>)
--      2. Set up variable as needed
--      3. Configure particular objects (tables / views) access using script example below under
--            the '--# To be copied, uncommented, adjusted and repeated for each object access is needed to #' section
--      4. Script is safe to execute multiple times having step 2 altered as needed

BEGIN
    declare 
        @db_role_name as nvarchar(max) = 'App_drb_Role'
        ,@user_name as nvarchar(max) = 'App_drb_User'
        ,@user_pwrd as nvarchar(max) = N'sanjel'
        ,@sql nvarchar(max)
        ;


	USE [master];

	--Create server login
    IF NOT EXISTS (select name from master.sys.server_principals WHERE name = @user_name)
    BEGIN
        set @sql = 'create login ' + @user_name + ' with password = ''' + @user_pwrd + '''' + ', CHECK_EXPIRATION = OFF, CHECK_POLICY = OFF';
        exec (@sql);
    END;


	USE [#TargetSanjelDataDb#];

		--Create database role
		IF DATABASE_PRINCIPAL_ID(@db_role_name) IS NULL
			BEGIN
				set @sql = 'create role ' + @db_role_name;
				EXEC (@sql);
			END;

		--Create database user
		IF NOT EXISTS (select name from sys.database_principals where name = @user_name)
			BEGIN
				set @sql = 'create user ' + @user_name + ' for login ' + @user_name;
				exec (@sql);
			END;
    
		--Add user to database role
		exec sp_addrolemember @db_role_name , @user_name;


		--Grant appropriate individual access explicitly to each object (tables/views) if needed 
		--# To be copied, uncommented, adjusted and repeated for each object access is needed to #
				--set @sql = 'grant [insert], [select], [update] on ' + 'Explicit Object Name' + ' to ' + @db_role_name;
				--exec (@sql);

		--Grant appropriate access to a database 

        set @sql = 'ALTER ROLE db_datareader ADD MEMBER ' + @db_role_name;
        exec (@sql);
    
        set @sql = 'ALTER ROLE db_datawriter ADD MEMBER ' + @db_role_name;
        exec (@sql);

        --To also assign the ability to execute all Stored Procedures for a Database:
        set @sql = 'GRANT EXECUTE TO ' + @db_role_name;
        exec (@sql);
            
		EXEC sp_change_users_login 'Auto_Fix', @user_name;

	USE [#TargetEservice6Db#];

		--Create database user
		IF NOT EXISTS (select name from sys.database_principals where name = @user_name)
			BEGIN
				set @sql = 'create user ' + @user_name + ' for login ' + @user_name;
				exec (@sql);
			END;
    
		--Grant appropriate access to a database 

        set @sql = 'ALTER ROLE db_datareader ADD MEMBER ' + @user_name;
        exec (@sql);
    
        set @sql = 'ALTER ROLE db_datawriter ADD MEMBER ' + @user_name;
        exec (@sql);

		EXEC sp_change_users_login 'Auto_Fix', @user_name;

END;




--Create and grant DRB access permissions to all RigBoard groups
USE [#TargetEservice6Db#];

INSERT INTO dbo.SD_PERMISSIONS (ID, APPLICATION_ID, NAME, DESCRIPTION, VERSION) VALUES(1000444, 572, N'DigitalResourceBoard', N'General Permission: Digital Resource Board', 0);
SELECT NEXT VALUE FOR dbo.SEQ_SD_PERMISSIONS;
INSERT INTO dbo.SD_GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID, VERSION) VALUES(1000481, 1000444, 0);
INSERT INTO dbo.SD_GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID, VERSION) VALUES(1000501, 1000444, 0);
INSERT INTO dbo.SD_GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID, VERSION) VALUES(1000502, 1000444, 0);
INSERT INTO dbo.SD_GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID, VERSION) VALUES(1000503, 1000444, 0);
INSERT INTO dbo.SD_PERMISSIONS (ID, APPLICATION_ID, NAME, DESCRIPTION, VERSION) VALUES(1000445, 572, N'BulkPlantIndex', N'Online Use Case: Bulk Plant Board Access', 0);
SELECT NEXT VALUE FOR dbo.SEQ_SD_PERMISSIONS
INSERT INTO dbo.SD_GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID, VERSION) VALUES(1000481, 1000445, 0);
INSERT INTO dbo.SD_GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID, VERSION) VALUES(1000501, 1000445, 0);
INSERT INTO dbo.SD_GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID, VERSION) VALUES(1000502, 1000445, 0);
INSERT INTO dbo.SD_GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID, VERSION) VALUES(1000503, 1000445, 0);
INSERT INTO dbo.SD_PERMISSIONS (ID, APPLICATION_ID, NAME, DESCRIPTION, VERSION) VALUES(1000446, 572, N'ResourceBoardIndex', N'Online Use Case: Resource Board Access', 0);
SELECT NEXT VALUE FOR dbo.SEQ_SD_PERMISSIONS
INSERT INTO dbo.SD_GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID, VERSION) VALUES(1000481, 1000446, 0);
INSERT INTO dbo.SD_GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID, VERSION) VALUES(1000501, 1000446, 0);
INSERT INTO dbo.SD_GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID, VERSION) VALUES(1000502, 1000446, 0);
INSERT INTO dbo.SD_GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID, VERSION) VALUES(1000503, 1000446, 0);

-- Grant Arcurve devs RigBoard access
USE [#TargetEservice6Db#];

EXEC [dbo].[SP_MANAGE_SD_USERS] 'gwong', '1000481|1000501|1000502|1000503|1009', 62, 0, 0;
EXEC [dbo].[SP_MANAGE_SD_USERS] 'mscoulding', '1000481|1000501|1000502|1000503|1009', 62, 0, 0;
EXEC [dbo].[SP_MANAGE_SD_USERS] 'vhorobets', '1000481|1000501|1000502|1000503|1009', 62, 0, 0;
EXEC [dbo].[SP_MANAGE_SD_USERS] 'cearl', '1000481|1000501|1000502|1000503|1009', 62, 0, 0;
EXEC [dbo].[SP_MANAGE_SD_USERS] 'skaleru', '1000481|1000501|1000502|1000503|1009', 62, 0, 0;
EXEC [dbo].[SP_MANAGE_SD_USERS] 'cchan', '1000481|1000501|1000502|1000503|1009', 62, 0, 0;


-- Set up Arcurve devs with eService password (sanjel)
use [#TargetEservice6Db#];

select * from dbo.SD_USERS where name in ('gwong', 'mscoulding', 'vhorobets', 'cearl', 'skaleru', 'cchan'); -- password is set for all to <sanjel> 

update dbo.SD_USERS set HASHED_PASSWORD = N'kCfv2Tnve3itVS1V7UalnQ==' where NAME = 'cchan';
update dbo.SD_USERS set HASHED_PASSWORD = N'eADLZzfsITpFESdvDT3eSA==' where NAME = 'cearl';
update dbo.SD_USERS set HASHED_PASSWORD = N'9p/8p63b/Cuco6FPHOV9nQ==' where NAME = 'gwong';
update dbo.SD_USERS set HASHED_PASSWORD = N'ATZFuiyGLzonnmrwK3h1hA==' where NAME = 'mscoulding';
update dbo.SD_USERS set HASHED_PASSWORD = N'Ybv4NdRg8mapEJcXzQw7ig==' where NAME = 'skaleru';
update dbo.SD_USERS set HASHED_PASSWORD = N'/XzEW9SW6a4rJebrdeD/LA==' where NAME = 'vhorobets';


USE [#TargetEservice6Db#]

ALTER TABLE [PRG_PUMPING_JOB_SECTIONS] ADD [PUMPER_COUNT]  [int] NULL;
ALTER TABLE [PRG_PUMPING_JOB_SECTIONS] ADD [JOB_DURATION]  [int] NULL;
ALTER TABLE [PRG_PUMPING_JOB_SECTIONS] ADD [PUMPING_DURATION]  [int] NULL;

ALTER TABLE [CALLSHEET_HEADERS] ADD [JD_PUMPER_COUNT]  [int] NULL;
ALTER TABLE [CALLSHEET_HEADERS] ADD [JD_JOB_DURATION]  [int] NULL;
Go


-- Create UnitLocation view

USE [#TargetSanjelDataDb#];

IF (EXISTS (SELECT 1 FROM sys.views WHERE name = 'UnitLocation' AND TYPE = 'v')) 
    drop view UnitLocation;
GO

create view UnitLocation 
as
with 
    motive as
    (
        SELECT  
            UnitNumber
            ,Lat                Latitude
            ,Lng                Longitude
            ,VehicleId
            ,LastRecordingTime
            ,DriverEmplNumber
            ,DriverEmail
            ,row_number() over (partition by UnitNumber order by LastRecordingTime desc, ProcessingDate desc) rn
        FROM 
            [Sanjel27\DW].SESI_DW.dbo.Motive_LastLocations
        where
            1=1
            and LastRecordingTime is not null
    )
    ,merged as
    (
        select 
            *
            ,row_number() over (partition by UnitNumber order by LastRecordingTime desc) rn
        from
        (
            SELECT 
                VehicleName         UnitNumber
                ,Lat                Latitude
                ,Lng                Longitude
                ,VehicleID
                ,Time               LastRecordingTime
                ,null               DriverEmplNumber
                ,null               DriverEmail
                ,'InThink'          src
            FROM [Sanjel27\DW].SESI_DW.dbo.InThink_LastLocations
            union all
            SELECT 
                UnitNumber
                ,Latitude
                ,Longitude
                ,VehicleID
                ,LastRecordingTime
                ,DriverEmplNumber
                ,DriverEmail
                ,'Motive'           src
            FROM motive
            WHERE rn = 1
        ) a
    ) 
    SELECT 
        cast(l.VehicleID as int)    id
        ,cast(l.VehicleID as int)   system_id
        ,1                          [version]
        ,0                          modified_user_id
        ,cast(NULL as nvarchar(255))    modified_user_name
        ,l.LastRecordingTime        modified_datetime
        ,1                          operation_type
        ,l.LastRecordingTime        effective_start_datetime
        ,cast('9999-12-31 23:59:59.0000000' as datetime2) effective_end_datetime
        ,0                          entity_status
        ,0                          owner_id
        ,cast(NULL as nvarchar(100))    [name]
        ,cast(l.src as nvarchar(500))   [description]
        ,e.Id                       Driverid
        ,e.name                     DriverName
        ,e.description              DriverDescription
        ,e.system_id                DriverSystemId
        ,u.id                       UnitId
        ,cast(l.Latitude as decimal(12,6)) Latitude
        ,cast(l.Longitude as decimal(12,6)) Longitude
        ,l.UnitNumber       
        ,u.name                     UnitName
        ,u.description              UnitDescription
        ,u.system_id                UnitSystemId
        ,u.UnitMainTypeid           UnitMainTypeid
        ,u.UnitMainTypeName         UnitMainTypeName
        ,u.UnitMainTypeDescription  UnitMainTypeDescription
        ,u.UnitMainTypeSystemId     UnitMainTypeSystemId
        ,u.UnitSubTypeid            UnitSubTypeid
        ,u.UnitSubTypeName          UnitSubTypeName
        ,u.UnitSubTypeDescription   UnitSubTypeDescription
        ,u.UnitSubTypeSystemId      UnitSubTypeSystemId
    FROM 
        merged l
        left join dbo.TruckUnit u on u.UnitNumber collate Latin1_General_CI_AS = l.UnitNumber and u.[effective_end_datetime] > getdate()
        left join dbo.Employee  e on e.EmployeeNumber = l.DriverEmplNumber and e.effective_end_datetime > getdate()
    where 
        l.rn = 1   
        and u.Id is not null
    ;
GO




USE [#TargetSanjelDataDb#];

IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'BlendUnloadSheet')) 
    drop table [dbo].[BlendUnloadSheet];
GO

CREATE TABLE [dbo].[BlendUnloadSheet](
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
	[ShippingLoadSheetid] [int] NULL,
	[ShippingLoadSheetSystemId] [int] NULL,
	[ShippingLoadSheetName] [nvarchar](100) NULL,
	[ShippingLoadSheetDescription] [nvarchar](255) NULL,
	[DestinationStorageDescription] [nvarchar](255) NULL,
	[DestinationStorageSystemId] [int] NULL,
	[UnloadAmount] [float] NULL,
	[DestinationStorageName] [nvarchar](255) NULL,
	[DestinationStorageid] [int] NULL
) ON [PRIMARY]
GO

IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'ShippingLoadSheet')) 
    drop table [dbo].[ShippingLoadSheet];
GO

CREATE TABLE [dbo].[ShippingLoadSheet](
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
	[SourceStorageName] [nvarchar](255) NULL,
	[SourceStorageSystemId] [int] NULL,
	[ClientRepresentative] [nvarchar](255) NULL,
	[ProgramId] [nvarchar](255) NULL,
	[ShippingStatus] [int] NULL,
	[CallSheetNumber] [int] NULL,
	[SourceStorageDescription] [nvarchar](255) NULL,
	[ProductHaulLoadDescription] [nvarchar](255) NULL,
	[ProductHaulLoadSystemId] [int] NULL,
	[OnLocationTime] [datetime2](7) NULL,
	[ExpectedOnLocationTime] [datetime2](7) NULL,
	[ProductHaulLoadid] [int] NULL,
	[RigName] [nvarchar](255) NULL,
	[Destination] [nvarchar](255) NULL,
	[LoadAmount] [float] NULL,
	[ProductHaulid] [int] NULL,
	[ProductHaulSystemId] [int] NULL,
	[ProductHaulName] [nvarchar](100) NULL,
	[ProductHaulDescription] [nvarchar](255) NULL,
	[ClientName] [nvarchar](255) NULL,
	[BlendDescription] [nvarchar](255) NULL,
	[SourceStorageid] [int] NULL,
	[BlendTestStatus] [int] NULL,
	[ProductHaulLoadName] [nvarchar](255) NULL,
	[CallSheetId] [int] NULL,
	[IsGoWithCrew] [bit] NULL
) ON [PRIMARY]
GO

IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'PodLoad')) 
    drop table [dbo].[PodLoad];
GO

CREATE TABLE [dbo].[PodLoad](
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
	[ShippingLoadSheetid] [int] NULL,
	[ShippingLoadSheetSystemId] [int] NULL,
	[LoadAmount] [float] NULL,
	[ShippingLoadSheetDescription] [nvarchar](255) NULL,
	[ProductHaulid] [int] NULL,
	[ProductHaulSystemId] [int] NULL,
	[ProductHaulName] [nvarchar](100) NULL,
	[ProductHaulDescription] [nvarchar](255) NULL,
	[PodIndex] [int] NULL,
	[ShippingLoadSheetName] [nvarchar](255) NULL
) ON [PRIMARY]
GO

ALTER TABLE [ProductHaulLoad] ADD [RemainsAmount] [float] NULL;
ALTER TABLE [ProductHaulLoad] ADD [BlendTestingStatus] [int] NULL;
ALTER TABLE [ProductHaulLoad] ADD [BlendShippingStatus] [int] NULL;
Go
update ProductHaulLoad set [BlendTestingStatus] = 0;
update ProductHaulLoad set [BlendShippingStatus] = 0;
GO

ALTER TABLE [BinInformation] ADD [LastProductHaulLoadId] [int] NULL;
GO
update BinInformation set [LastProductHaulLoadId] = 0;
GO

ALTER TABLE [BinLoadHistory] ADD [BinInformationid] [int] NULL;
ALTER TABLE [BinLoadHistory] ADD [BinInformationSystemId] [int] NULL;
ALTER TABLE [BinLoadHistory] ADD [BinInformationName] [nvarchar](255) NULL;
ALTER TABLE [BinLoadHistory] ADD [BinInformationDescription] [nvarchar](255) NULL;

ALTER TABLE [BinLoadHistory] ADD [ShippingLoadSheetid] [int] NULL;
ALTER TABLE [BinLoadHistory] ADD [ShippingLoadSheetSystemId] [int] NULL;
ALTER TABLE [BinLoadHistory] ADD [ShippingLoadSheetName] [nvarchar](255) NULL;
ALTER TABLE [BinLoadHistory] ADD [ShippingLoadSheetDescription] [nvarchar](255) NULL;


IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'Well')) 
    drop table [dbo].[Well];
GO

CREATE TABLE [dbo].[Well](
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
	[WellOperatorDescription] [nvarchar](255) NULL,
	[WellOperatorSystemId] [int] NULL,
	[WellLocationTypeid] [int] NULL,
	[WellLocationTypeSystemId] [int] NULL,
	[WellOperatorid] [int] NULL,
	[WellTypeName] [nvarchar](255) NULL,
	[WellLocationTypeDescription] [nvarchar](255) NULL,
	[WellTypeDescription] [nvarchar](255) NULL,
	[DownHoleLocation] [ntext] NULL,
	[WellLocationTypeName] [nvarchar](255) NULL,
	[WellOperatorName] [nvarchar](255) NULL,
	[Longitude] [decimal](18, 6) NULL,
	[Licence] [nvarchar](255) NULL,
	[WellTypeid] [int] NULL,
	[SurfaceLocation] [ntext] NULL,
	[Latitude] [decimal](18, 6) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/*
IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'LocationLookup')) 
    drop table [dbo].[LocationLookup];
GO

CREATE TABLE [dbo].[LocationLookup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[LSD_TWP] [int] NULL,
	[LsdFinderFlag] [int] NULL,
	[ProcessingNotes] [ntext] NULL,
	[LSD_RGE] [int] NULL,
	[Longitude] [decimal](18, 6) NULL,
	[NTS_Map] [int] NULL,
	[NTS_Grid] [int] NULL,
	[ProcessingDateTime] [datetime2](7) NULL,
	[LSD_Mer] [int] NULL,
	[WellLocation] [nvarchar](255) NULL,
	[Latitude] [decimal](18, 6) NULL,
	[NormalizedWellLocation] [nvarchar](255) NULL,
	[NTS_MapSheet] [nvarchar](255) NULL,
	[LSD_LSD] [int] NULL,
	[LSD_Sec] [int] NULL,
	[NTS_QuaterUnit] [int] NULL,
	[NTS_Unit] [int] NULL,
	[NTS_Block] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
*/

IF (EXISTS (SELECT 1 FROM sys.views WHERE name = 'LocationLookup' AND TYPE = 'v')) 
    drop view LocationLookup;
GO

CREATE view [dbo].[LocationLookup]
as
	SELECT
		AddedOrder id
		,WellLocation
		,NormalizedWellLocation
		,cast(Latitude as decimal (18,6)) Latitude
		,cast(Longitude as decimal (18,6)) Longitude
		,LSD_Mer
		,LSD_RGE
		,LSD_TWP
		,NULL LSD_LSD
		,NULL LSD_Sec
		,NTS_Map
		,cast(NTS_MapSheet as nvarchar(255)) NTS_MapSheet
		,NTS_Grid
		,NULL NTS_QuaterUnit
		,NULL NTS_Unit
		,NULL NTS_Block
		,LsdFinderFlag
		,ProcessingDateTime
		--,ProcessingNotes
		,cast(ProcessingNotes as ntext) ProcessingNotes
		,0 entity_status
		,0 owner_id
		,cast(null as nvarchar(100)) name
		,cast(null as nvarchar(500)) description
		--FROM #TargetSanjelDataDb#.dbo.LocationLookup
	from 
		[Sanjel27\DW].SESI_DW.dbo.Dim_WellLocations
GO


ALTER TABLE [RigJob] ADD [Latitude] [decimal](18, 6) NULL;
ALTER TABLE [RigJob] ADD [Longitude] [decimal](18, 6) NULL;
GO
ALTER TABLE [RigJob] ADD [PumperCount]  [int] NULL;
ALTER TABLE [RigJob] ADD [JobDuration]  [int] NULL;
ALTER TABLE [RigJob] ADD [PreJobTesting]  [bit] NULL;
Go
update rigjob set Latitude = 0, Longitude = 0 where Latitude is null;
update rigjob set PreJobTesting = 0 where Latitude is null;
Go

ALTER TABLE [Rig] ADD [Latitude] [decimal](18, 6) NULL;
ALTER TABLE [Rig] ADD [Longitude] [decimal](18, 6) NULL;
ALTER TABLE [Rig] ADD [WellLocation] [nvarchar](255) NULL;
GO
update Rig set Latitude = 0, Longitude = 0 where Latitude is null;
Go

IF OBJECT_ID(N'dbo.JobDesign', N'V') IS NOT NULL  
   DROP VIEW [dbo].[JobDesign];  
GO
CREATE VIEW [dbo].[JobDesign]
AS
select 
PRG.id as id,
0 as entity_status,
0 as owner_id,
null as name,
null as description,
PRG.id as system_id, 
cast(1 as int) as version,
0 as [modified_user_id],
null as [modified_user_name],
cast(PRG.LAST_MODIFIED_DATE_TIME as datetime2) as [modified_datetime],
PRG.LAST_OPERATION_TYPE as [operation_type],
cast(PRG.EFFECTIVE_START_DATE_TIME as datetime2) as [effective_start_datetime],
cast(PRG.EFFECTIVE_END_DATE_TIME as datetime2) as [effective_end_datetime],
1 as PumperCount,
PCIS.COMPANY_ID as ClientCompanyid,
0 as ClientCompanySystemId,
PCIS.COMPANY_NAME as ClientCompanyName,
PCIS.COMPANY_NAME as ClientCompanyDescription,
COM.SHORT_NAME as ClientCompanyShortName,
cast(0 as bit) as PreJobTesting,
PRG.JD_SERVICE_POINT_ID as ServicePointid,
0 as ServicePointSystemId,
JD_SERVICE_POINT_NAME as ServicePointName,
JD_SERVICE_POINT_NAME as ServicePointDescription,
WLI_RIG_ID as Rigid,
0 as RigSystemId,
WLI_RIG_NAME as RigName,
WLI_RIG_NAME as RigDescription,
ESTIMATE_START_DATE as JobDateTime,
PROGRAM_ID as ProgramId,
cast(8 as int) as JobDuration,
cast(0 as float) as RiskMatrix,
cast(null as [nvarchar](100)) as JobTypeName,
cast(null as [nvarchar](500)) as JobTypeDescription,
cast(0 as int) as JobTypeid,
cast(0 as int) as JobTypeSystemId,
REVISION_DESCRIPTION as RevisionDescription,
WLI_WELL_LOCATION as SurfaceLocation,
Revision as Revision,
Well_Count as WellCount,
WLI_DH_WELL_LOCATION as WellLocation,
cast(isnull(Is_Multiple_Well, 0) as bit) as IsMultipleWell,
PROGRAM_GENERATED_DATE as ProgramGeneratedDate
from #TargetEservice6Db#.dbo.programs PRG inner join
#TargetEservice6Db#.dbo.PRG_COMPANY_INFO_SCTNS PCIS on PCIS.ROOT_ID = PRG.id
inner join #TargetEservice6Db#.dbo.COMPANIES COM on COM.Id = PCIS.COMPANY_ID
where PCIS.IS_CLIENT = 1
GO

/*
IF OBJECT_ID(N'dbo.JobDesignPumpingJobSection', N'V') IS NOT NULL  
   DROP VIEW [dbo].[JobDesignPumpingJobSection];  
GO
CREATE VIEW [dbo].[JobDesignPumpingJobSection]
AS
select 
cast(PPJS.ID as int) as ID,
cast(0 as int) as entity_status,
cast(ROOT_ID as int) as owner_id,
cast(null as [nvarchar](100)) as name,
cast(null as [nvarchar](500)) as description,
cast(8 as int) as JobDuration,
cast(isnull(RISK_MATRIX, 0) as float) as RiskMatrix,
cast(1 as int) as PumperCount,
ROOT_ID as JobDesignid,
cast(0 as int) as JobDesignSystemId,
cast(null as [nvarchar](100)) as JobDesignName,
cast(null as [nvarchar](500)) as JobDesignDescription,
cast(JD_JOB_TYPE_ID as int) as JobTypeid,
cast(0 as int) as JobTypeSystemId,
cast(null as [nvarchar](500))  as JobTypeDescription,
cast(JD_JOB_TYPE_NAME as [nvarchar](500)) as JobTypeName
from #TargetEservice6Db#.dbo.PRG_PUMPING_JOB_SECTIONS PPJS;
GO
*/
USE #TargetSanjelDataDb#;
GO

IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'JobTimeReport')) 
    drop table [dbo].[JobTimeReport];
GO

CREATE TABLE JobTimeReport 
(
	id 						int IDENTITY(1, 1) NOT NULL
	, entity_status 		int NULL
	, owner_id 				int NULL
	, name 					nvarchar(100) NULL
	, description 			nvarchar(500) NULL
	, JobTypeid 			int
	, JobTypeName 			nvarchar(100) NULL
	, JobTypeDescription 	nvarchar(500) NULL
	, JobTypeSystemId 		int Not NULL
	, PostJobDuration 		int
	, PrepDuration 			int
	, PumpingDuration 		int
	, PumperCount 			int
);
GO

INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'2-Stage Intermediate',0,30,180,180,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'2-Stage Intermediate',0,30,180,180,2)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'2-Stage Production',0,30,190,180,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'2-Stage Production',0,30,190,180,2)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'2-Stage Production',0,30,190,180,3)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'2-Stage Surface',0,30,180,180,2)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Abandonment Squeeze',0,30,110,120,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Abrasive Jet',0,30,95,240,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Abrasive Jet',0,30,95,240,2)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Acid Squeeze',0,30,110,120,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Acid Wash',0,30,110,120,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Balanced Plug',0,30,100,120,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Bradenhead Squeeze',0,30,100,120,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Bull Head Squeeze',0,30,110,120,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Casing-in-Casing Remedial Cement',0,30,130,120,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Cement Top Off',0,30,80,90,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Cement Top Off - Remedial',0,45,110,90,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Cementing through Third Party Coil',0,30,80,100,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Circulation Squeeze',0,30,80,120,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Conductor Barrel',0,30,60,90,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Conductor Barrel',0,30,60,90,2)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Foamed Cement',0,75,300,240,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Foamed Cement Squeeze',0,75,300,240,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Injection Test',0,30,45,150,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Injection Test',0,30,45,150,2)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Intermediate Casing',0,45,150,180,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Intermediate Casing',0,45,150,180,2)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Intermediate Casing',0,45,150,180,3)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Liner Casing',0,30,190,200,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Liner Casing',0,30,190,200,2)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Lost Circulation Plug',0,30,120,180,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Lost Circulation Plug',0,30,120,180,2)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Misc. Pumping – Remedial',0,30,120,120,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Miscellaneous Pumping',0,30,120,120,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Pipeline / HDD Abandonment',0,30,45,180,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Pipeline Grouting',0,30,110,180,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Pipeline Grouting',0,30,200,180,2)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Pipeline Grouting',0,30,200,180,3)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Pipeline Grouting',0,30,200,180,5)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Plugback Production',0,30,200,180,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Plugback Whipstock',0,30,150,180,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Plugback Whipstock',0,30,150,180,2)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Primary Abandonment Plug',0,30,120,180,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Primary Abandonment Plug',0,30,120,180,2)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Production Casing',0,30,160,180,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Production Casing',0,30,160,180,2)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Remedial Abandonment Plug',0,30,160,150,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Remedial Abandonment Plug',0,30,160,150,2)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Retainer Squeeze',0,30,75,180,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Slow Rate Bradenhead Squeeze',0,30,110,200,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Slow Rate Retainer Squeeze',0,30,110,200,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Surface Casing',0,30,140,90,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Surface Casing',0,30,140,90,2)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Surface Casing',0,30,140,90,3)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Well Kill',0,30,120,180,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Well Kill',0,30,120,180,2)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Well Kill - Remedial',0,30,150,180,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Well Stability Plug',0,30,150,120,1)
INSERT INTO dbo.JobTimeReport (entity_status,owner_id,name,description,JobTypeid,JobTypeName,JobTypeDescription,JobTypeSystemId,PostJobDuration,PrepDuration,PumpingDuration,PumperCount) VALUES (0,0,null,null,0,null,'Whipstock Plug',0,30,150,120,1)
GO 

update r 
	set
	JobTypeid 			= t.Id
	,JobTypeName		= t.name
	,JobTypeSystemId	= t.system_id
--select r.JobTypeDescription, t.* 
from 
	dbo.JobTimeReport r
	left join dbo.JobType t on t.description = iif(r.JobTypeDescription = 'Miscellaneous Pumping', 'Misc. Pumping – Primary', r.JobTypeDescription) 
;	


IF OBJECT_ID(N'dbo.JobDesignPumpingJobSection', N'V') IS NOT NULL  
   DROP VIEW [dbo].[JobDesignPumpingJobSection];  
GO
CREATE VIEW [dbo].[JobDesignPumpingJobSection]
AS
select 
	cast(PPJS.ID as int) 				as ID,
	cast(0 as int) 						as entity_status,
	cast(PPJS.ROOT_ID as int) 			as owner_id,
	cast(null as [nvarchar](100)) 		as name,
	cast(null as [nvarchar](500)) 		as description,
	--cast(8 as int) 						as JobDurationOld,
	--cast(iif(IsNull(PPJS.NUM_OF_STAGES - 1, 0) = 0, IsNull(r.PrepDuration, 0) + IsNull(r.PumpingDuration, 0) + IsNull(r.PostJobDuration, 0), 8) as int) as JobDuration, -- just a test before PPJS.PUMPING_DURATION added to the table
	--cast(iif(IsNull(PPJS.PUMPING_DURATION, 0) = 0, IsNull(r.PrepDuration, 0) + IsNull(r.PumpingDuration, 0) + IsNull(r.PostJobDuration, 0), 8) as int) as JobDuration,
	cast(iif(IsNull(PPJS.PUMPING_DURATION, 0) = 0, IsNull(r.PrepDuration, 0) + IsNull(r.PumpingDuration, 0) + IsNull(r.PostJobDuration, 0), PPJS.PUMPING_DURATION) as int) as JobDuration,
	cast(isnull(PPJS.RISK_MATRIX, 0) as float) as RiskMatrix,
	--cast(1 as int) 						as PumperCount,
	cast(iif(IsNull(PPJS.PUMPER_COUNT, 0) = 0, 1, PPJS.PUMPER_COUNT) as int)	as PumperCount,
	PPJS.ROOT_ID 						as JobDesignid,
	cast(0 as int) 						as JobDesignSystemId,
	cast(null as [nvarchar](100)) 		as JobDesignName,
	cast(null as [nvarchar](500)) 		as JobDesignDescription,
	cast(PPJS.JD_JOB_TYPE_ID as int) 	as JobTypeid,
	cast(0 as int) 						as JobTypeSystemId,
	cast(null as [nvarchar](500))  		as JobTypeDescription,
	cast(PPJS.JD_JOB_TYPE_NAME as [nvarchar](500)) as JobTypeName
from 
	#TargetEservice6Db#.dbo.PRG_PUMPING_JOB_SECTIONS PPJS
	--left join dbo.JobTimeReport r on r.JobTypeid = cast(PPJS.JD_JOB_TYPE_ID as int) and r.PumperCount = cast(1 as int)
	left join dbo.JobTimeReport r on r.JobTypeid = cast(PPJS.JD_JOB_TYPE_ID as int) and r.PumperCount = cast(iif(IsNull(PPJS.PUMPER_COUNT, 0) = 0, 1, PPJS.PUMPER_COUNT) as int)
;
GO



USE #TargetSanjelDataDb#;

IF (EXISTS (SELECT 1 FROM sys.views WHERE name = 'UnitCount' AND TYPE = 'v')) 
    drop view UnitCount;
GO
CREATE TABLE [dbo].[UnitCount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[WorkDate] [datetime2](7) NULL,
	[ScmtCount] [int] NULL,
	[ScmsCount] [int] NULL,
	[UnitStatus] [int] NULL,
	[ServicePointName] [nvarchar](255) NULL,
	[ServicePointSystemId] [int] NULL,
	[ServicePointDescription] [nvarchar](255) NULL,
	[ServicePointid] [int] NULL
) ON [PRIMARY]
GO

IF (EXISTS (SELECT 1 FROM sys.views WHERE name = 'EstimateJob' AND TYPE = 'v')) 
    drop view EstimateJob;
GO
CREATE TABLE [dbo].[EstimateJob](
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
	[ClientCompanyShortName] [nvarchar](255) NULL,
	[ServicePointName] [nvarchar](255) NULL,
	[RigDescription] [nvarchar](255) NULL,
	[RigSystemId] [int] NULL,
	[ClientCompanyName] [nvarchar](255) NULL,
	[ClientCompanySystemId] [int] NULL,
	[PumperCount] [int] NULL,
	[JobDuration] [int] NULL,
	[JobTypeid] [int] NULL,
	[JobTypeSystemId] [int] NULL,
	[ProgramId] [nvarchar](255) NULL,
	[RiskMatrix] [float] NULL,
	[ClientCompanyDescription] [nvarchar](255) NULL,
	[ClientCompanyid] [int] NULL,
	[Rigid] [int] NULL,
	[JobDateTime] [datetime2](7) NULL,
	[JobTypeDescription] [nvarchar](255) NULL,
	[RigName] [nvarchar](255) NULL,
	[ServicePointDescription] [nvarchar](255) NULL,
	[PreJobTesting] [bit] NULL,
	[JobTypeName] [nvarchar](255) NULL,
	[GroupUid] nvarchar(255)
) ON [PRIMARY]
GO


IF OBJECT_ID(N'dbo.SanjelUser', N'V') IS NOT NULL  
   DROP VIEW [dbo].[SanjelUser];  
GO
CREATE VIEW dbo.[SanjelUser]
as
Select 
	u.id as [ID],
	 0 as [entity_status],
	 0 as [owner_id],
	 Name as [Name],
	 null as [description],
	 u.id as [system_id],
	 1 as [version],
	 0 as [modified_user_id],
	 null as [modified_user_name],
	 cast('2021-12-31 23:59:59.0000000' as datetime2) as [modified_datetime],
	 1 as [operation_type],
	 cast('2021-12-31 23:59:59.0000000' as datetime2) as [effective_start_datetime],
	 cast('9999-12-31 23:59:59.0000000' as datetime2) as [effective_end_datetime],
	 HASHED_PASSWORD as [HashedPassword],
	 u.DISTRICT_ID as [ServicePointid],
	 0 as [ServicePointSystemid],
	 DISTRICT_NAME as [ServicePointName],
	 null as [ServicePointDescription],
	 EMP_ID as [Employeeid],
	 0 as EmployeeSystemid,
	 EMP_NAME as [EmployeeName],
	 null as [EmployeeDescription],
	 name+'@sanjel.com' as [EmailAddress]
from #TargetEservice6Db#.dbo.SD_USERS U
left join #TargetEservice6Db#.dbo.EMPLOYEES EMP on EMP_ID = emp.id
where
	EMP.[EFFECTIVE_END_DATE_TIME] > getdate()
	or name in ('gwong', 'mscoulding', 'vhorobets', 'cearl', 'skaleru', 'cchan')
; 
-- Enable following condition in PRD
--where EMP.[EFFECTIVE_END_DATE_TIME] > getdate();
GO

IF OBJECT_ID(N'dbo.UserPermission', N'V') IS NOT NULL  
   DROP VIEW [dbo].[UserPermission];  
GO
CREATE VIEW dbo.UserPermission
as
Select 
	id as [ID],
	 0 as [entity_status],
	 0 as [owner_id],
	 Name as [Name],
	 null as [description],
	 id as [system_id],
	 1 as [version],
	 0 as [modified_user_id],
	 null as [modified_user_name],
	 cast('2021-12-31 23:59:59.0000000' as datetime2) as [modified_datetime],
	 1 as [operation_type],
	 cast('2021-12-31 23:59:59.0000000' as datetime2) as [effective_start_datetime],
	 cast('9999-12-31 23:59:59.0000000' as datetime2) as [effective_end_datetime]
from #TargetEservice6Db#.dbo.SD_PERMISSIONS;
GO 

IF OBJECT_ID(N'dbo.UserGroup', N'V') IS NOT NULL  
   DROP VIEW [dbo].[UserGroup];  
GO
CREATE VIEW dbo.UserGroup
as
Select 
	 id as [ID],
	 0 as [entity_status],
	 0 as [owner_id],
	 Name as [NAME],
	 null as [description],
	 id as [system_id],
	 1 as [version],
	 0 as [modified_user_id],
	 null as [modified_user_name],
	 cast('2021-12-31 23:59:59.0000000' as datetime2) as [modified_datetime],
	 1 as [operation_type],
	 cast('2021-12-31 23:59:59.0000000' as datetime2) as [effective_start_datetime],
	 cast('9999-12-31 23:59:59.0000000' as datetime2) as [effective_end_datetime]
from #TargetEservice6Db#.dbo.SD_PERMISSIONS;
GO

IF OBJECT_ID(N'dbo.UserGroupSanjelUser', N'V') IS NOT NULL  
   DROP VIEW [dbo].[UserGroupSanjelUser];  
GO
Create View [dbo].[UserGroupSanjelUser]
AS
 Select cast((ROW_NUMBER() over (Order by GU.User_ID, GU.GROUP_ID)) as int) as ID,
 	 0 as [entity_status],
	 0 as [owner_id],
	 null as [Name],
	 null as [description],
	cast((ROW_NUMBER() over (Order by GU.User_ID, GU.GROUP_ID)) as int) as system_id,
	 1 as [version],
	 0 as [modified_user_id],
	 null as [modified_user_name],
	 cast('2021-12-31 23:59:59.0000000' as datetime2) as [modified_datetime],
	 1 as [operation_type],
	 cast('2021-12-31 23:59:59.0000000' as datetime2) as [effective_start_datetime],
	 cast('9999-12-31 23:59:59.0000000' as datetime2) as [effective_end_datetime],
		  U.ID as [SanjelUserid],
		  0 as [SanjelUserSystemid],
		  U.NAME as [SanjelUserName], null as [SanjelUserDescription],
		  G.ID as [UserGroupid],
		  0 as [UserGroupSystemid],
		  G.NAME as [UserGroupName],
		  null as [UserGroupDescription]
		  from #TargetEservice6Db#.dbo.SD_GROUP_USERS GU
		  Join SanjelUser U on GU.USER_ID = U.id
		  join #TargetEservice6Db#.dbo.SD_GROUPS G on GU.GROUP_ID = G.ID;
GO

IF OBJECT_ID(N'dbo.UserGroupUserPermission', N'V') IS NOT NULL  
   DROP VIEW [dbo].[UserGroupUserPermission];  
GO
CREATE VIEW dbo.[UserGroupUserPermission] AS
Select
	cast((ROW_NUMBER() over (Order by GU.PERMISSION_ID, GU.GROUP_ID)) as int) as ID,
 	 0 as [entity_status],
	 0 as [owner_id],
	 null as [Name],
	 null as [description],
	cast((ROW_NUMBER() over (Order by GU.PERMISSION_ID, GU.GROUP_ID)) as int) as system_id,
	 1 as [version],
	 0 as [modified_user_id],
	 null as [modified_user_name],
	 cast(Getdate() as datetime2) as [modified_datetime],
	 1 as [operation_type],
	 cast(Getdate() as datetime2) as [effective_start_datetime],
	 cast('9999-12-31 23:59:59.0000000' as datetime2) as [effective_end_datetime],
		  G.ID as [UserGroupid],
		  0 as [UserGroupSystemid],
		  G.NAME as [UserGroupName],
		  null as [UserGroupDescription],
		  u.ID as [UserPermissionid],
		  0 as [UserPermissionSystemid],
		  u.NAME as [UserPermissionName],
		  null as [UserPermissionDescription]
		  from #TargetEservice6Db#.dbo.SD_GROUP_PERMISSIONS GU
		  Join #TargetEservice6Db#.dbo.SD_PERMISSIONS U on GU.PERMISSION_ID = U.id
		  join #TargetEservice6Db#.dbo.SD_GROUPS G on GU.GROUP_ID = G.ID;
GO

CREATE TABLE [Crew] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2,[Notes] nvarchar(255),[Typeid] int,[TypeName] [nvarchar](100) NULL,[TypeDescription] [nvarchar](500) NULL);
GO

CREATE TABLE [JobBase] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2,[ClientCompanyShortName] nvarchar(255),[JobDateTime] datetime,[JobDuration] int,[PreJobTesting] bit,[ProgramId] nvarchar(255),[PumperCount] int,[RiskMatrix] float,[ClientCompanyid] int,[ClientCompanyName] [nvarchar](100) NULL,[ClientCompanyDescription] [nvarchar](500) NULL,[ClientCompanySystemId] [int] Not NULL,[JobTypeid] int,[JobTypeName] [nvarchar](100) NULL,[JobTypeDescription] [nvarchar](500) NULL,[JobTypeSystemId] [int] Not NULL,[Rigid] int,[RigName] [nvarchar](100) NULL,[RigDescription] [nvarchar](500) NULL,[RigSystemId] [int] Not NULL,[ServicePointid] int,[ServicePointName] [nvarchar](100) NULL,[ServicePointDescription] [nvarchar](500) NULL,[ServicePointSystemId] [int] Not NULL);
Go

CREATE TABLE [Schedule] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2,[EndTime] datetime,[StartTime] datetime);
GO

CREATE TABLE [VesselCount] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[ServicePointid] int,[ServicePointName] [nvarchar](100) NULL,[ServicePointDescription] [nvarchar](500) NULL,[ServicePointSystemId] [int] Not NULL,[BtrainCount] int,[BulkerCount] int,[WorkDate] datetime,[UnitStatus] int);
Go





/* This is for support environment only to keep the WFR_ tables and update the schema to meet new model definition.
use [#TargetSanjelDataDb#]
ALTER TABLE [wfr_AssignedPlan] ADD [AssignedPlanStatusName] [nvarchar](100) NULL;
ALTER TABLE [wfr_AssignedPlan] ADD [AssignedPlanStatusDescription] [nvarchar](500) NULL;

ALTER TABLE [wfr_AssignedPlanItem] ADD [AssignedPlanItemStatusDescription] [nvarchar](500) NULL;
ALTER TABLE [wfr_AssignedPlanItem] ADD [AssignedPlanItemStatusName] [nvarchar](100) NULL;

--ALTER TABLE [wfr_AssignedPlanItem] ADD [AssignPlanItemStatusid] int NULL;
--ALTER TABLE [wfr_AssignedPlanItem] ADD [AssignPlanItemStatusDescription] [nvarchar](500) NULL;
--ALTER TABLE [wfr_AssignedPlanItem] ADD [AssignPlanItemStatusName] [nvarchar](100) NULL;

ALTER TABLE [wfr_PlanItem] ADD [PlanDescription] [nvarchar](500) NULL;
ALTER TABLE [wfr_PlanItem] ADD [PlanName] [nvarchar](100) NULL;

CREATE TABLE [wfr_PlanItemNote] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[CreatedOn] datetime,[DocumentLink] nvarchar(255),[DocumentName] nvarchar(255),[IsActive] bit,[CreatedByid] int,[CreatedByName] [nvarchar](100) NULL,[CreatedByDescription] [nvarchar](500) NULL,[CreatedBySystemId] [int] Not NULL);
*/
