CREATE VIEW [dbo].[WorkType] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from SanjelData.dbo.WorkType
	)
	select
		id							ID,
		description					DESCRIPTION,
		version						VERSION,
		CAST(modified_user_id as int)	LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME,
		name						NAME
	from orderedRecords where rowNum = 1;
GO

CREATE VIEW [dbo].[JobRole] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from SanjelData.dbo.JobRole
	)
	select
		id							ID,
		description					DESCRIPTION,
		version						VERSION,
		CAST(modified_user_id as int)	LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME,
		name						NAME
	from orderedRecords where rowNum = 1;
GO
/* already run
alter table RPT_JOB_BONUS_SCTNS add IS_TWO_WAY bit null;
alter table RPT_JOB_BONUS_SCTNS add TRAVEL_DISTANCE float null;
alter table RPT_JOB_BONUS_SCTNS add WORK_TYPE_ID int null;
alter table RPT_JOB_BONUS_SCTNS add WORK_TYPE_NAME nvarchar(50) null;
alter table RPT_JOB_BONUS_SCTNS add JOB_ROLE_ID INT null;
alter table RPT_JOB_BONUS_SCTNS add JOB_ROLE_NAME nvarchar(50) null;
alter table RPT_JOB_BONUS_SCTNS add WORKING_HOURS float null;
alter table RPT_JOB_BONUS_SCTNS add LOAD_QUANTITY float null;


alter table CSH_JOB_BONUS_SCTNS add IS_TWO_WAY bit null;
alter table CSH_JOB_BONUS_SCTNS add TRAVEL_DISTANCE float null;
alter table CSH_JOB_BONUS_SCTNS add WORK_TYPE_ID int null;
alter table CSH_JOB_BONUS_SCTNS add WORK_TYPE_NAME nvarchar(50) null;
alter table CSH_JOB_BONUS_SCTNS add JOB_ROLE_ID INT null;
alter table CSH_JOB_BONUS_SCTNS add JOB_ROLE_NAME nvarchar(50) null;
alter table CSH_JOB_BONUS_SCTNS add WORKING_HOURS float null;
alter table CSH_JOB_BONUS_SCTNS add LOAD_QUANTITY float null;

alter table SERVICE_REPORT_HEADERS add IS_CREW_EFFICIENCY bit null;
alter table SERVICE_REPORT_HEADERS add IS_MULTIPLE_WELL_PROJECT bit null;

USE [eservice6]
GO
update BONUS_AREAS set version = version + 1, EFFECTIVE_END_DATE_TIME = GETDATE(), LAST_MODIFIED_DATE_TIME=GETDATE() where id in (2,3,4,5,6);
GO


INSERT [dbo].[BONUS_AREAS] ([ID], [NAME], [VERSION], [LAST_MODIFIED_USER_ID], [LAST_MODIFIED_USER_NAME], [LAST_MODIFIED_DATE_TIME], [LAST_OPERATION_TYPE], [EFFECTIVE_START_DATE_TIME], [EFFECTIVE_END_DATE_TIME]) VALUES (7, N'E', 1, 29747, N'awang', GETDATE(), 1, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[BONUS_AREAS] ([ID], [NAME], [VERSION], [LAST_MODIFIED_USER_ID], [LAST_MODIFIED_USER_NAME], [LAST_MODIFIED_DATE_TIME], [LAST_OPERATION_TYPE], [EFFECTIVE_START_DATE_TIME], [EFFECTIVE_END_DATE_TIME]) VALUES (8, N'W', 1, 29747, N'awang', GETDATE(), 1, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2))
GO


alter table PUMP_BLEND_SCTNS add ORIGINAL_QUANTITY float null;
alter table PRG_BLEND_SCTNS add ORIGINAL_QUANTITY float null;
alter table PSPT_BLEND_SCTNS add ORIGINAL_QUANTITY float null;

GO
*.
