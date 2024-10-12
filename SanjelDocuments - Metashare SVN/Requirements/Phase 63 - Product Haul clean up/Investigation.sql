select id, system_id, version, modified_datetime, effective_start_datetime, effective_end_datetime, callsheetid, islisted, rigstatus, rigid, rigname, joblifestatus, servicepointname, jobdatetime
from rigjob where effective_end_datetime >getdate() and jobdatetime is null order by system_id desc;


select id, system_id, version, entity_status, modified_datetime, effective_start_datetime, effective_end_datetime, callsheetid, islisted, rigstatus, rigid, rigname, joblifestatus, servicepointname, jobdatetime
from rigjob where rigid = 223 order by system_id desc;


select id, system_id, version, modified_datetime, effective_start_datetime, effective_end_datetime, callsheetid, islisted, rigstatus, rigid, rigname, joblifestatus
from rigjob where id = 49452 order by system_id desc;


select id, system_id, version, modified_datetime, effective_start_datetime, effective_end_datetime, callsheetid, islisted, rigstatus, rigid, rigname, joblifestatus
from rigjob where effective_end_datetime >getdate() order by system_id desc;

select id, system_id, version, modified_datetime, effective_start_datetime, effective_end_datetime, callsheetid, islisted, rigstatus, rigid, rigname, joblifestatus , servicepointname, jobdatetime
from rigjob where rigid = 262 order by system_id desc;

update rigjob set islisted = 1 where system_id = 411197;

select id, system_id, endtime from sanjelcrewschedule where  effective_end_datetime >getdate() and  endtime <'2020-10-26 03:30:00.0000000'  order by system_id desc;




select id, system_id, version, modified_datetime, effective_start_datetime, effective_end_datetime, callsheetid, islisted, rigstatus, rigid, rigname, joblifestatus 
from rigjob where id = 49452 order by system_id desc;

select top(100) * from rigjob order by system_id desc;

select top(100) * from rig where id =262 order by system_id desc;
update rig set status = 6 where system_id = 7378;


select id, system_id, version, modified_datetime, effective_start_datetime, effective_end_datetime, callsheetid, islisted, rigstatus, rigid, rigname, joblifestatus
from rigjob where effective_end_datetime >getdate() and islisted=1 and rigid = 262 order by system_id desc;

select top(100) * from bininformation order by system_id desc;

select top(100) * from binloadhistory order by id desc;


select top(100) * from producthaulload order by system_id desc;

select top(100) * from ShippingLoadSheet order by system_id desc;

update producthaulload set producthaulloadlifestatus = 4 where system_id = 139326;

select top(100) * from callsheet order by id desc;




