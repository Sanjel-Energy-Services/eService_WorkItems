--Problem: When a rig is changed from project rig to normal rig, the rig job will still being created by flagged as "Project Rig"

-- Find rig by rig number or rig name
select * from rig where RigNumber = '8' order by system_id desc;

-- Check rig data to verify lastest version is correct
select * from rig where id = 535 order by system_id desc;

-- Set all rig record IsProjectRig correctly
--update rig set IsProjectRig=0 where id = 535;

-- Check IsProjectRig status is correct in rig job
select * from rigjob where Rigid = 535 order by system_id desc;

-- Updte Rigjob to set IsProjectRig flag correct
-- update RigJob set IsProjectRig = 0 where id = 53382;

