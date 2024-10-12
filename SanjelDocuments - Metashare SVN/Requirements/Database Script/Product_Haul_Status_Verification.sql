select * from ProductHaulLoad where CallSheetNumber = 1093266;


select * from ProductLoadSection where ProductHaulLoadid = 13587;


select * from ProductLoadSection where ProductHaulLoadid = 13588;


select * from ProductHaul where id in (13363, 13364);

select * from SanjelCrewSchedule where id in (6228, 6229);

select * from RigJob where CallSheetNumber = 1093266;


select PH.id, PH.ProductHaulLifeStatus, PHL.ProductHaulLoadLifeStatus from ProductHaul PH 
join ProductHaulLoad PHL on PH.id = phl.ProductHaulid
join RigJob RJ on RJ.CallSheetNumber = PHL.CallSheetNumber
where PH.ProductHaulLifeStatus = 2 and PH.effective_end_datetime > GETDATE() and PHL.effective_end_datetime > GETDATE() and RJ.effective_end_datetime > GETDATE() and RJ.JobLifeStatus = 8 and PH.IsGoWithCrew =1;

select PHL.id, PHL.ProductHaulLoadLifeStatus from ProductHaulLoad PHL 
join RigJob RJ on RJ.CallSheetNumber = PHL.CallSheetNumber
where PHL.ProductHaulLoadLifeStatus = 1 and PHL.effective_end_datetime > GETDATE() 
and RJ.effective_end_datetime > GETDATE() and RJ.JobLifeStatus = 8 and PHL.IsGoWithCrew =1;

