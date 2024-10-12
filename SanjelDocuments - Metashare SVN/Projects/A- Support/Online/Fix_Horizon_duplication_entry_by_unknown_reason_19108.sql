select * from RigJob where RigName = 'Ironhand 5' and islisted = 1 order by system_id desc;

select * from RigJob where RigName = 'Horizon 39'  order by system_id desc;


select * from RigJob where id = 51665;

--delete from rigjob where id = 51665;

select * from RigJob where id = 51737 order by system_id desc;


select * from RigJob where id = 51606 order by system_id desc;

select * from rigjob where id = 51606 and system_id > 52074;

--delete from rigjob where id = 51606 and system_id > 52074;


select * from rig where id  =199;

select * from RigJob where system_id between 52070 and 52080 order by system_id desc;


select * from RigJob where Rigid = 199  and islisted = 1 order by system_id desc;

select top(100) * from RigJob  order by system_id desc;

select * from RigJob where id =51590 order by system_id desc;;

select * from ProductHaul order by system_id desc;

select * from UnitSchedule where system_id in (4766, 4764);

select * from RigJobSanjelCrewSection where RigJobid in (52160) order by system_id desc;

select * from SanjelCrewSchedule where SanjelCrewid in (561, 553, 600)  order by system_id desc;

select * from RigJobSanjelCrewSection order by id desc;



select * from rigjob where Rigid = 0 order by system_id desc;
select * from rigjob where JobLifeStatus = 7 order by system_id desc;


--update RigJob set effective_end_datetime = '9999-12-31 23:59:59.0000000' where system_id = 51676;

--update RigJob set JobLifeStatus = 7 where system_id = 51676;


select * from RigJob where RigName = 'Savanna 653' order by system_id desc;







