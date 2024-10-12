--1. Find last crew assignment to rig job
select * from RigJobSanjelCrewSection where SanjelCrewName like '%445088%' order by system_id desc;

select * from RigJob where CallSheetNumber = 1090996 order by system_id desc;


-- rigjob id = 52231

-- 2. find the rig job to verify with  rig board

select * from RigJob where id = 52231 order by system_id desc;

-- 3. Determine the correct assignment record.

select * from RigJobSanjelCrewSection where rigjobid = 52231 order by system_id desc;

-- system_id:10429


update RigJobSanjelCrewSection set entity_status = 1 where system_id = 10429;

-- This forces the assignment status to be deleted, so will lose the history.