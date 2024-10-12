select id, system_id, version, modified_datetime, effective_start_datetime, effective_end_datetime, Status, name from rig where name = 'Grimes 11' order by system_id desc;

select * from RigJob where Rigid = 2114 order by system_id desc;

select * from RigJob where Rigid = 2114  and effective_end_datetime >GETDATE()  order by system_id desc;


select * from RigJob where id = 51398;
select * from RigJob where id = 51387;
select * from RigJob where id = 51354;


select id, system_id, modified_datetime, effective_start_datetime, effective_end_datetime, Rigid, RigStatus, CallSheetNumber, JobUniqueId, IsListed from RigJob where id = 51398 order by system_id desc;;
-- delete deactivate job and rig record, restore to active status

--delete from rigjob where system_id = 47685;
--delete from rig where system_id = 1115;
--update rig set  effective_end_datetime = N'9999-12-31 23:59:59.0000000' where system_id = 1103;


select id, system_id, modified_datetime, effective_start_datetime, effective_end_datetime, Rigid, RigStatus, CallSheetNumber, JobUniqueId, IsListed from RigJob where id = 51387 order by system_id desc;;

update rigjob set IsListed = 0 where system_id = 47684;

select id, system_id, modified_datetime, effective_start_datetime, effective_end_datetime, Rigid, RigStatus, CallSheetNumber, JobUniqueId, IsListed from RigJob where id = 51354 order by system_id desc;;

select id, system_id, modified_datetime, effective_start_datetime, effective_end_datetime, Rigid, RigStatus, CallSheetNumber, JobUniqueId, IsListed from RigJob where id = 51352 order by system_id desc;;



select id, system_id, modified_datetime, effective_start_datetime, effective_end_datetime, Rigid, RigStatus, CallSheetNumber, JobUniqueId, IsListed from RigJob where id = 46449 order by system_id desc;;



select id, system_id, modified_datetime, effective_start_datetime, effective_end_datetime, Rigid, RigStatus, CallSheetNumber, JobUniqueId, IsListed from RigJob where id = 50489 order by system_id desc;;
select id, system_id, modified_datetime, effective_start_datetime, effective_end_datetime, Rigid, RigStatus, CallSheetNumber, JobUniqueId, IsListed from RigJob where id = 50487 order by system_id desc;;
select id, system_id, modified_datetime, effective_start_datetime, effective_end_datetime, Rigid, RigStatus, CallSheetNumber, JobUniqueId, IsListed from RigJob where id = 50472 order by system_id desc;;

select id, system_id, version, modified_datetime, effective_start_datetime, effective_end_datetime, Rigid, RigStatus, CallSheetNumber, JobUniqueId, IsListed, JobLifeStatus 
from RigJob where id = 49332 order by system_id desc;;

select id, system_id, version, modified_datetime, effective_start_datetime, effective_end_datetime, Rigid, RigStatus, CallSheetNumber, JobUniqueId, IsListed, JobLifeStatus 
from RigJob where id = 49328 order by system_id desc;;


select id, system_id, version, modified_datetime, effective_start_datetime, effective_end_datetime, Rigid, RigStatus, CallSheetNumber, JobUniqueId, IsListed, JobLifeStatus 
from RigJob where id = 50414 order by system_id desc;;


select id, system_id, version, modified_datetime, effective_start_datetime, effective_end_datetime, Rigid, RigStatus, CallSheetNumber, JobUniqueId, IsListed, JobLifeStatus 
from RigJob where id = 49950 order by system_id desc;;

select id, system_id, version, modified_datetime, effective_start_datetime, effective_end_datetime, Rigid, RigStatus, CallSheetNumber, JobUniqueId, IsListed, JobLifeStatus 
from RigJob where id = 49884 order by system_id desc;;


select id, system_id, version, modified_datetime, effective_start_datetime, effective_end_datetime, Rigid, RigStatus, CallSheetNumber, JobUniqueId, IsListed, JobLifeStatus 
from RigJob where rigid = 2081 and effective_end_datetime > GETDATE() order by system_id desc;;


select * from RigJob where CallSheetNumber = 1088636;

select *from RigJob where system_id between 15886 and 15890;

-- Delete 49332 which created for enable rig, but status always alive 
--delete from rigjob where id = 49332 and version > 1;

select *  from rigjob where system_id > 32719 and Rigid = 2081 order by system_id desc;

-- Delete rigjob records which dipatch tried to move rig status up and down

--delete from rigjob where system_id > 32718 and Rigid = 2081;
--delete from Rig where id = 2081 and version > 4;

select *  from rigjob where system_id > 32718 and Rigid = 2081 order by system_id desc;

-- set last valid record active to allow dispatch to move it down again.

--update rigjob set effective_end_datetime = N'9999-12-31 23:59:59.0000000' where system_id = 32718;
--update rig set  effective_end_datetime = N'9999-12-31 23:59:59.0000000' where system_id = 535;

select * from Rig where id = 2081 and version > 4;