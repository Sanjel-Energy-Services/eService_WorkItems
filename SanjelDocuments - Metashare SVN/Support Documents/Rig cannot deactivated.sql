-- Solve Cannot deactivate a rig

-- 1. Find all recent jobs on the rig, find out rig id from resuult
Select * from RigJob where RigName = 'Savanna 127' order by system_id desc;

-- Rig id: 2105
-- 2. Find rig lastest status
Select * from rig where id = 2105 order by system_id desc;

-- Check rig latest status, if it is 6, that means the deactivation was successful. But there should be a job is still enabled.
-- 3. Query the job list again with IsListed flag .

Select * from RigJob where RigName = 'Savanna 127' and IsListed =1 and effective_end_datetime>GETDATE() order by system_id desc;

-- Only found one effective record, but the job was canceled.
-- This means the rig deactivation was not successfully updated last rig job status. 

-- Bug is found, the IsList flag calcuation is not correct as a rig is deactivated after the last job is canceled.
-- Before the bug is fixed, simply set the last canceled job not listed.

update rigjob set IsListed = 0 where system_id = 208976;

