Database Script for DRB deployment



These scripts need to run for production release and dev databases' refresh



```sql
USE [###SanjelData###]
GO

EXEC sp_rename 'dbo.SalesProject.Status','SalesProjectStatus','COLUMN';
GO
    
/****** Object:  Trigger [TR_SalesProject_StatusChange]    Script Date: 10/18/2023 6:05:28 PM ******/
DROP TRIGGER [dbo].[TR_SalesProject_StatusChange]
GO

/****** Object:  Trigger [dbo].[TR_SalesProject_StatusChange]    Script Date: 10/18/2023 6:05:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[TR_SalesProject_StatusChange] ON [dbo].[SalesProject]
        AFTER INSERT --, UPDATE, DELETE
    AS
        BEGIN
                
            --Process updated records
            INSERT INTO SalesProjectStatusHistory (
                [SalesProjectid],
                [SalesProjectName],
                [SalesProjectDescription],
                [IsDeleted],
                [Status],
                [TimeStamp]
            )
            SELECT
                i.[id],
                i.[name],
                i.[description],
                i.entity_status,
                i.SalesProjectStatus,
                GetDate()
            FROM 
                Inserted i 
            WHERE 
                i.SalesProjectStatus not in (
                        SELECT TOP 1 h.[Status] 
                        FROM SalesProjectStatusHistory h 
                        WHERE h.SalesProjectid = i.Id
                        ORDER BY h.[TimeStamp] DESC
                )
                     or (i.entity_status = 1)
            ;
        END;
GO

ALTER TABLE [dbo].[SalesProject] ENABLE TRIGGER [TR_SalesProject_StatusChange]
GO
    
    ALTER VIEW [dbo].[SalesProjectChangeReport] as
    with 
    cutoff as
    (
        select PrevReportingDT = max(ProcessedTS), CurrReportingDT = getdate() from SYN_STG_SalesProjectChangeReportingLog where SalesProjectId = 0
    )
    --,jobTypes as (select * from JobType where effective_end_datetime > getdate())
    ,empl as 
    (
        select * from (select id, WorkEmail, row_number() over (partition by Id order by version desc) rn from dbo.employee) a where a.rn = 1 -- where Id = 12283
    )
    ,rigs as 
    (
        select * from dbo.Rig 
    )
    ,programs AS 
    (
        select distinct
            p.id
            ,p.program_id 
            ,p.revision 
            --,ps.jd_job_type_id 
            --,jt.servicelineid 
            ,max(jt.SbsPrimaryServiceLineName) over (partition by p.id, p.revision order by jt.SbsPrimaryServiceLineName desc) ServiceLine  
        from 
            syn_es_prg_pumping_job_sections ps 
            join syn_es_programs p on ps.root_id  = p.id
            left join JobType jt on jt.id = ps.jd_job_type_id and jt.effective_end_datetime > getdate()
        --order by p.id desc        
    )
    ,latest_SpecialtyProduct as
    (
        SELECT a.SalesProjectid
               ,LEFT(a.ProductNames,Len(a.ProductNames)-1) SpecialityProductNames
        FROM
            (
                SELECT DISTINCT SP2.SalesProjectid, 
                    (
                        SELECT SP1.ProductName + '; ' AS [text()]
                        FROM dbo.SalesSpecialtyProduct SP1
                        WHERE SP1.SalesProjectid = SP2.SalesProjectid
                        ORDER BY SP1.SalesProjectid, SP1.ProductName, SP1.Id
                        FOR XML PATH (''), TYPE
                    ).value('text()[1]','nvarchar(max)') ProductNames
                FROM dbo.SalesSpecialtyProduct SP2
                --where SalesProjectId > 28
            ) a
    )
    ,reported_SpecialtyProduct as 
    (
        select 
            SalesProjectId
            , LastSpecialtyProducts SpecialityProductNames 
        from
        (
            select *, row_number() over (partition by SalesProjectId order by ProcessedTS desc) rn 
            from SYN_STG_SalesProjectChangeReportingLog where IsNull(SalesProjectId, 0) <> 0
        ) a 
        where rn = 1
    )
    ,reported_SalesProject as 
    (
        select * from
        (
            SELECT
                p.id SalesProjectId
                , p.name
                --, p.Districtid
                , p.DistrictName
                --, p.ClientCompanyid
                , p.ClientCompanyName
                , p.Rigid
                , p.RigName
                --,case p.Status
                ,case p.SalesProjectStatus
                    when 0 then 'None'
                    when 1 then 'Bid'
                    when 2 then 'Lost'
                    when 3 then 'Second Call'
                    when 4 then 'Potential'
                    when 5 then 'Won'
                    when 6 then 'OngoingWork'
                    when 7 then 'Completed'
                    when 8 then 'Cancelled'
                    else 'Unknown'
                end ProjectStatus
                --, p.RigStatus
                --, p.ApprovalStatus
                , p.WellCount
                , p.StartTime
                , p.EndTime
                , p.SalesRepresentativeid
                , p.SalesRepresentativeName
                ,PrevReportingDT ReportedDateTime
                ,row_Number() over (partition by p.id order by p.modified_datetime desc) rn
            FROM
                dbo.SalesProject p CROSS APPLY cutoff
            where 
                p.modified_datetime <= PrevReportingDT
        ) a 
        where 
            rn = 1
            --and SalesProjectId not in (4)
    )
    ,latest_SalesProject as 
    (
        select * from
        (
            SELECT
                p.id SalesProjectId
                , p.name
                , p.DistrictName
                , p.ClientCompanyName
                , p.Rigid
                , p.RigName
                --,case p.Status
                ,case p.SalesProjectStatus
                    when 0 then 'None'
                    when 1 then 'Bid'
                    when 2 then 'Lost'
                    when 3 then 'Second Call'
                    when 4 then 'Potential'
                    when 5 then 'Won'
                    when 6 then 'OngoingWork'
                    when 7 then 'Completed'
                    when 8 then 'Cancelled'
                    else 'Unknown'
                end as ProjectStatus
                --, p.RigStatus
                --, p.ApprovalStatus
                , p.WellCount
                , p.StartTime
                , p.EndTime
                , p.SalesRepresentativeid
                , p.SalesRepresentativeName
                , e.WorkEmail SalesRepresentativeWorkEmail
                , p.ProgramNumber
                , p.ProgramRevision
                , p.RepresentativeProgramNumber
                , p.RepresentativeProgramRevision
                ,CurrReportingDT ReportedDateTime
                ,row_Number() over (partition by p.id order by p.modified_datetime desc) rn
                --,*
            FROM
                dbo.SalesProject p CROSS APPLY cutoff
                left join empl e on e.id = p.SalesRepresentativeid
            where 
                p.modified_datetime <= CurrReportingDT
        ) a 
        where 
            rn = 1
            --and SalesProjectId not in (4)
    )
    SELECT
        lsp.ReportedDateTime
        ,lsp.SalesProjectId
        , lsp.name SalesProjectName
        , lsp.DistrictName
        , lsp.ClientCompanyName
        --, lsp.Rigid
        --, lsp.RigName
        --, lsp.ProjectStatus
            --, lsp.RigStatus
            --, lsp.ApprovalStatus
        --, lsp.WellCount
        --, rsp.WellCount www
        , lsp.StartTime
        --, lsp.EndTime
        --, rssp.SpecialityProductNames sppp
        --, lsp.SalesRepresentativeid
        , lsp.RepresentativeProgramNumber
        , lsp.RepresentativeProgramRevision
        , lssp.SpecialityProductNames
        , iif (IsNull(pr.ServiceLine, 'No Service Line') = 'Cementing', 'Primary', IsNull(pr.ServiceLine, 'No Service Line')) ServiceLine
        , lsp.SalesRepresentativeName
        , lsp.SalesRepresentativeWorkEmail
        , iif(rsp.SalesProjectId is NULL, 'New', 'Upd')
            + ' | ' + lsp.ClientCompanyName + iif(IsNull(rsp.ClientCompanyName, '') <> IsNull(lsp.ClientCompanyName, ''), IsNull(' (' + rsp.ClientCompanyName + ')', ''), '')
            + ' | ' + lsp.DistrictName + iif(IsNull(rsp.DistrictName, '') <> IsNull(lsp.DistrictName, ''), IsNull(' (' + rsp.DistrictName + ')', ''), '')
            + ' | ' + lsp.RigName + iif(IsNull(rsp.RigName, '') <> IsNull(lsp.RigName, ''), IsNull(' (' + rsp.RigName + ')', ''), '')
            + iif(IsNull(rsp.ProjectStatus, '') <> IsNull(lsp.ProjectStatus, ''), ' | Status = ' + IsNull(lsp.ProjectStatus, '') + IsNull(' (' + rsp.ProjectStatus + ')', ''), '')
            + iif(IsNull(rsp.WellCount, -1) <> IsNull(lsp.WellCount, -1),  ' | Well Count = ' + IsNull(cast(lsp.WellCount as nvarchar(max)), '') + IsNull(' (' + cast(rsp.WellCount as nvarchar(max)) + ')', ''), '')
            + iif(IsNull(rsp.StartTime, '1999-12-31') <> IsNull(lsp.StartTime, '1999-12-31'), ' | Start Date = ' + IsNull(cast(lsp.StartTime as nvarchar(11)), '') + IsNull(' (' + cast(rsp.StartTime as nvarchar(11)) + ')', ''), '') 
            + iif(IsNull(rsp.EndTime, '1999-12-31') <> IsNull(lsp.EndTime, '1999-12-31'), ' | End Date = ' + IsNull(cast(lsp.EndTime as nvarchar(11)), '') + IsNull(' (' + cast(rsp.EndTime as nvarchar(11)) + ')', ''), '')
            + iif(rsp.SalesProjectId is NULL or IsNull(rssp.SpecialityProductNames, '') <> IsNull(lssp.SpecialityProductNames, ''), ' | Specialty Products = ' + IsNull(lssp.SpecialityProductNames, '') + iif(rsp.SalesProjectId is NULL, '', ' (' + IsNull(rssp.SpecialityProductNames, '') + ')'), '')
            ChangesMsg
    FROM
        latest_SalesProject                     lsp 
        left join reported_SalesProject         rsp on rsp.SalesProjectId = lsp.SalesProjectId 
        left join latest_SpecialtyProduct       lssp on lssp.SalesProjectid = lsp.SalesProjectId 
        left join reported_SpecialtyProduct  rssp on rssp.SalesProjectid = lsp.SalesProjectId 
        left join programs pr on pr.program_id = lsp.RepresentativeProgramNumber and pr.revision = lsp.RepresentativeProgramRevision
    WHERE   
        rsp.SalesProjectId is NULL 
        --or IsNull(rsp.name, '') <> IsNull(lsp.name, '')
        or IsNull(rsp.DistrictName, '') <> IsNull(lsp.DistrictName, '')
        or IsNull(rsp.ClientCompanyName, '') <> IsNull(lsp.ClientCompanyName, '')
        or IsNull(rsp.RigName, '') <> IsNull(lsp.RigName, '')
        or IsNull(rsp.ProjectStatus, -1) <> IsNull(lsp.ProjectStatus, -1)
        or IsNull(rsp.WellCount, -1) <> IsNull(lsp.WellCount, -1)
        or IsNull(rsp.StartTime, '1999-12-31') <> IsNull(lsp.StartTime, '1999-12-31')
        or IsNull(rsp.EndTime, '1999-12-31') <> IsNull(lsp.EndTime, '1999-12-31')
        or IsNull(rssp.SpecialityProductNames, '') <> IsNull(lssp.SpecialityProductNames, '')
        /*
    order by 
        ServiceLine
        ,SalesRepresentativeName
        ,Msg
        ,DistrictName
        ,ClientCompanyName
        ,StartTime
        */
    ;
    GO
    

DROP TABLE [dbo].[RotationTemplate]
GO
    
CREATE TABLE [RotationTemplate] ([id] [int] IDENTITY(1,1) NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,[ColorScheme] nvarchar(255),[OffDays] int,[RotationOrder] int,[StartDay] int,[WorkDays] int,[IsCombinedSchedule] bit,[RotationIndex] int,[CombinedScheduleOrder] int)
GO
    
SET IDENTITY_INSERT [dbo].[RotationTemplate] ON 
GO
INSERT [dbo].[RotationTemplate] ([id], [entity_status], [owner_id], [name], [description], [ColorScheme], [OffDays], [RotationOrder], [StartDay], [WorkDays], [IsCombinedSchedule], [RotationIndex], [CombinedScheduleOrder]) VALUES (1, 0, 0, N'15&6 Group 1', N'Work 15 Off 6 starts on Wednesday - Group 1', N'#8000FF', 6, 1, 3, 15, 0, 1, 0)
GO
INSERT [dbo].[RotationTemplate] ([id], [entity_status], [owner_id], [name], [description], [ColorScheme], [OffDays], [RotationOrder], [StartDay], [WorkDays], [IsCombinedSchedule], [RotationIndex], [CombinedScheduleOrder]) VALUES (2, 0, 0, N'15&6 Group 2', N'Work 15 Off 6 starts on Wednesday - Group 2', N'#80FF80', 6, 3, 3, 15, 0, 2, 0)
GO
INSERT [dbo].[RotationTemplate] ([id], [entity_status], [owner_id], [name], [description], [ColorScheme], [OffDays], [RotationOrder], [StartDay], [WorkDays], [IsCombinedSchedule], [RotationIndex], [CombinedScheduleOrder]) VALUES (3, 0, 0, N'15&6 Group 3', N'Work 15 Off 6 starts on Wednesday - Group 3', N'#FFFF80', 6, 2, 3, 15, 0, 3, 0)
GO
INSERT [dbo].[RotationTemplate] ([id], [entity_status], [owner_id], [name], [description], [ColorScheme], [OffDays], [RotationOrder], [StartDay], [WorkDays], [IsCombinedSchedule], [RotationIndex], [CombinedScheduleOrder]) VALUES (4, 0, 0, N'5&2 Group', N'Work 5 Off 2 starts on Monday', N'#000000', 2, 1, 1, 5, 0, 4, 0)
GO
INSERT [dbo].[RotationTemplate] ([id], [entity_status], [owner_id], [name], [description], [ColorScheme], [OffDays], [RotationOrder], [StartDay], [WorkDays], [IsCombinedSchedule], [RotationIndex], [CombinedScheduleOrder]) VALUES (5, 0, 0, N'10 & 4 Group 1', N'Work 10 Off 4 starts on Tuesday - Group 1', N'#7A306C', 4, 1, 2, 10, 0, 5, 0)
GO
INSERT [dbo].[RotationTemplate] ([id], [entity_status], [owner_id], [name], [description], [ColorScheme], [OffDays], [RotationOrder], [StartDay], [WorkDays], [IsCombinedSchedule], [RotationIndex], [CombinedScheduleOrder]) VALUES (6, 0, 0, N'10 & 4 Group 2', N'Work 10 Off 4 starts on Tuesday - Group 2', N'#8E8DBE', 4, 2, 2, 10, 0, 6, 0)
GO
INSERT [dbo].[RotationTemplate] ([id], [entity_status], [owner_id], [name], [description], [ColorScheme], [OffDays], [RotationOrder], [StartDay], [WorkDays], [IsCombinedSchedule], [RotationIndex], [CombinedScheduleOrder]) VALUES (7, 0, 0, N'21 & 14 Group 1', N'Work 21 Off 14 starts on Wednesday - Group 1', N'#BEE9E8', 4, 1, 3, 21, 0, 7, 0)
GO
INSERT [dbo].[RotationTemplate] ([id], [entity_status], [owner_id], [name], [description], [ColorScheme], [OffDays], [RotationOrder], [StartDay], [WorkDays], [IsCombinedSchedule], [RotationIndex], [CombinedScheduleOrder]) VALUES (8, 0, 0, N'21 & 14 Group 2', N'Work 21 Off 14 starts on Wednesday - Group 2', N'#62B6CB', 14, 2, 3, 21, 0, 8, 0)
GO
INSERT [dbo].[RotationTemplate] ([id], [entity_status], [owner_id], [name], [description], [ColorScheme], [OffDays], [RotationOrder], [StartDay], [WorkDays], [IsCombinedSchedule], [RotationIndex], [CombinedScheduleOrder]) VALUES (9, 0, 0, N'21 & 14 Group 3', N'Work 21 Off 14 starts on Wednesday - Group 3', N'#1B4965', 14, 3, 3, 21, 0, 9, 0)
GO
INSERT [dbo].[RotationTemplate] ([id], [entity_status], [owner_id], [name], [description], [ColorScheme], [OffDays], [RotationOrder], [StartDay], [WorkDays], [IsCombinedSchedule], [RotationIndex], [CombinedScheduleOrder]) VALUES (10, 0, 0, N'21 & 14 Group 4', N'Work 21 Off 14 starts on Wednesday - Group 4', N'#CAE9FF', 14, 4, 3, 21, 0, 10, 0)
GO
INSERT [dbo].[RotationTemplate] ([id], [entity_status], [owner_id], [name], [description], [ColorScheme], [OffDays], [RotationOrder], [StartDay], [WorkDays], [IsCombinedSchedule], [RotationIndex], [CombinedScheduleOrder]) VALUES (11, 0, 0, N'21 & 14 Group 5', N'Work 21 Off 14 starts on Wednesday - Group 5', N'#5FA8D3', 14, 5, 3, 21, 0, 11, 0)
GO
INSERT [dbo].[RotationTemplate] ([id], [entity_status], [owner_id], [name], [description], [ColorScheme], [OffDays], [RotationOrder], [StartDay], [WorkDays], [IsCombinedSchedule], [RotationIndex], [CombinedScheduleOrder]) VALUES (12, 0, 0, N'7&3/7&4 Group 1', N'Work 7 off 3 then work 7 off 4 on Tuesday', N'#2C365E', 3, 1, 2, 7, 1, 12, 1)
GO
INSERT [dbo].[RotationTemplate] ([id], [entity_status], [owner_id], [name], [description], [ColorScheme], [OffDays], [RotationOrder], [StartDay], [WorkDays], [IsCombinedSchedule], [RotationIndex], [CombinedScheduleOrder]) VALUES (13, 0, 0, N'7&3/7&4 Group 1', N'Work 7 off 3 then work 7 off 4 on Tuesday', N'#2C365E', 4, 1, 2, 7, 1, 12, 2)
GO
INSERT [dbo].[RotationTemplate] ([id], [entity_status], [owner_id], [name], [description], [ColorScheme], [OffDays], [RotationOrder], [StartDay], [WorkDays], [IsCombinedSchedule], [RotationIndex], [CombinedScheduleOrder]) VALUES (14, 0, 0, N'7&3/7&4 Group 2', N'Work 7 off 3 then work 7 off 4 on Tuesday - Group 1', N'#0B6E4F', 3, 2, 2, 7, 1, 13, 1)
GO
INSERT [dbo].[RotationTemplate] ([id], [entity_status], [owner_id], [name], [description], [ColorScheme], [OffDays], [RotationOrder], [StartDay], [WorkDays], [IsCombinedSchedule], [RotationIndex], [CombinedScheduleOrder]) VALUES (15, 0, 0, N'7&3/7&4 Group 2', N'Work 7 off 3 then work 7 off 4 on Tuesday - Group 2', N'#0B6E4F', 4, 2, 2, 7, 1, 13, 2)
GO
INSERT [dbo].[RotationTemplate] ([id], [entity_status], [owner_id], [name], [description], [ColorScheme], [OffDays], [RotationOrder], [StartDay], [WorkDays], [IsCombinedSchedule], [RotationIndex], [CombinedScheduleOrder]) VALUES (16, 0, 0, N'7&3/7&4 Group 3', N'Work 7 off 3 then work 7 off 4 on Tuesday - Group 3', N'#D00000', 3, 3, 2, 7, 1, 14, 1)
GO
INSERT [dbo].[RotationTemplate] ([id], [entity_status], [owner_id], [name], [description], [ColorScheme], [OffDays], [RotationOrder], [StartDay], [WorkDays], [IsCombinedSchedule], [RotationIndex], [CombinedScheduleOrder]) VALUES (17, 0, 0, N'7&3/7&4 Group 3', N'Work 7 off 3 then work 7 off 4 on Tuesday - Group 3', N'#D00000', 4, 3, 2, 7, 1, 14, 2)
GO
SET IDENTITY_INSERT [dbo].[RotationTemplate] OFF
GO
```

