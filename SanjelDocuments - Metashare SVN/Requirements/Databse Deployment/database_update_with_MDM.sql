
/* Run on Production on Dec 2
-- Adding Schedule type to Schedule tables.

ALTER TABLE [SanjelCrewSchedule] ADD [Type] [int] Default 2;
ALTER TABLE [WorkerSchedule] ADD [Type] [int] Default 2;
ALTER TABLE [UnitSchedule] ADD [Type] [int] Default 2;
ALTER TABLE [ThirdPartyBulkerCrewSchedule] ADD [Type] [int] Default 2;
GO

-- Adding Primary Crew flag to control if the crew should be shown on board without unfold the unit 
ALTER TABLE Sanjelcrew ADD IsPrimaryCrew bit Default 0;
GO
*/
Update sanjelcrew set IsPrimaryCrew = 1 where effective_end_datetime > getdate();
GO



CREATE VIEW [dbo].[ActiveCrewList]
AS
SELECT crew.id
	,crew.system_id AS SystemId
	,crew.version
	,crew.modified_user_id AS ModifiedUserId
	,crew.modified_user_name AS ModifiedUserName
	,crew.modified_datetime AS ModifiedDateTime
	,crew.operation_type AS OperationType
	,crew.effective_start_datetime AS EffectiveStartDateTime
	,crew.effective_end_datetime AS EffectiveEndDateTime
	,crew.entity_status AS EntityStatus
	,crew.owner_id AS OwnerId
	,crew.name
	,crew.description
	,crew.Rotation	
	,crew.Notes
	--
	,crew.Typeid
	,crew.TypeName
	,crew.TypeDescription
	--
	,crew.WorkingServicePointid
	,crew.WorkingServicePointName
	,crew.WorkingServicePointDescription
	,crew.WorkingServicePointSystemId
	--
	,crew.HomeServicePointSystemId
	,crew.HomeServicePointName
	,crew.HomeServicePointDescription
	,crew.HomeServicePointid
	--
	,CrewWorkerSection.id AS WorkerSectionId
	,CrewWorkerSection.system_id AS WorkerSectionSystemId
	,CrewWorkerSection.version AS WorkerSectionVersion
	,CrewWorkerSection.modified_user_id AS WorkerSectionModifiedUserId
	,CrewWorkerSection.modified_user_name AS WorkerSectionModifiedUserName
	,CrewWorkerSection.modified_datetime AS WorkerSectionModifiedDateTime
	,CrewWorkerSection.operation_type AS WorkerSectionOperationType
	,CrewWorkerSection.effective_start_datetime AS WorkerSectionEffectiveStartDateTime
	,CrewWorkerSection.effective_end_datetime AS WorkerSectionEffectiveEndDateTime
	,CrewWorkerSection.entity_status AS WorkerSectionEntityStatus
	,CrewWorkerSection.owner_id AS WorkerSectionOwnerId
	,CrewWorkerSection.name AS WorkerSectionName
	,CrewWorkerSection.description AS WorkerSectionDescription
	--
	,CrewWorkerSection.SanjelCrewId
	,CrewWorkerSection.SanjelCrewName
	,CrewWorkerSection.SanjelCrewDescription
	,CrewWorkerSection.SanjelCrewSystemId
	--
	,CrewWorkerSection.WorkerId
	,CrewWorkerSection.WorkerDescription
	,CrewWorkerSection.WorkerName
	,CrewWorkerSection.WorkerSystemId
	--
	,CrewWorkerSection.CrewPositionid as CrewPositionId
	,CrewWorkerSection.CrewPositionName
	,CrewWorkerSection.CrewPositionDescription
	--
	,TruckUnitSection.id AS UnitSectionId
	,TruckUnitSection.system_id AS UnitSectionSystemId
	,TruckUnitSection.version AS UnitSectionVersion
	,TruckUnitSection.modified_user_id AS UnitSectionModifiedUserId
	,TruckUnitSection.modified_user_name AS UnitSectionModifiedUserName
	,TruckUnitSection.modified_datetime AS UnitSectionModifiedDateTime
	,TruckUnitSection.operation_type AS UnitSectionOperationType
	,TruckUnitSection.effective_start_datetime AS UnitSectionEffectiveStartDateTime
	,TruckUnitSection.effective_end_datetime AS UnitSectionEffectiveEndDateTime
	,TruckUnitSection.entity_status AS UnitSectionEntityStatus
	,TruckUnitSection.owner_id AS UnitSectionOwnerId
	,TruckUnitSection.name AS UnitSectionName
	,TruckUnitSection.description AS UnitSectionDescription
	--
	,TruckUnitSection.SanjelCrewSystemId as UnitSectionSanjelCrewSystemId
	,TruckUnitSection.SanjelCrewid as UnitSectionSanjelCrewId
	,TruckUnitSection.SanjelCrewName as UnitSectionSanjelCrewName
	,TruckUnitSection.SanjelCrewDescription as UnitSectionSanjelCrewDescription
	--
	,TruckUnitSection.TruckUnitid as TruckUnitId
	,TruckUnitSection.TruckUnitName
	,TruckUnitSection.TruckUnitDescription
	,TruckUnitSection.TruckUnitSystemId
FROM SanjelCrew AS crew
LEFT JOIN (
	SELECT *
	FROM SanjelCrewNote
	WHERE effective_end_datetime >= GETDATE()
	) AS crewNote ON crew.id = crewNote.SanjelCrewid
LEFT JOIN (
	SELECT *
	FROM SanjelCrewWorkerSection
	WHERE effective_end_datetime >= GETDATE()
	) AS CrewWorkerSection ON crew.id = CrewWorkerSection.SanjelCrewid
LEFT JOIN (
	SELECT *
	FROM SanjelCrewTruckUnitSection
	WHERE effective_end_datetime >= GETDATE()
	) AS TruckUnitSection ON crew.id = TruckUnitSection.SanjelCrewid
WHERE crew.effective_end_datetime >= GETDATE()

GO

 


CREATE VIEW [dbo].[RigJobSanjelCrewSectionList]
AS
SELECT  distinct
	 crewSection.id
	,crewSection.SanjelCrewid AS crewId,
	crewSection.effective_end_datetime AS crewsectionEffective_end_datetime
	--
	,rigJob.Rigid
	,rigJob.RigName
	,rigJob.RigDescription
	,rigJob.RigSystemId

	,rigJob.ClientCompanyid
	,rigJob.ClientCompanyName
	,rigJob.ClientCompanyDescription
	,rigJob.ClientCompanySystemId

	,rigJob.JobTypeid
	,rigJob.JobTypeName
	,rigJob.JobTypeDescription
	,rigJob.JobTypeSystemId

	,rigJob.ServicePointid
	,rigJob.ServicePointName
	,rigJob.ServicePointDescription
	,rigJob.ServicePointSystemId

	,rigJob.ClientConsultant1id
	,rigJob.ClientConsultant1Name
	,rigJob.ClientConsultant1Description
	,rigJob.ClientConsultant1SystemId

	,rigJob.ClientConsultant2id
	,rigJob.ClientConsultant2Name
	,rigJob.ClientConsultant2Description
	,rigJob.ClientConsultant2SystemId

	,rigJob.WellLocationTypeid
	,rigJob.WellLocationTypeName
	,rigJob.WellLocationTypeDescription
	,rigJob.WellLocationTypeSystemId


	,rigJob.id as rigJobId
	,rigJob.system_id
	,rigJob.version
	,rigJob.modified_user_id
	,rigJob.modified_user_name
	,rigJob.modified_datetime
	,rigJob.operation_type
	,rigJob.effective_start_datetime
	,rigJob.effective_end_datetime
	,rigJob.entity_status
	,rigJob.owner_id
	,rigJob.name
	,rigJob.description
	,rigJob.WellLocation
	,rigJob.IsProjectRig
	,rigJob.CallSheetId
	,rigJob.IsListed
	,rigJob.IsDownholeLocation
	,rigJob.JobNumber
	,rigJob.RigStatus
	,rigJob.IsHighProfile
	,rigJob.Directions
	,rigJob.IsNeedBins
	,rigJob.ProgramId
	,rigJob.Notes
	,rigJob.SurfaceLocation
	,rigJob.JobDateTime
	,rigJob.JobUniqueId
	,rigJob.IsServiceRig
	,rigJob.CallSheetNumber
	,rigJob.JobLifeStatus
	,rigJob.IsCoDCleared
	,rigJob.JobAlertId
	,rigJob.ClientCompanyShortName
	,rigJob.RiskMatrix
	,rigJob.ProgramRevision
	,rigJob.MaxProgramRevision
	,rigJob.Latitude
	,rigJob.Longitude
	,rigJob.PumperCount
	,rigJob.PreJobTesting
	,rigJob.JobDuration
FROM (select * FROM RigJobSanjelCrewSection where entity_status = 0 and effective_end_datetime>GETDATE()) AS crewSection
INNER JOIN RigJob AS rigJob ON RigJobid = rigJob.id
 
GO

-- Lab Dabase update

Alter table sld_LabSample add [VendorLoginNumber] nvarchar(255) NULL;
