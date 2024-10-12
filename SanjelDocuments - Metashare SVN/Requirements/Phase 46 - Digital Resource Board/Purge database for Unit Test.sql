select count(*) from RigJob where effective_end_datetime > GETDATE();

select top(1000) * from RigJob where effective_end_datetime > GETDATE() and JobLifeStatus <> 0 order by id desc;

select count(*) from RigJob where effective_end_datetime > GETDATE() and JobLifeStatus <> 0;

select top(1000)  * from SanjelCrewSchedule;
select top(1000)  * from UnitSchedule;

select * from eservice6_UT.dbo.programs PRG where PRG.PROGRAM_ID in (Select PROGRAM_ID from eservice6_UT.dbo.CALLSHEET_HEADERS) and PRG.ID > 25000 order by id 
;


select count(*) from eservice6_UT.dbo.programs PRG where id > 25333;

Select * from eservice6_UT.dbo.CALLSHEET_HEADERS where PROGRAM_ID = 'PRG2100761';

-- delete old job, only keep 1000 jobs
-- back up date 220924
-- first job 67749
-- Delete all lab database to shrink the database size


delete from rigjob where id < 67749;
delete from RigJobSanjelCrewSection where RigJobid < 67749;
delete from RigJobThirdPartyBulkerCrewSection where RigJobid < 67749;
delete from SanjelCrewSchedule where RigJobSanjelCrewSectionid not in (select distinct id from RigJobSanjelCrewSection);
delete from ThirdPartyBulkerCrewSchedule where RigJobThirdPartyBulkerCrewSectionid not in (select distinct id from RigJobThirdPartyBulkerCrewSection);
delete from UnitSchedule where SanjelCrewScheduleid not in (select distinct id from SanjelCrewSchedule);
delete from WorkerSchedule where SanjelCrewScheduleid not in (select distinct id from SanjelCrewSchedule);

delete from eservice6_UT.dbo.CALLSHEET_HEADERS where id not in (select distinct CallSheetId from RigJob);

delete from eservice6_UT.dbo.JOBS where CALL_SHEET_NUMBER not in (select distinct CALL_SHEET_NUMBER from eservice6_UT.dbo.CALLSHEET_HEADERS);

delete from eservice6_UT.dbo.SERVICE_TICKETS where SERVICE_TICKET_NUMBER not in (select distinct JOB_NUMBER from eservice6_UT.dbo.JOBS);

delete from eservice6_UT.dbo.SERVICE_REPORT_HEADERS where JOB_NUMBER not in (select distinct JOB_NUMBER from eservice6_UT.dbo.JOBS);

-- Drop constraints before purging programs

ALTER TABLE [dbo].[PRG_BLEND_BLEND_ADDTV_SCTNS] DROP CONSTRAINT [PRG_BLND_ADDTV_SCTNS_PRGID_FK]
GO

ALTER TABLE [dbo].[PRG_BLEND_SCTNS] DROP CONSTRAINT [PRG_BLEND_PROGRAM_ID_FK]
GO

ALTER TABLE [dbo].[PRG_CHRG_MTHD_DSCT_SCTNS] DROP CONSTRAINT [PRG_CHRG_MTHD_DSCT_PRG_ID_FK]
GO

ALTER TABLE [dbo].[PRG_COMPANY_INFO_SCTNS] DROP CONSTRAINT [PRG_COM_INFO_SCTNS_PRG_ID_FK]
GO

ALTER TABLE [dbo].[PRG_EMPLOYEE_SCTNS] DROP CONSTRAINT [PRG_EMPLOYEE_SCTNS_PRG_ID_FK]
GO

ALTER TABLE [dbo].[PRG_GROUP_LINE_ITEM_SCTNS] DROP CONSTRAINT [PRG_GROUP_LINE_ITEM_PRG_ID_FK]
GO

ALTER TABLE [dbo].[PRG_LINE_ITEM_SCTNS] DROP CONSTRAINT [PRG_LINE_ITEM_PRG_ID_FK]
GO

ALTER TABLE [dbo].[PRG_PUMPING_JOB_SECTIONS] DROP CONSTRAINT [PRG_PUMP_JS_PRG_ID_FK]
GO

ALTER TABLE [dbo].[PRG_DOWNHOLE_TOOL_SCTNS] DROP CONSTRAINT [PRG_DNHL_TOOL_SCTNS_PRG_ID_FK]
GO

ALTER TABLE [dbo].[PRG_PIPES_SCTNS] DROP CONSTRAINT [PRG_PIPES_SCTNS_CS_ID_FK]
GO

ALTER TABLE [dbo].[PRG_OPEN_HOLE_SCTNS] DROP CONSTRAINT [PRG_OPEN_HOLE_SCTNS_PRG_ID_FK]
GO

ALTER TABLE [dbo].[PRG_FORMATION_SCTNS] DROP CONSTRAINT [PRG_FORMATION_SCTNS_SR_ID_FK]
GO

-- End


delete from eservice6_UT.dbo.programs where PROGRAM_ID not in (Select PROGRAM_ID from eservice6_UT.dbo.CALLSHEET_HEADERS) and ID < 25000;


delete from eservice6_UT.dbo.PRG_PUMPING_JOB_SECTIONS where ROOT_ID not in (select id from eservice6_UT.dbo.PROGRAMS);
