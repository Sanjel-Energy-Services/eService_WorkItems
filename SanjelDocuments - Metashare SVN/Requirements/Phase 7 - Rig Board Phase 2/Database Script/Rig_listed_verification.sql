

-- find if more than one list rig job for a single rig                              
select rig_id, count(rig_id) from RIG_JOB where IS_LISTED = 1 group by rig_id having count(rig_id)>1;

-- find rig listed item count

select rigid, count(rigid) from
(select RIG.ID as rigid, RJ.IS_LISTED as IL from rigs RIG
left outer join rig_job RJ on RJ.RIG_ID = RIG.ID) where IL= 1 group by rigid;
                              
-- find rig  has no listed item                              
select RIGS.ID RIGID, RIGCOUNT.CNT from RIGS RIGS
left outer join
(select rig_id, count(rig_id) CNT from RIG_JOB where IS_LISTED = 1 group by rig_id) RIGCOUNT
on RIGS.ID = RIGCOUNT.rig_id where RIGCOUNT.CNT is null;

-- check rig status which doesn't have a listed job

select * from rigs where id in 
(select RIGS.ID RIGID from RIGS RIGS
left outer join
(select rig_id, count(rig_id) CNT from RIG_JOB where IS_LISTED = 1 group by rig_id) RIGCOUNT
on RIGS.ID = RIGCOUNT.rig_id where RIGCOUNT.CNT is null);

select * from rig_job where rig_id in (41, 500, 520, 540, 541);

-- deactivated rigs should not have listed items
-- status = 0 rig, should not have listed items, but need to understand why the rig exists.


