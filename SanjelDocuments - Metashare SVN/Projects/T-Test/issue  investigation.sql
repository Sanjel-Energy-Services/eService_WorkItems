select id, system_id, version, effective_start_datetime, effective_end_datetime, entity_status, IsListed, RigName, RigStatus
, Rigid, JobDateTime, JobUniqueId,JobTypeName, ServicePointName,CallSheetId, CallSheetNumber, JobLifeStatus, ClientCompanyShortName
 from RigJob where RigName = 'Bonanza 5' and effective_end_datetime > GETDATE() order by system_id desc;

Update RigJob  set JobLifeStatus = 8 
Where JobLifeStatus = 9 and JobUniqueId is not null;

update RigJob set IsListed = 0 where system_id = 20807;
update RigJob set IsListed = 1 where system_id = 20806;

select * from RigJob where id = 49575 order by version;

select id, system_id, version, effective_start_datetime, effective_end_datetime, entity_status, IsListed, RigName, RigStatus
, Rigid, JobDateTime, JobUniqueId,JobTypeName, ServicePointName,CallSheetId, CallSheetNumber, JobLifeStatus, ClientCompanyShortName
from rigjob where system_id between 20508 and 20541 and rigid = 298;


--delete from RigJob where id = 49390;
delete from RigJob where system_id in (20905, 20904, 20903);

-- Release Crew when job is completed

select * from RigJob where CallSheetNumber = 1088840;

select * from RigJobSanjelCrewSection where RigJobid = 49625 order by id, version;

select * from RigJobSanjelCrewSection order by system_id desc;


