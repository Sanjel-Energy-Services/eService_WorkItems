-- DRB Phase 2 Deployment script
select top(100) * from sanjelcrewschedule where type is null order by system_id desc;
update sanjelcrewschedule set type = 2 where type is null;
select top(100) * from thirdpartybulkercrewschedule where type is null order by system_id desc;
update thirdpartybulkercrewschedule set type = 2 where type is null;
Go
Update sanjelcrew set IsPrimaryCrew = 1 where effective_end_datetime > getdate();
GO

-- following need to run on PRD if eServiceOnline is not published
update SanjelDataUAT.dbo.RigJob set CallCrewTime = (select CIF_CALL_CREW_DATE_TIME from eservice6UAT.dbo.CALLSHEET_HEADERS cs where cs.CALL_SHEET_NUMBER = RigJob.CallSheetNumber)
where effective_end_datetime > GETDATE() and JobLifeStatus in (3,4,5,7);

