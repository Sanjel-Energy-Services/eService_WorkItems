-- Cleanup RigJobSanjelCrewSection - 1
update RigJobSanjelCrewSection set effective_end_datetime = modified_datetime where entity_status = 1;
-- Cleanup RigJobSanjelCrewSection - 2
-- Find RigJob completed but crew assignment is not removed.
insert into RigJobSanjelCrewSection
(
	 [id]
      ,[version]
      ,[modified_user_id]
      ,[modified_user_name]
      ,[modified_datetime]
      ,[operation_type]
      ,[effective_start_datetime]
      ,[effective_end_datetime]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[RigJobid]
      ,[ProductHaulDescription]
      ,[SanjelCrewDescription]
      ,[SanjelCrewSystemId]
      ,[RigJobName]
      ,[RigJobDescription]
      ,[ProductHaulName]
      ,[RigJobCrewSectionStatus]
      ,[ProductHaulid]
      ,[ProductHaulSystemId]
      ,[SanjelCrewName]
      ,[RigJobSystemId]
      ,[SanjelCrewid])
select
		RJCS.[id]
      ,RJCS.[version] + 1 as [version]
      ,RJCS.[modified_user_id]
      ,RJCS.[modified_user_name]
      ,getdate() as [modified_datetime]
      ,RJCS.[operation_type]
      ,RJCS.[effective_start_datetime]
      ,getdate() as [effective_end_datetime]
      ,1 as [entity_status]
      ,RJCS.[owner_id]
      ,RJCS.[name]
      ,RJCS.[description]
      ,RJCS.[RigJobid]
      ,RJCS.[ProductHaulDescription]
      ,RJCS.[SanjelCrewDescription]
      ,RJCS.[SanjelCrewSystemId]
      ,RJCS.[RigJobName]
      ,RJCS.[RigJobDescription]
      ,RJCS.[ProductHaulName]
      ,3 as [RigJobCrewSectionStatus]
      ,RJCS.[ProductHaulid]
      ,RJCS.[ProductHaulSystemId]
      ,RJCS.[SanjelCrewName]
      ,RJCS.[RigJobSystemId]
      ,RJCS.[SanjelCrewid]
	  from RigJobSanjelCrewSection RJCS
join RigJob RJ on RJ.ID = RJCS.RigJobid
where RJ.JobLifeStatus = 8 and RJ.effective_end_datetime > getdate() and RJ.RigStatus = 1 and RJCS.effective_end_datetime > getdate();
--Cleanup RigJobSanjelCrewSection - 3
-- Update original record to end up effectiveness
update RigJobSanjelCrewSection set effective_end_datetime = GETDATE() where system_id in (
select RJCS.system_id from RigJobSanjelCrewSection RJCS
join RigJob RJ on RJ.ID = RJCS.RigJobid
where RJ.JobLifeStatus = 8 and RJ.effective_end_datetime > getdate() and RJ.RigStatus = 1 and RJCS.effective_end_datetime > getdate());

-- Cleanup SanjelCrewSchedule - 1
-- Insert final deleted records

insert into [SanjelCrewSchedule] (
[id]
      ,[version]
      ,[modified_user_id]
      ,[modified_user_name]
      ,[modified_datetime]
      ,[operation_type]
      ,[effective_start_datetime]
      ,[effective_end_datetime]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[WorkingServicePointSystemId]
      ,[WorkingServicePointName]
      ,[SanjelCrewid]
      ,[CrewScheduleTypeid]
      ,[RigJobSanjelCrewSectionSystemId]
      ,[CrewScheduleTypeDescription]
      ,[WorkingServicePointDescription]
      ,[SanjelCrewDescription]
      ,[RigJobSanjelCrewSectionid]
      ,[CrewScheduleTypeName]
      ,[EndTime]
      ,[SanjelCrewName]
      ,[WorkingServicePointid]
      ,[RigJobSanjelCrewSectionName]
      ,[RigJobSanjelCrewSectionDescription]
      ,[StartTime]
      ,[SanjelCrewSystemId])
select 
SCS.[id]
      ,SCS.[version] + 1 as [version]
      ,SCS.[modified_user_id]
      ,SCS.[modified_user_name]
      ,getdate() as [modified_datetime]
      ,SCS.[operation_type]
      ,SCS.[effective_start_datetime]
      ,getdate() as [effective_end_datetime]
      ,1 as [entity_status]
      ,SCS.[owner_id]
      ,SCS.[name]
      ,SCS.[description]
      ,SCS.[WorkingServicePointSystemId]
      ,SCS.[WorkingServicePointName]
      ,SCS.[SanjelCrewid]
      ,SCS.[CrewScheduleTypeid]
      ,SCS.[RigJobSanjelCrewSectionSystemId]
      ,SCS.[CrewScheduleTypeDescription]
      ,SCS.[WorkingServicePointDescription]
      ,SCS.[SanjelCrewDescription]
      ,SCS.[RigJobSanjelCrewSectionid]
      ,SCS.[CrewScheduleTypeName]
      ,SCS.[EndTime]
      ,SCS.[SanjelCrewName]
      ,SCS.[WorkingServicePointid]
      ,SCS.[RigJobSanjelCrewSectionName]
      ,SCS.[RigJobSanjelCrewSectionDescription]
      ,SCS.[StartTime]
      ,SCS.[SanjelCrewSystemId]
  from SanjelCrewSchedule SCS
join [RigJobSanjelCrewSection] RJCS on scs.RigJobSanjelCrewSectionid = RJCS.id
where rjcs.entity_status  = 1 and scs.effective_end_datetime > getdate() order by scs.system_id;

-- Cleanup SanjelCrewSchedule - 2
-- Update original record to end up effectiveness
update SanjelCrewSchedule set effective_end_datetime = GETDATE() where system_id in (
select SCS.system_id  from SanjelCrewSchedule SCS
join [RigJobSanjelCrewSection] RJCS on scs.RigJobSanjelCrewSectionid = RJCS.id
where rjcs.entity_status  = 1 and scs.effective_end_datetime > getdate());


-- Cleanup UnitSchedule - 1
-- Insert final deleted records


Insert into UnitSchedule (
[id]
      ,[version]
      ,[modified_user_id]
      ,[modified_user_name]
      ,[modified_datetime]
      ,[operation_type]
      ,[effective_start_datetime]
      ,[effective_end_datetime]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[UnitScheduleTypeid]
      ,[UnitScheduleTypeName]
      ,[WorkingServicePointid]
      ,[WorkingServicePointSystemId]
      ,[WorkingServicePointDescription]
      ,[TruckUnitDescription]
      ,[TruckUnitSystemId]
      ,[WorkingServicePointName]
      ,[EndTime]
      ,[TruckUnitid]
      ,[TruckUnitName]
      ,[UnitScheduleTypeDescription]
      ,[StartTime])
	  select 
	  US.[id]
      ,US.[version] + 1 as [version]
      ,US.[modified_user_id]
      ,US.[modified_user_name]
      ,getdate() as [modified_datetime]
      ,US.[operation_type]
      ,getdate() as [effective_start_datetime]
      ,getdate() as [effective_end_datetime]
      ,1 as [entity_status]
      ,US.[owner_id]
      ,US.[name]
      ,US.[description]
      ,US.[UnitScheduleTypeid]
      ,US.[UnitScheduleTypeName]
      ,US.[WorkingServicePointid]
      ,US.[WorkingServicePointSystemId]
      ,US.[WorkingServicePointDescription]
      ,US.[TruckUnitDescription]
      ,US.[TruckUnitSystemId]
      ,US.[WorkingServicePointName]
      ,US.[EndTime]
      ,US.[TruckUnitid]
      ,US.[TruckUnitName]
      ,US.[UnitScheduleTypeDescription]
      ,US.[StartTime]
	  from UnitSchedule US
join SanjelCrewSchedule SCS on US.owner_id = SCS.id
where SCS.entity_status = 1 and us.effective_end_datetime > getdate();

 
 -- Cleanup Unit Schedule - 2
-- Update original record to end up effectiveness
update UnitSchedule set effective_end_datetime = GETDATE() where system_id in (
select US.system_id   from UnitSchedule US
join SanjelCrewSchedule SCS on US.owner_id = SCS.id
where SCS.entity_status = 1 and us.effective_end_datetime > getdate());

-- Cleanup Worker Schedule - 1
-- Insert final deleted records

Insert into WorkerSchedule(
[id]
      ,[version]
      ,[modified_user_id]
      ,[modified_user_name]
      ,[modified_datetime]
      ,[operation_type]
      ,[effective_start_datetime]
      ,[effective_end_datetime]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[WorkerName]
      ,[WorkerSystemId]
      ,[EndTime]
      ,[WorkerScheduleTypeid]
      ,[WorkingServicePointid]
      ,[WorkingServicePointSystemId]
      ,[WorkerScheduleTypeName]
      ,[WorkingServicePointDescription]
      ,[WorkerScheduleTypeDescription]
      ,[StartTime]
      ,[WorkerDescription]
      ,[Workerid]
      ,[WorkingServicePointName])
	  select 
	  US.[id]
      ,US.[version] + 1 as [version]
      ,US.[modified_user_id]
      ,US.[modified_user_name]
      ,getdate() as [modified_datetime]
      ,US.[operation_type]
      ,getdate() as [effective_start_datetime]
      ,getdate() as [effective_end_datetime]
      ,1 as [entity_status]
      ,US.[owner_id]
      ,US.[name]
      ,US.[description]
      ,US.[WorkerName]
      ,US.[WorkerSystemId]
      ,US.[EndTime]
      ,US.[WorkerScheduleTypeid]
      ,US.[WorkingServicePointid]
      ,US.[WorkingServicePointSystemId]
      ,US.[WorkerScheduleTypeName]
      ,US.[WorkingServicePointDescription]
      ,US.[WorkerScheduleTypeDescription]
      ,US.[StartTime]
      ,US.[WorkerDescription]
      ,US.[Workerid]
      ,US.[WorkingServicePointName]
	  from WorkerSchedule US
join SanjelCrewSchedule SCS on US.owner_id = SCS.id
where SCS.entity_status = 1 and us.effective_end_datetime > getdate();

 
 -- Cleanup worker Schedule - 2
-- Update original record to end up effectiveness
update WorkerSchedule set effective_end_datetime = GETDATE() where system_id in (
select US.system_id   from WorkerSchedule US
join SanjelCrewSchedule SCS on US.owner_id = SCS.id
where SCS.entity_status = 1 and us.effective_end_datetime > getdate());


-- Cleanup ThirdPartyBulkerCrewSchedule - 1
-- Insert final deleted records

insert into ThirdPartyBulkerCrewSchedule(
[id]
      ,[version]
      ,[modified_user_id]
      ,[modified_user_name]
      ,[modified_datetime]
      ,[operation_type]
      ,[effective_start_datetime]
      ,[effective_end_datetime]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[RigJobThirdPartyBulkerCrewSectionid]
      ,[ThirdPartyBulkerCrewid]
      ,[RigJobThirdPartyBulkerCrewSectionSystemId]
      ,[CrewScheduleTypeid]
      ,[RigJobThirdPartyBulkerCrewSectionDescription]
      ,[CrewScheduleTypeName]
      ,[ThirdPartyBulkerCrewName]
      ,[ThirdPartyBulkerCrewSystemId]
      ,[RigJobThirdPartyBulkerCrewSectionName]
      ,[EndTime]
      ,[ThirdPartyBulkerCrewDescription]
      ,[CrewScheduleTypeDescription]
      ,[StartTime])
select 
SCS.[id]
      ,SCS.[version] + 1 as [version]
      ,SCS.[modified_user_id]
      ,SCS.[modified_user_name]
      ,getdate() as [modified_datetime]
      ,SCS.[operation_type]
      ,SCS.[effective_start_datetime]
      ,getdate() as [effective_end_datetime]
      ,1 as [entity_status]
      ,SCS.[owner_id]
      ,SCS.[name]
      ,SCS.[description]
      ,SCS.[RigJobThirdPartyBulkerCrewSectionid]
      ,SCS.[ThirdPartyBulkerCrewid]
      ,SCS.[RigJobThirdPartyBulkerCrewSectionSystemId]
      ,SCS.[CrewScheduleTypeid]
      ,SCS.[RigJobThirdPartyBulkerCrewSectionDescription]
      ,SCS.[CrewScheduleTypeName]
      ,SCS.[ThirdPartyBulkerCrewName]
      ,SCS.[ThirdPartyBulkerCrewSystemId]
      ,SCS.[RigJobThirdPartyBulkerCrewSectionName]
      ,SCS.[EndTime]
      ,SCS.[ThirdPartyBulkerCrewDescription]
      ,SCS.[CrewScheduleTypeDescription]
      ,SCS.[StartTime]
  from ThirdPartyBulkerCrewSchedule SCS
join RigJobThirdPartyBulkerCrewSection RJCS on scs.RigJobThirdPartyBulkerCrewSectionid = RJCS.id
where rjcs.entity_status  = 1 and scs.effective_end_datetime > getdate() order by scs.system_id;

-- Cleanup ThirdPartyBulkerCrewSchedule - 2
-- Update original record to end up effectiveness
update ThirdPartyBulkerCrewSchedule set effective_end_datetime = GETDATE() where system_id in (
select SCS.system_id  from ThirdPartyBulkerCrewSchedule SCS
join RigJobThirdPartyBulkerCrewSection RJCS on scs.RigJobThirdPartyBulkerCrewSectionid = RJCS.id
where rjcs.entity_status  = 1 and scs.effective_end_datetime > getdate());

-- Cleanup Product Haul Load - 1
-- Insert final deleted records
 Insert into ProductHaulLoad (
[id]
      ,[version]
      ,[modified_user_id]
      ,[modified_user_name]
      ,[modified_datetime]
      ,[operation_type]
      ,[effective_start_datetime]
      ,[effective_end_datetime]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[OnLocationTime]
      ,[BlendSectionId]
      ,[JobTypeName]
      ,[JobDate]
      ,[JobTypeSystemId]
      ,[BlendCategorySystemId]
      ,[TotalBlendWeight]
      ,[BlendChemicalName]
      ,[JobTypeDescription]
      ,[CustomerSystemId]
      ,[ServicePointDescription]
      ,[ProductHaulid]
      ,[BlendCategoryName]
      ,[ServicePointName]
      ,[CustomerName]
      ,[ExpectedOnLocationTime]
      ,[ProductHaulSystemId]
      ,[BlendCategoryid]
      ,[Comments]
      ,[BlendChemicalid]
      ,[Binid]
      ,[ServicePointid]
      ,[BlendCategoryDescription]
      ,[BinDescription]
      ,[MixWater]
      ,[BlendChemicalDescription]
      ,[CallSheetNumber]
      ,[ServicePointSystemId]
      ,[CustomerDescription]
      ,[BlendChemicalSystemId]
      ,[IsTotalBlendTonnage]
      ,[BinName]
      ,[LoadSheetSerialNumber]
      ,[ProductHaulLoadLifeStatus]
      ,[WellLocation]
      ,[BinSystemId]
      ,[ProductHaulName]
      ,[IsGoWithCrew]
      ,[Customerid]
      ,[ProductHaulDescription]
      ,[BaseBlendWeight]
      ,[JobTypeid]
      ,[Yield]
      ,[SackWeight]
      ,[BulkVolume]
      ,[Density]
      ,[UnitName]
      ,[UnitSystemId]
      ,[Unitid]
      ,[UnitDescription]
      ,[StorageName]
      ,[SiteName]
      ,[DriverName]
      ,[BulkPlantDescription]
      ,[BulkPlantid]
      ,[BulkPlantSystemId]
      ,[BulkPlantName]
      ,[RigDescription]
      ,[Rigid]
      ,[RigSystemId]
      ,[RigName]
      ,[IsBlendTest]
      ,[ClientRepresentative]
      ,[DispatchBy]
      ,[ProgramId]
      ,[PodIndex]
      ,[CallSheetId])

select 
	  PHL.[id]
      ,PHL.[version] + 1 as [version]
      ,PHL.[modified_user_id]
      ,PHL.[modified_user_name]
      ,getdate() as [modified_datetime]
      ,PHL.[operation_type]
      ,getdate() as [effective_start_datetime]
      ,PHL.[effective_end_datetime]
      ,PHL.[entity_status]
	  ,PHL.[owner_id]
      ,PHL.[name]
      ,PHL.[description]
      ,PHL.[OnLocationTime]
      ,PHL.[BlendSectionId]
      ,PHL.[JobTypeName]
      ,PHL.[JobDate]
      ,PHL.[JobTypeSystemId]
      ,PHL.[BlendCategorySystemId]
      ,PHL.[TotalBlendWeight]
      ,PHL.[BlendChemicalName]
      ,PHL.[JobTypeDescription]
      ,PHL.[CustomerSystemId]
      ,PHL.[ServicePointDescription]
      ,PHL.[ProductHaulid]
      ,PHL.[BlendCategoryName]
      ,PHL.[ServicePointName]
      ,PHL.[CustomerName]
      ,PHL.[ExpectedOnLocationTime]
      ,PHL.[ProductHaulSystemId]
      ,PHL.[BlendCategoryid]
      ,PHL.[Comments]
      ,PHL.[BlendChemicalid]
      ,PHL.[Binid]
      ,PHL.[ServicePointid]
      ,PHL.[BlendCategoryDescription]
      ,PHL.[BinDescription]
      ,PHL.[MixWater]
      ,PHL.[BlendChemicalDescription]
      ,PHL.[CallSheetNumber]
      ,PHL.[ServicePointSystemId]
      ,PHL.[CustomerDescription]
      ,PHL.[BlendChemicalSystemId]
      ,PHL.[IsTotalBlendTonnage]
      ,PHL.[BinName]
      ,PHL.[LoadSheetSerialNumber]
      ,2 as [ProductHaulLoadLifeStatus]
      ,PHL.[WellLocation]
      ,PHL.[BinSystemId]
      ,PHL.[ProductHaulName]
      ,PHL.[IsGoWithCrew]
      ,PHL.[Customerid]
      ,PHL.[ProductHaulDescription]
      ,PHL.[BaseBlendWeight]
      ,PHL.[JobTypeid]
      ,PHL.[Yield]
      ,PHL.[SackWeight]
      ,PHL.[BulkVolume]
      ,PHL.[Density]
      ,PHL.[UnitName]
      ,PHL.[UnitSystemId]
      ,PHL.[Unitid]
      ,PHL.[UnitDescription]
      ,PHL.[StorageName]
      ,PHL.[SiteName]
      ,PHL.[DriverName]
      ,PHL.[BulkPlantDescription]
      ,PHL.[BulkPlantid]
      ,PHL.[BulkPlantSystemId]
      ,PHL.[BulkPlantName]
      ,PHL.[RigDescription]
      ,PHL.[Rigid]
      ,PHL.[RigSystemId]
      ,PHL.[RigName]
      ,PHL.[IsBlendTest]
      ,PHL.[ClientRepresentative]
      ,PHL.[DispatchBy]
      ,PHL.[ProgramId]
      ,PHL.[PodIndex]
      ,PHL.[CallSheetId]
 from ProductHaulLoad PHL
--join (select distinct callsheetid from RigJob  group by CallSheetId having  max(JobLifeStatus) = 8) RJ on RJ.CallSheetId = PHL.CallSheetId
where PHL.effective_end_datetime > GETDATE() and PHL.ProductHaulLoadLifeStatus <> 2 and CallSheetId in (select distinct callsheetid from RigJob  group by CallSheetId having  max(JobLifeStatus) = 8);


-- Cleanup Product Haul Load - 2
-- Update original record to end up effectiveness

update ProductHaulLoad set effective_end_datetime = GETDATE() where system_id in (
select PHL.system_id    from ProductHaulLoad PHL
--join RigJob RJ on RJ.CallSheetId = PHL.CallSheetId
where PHL.effective_end_datetime > GETDATE() and PHL.ProductHaulLoadLifeStatus <> 2 and PHL.CallSheetId in (select distinct callsheetid from RigJob  group by CallSheetId having  max(JobLifeStatus) = 8));



--Run http://localhost:44704/DataCleanUp/SetProductHaulOnLocationIfAllLoadsOnLocation
--Run http://localhost:44703/DataCleanUp/UpdateProductHaulCrewInfo


