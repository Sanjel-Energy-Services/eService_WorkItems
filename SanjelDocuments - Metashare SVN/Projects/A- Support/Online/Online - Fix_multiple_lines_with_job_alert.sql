
--When a bin is released from rig, Bin Status is 0, but when rig job load bins from BinInformaion if Rig Id is zero, the bin information will be loaded up to job alert without rig caused multiple lines.
-- Solution: When no rig, then don't load up bins. Fix is in feature/bulk-plant branch

select * from BinInformation where rigid = 0 and effective_end_datetime > GETDATE();

Update BinInformation set effective_end_datetime = GETDATE() where  rigid = 0 and effective_end_datetime > GETDATE();

-- Check history
select * from BinInformation where id =  2712 order by system_id desc;

