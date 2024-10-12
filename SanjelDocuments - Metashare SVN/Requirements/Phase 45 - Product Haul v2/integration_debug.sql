use SanjelDataUAT

select * from rigjobsanjelcrewsection where id = 44615 order by system_id desc;

select top(100) * from rigjobsanjelcrewsection where ProductHaulDescription like '%2045%' order by system_id desc;


select * from sanjelcrewschedule where rigjobsanjelcrewsectionid=44616;

select top(100) * from producthaulload  order by system_id desc;

select top(100) * from producthaulload where description like '%N3%' order by system_id desc;

select * from bin where id = 363;
select * from bininformation where binid = 363 and podindex =1;

select * from bininformation where binid = 380 and podindex =1;

select top(100) * from podload order by system_id desc;

select top(100) * from producthaul  order by system_id desc;

select * from [RotationTemplate];

SET IDENTITY_INSERT [dbo].[RotationTemplate] ON 
GO
INSERT [dbo].[RotationTemplate] ([id], [entity_status], [owner_id], [name], [description], [ColorScheme], [OffDays], [RotationOrder], [StartDay], [WorkDays]) VALUES (4, 0, 0, N'5&2 Group', N'Work 5 Off 2 starts on Monday', N'#8000FF', 2, 1, 1, 5)
GO
--INSERT [dbo].[RotationTemplate] ([id], [entity_status], [owner_id], [name], [description], [ColorScheme], [OffDays], [RotationOrder], [StartDay], [WorkDays]) VALUES (2, 0, 0, N'7&3 Group 2', N'Work 7 Off 3 starts on Wednesday - Group 2', N'#80FF80', 6, 3, 3, 15)
--GO
--INSERT [dbo].[RotationTemplate] ([id], [entity_status], [owner_id], [name], [description], [ColorScheme], [OffDays], [RotationOrder], [StartDay], [WorkDays]) VALUES (3, 0, 0, N'15&6 Group 3', N'Work 15 Off 6 starts on Wednesday - Group 3', N'#FFFF80', 6, 2, 3, 15)
--GO
SET IDENTITY_INSERT [dbo].[RotationTemplate] OFF
GO

select * from workerschedule where type in (4,5) order by system_id desc; 

select * from employee where name like '%Wang%';

select * from [RotationTemplate]

select  top(100) * from producthaulload where rigid = 0 and effective_end_datetime > getdate() order by system_id desc; 

select  top(1000) * from producthaulload where  effective_end_datetime > getdate() order by system_id desc; 
select  top(1000) * from producthaul where  effective_end_datetime > getdate() order by system_id desc; 
select  top(1000) * from shippingloadsheet where  effective_end_datetime > getdate() order by system_id desc; 
select  top(1000) * from RigJobThirdPartyBulkerCrewSection where  effective_end_datetime > getdate() order by system_id desc; 
select  top(1000) * from Thirdpartybulkercrew where  effective_end_datetime > getdate() order by system_id desc; 

select top(100) * from thirdpartybulkercrewschedule where  effective_end_datetime > getdate() order by system_id desc; 

select top(100) * from sanjelcrewschedule where  effective_end_datetime > getdate() order by system_id desc; 

select  top(1000) * from producthaulload where id = 43968;

select * from contractorcompany;

select * from sanjelcrew where  effective_end_datetime > getdate() order by system_id desc; 

select id, name from ServicePoint where  effective_end_datetime > getdate() order by system_id desc; 

select  top(1000) * from producthaulload  order by system_id desc; 
select  top(1000) * from producthaul order by system_id desc; 
--delete from ProductHaul where system_id in (80147, 80146);
--update ProductHaul set ProductHaulLifeStatus = 2 where system_id = 80145;
--update ProductHaul set effective_end_datetime = '9999-12-31 23:59:59.0000000' where system_id = 80145;
select  top(1000) * from shippingloadsheet order by system_id desc; 
select  top(1000) * from RigJobThirdPartyBulkerCrewSection order by system_id desc; 
select  top(1000) * from Thirdpartybulkercrew where  effective_end_datetime > getdate() order by system_id desc; 

select top(100) * from thirdpartybulkercrewschedule where  effective_end_datetime > getdate() order by system_id desc; 
select top(100) * from rigjobsanjelcrewsection  order by system_id desc; 

--delete from rigjobsanjelcrewsection where system_id in  (106528,106527,106526);
--update rigjobsanjelcrewsection set effective_end_datetime = '9999-12-31 23:59:59.0000000' where system_id = 106520;


select top(100) * from sanjelcrewschedule  order by system_id desc; 
select top(1000) * from workerschedule  order by system_id desc; 
select top(100) * from unitschedule  order by system_id desc; 
select top(100) * from thirdpartybulkercrewschedule order by system_id desc; 
select top(100) * from sanjelcrewschedule where  effective_end_datetime > getdate() order by system_id desc; 
select * from bulkercrewlog  order by system_id desc; 
--delete from bulkercrewlog where system_id in (4318,4313);
--update bulkercrewlog set effective_end_datetime = '9999-12-31 23:59:59.0000000' where system_id = 4310;
--update bulkercrewlog set CrewStatus=2 where system_id = 4313;



select  * from unitschedule where  effective_end_datetime > getdate() and type=0 order by system_id desc; 
select  * from workerschedule where  effective_end_datetime > getdate() and type=0 order by system_id desc; 
select top(100) * from sanjelcrewschedule where  effective_end_datetime > getdate() and id  = 47852 order by system_id desc; 
select  top(100) * from shippingloadsheet where rigid = 0 and effective_end_datetime > getdate() order by system_id desc; 

select top(100) * from rigjobsanjelcrewsection where  effective_end_datetime > getdate() order by system_id desc; 



select * from [RotationTemplate];
select * from bonusposition where id in (
select distinct BonusPositionid from employee where  BonusPositionid <>0) and effective_end_datetime > getdate() order by system_id desc; 


select * from rigjobsanjelcrewsection where id = 44722;

select * from rigjob where rigname like 'PD 184' order by system_id desc; 

select * from sanjelcrew where id = 4880;

update contractorcompany set effective_end_datetime = getdate() where id in (11, 10, 9, 8, 7, 6, 5, 4, 3, 2);

SET IDENTITY_INSERT [dbo].[ContractorCompany] ON 
GO
INSERT [dbo].[ContractorCompany] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (1, 1, 1, 0, NULL, CAST(N'2018-01-30T00:00:00.0000000' AS DateTime2), 1, CAST(N'2018-01-30T00:00:00.0000000' AS DateTime2), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2), 0, 0, N'Total Transload', N'Total Transload Services')
GO
INSERT [dbo].[ContractorCompany] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (12, 12, 1, 0, NULL, CAST(N'2023-06-15T15:16:25.6600000' AS DateTime2), 1, CAST(N'2023-06-15T15:16:25.6600000' AS DateTime2), CAST(N'9999-12-31T23:59:59.0000000' AS DateTime2), 0, 0, N'Living Sky', N'Living Sky Transport Inc.')
GO
INSERT [dbo].[ContractorCompany] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (13, 13, 1, 0, NULL, CAST(N'2023-06-15T15:18:01.1970000' AS DateTime2), 1, CAST(N'2023-06-15T15:18:01.1970000' AS DateTime2), CAST(N'9999-12-31T23:59:59.0000000' AS DateTime2), 0, 0, N'Courage', N'Courage Oilfield Services Ltd')
GO
INSERT [dbo].[ContractorCompany] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (14, 14, 1, 0, NULL, CAST(N'2023-06-15T15:18:15.7270000' AS DateTime2), 1, CAST(N'2023-06-15T15:18:15.7270000' AS DateTime2), CAST(N'9999-12-31T23:59:59.0000000' AS DateTime2), 0, 0, N'Cascade', N'Cascade Carriers LP')
GO
INSERT [dbo].[ContractorCompany] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (15, 15, 1, 0, NULL, CAST(N'2023-06-15T15:18:29.6030000' AS DateTime2), 1, CAST(N'2023-06-15T15:18:29.6030000' AS DateTime2), CAST(N'9999-12-31T23:59:59.0000000' AS DateTime2), 0, 0, N'Komat', N'Komat Drilling Ltd')
GO
INSERT [dbo].[ContractorCompany] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (16, 16, 1, 0, NULL, CAST(N'2023-06-15T15:19:36.8300000' AS DateTime2), 1, CAST(N'2023-06-15T15:19:36.8300000' AS DateTime2), CAST(N'9999-12-31T23:59:59.0000000' AS DateTime2), 0, 0, N'Shane Evans', N'Shane Evans Trucking')
GO
SET IDENTITY_INSERT [dbo].[ContractorCompany] OFF
GO


select id, Name from contractorcompany where  effective_end_datetime > getdate() order by system_id desc;


select * from thirdpartybulkercrew where  effective_end_datetime > getdate() order by system_id desc;

select * from thirdpartybulkercrew where  ContractorCompanyName = 'Living Sky' and effective_end_datetime > getdate();

update thirdpartybulkercrew set ContractorCompanyid = 12 where  ContractorCompanyName = 'Living Sky' and effective_end_datetime > getdate();

select * from thirdpartybulkercrew where  ContractorCompanyName = 'Cascade' and effective_end_datetime > getdate();

update thirdpartybulkercrew set ContractorCompanyid = 14 where  ContractorCompanyName = 'Cascade' and effective_end_datetime > getdate();

select * from thirdpartybulkercrew where  ContractorCompanyName = 'Courage' and effective_end_datetime > getdate();

update thirdpartybulkercrew set ContractorCompanyid = 13 where  ContractorCompanyName = 'Courage' and effective_end_datetime > getdate();

select * from thirdpartybulkercrew where  ContractorCompanyName = 'Komat' and effective_end_datetime > getdate();

update thirdpartybulkercrew set ContractorCompanyid = 15 where  ContractorCompanyName = 'Komat' and effective_end_datetime > getdate();

update thirdpartybulkercrew set ContractorCompanyid = 12 where  ContractorCompanyName = 'Living Sky' and effective_end_datetime > getdate();
update thirdpartybulkercrew set ContractorCompanyid = 13 where  ContractorCompanyName = 'Courage' and effective_end_datetime > getdate();
update thirdpartybulkercrew set ContractorCompanyid = 14 where  ContractorCompanyName = 'Cascade' and effective_end_datetime > getdate();
update thirdpartybulkercrew set ContractorCompanyid = 15 where  ContractorCompanyName = 'Komat' and effective_end_datetime > getdate();


select * from specialtyproduct;

select * from blendchemical where name like '%100 Mesh%';

select * from product where name like '%Barite%';