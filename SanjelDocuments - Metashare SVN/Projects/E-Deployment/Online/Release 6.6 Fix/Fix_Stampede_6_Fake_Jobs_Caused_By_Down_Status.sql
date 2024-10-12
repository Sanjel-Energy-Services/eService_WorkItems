select * from RigJob where RigName = 'Ensign T010' and effective_end_datetime > GETDATE() order by system_id desc;

Update RigJob set JobLifeStatus = 8 where system_id = 18235;
Update RigJob set JobLifeStatus = 8 where system_id = 18559;
Update RigJob set JobLifeStatus = 8 where system_id = 19664;


select * from RigJob where id = 49332;
delete from RigJob where id = 49332;


--Update all RigJob 

Update RigJob  set JobLifeStatus = 8 
Where JobLifeStatus = 9 and JobUniqueId is not null;


select * from RigJob where RigName = 'Tempco 8' and effective_end_datetime > GETDATE() order by system_id desc;
select * from RigJob where id = 49390;
delete from RigJob where id = 49390;


-- Release Crew when job is completed

select * from RigJob where CallSheetNumber = 1088832;

select * from RigJobSanjelCrewSection where RigJobid = 49615 order by id, version;



 