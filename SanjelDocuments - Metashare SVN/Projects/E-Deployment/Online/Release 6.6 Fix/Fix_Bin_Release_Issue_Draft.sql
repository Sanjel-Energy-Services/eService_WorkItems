select * from TruckUnit where UnitNumber = '746074';

Update TruckUnit set name=UnitNumber;

select * from RigJob where RigName = 'Bonanza 1' order by system_id desc;

select * from RigBinSection where BinName = '2134';

select * from rig where id = 2085;

select * from RigBinSection where rigid = 2085;

INSERT [dbo].[RigBinSection] ([id], [system_id], [version], [modified_user_id], [modified_user_name], 
[modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], 
[owner_id], [name], [description], [RigName], [BinSystemId], [BinName], [Binid], [BinDescription], [RigDescription], [Rigid], [RigSystemId]) 
VALUES (2608, 22, 1, 0, NULL, CAST(N'2019-05-23T13:29:18.0000000' AS DateTime2), 1, GETDATE(), CAST(N'9999-12-31T23:59:59.9970000' AS DateTime2), 1, 0, NULL, NULL, N'Bonanza 1', 24, N'2134', 154, N'2134 Bin - P -Tank', N'Bonanza 1', 2085, 448)
GO

Update [dbo].[RigBinSection] set effective_end_datetime = GETDATE() where system_id = 21;

SET IDENTITY_INSERT [dbo].[RigBinSection] OFF
GO

SET IDENTITY_INSERT [dbo].[RigBinSection] ON
GO


select * from Rig where name like 'Trinidad 432';

select * from RigJob where Rigid = 336 order by version desc;

select * from SanjelCrew where name = '' and  effective_end_datetime > GETDATE();

select * from SanjelCrew where name is null and  effective_end_datetime > GETDATE();

Update SanjelCrew set name = '740087' where system_id = 1338;



