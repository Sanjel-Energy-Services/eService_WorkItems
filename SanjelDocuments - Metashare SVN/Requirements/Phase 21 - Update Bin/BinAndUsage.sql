

select * from 
(select  BIN.Id as BIN_ID, BIN.name as BIN_NAME, BIN.BinTypeName, IIF(RBS.BinStatus=0, 'IN Yard', 'Assiged to Rig') as ASSIGNMENT, RBS.RigName, RBS.Rigid, RBS.WorkingServicePointName, BIN.HomeServicePointName, RBS.Capacity, RBS.Quantity from Bin BIN
full outer join 
(Select * from BinInformation where effective_end_datetime > GETDATE()) RBS on BIN.id = rbs.Binid
) BIF
left outer join
(select id as RIG_ID,
CASE
	WHEN status = 1 THEN 'Active'
	WHEN status = 2 THEN 'Down For Maintenance'
	WHEN status = 3 THEN 'Down For Holding Equipment'
	WHEN status = 4 THEN 'Down For Weather'
	WHEN status = 5 THEN 'Down For New Lease Or Licenses'
	WHEN status = 6 THEN 'Deactivated'
	ELSE ''
end as RIG_STATUS from rig where  rig.effective_end_datetime > GETDATE()) RG
 on RG.RIG_ID = BIF.Rigid order by BinTypeName, BIN_NAME;