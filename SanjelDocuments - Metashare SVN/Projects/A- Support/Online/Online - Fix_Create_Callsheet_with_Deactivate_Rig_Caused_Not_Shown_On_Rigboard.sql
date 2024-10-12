-- A callsheet is  created but not shown on rigboar.
select * from RigJob where rigname='Concord 41' order by system_id desc;

-- 

select * from rig where id = 155 order by system_id desc;

-- Reason 1, rig is deactivated which rigstatus is 6.
-- Solution 1, activate the rig on RigBoard.



