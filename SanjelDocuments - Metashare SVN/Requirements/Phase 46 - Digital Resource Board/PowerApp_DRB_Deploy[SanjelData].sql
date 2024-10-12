
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--!!!!!!!!!!!!!!! Make sure we are connected to [Sanjel23\App] !!!!!!!!!!!!!!!
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

-- Script is configured to restore and configure the following databases  by default:   
-- [Sanjel23\App].SanajelData
-- [Sanjel23\App].eservice6


-------------- Restore [Sanjel23\App].SanjelData DB from the latest daily Prod

USE [master];
ALTER DATABASE SanjelData SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

BEGIN TRY

       EXECUTE [dbo].[RestoreDbFromLastBackup ] 
          @srcBackupPath = N'\\Sanjel25\First4_Backups\SANJEL25.APP\Daily\'
          --@srcBackupPath = N'\\sanjel20\dbbackups$\MSSQL\SANJEL25\SANJEL25.APP\Daily\'
         ,@srcDbName = 'SanjelData'
         ,@srcLogicalDbName = 'MasterDataManagement'
         ,@srcLogicalLogName = 'MasterDataManagement_log'
         ,@destDbMoveToPath = N'D:\Program Files\Microsoft SQL Server\MSSQL12.APP\MSSQL\DATA\'
         ,@destDbName = 'SanjelData'
         ,@destLogicalDbName = 'SanjelData'
         ,@destLogicalLogName = 'SanjelData_log'
       ;

       USE [SanjelData];
       --EXEC sp_change_users_login 'Report';
       EXEC sp_change_users_login 'Auto_Fix', 'eservice6';
       EXEC sp_change_users_login 'Auto_Fix', 'LabTestingAdmin';

END TRY
BEGIN CATCH
END CATCH

USE [master];
ALTER DATABASE SanjelData SET MULTI_USER;





-------------- Restore [Sanjel23\App].eservice6 DB from latest daily Prod

USE [master];
ALTER DATABASE eservice6 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

BEGIN TRY

       EXECUTE [dbo].[RestoreDbFromLastBackup] 
          @srcBackupPath = N'\\Sanjel25\First4_Backups\SANJEL25.APP\Daily\'
          --@srcBackupPath = N'\\sanjel20\dbbackups$\MSSQL\SANJEL25\SANJEL25.APP\Daily\'
         ,@srcDbName = 'eservice6'
         ,@srcLogicalDbName = 'eservice6'
         ,@srcLogicalLogName = 'eservice6_log'
         ,@destDbMoveToPath = N'D:\Program Files\Microsoft SQL Server\MSSQL12.APP\MSSQL\DATA\'
         ,@destDbName = 'eservice6'
         ,@destLogicalDbName = 'eservice6'
         ,@destLogicalLogName = 'eservice6_log'
       ;
       USE [eservice6];
       --EXEC sp_change_users_login 'Report';
       EXEC sp_change_users_login 'Auto_Fix', 'FIRST4DB_MON';
       EXEC sp_change_users_login 'Auto_Fix', 'eservice6';
       EXEC sp_change_users_login 'Auto_Fix', 'LabTestingAdmin';

END TRY
BEGIN CATCH
END CATCH

USE [master];
ALTER DATABASE eservice6 SET MULTI_USER;

-------------- Restore [Sanjel23\App].eservice6 DB from latest daily Prod End





-- Grant Arcurve devs RigBoard access
USE [eservice6]

EXEC [dbo].[SP_MANAGE_SD_USERS] 'gwong', '1000481|1000501|1000502|1000503', 62, 0, 0;
EXEC [dbo].[SP_MANAGE_SD_USERS] 'mscoulding', '1000481|1000501|1000502|1000503', 62, 0, 0;
EXEC [dbo].[SP_MANAGE_SD_USERS] 'vhorobets', '1000481|1000501|1000502|1000503', 62, 0, 0;
EXEC [dbo].[SP_MANAGE_SD_USERS] 'cearl', '1000481|1000501|1000502|1000503', 62, 0, 0;





-- Create UnitLocation view

USE [SanjelData];

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
                ,'InThink'          src
            FROM [Sanjel27\DW].SESI_DW.dbo.InThink_LastLocations
            union all
            SELECT 
                UnitNumber
                ,Latitude
                ,Longitude
                ,VehicleID
                ,LastRecordingTime
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
        ,NULL                       modified_user_name
        ,l.LastRecordingTime        modified_datetime
        ,1                          operation_type
        ,l.LastRecordingTime        effective_start_datetime
        ,cast('9999-12-31 23:59:59.0000000' as datetime2) effective_end_datetime
        ,0                          entity_status
        ,0                          owner_id
        ,NULL                       [name]
        ,l.src                      [description]
        ,u.id                       UnitId
        ,l.Latitude
        ,l.Longitude
        ,l.UnitNumber               
    FROM 
        merged l
        left join [dbo].[TruckUnit] u on u.UnitNumber collate Latin1_General_CI_AS = l.UnitNumber and u.[effective_end_datetime] > getdate()
    where 
        l.rn = 1   
    ;
GO



-- Configure Arcurve DRB permissions

--Before executing script
--      1. Make sure the proper DB is used (USE <DbName>)
--      2. Set up variable as needed
--      3. Configure particular objects (tables / views) access using script example below under
--            the '--# To be copied, uncommented, adjusted and repeated for each object access is needed to #' section
--      4. Script is safe to execute multiple times having step 2 altered as needed

USE [SanjelData]
GO

BEGIN
    declare 
        @db_role_name as nvarchar(max) = 'App_drb_Role'
        ,@user_name as nvarchar(max) = 'App_drb_User'
        ,@user_pwrd as nvarchar(max) = N'sanjel'
        ,@sql nvarchar(max)
        ;

    --Create database role
    IF DATABASE_PRINCIPAL_ID(@db_role_name) IS NULL
        BEGIN
            set @sql = 'create role ' + @db_role_name;
            EXEC (@sql);
        END;

    --Create server login
    IF NOT EXISTS (select name from master.sys.server_principals WHERE name = @user_name)
    BEGIN
        set @sql = 'create login ' + @user_name + ' with password = ''' + @user_pwrd + '''' + ', CHECK_EXPIRATION = OFF, CHECK_POLICY = OFF';
        exec (@sql);
    END;

    --Create database user
    IF NOT EXISTS (select name from sys.database_principals where name = @user_name)
        BEGIN
            --CREATE USER Mary5 FOR LOGIN [Contoso\Mary5] ;  
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


    --Might be used to revoke a particular tables/views access 
    --REVOKE UPDATE ON [ObjectName] FROM [DatabaseRole]
    --REVOKE UPDATE ON Employee FROM App_Test_Role

END;

-- Update datebase for eServiceOnline and DRB changes


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

ALTER TABLE [RigJob] ADD [Latitude] [decimal](18, 6) NULL;
ALTER TABLE [RigJob] ADD [Longitude] [decimal](18, 6) NULL;
GO
update rigjob set Latitude = 0, Longitude = 0 where Latitude is null;
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
from eservice6.dbo.programs PRG inner join
eservice6.dbo.PRG_COMPANY_INFO_SCTNS PCIS on PCIS.ROOT_ID = PRG.id
inner join eservice6.dbo.COMPANIES COM on COM.Id = PCIS.COMPANY_ID
where PCIS.IS_CLIENT = 1
GO


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
from eservice6.dbo.PRG_PUMPING_JOB_SECTIONS PPJS;
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

ALTER TABLE [RigJob] ADD [PumperCount]  [int] NULL;
ALTER TABLE [RigJob] ADD [JobDuration]  [int] NULL;
ALTER TABLE [RigJob] ADD [PreJobTesting]  [bit] NULL;
Go

IF OBJECT_ID(N'dbo.SanjelUser', N'V') IS NOT NULL  
   DROP VIEW [dbo].[SanjelUser];  
GO
IF OBJECT_ID(N'dbo.UserGroup', N'V') IS NOT NULL  
   DROP VIEW [dbo].[UserGroup];  
GO
IF OBJECT_ID(N'dbo.UserGroupSanjelUser', N'V') IS NOT NULL  
   DROP VIEW [dbo].[UserGroupSanjelUser];  
GO
IF OBJECT_ID(N'dbo.UserGroupUserPermission', N'V') IS NOT NULL  
   DROP VIEW [dbo].[UserGroupUserPermission];  
GO
IF OBJECT_ID(N'dbo.UserPermission', N'V') IS NOT NULL  
   DROP VIEW [dbo].[UserPermission];  
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
from eservice6.dbo.SD_USERS U
join eservice6.dbo.EMPLOYEES EMP on EMP_ID = emp.id;
-- Enable following condition in PRD
--where EMP.[EFFECTIVE_END_DATE_TIME] > getdate();
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
from eservice6.dbo.SD_PERMISSIONS;
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
from eservice6.dbo.SD_PERMISSIONS;
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
		  from eservice6.dbo.SD_GROUP_USERS GU
		  Join SanjelUser U on GU.USER_ID = U.id
		  join eservice6.dbo.SD_GROUPS G on GU.GROUP_ID = G.ID;
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
		  from eservice6.dbo.SD_GROUP_PERMISSIONS GU
		  Join eservice6.dbo.SD_PERMISSIONS U on GU.PERMISSION_ID = U.id
		  join eservice6.dbo.SD_GROUPS G on GU.GROUP_ID = G.ID;
GO

CREATE TABLE [Crew] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2,[Notes] nvarchar(255),[Typeid] int,[TypeName] [nvarchar](100) NULL,[TypeDescription] [nvarchar](500) NULL);
GO

CREATE TABLE [JobBase] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2,[ClientCompanyShortName] nvarchar(255),[JobDateTime] datetime,[JobDuration] int,[PreJobTesting] bit,[ProgramId] nvarchar(255),[PumperCount] int,[RiskMatrix] float,[ClientCompanyid] int,[ClientCompanyName] [nvarchar](100) NULL,[ClientCompanyDescription] [nvarchar](500) NULL,[ClientCompanySystemId] [int] Not NULL,[JobTypeid] int,[JobTypeName] [nvarchar](100) NULL,[JobTypeDescription] [nvarchar](500) NULL,[JobTypeSystemId] [int] Not NULL,[Rigid] int,[RigName] [nvarchar](100) NULL,[RigDescription] [nvarchar](500) NULL,[RigSystemId] [int] Not NULL,[ServicePointid] int,[ServicePointName] [nvarchar](100) NULL,[ServicePointDescription] [nvarchar](500) NULL,[ServicePointSystemId] [int] Not NULL);
Go

CREATE TABLE [Schedule] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2,[EndTime] datetime,[StartTime] datetime);
GO


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

CREATE TABLE [VesselCount] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[ServicePointid] int,[ServicePointName] [nvarchar](100) NULL,[ServicePointDescription] [nvarchar](500) NULL,[ServicePointSystemId] [int] Not NULL,[BtrainCount] int,[BulkerCount] int,[WorkDate] datetime,[UnitStatus] int);

