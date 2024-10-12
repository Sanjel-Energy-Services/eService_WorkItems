use eService6

-- move data from view to table to remove the dependency on Sanjel27

select count(*)  from dbo.SCM_PLC_LOG;
GO 

select * into  [dbo].[SCM_PLC_LOG_RBD] from [dbo].[SCM_PLC_LOG];
GO

drop view [dbo].[SCM_PLC_LOG];
GO

exec sp_rename 'SCM_PLC_LOG_RBD', 'SCM_PLC_LOG'
GO

select count(*)  from dbo.SCM_PLC_LOG;
GO


select count(*) from EMPLOYEES;
GO

select *  into Employees_RBD from EMPLOYEES;
GO

drop view EMPLOYEES;
GO

exec sp_rename 'Employees_RBD', 'EMPLOYEES'
GO

select count(*) from EMPLOYEES;
GO

-- Trim off old data to shrink the data file size

delete from JOBS where LAST_MODIFIED_DATE_TIME < '2019-12-01';
GO

delete from SERVICE_TICKETS where LAST_MODIFIED_DATE_TIME < '2019-12-01';
GO

delete from SERVICE_REPORT_HEADERS where LAST_MODIFIED_DATE_TIME < '2019-12-01';
GO

delete from CALLSHEET_HEADERS where LAST_MODIFIED_DATE_TIME < '2019-12-01';
GO

delete from PROGRAMS where LAST_MODIFIED_DATE_TIME < '2019-12-01';
GO

truncate table [UPLOAD_DOCUMENT_SCTNS];
GO

Truncate table rig_job_log;
GO
