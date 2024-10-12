-- Solve Cannot complete a job

-- 1. Find all recent jobs on the rig, find out rig id from resuult
Select * from RigJob where RigName = 'Akita 26' order by system_id desc;

-- Rig id: 1854

-- 2. Find out action chain of the job which is not able to be completed.
--rigjob system id: 211438 its effective_end_time should be updated as not listed, 

-- System_id: 211207 spaws two next job record when changing the status from 2 to 3. The reason might be double click menu on UI.

-- Modification Plan:
-- 1. End record 211438 with the next record started time.
update RigJob set effective_end_datetime = '2021-09-30 22:39:04.5130000' where system_id = 211438;
--2. Change the completed job recored (id:62408) to unlisted.
update RigJob set IsListed =0 where system_id = 211613;
--3. Change the in-progress job recored (id:62448) to unlisted.
update RigJob set IsListed =1 where system_id = 211594;



