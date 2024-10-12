--SanjelData update
    --  !!!!!!!!!!!!!!!!!!!!! Update     
USE SanjelData;
    --  !!!!!!!!!!!!!!!!!!!!! Update     
    
IF OBJECT_ID('CreateExternalObjectSynonym') IS not NULL
    DROP PROCEDURE [dbo].[CreateExternalObjectSynonym];
GO
CREATE PROCEDURE [dbo].[CreateExternalObjectSynonym]        
    @ObjectName varchar(255),
    @ServerName varchar(255),
    @DbName varchar(255),
    @SynPrefix varchar(255)
AS         
begin
    begin try 
        Declare @qry varchar(255);
        IF OBJECT_ID(@SynPrefix + @Objectname) IS NOT NULL Exec('drop synonym ' + @SynPrefix + @Objectname);
        set @qry ='create synonym ' + @SynPrefix + @Objectname + ' for ' + @ServerName + iif(@ServerName = '', '', '.') + @DbName + '.dbo.' + @Objectname;
        exec (@qry);
    end try

    begin catch
        declare @error int
        declare @message varchar(4000)
        declare @xstate int;
        select @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
        raiserror ('CreateExternalObjectSynonym : %s', 16, 1, @message) ;
        return;
    end catch    
end
GO


BEGIN
    Declare @ExternalServerName varchar(255);
    Declare @ExternalDbName varchar(255);
    Declare @SynPrefix varchar(255);


    --  !!!!!!!!!!!!!!!!!!!!! Update     
    USE SanjelData;
    Set @ExternalDbName ='eservice6';
    Set @SynPrefix = 'SYN_ES_';
    Set @ExternalServerName ='';
    --  !!!!!!!!!!!!!!!!!!!!! Update     

    exec [dbo].[CreateExternalObjectSynonym] 'EMPLOYEES', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'SD_USERS', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'SD_PERMISSIONS', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'SD_GROUPS', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'SD_GROUP_USERS', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'SD_GROUP_PERMISSIONS', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'SD_PERMISSIONS', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'SD_SECURED_APPLICATIONS', @ExternalServerName, @ExternalDbName, @SynPrefix;

    exec [dbo].[CreateExternalObjectSynonym] 'PROGRAMS', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'PRG_COMPANY_INFO_SCTNS', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'COMPANIES', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'PRG_PUMPING_JOB_SECTIONS', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'CALLSHEET_HEADERS', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'PUMP_BLEND_SCTNS', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'PUMP_BLEND_BLEND_ADDTV_SCTNS', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'PRG_BLEND_SCTNS', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'PRG_BLEND_BLEND_ADDTV_SCTNS', @ExternalServerName, @ExternalDbName, @SynPrefix;


    --  !!!!!!!!!!!!!!!!!!!!! Update     
    Set @SynPrefix = 'SYN_DW_';
    Set @ExternalDbName ='SESI_DW';
    Set @ExternalServerName =N'[SANJEL27\DW]';
    --  !!!!!!!!!!!!!!!!!!!!! Update     

    exec [dbo].[CreateExternalObjectSynonym] 'Lms_CoursesCategories', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'Lms_Certificates_View', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'Lms_Categories', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'AdpEmployees_Current', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'Lms_Courses', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'Dim_WellLocations', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'PurchasePriceForEService', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'Motive_LastLocations', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'InThink_LastLocations', @ExternalServerName, @ExternalDbName, @SynPrefix;


    --  !!!!!!!!!!!!!!!!!!!!! Update     
    Set @SynPrefix = 'SYN_MD_';
    Set @ExternalDbName ='SESI_MasterDB';
    Set @ExternalServerName = N'[SANJEL27\DW]';
    --  !!!!!!!!!!!!!!!!!!!!! Update     

    exec [dbo].[CreateExternalObjectSynonym] 'Districts', @ExternalServerName, @ExternalDbName, @SynPrefix;

END;

--eService6 update
    --  !!!!!!!!!!!!!!!!!!!!! Update     
USE eservice6;
    --  !!!!!!!!!!!!!!!!!!!!! Update     
    
IF OBJECT_ID('CreateExternalObjectSynonym') IS not NULL
    DROP PROCEDURE [dbo].[CreateExternalObjectSynonym];
GO
CREATE PROCEDURE [dbo].[CreateExternalObjectSynonym]        
    @ObjectName varchar(255),
    @ServerName varchar(255),
    @DbName varchar(255),
    @SynPrefix varchar(255)
AS         
begin
    begin try 
        Declare @qry varchar(255);
        IF OBJECT_ID(@SynPrefix + @Objectname) IS NOT NULL Exec('drop synonym ' + @SynPrefix + @Objectname);
        set @qry ='create synonym ' + @SynPrefix + @Objectname + ' for ' + @ServerName + iif(@ServerName = '', '', '.') + @DbName + '.dbo.' + @Objectname;
        exec (@qry);
    end try

    begin catch
        declare @error int
        declare @message varchar(4000)
        declare @xstate int;
        select @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
        raiserror ('CreateExternalObjectSynonym : %s', 16, 1, @message) ;
        return;
    end catch    
end
GO

BEGIN
    Declare @ExternalServerName varchar(255);
    Declare @ExternalDbName varchar(255);
    Declare @SynPrefix varchar(255);

    --  !!!!!!!!!!!!!!!!!!!!! Update     
    USE eservice6;
    Set @SynPrefix = 'SYN_SD_';
    Set @ExternalDbName ='SanjelData';
    Set @ExternalServerName ='';
    --  !!!!!!!!!!!!!!!!!!!!! Update     

    exec [dbo].[CreateExternalObjectSynonym] 'BinType', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'Bin', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'BlendChemical', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'BlendRecipe', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'BlendChemicalSection', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'BonusPosition', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'ClientConsultant', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'ClientCompany', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'ContractorCompany', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'Country', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'DrillingCompany', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'Employee', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'JobType', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'JobRole', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'Product', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'ProvinceOrState', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'Rig', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'SanjelCompany', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'ServicePoint', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'TruckUnit', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'PlugLoadingHeadSpecialty', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'PlugManufacture', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'PlugLoadingHeadManufacture', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'QualityObservationType', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'PotentialSeverity', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'PerformanceMetric', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'IncidentType', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'SeverityMatrixtype', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'BlendFluidType', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'AdditiveType', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'UnitSubType', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'UnitMainType', @ExternalServerName, @ExternalDbName, @SynPrefix;
    exec [dbo].[CreateExternalObjectSynonym] 'WorkType', @ExternalServerName, @ExternalDbName, @SynPrefix;


    --  !!!!!!!!!!!!!!!!!!!!! Update     
    Set @SynPrefix = 'SYN_PLC_';
    Set @ExternalDbName ='SESI_PLC';
    Set @ExternalServerName ='[SANJEL27\DW]';
    --  !!!!!!!!!!!!!!!!!!!!! Update     

    exec [dbo].[CreateExternalObjectSynonym] 'SCM_PLC_LOG', @ExternalServerName, @ExternalDbName, @SynPrefix;

END;


SELECT 
    [Scehma] = schema_name(o.schema_id)
    , o.Name
    , o.type 
    , m.definition + NCHAR(13) + NCHAR(10) Def
FROM 
    sys.sql_modules m
    INNER JOIN sys.objects o ON o.object_id = m.object_id
WHERE
    1=1
    --and o.type = 'V'
    and m.definition like '%eservice6%'
order by 
    2
;

