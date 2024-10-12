
USE SanjelDataDRB;


IF OBJECT_ID('CreateSynonymsForAllExternalViewsAndTables') IS not NULL
    DROP PROCEDURE [dbo].[CreateSynonymsForAllExternalViewsAndTables];
GO

CREATE PROCEDURE [dbo].[CreateSynonymsForAllExternalViewsAndTables]        
    @ExternalServerName nvarchar(max),
    @ExternalDbName nvarchar(max),
    @SynPrefix nvarchar(max),
    @DeleteOnlyAllMatchingSynonyms int = 0 
        
    AS         
    begin
        begin try 
            declare @IterationCnt int;
            declare @RowCnt int = 0;
            declare @Objectname nvarchar(max);
            declare @qry nvarchar(max);
        
            set @IterationCnt = 1;
            select @RowCnt = COUNT(0) from sys.synonyms where name like @SynPrefix + '%';
            while @IterationCnt <= @RowCnt
                begin
                    select @Objectname = min(name) from sys.synonyms where name like @SynPrefix + '%';
                    Exec('drop synonym ' + @Objectname)
                    set @IterationCnt = @IterationCnt + 1;
                end;
        
            if(OBJECT_ID('tempdb..##ToSyn') is not null) drop table ##ToSyn;
            
            set @qry = 'select * into ##ToSyn from ' + @ExternalServerName + iif(@ExternalServerName = '', '', '.') + @ExternalDbName + '.INFORMATION_SCHEMA.TABLES';
            exec (@qry);

            set @IterationCnt = 1;
            select @RowCnt = COUNT(0) from ##ToSyn;
    
            while @IterationCnt <= @RowCnt
                begin
                    with v as ( select *, row_number() over (order by TABLE_NAME) rn from ##ToSyn) 
                    select @Objectname = min(TABLE_NAME) from v where rn = @IterationCnt;
                    
                    set @IterationCnt = @IterationCnt + 1;
                
                    if OBJECT_ID(@SynPrefix + @Objectname) is not null Exec('drop synonym ' + @SynPrefix + @Objectname);
                    set @qry ='create synonym ' + @SynPrefix + @Objectname + ' for ' + @ExternalServerName + iif(@ExternalServerName = '', '', '.') + @ExternalDbName + '.dbo.' + @Objectname;
                    if @DeleteOnlyAllMatchingSynonyms <> 1
                        exec (@qry);
                end;

            if(OBJECT_ID('tempdb..##ToSyn') is not null) drop table ##ToSyn;

        end try
    
        begin catch
            declare @error int;
            declare @message varchar(4000);
            declare @xstate int;
        
            select @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
            raiserror ('CreateSynonymsForAllExternalViewsAndTables : %s', 16, 1, @message) ;
            return;
        end catch 
    end;
GO

exec CreateSynonymsForAllExternalViewsAndTables N'', N'eService6srd', N'SYN_ES_', 0;
--exec CreateSynonymsForAllExternalViewsAndTables N'', N'SanjelData', N'SYN_SD_', 0;
--exec CreateSynonymsForAllExternalViewsAndTables N'[Sanjel27\DW]', N'SESI_PLC', N'SYN_PLC_', 0;
exec CreateSynonymsForAllExternalViewsAndTables N'[Sanjel27\DW]', N'SESI_DW', N'SYN_DW_', 0;
exec CreateSynonymsForAllExternalViewsAndTables N'[Sanjel27\DW]', N'SESI_MasterDB', N'SYN_MD_', 0;
--exec CreateSynonymsForAllExternalViewsAndTables N'[Sanjel27\DW]', N'SESI_Staging', N'SYN_STG_', 0;
--exec CreateSynonymsForAllExternalViewsAndTables N'[Sanjel27\DW]', N'SBS_VIEWS', N'SYN_SBS_', 0;



