select * from rigjob where rigname like 'Ensign 423' order by system_id desc;

select * from rigjobsanjelcrewsection where rigjobid = 73846;

select * from rigjobsanjelcrewsection where rigjobid = 73842;

-- release pumper crew

--update rigjobsanjelcrewsection set entity_status=0  where system_id = 105140;

select * from sanjelcrewschedule where rigjobsanjelcrewsectionid=44071;

select top(100) * from sanjelcrewschedule where type = 2 order by system_id desc;

select * from producthaulload where callsheetid = 1108534;
-- two product haul loads 44921 is blended, 44929 is on location. 
--set 44921 on location and delete 44929
--update producthaulload set id =44921, version = 5 where system_id = 113677;
--update producthaulload set effective_end_datetime = '2023-05-31 02:11:55.6300000' where system_id = 113657;
--update producthaulload set entity_status = 1 where system_id = 113676;


select * from shippingloadsheet where producthaulloadid = 44921;

select * from shippingloadsheet where producthaulloadid = 44929;

-- 44921 was deleted need be restored, set 44921 on location

--update shippingloadsheet set entity_status = 0, effective_end_datetime ='9999-12-31 23:59:59.0000000', ShippingStatus = 3 where system_id = 3697;
-- delete 44929 related shipping load sheet
--update shippingloadsheet set entity_status = 1, effective_end_datetime ='2023-05-31 02:10:46.5570000', ShippingStatus = 1 where system_id = 3699;

-- product 43315 was deleted, shoud be restored and put on location
-- product haul 43322 should be deleted

select * from producthaul where id = 43315;
--update producthaul set entity_status = 0, effective_end_datetime ='9999-12-31 23:59:59.0000000', ProductHaulLifeStatus = 4 where system_id = 79129;

select * from producthaul where id = 43322;
--update producthaul set entity_status = 1, effective_end_datetime ='2023-05-31 02:10:46.5570000', ProductHaulLifeStatus = 2 where system_id = 79131;

-- Delete rig job 73846, use  73842 as the correct job since it is completed by server automatically.
--update rigjob set entity_status = 1, effective_end_datetime = getdate() where system_id = 374322;

--update rigjob set islisted = 1 where system_id = 374321;

-- RigJob 73846, 73842 are duplicated and messed up. the product data are duplicated and messed too. Need further data fix.

-- Fix pumper assignement 

--update rigjobsanjelcrewsection set RigJobid = 73842, rigjobsystemid =374269  where system_id = 105140;

select * from rigjob where id = 73842 order by system_id desc;

