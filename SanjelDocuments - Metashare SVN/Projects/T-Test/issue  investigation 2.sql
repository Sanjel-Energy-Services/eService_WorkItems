select * from SanjelCrew where name is null and effective_end_datetime > GETDATE();

select * from SanjelCrewTruckUnitSection where owner_id = 149;

select * from TruckUnit where id = 2745;


select * from RigJob order by system_id desc;

select * from RigJob where CallSheetNumber = 1088746;

select * from RigJobSanjelCrewSection  where RigJobid=49572 ;

select * from SanjelCrewTruckUnitSection where SanjelCrewid = 172;

select * from SanjelCrewWorkerSection where SanjelCrewid = 172;



select * from RigJob RJ 
join RigJobSanjelCrewSection RJSCS on RJSCS.RigJobid = RJ.Id
where Rj.JobLifeStatus = 8 and RJSCS.entity_status=1 and RJSCS.effective_end_datetime > GETDATE();

select * from ProductHaulLoad order by system_id desc;

select * from ProductHaul where id = 9362;


select * from Rig where name like 'Trinidad 432';

select * from RigJob where Rigid = 329 order by system_id desc;

update RigJob set RigStatus = 3 where system_id = 16542;

select * from Rig where name like 'Ensign T014';


select * from RigJob where Rigid = 2154 order by system_id desc;

select * from RigJobSanjelCrewSection where rigjobid = 49602 order by system_id desc;

select * from RigJobSanjelCrewSection where system_id = 795 order by system_id desc;

select * from SanjelCrewSchedule order by system_id desc;

select * from SanjelCrew where id = 111 order by system_id desc;

select * from SanjelCrew order by system_id desc;

select * from SanjelCrew where name = '' and  effective_end_datetime > GETDATE();

Update SanjelCrew set name = '740087' where system_id = 1338;


Update Rig set effective_end_datetime = '9999-12-31 23:59:59.0000000' where system_id = 542;
delete from Rig where system_id in (543, 617);


select * from RigJob where CallSheetNumber = 1088843;

select * from RigJobSanjelCrewSection where RigJobid = 49636 order by version desc;

select * from RigJobSanjelCrewSection order by system_id desc;

delete from RigJobSanjelCrewSection where system_id in (803, 804);
update RigJobSanjelCrewSection set effective_end_datetime = CAST(N'9999-12-31T23:59:59.0000000' AS DateTime2) where system_id = 801;

SELECT Y.[id], Y.[version]+1, Y.[modified_user_id], Y.[modified_user_name], GETDATE(), 3, GETDATE(), '9999-12-31 23:59:59.0000000', 1, Y.[owner_id], Y.[name], Y.[description], Y.[RigJobid], [ProductHaulDescription], [SanjelCrewDescription], [SanjelCrewSystemId], [RigJobName], [RigJobDescription], [ProductHaulName], [RigJobCrewSectionStatus], [ProductHaulid], Y.[ProductHaulSystemId], Y.[SanjelCrewName], Y.[RigJobSystemId], Y.[SanjelCrewid]
From RigJobSanjelCrewSection Y
Where Y.RigJobId = 49633 and Y.Effective_End_DateTime > GETDATE();

select * from rigjob where system_id =20240;

delete from RigJob where system_id =20267;
update RigJob set effective_end_datetime = CAST(N'9999-12-31T23:59:59.0000000' AS DateTime2) where system_id =20266;

update RigJob set JobLifeStatus =2 where system_id = 20238;



INSERT [dbo].[RigJob] ([id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [WellLocation], [ClientConsultant1id], [WellLocationTypeName], [IsProjectRig], [ServicePointName], [CallSheetId], [IsListed], [ServicePointSystemId], [IsDownholeLocation], [ClientCompanyid], [JobNumber], [RigStatus], [RigName], [WellLocationTypeid], [WellLocationTypeDescription], [JobTypeDescription], [IsHighProfile], [Directions], [IsNeedBins], [ProgramId], [Rigid], [JobTypeName], [Notes], [SurfaceLocation], [ClientCompanySystemId], [JobDateTime], [JobUniqueId], [WellLocationTypeSystemId], [IsServiceRig], [ServicePointid], [JobTypeid], [CallSheetNumber], [ClientConsultant2id], [JobLifeStatus], [ClientCompanyName], [ClientConsultant2Description], [ServicePointDescription], [ClientConsultant2Name], [ClientConsultant1Name], [IsCoDCleared], [JobTypeSystemId], [JobAlertId], [ClientConsultant1Description], [ClientConsultant2SystemId], [RigSystemId], [ClientCompanyDescription], [ClientConsultant1SystemId], [RigDescription], [ClientCompanyShortName]) 
VALUES (49635, 6, 0, NULL, GETDATE(), 2, GETDATE(), CAST(N'9999-12-31T23:59:59.0000000' AS DateTime2), 0, 0, NULL, NULL, N'94-B-9', 501, N'General', 0, N'Fort St. John', 1088847, 1, 4, 1, 4668, 0, 1, N'PD 538', 1, N'General', N'Surface Casing', 1, N'test', 0, N'PRG1902144', 283, N'Surface', N'2045 -MT | 1908 - MT
13 wells

', NULL, 163, CAST(N'2019-06-17T15:15:00.0000000' AS DateTime2), N'da5a188c-cd08-41da-91e9-7c950534318c', 1, 0, 66, 1504, 1088842, 0, 9, N'Tourmaline Oil Corp.', NULL, NULL, NULL, N'Aaron Hansen', 0, 7, 0, NULL, 0, 181, N'Tourmaline Oil Corp.', 0, N'PD 538', N'Tourmaline');
