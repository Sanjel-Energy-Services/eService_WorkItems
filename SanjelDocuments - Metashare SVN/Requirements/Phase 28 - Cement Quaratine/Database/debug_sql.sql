select  * from ProductHaulLoad order by system_id desc;

select * from ProductLoadSection where ProductHaulLoadid = 33 order by system_id desc;
select * from ProductLoadSection  order by system_id desc;

select top(10) * from ProductHaul order by system_id desc;

select top(10) * from SanjelCrewSchedule order by system_id desc;

select top(10) * from RigJobSanjelCrewSection order by system_id desc;

select top(10) * from RigJobThirdPartyBulkerCrewSection order by system_id desc;

select top(10) * from WorkerSchedule order by system_id desc;

select top(10) * from UnitSchedule order by system_id desc;

select top(10) * from ThirdPartyBulkerCrew order by system_id desc;

select top(10) * from SanjelCrew order by system_id desc;

select top(10) * from SanjelCrewWorkerSection order by system_id desc;

select top(10) * from SanjelCrewTruckUnitSection order by system_id desc;

select id,name,description, ServiceLineName as eService_ServiceLine, SbsPrimaryServiceLineId, SbsPrimaryServiceLineName, SbsSecondaryServiceLineId, SbsSecondaryServiceLineName, JobIntervalTypeName, JobIntervalCount from jobtype where effective_end_datetime > getdate();

