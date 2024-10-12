insert into [dbo].[QualityControl](
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[TestRequestType]
      ,[Blaine]
      ,[TenSecGelStrength]
      ,[SpecificGravity]
      ,[ProductionWeek]
      ,[LabSampleDescription]
      ,[FreeWater]
      ,[TenMinGelStrength]
      ,[LabSampleid]
      ,[Density]
      ,[LabSampleName]
      ,[OneDay]
      ,[RetainedSieve]
      ,[Rheology]
      ,[InitialBC]
      ,[TT100]
      ,[OldSampleId]
      ,[TT40]
      ,[VicatInitialSet])

(SELECT 0
      ,[ModifiedById]
	  ,''
	  ,''
      ,[Type]
      ,[Blaine]
	  ,[TenSecGelStrength]
	  ,[SpecificGravity]
	  ,[ProductionWeek]
	  ,''
	  ,[FreeWater]
	  ,[TenMinGelStrength]
	  ,'0'
	  ,[Density]
	  ,''
	  ,[OneDay]
	  ,[RetainedSieve]
	  ,[Rheology]
      ,[InitialBC]
	  ,[TT40]
	  ,[SampleId]
      ,[TT100]
	,[VicatInitialSet]
  FROM [dbo].[SldQualityControls])
  
  update [dbo].[QualityControl] set (LabSampleDescription,LabSampleid,LabSampleName)=(select description,id,name from labsample where OldId=QualityControl.OldSampleId)
  
  
  
  
  
  insert into [dbo].[WaterAnalysis](
  ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[Bicarbonate]
      ,[SalesRep]
      ,[Content]
      ,[SpecificGravity]
      ,[PH]
      ,[OldSampleId]
      ,[Appearance]
      ,[Sulfate]
      ,[LabAnalyst]
      ,[Odour]
      ,[TAlkanity]
      ,[Sodium]
      ,[LabSampleDescription]
      ,[RemainingVolume]
      ,[Magnesium]
      ,[PAlkanity]
      ,[Iron]
      ,[PAnalysisMethod]
      ,[WaterSource]
      ,[Colour]
      ,[Notes]
      ,[Hydroxide]
      ,[Chloride]
      ,[Calcium]
      ,[LabSampleid]
      ,[DateAnalyzed]
      ,[LabSampleName]
      ,[OldId]
      ,[WithinSpecs]
      ,[IsH2SPresent]
      ,[Carbonate]
      ,[FileName])
	  
	  (SELECT
	  0
      ,[ModifiedById]
	  ,''
	  ,''
	  ,[Bicarbonate]
	    ,[SalesRep]
		,''
      ,[SpecificGravity]
	   ,[PH]
	   ,[SampleId]
	   ,[Appearance]
	   ,[Sulfate]
	   ,[LabAnalyst]
		,[Odour]
      ,[TAlkanity]
	  ,[Sodium]
	  ,''
	  ,[RemainingVolume]
	  ,[Magnesium]
	  ,[PAlkanity]
	   ,[Iron]
	  ,[AnalysisMethod]
	  ,[WaterSource]
	  ,[Colour]
	  ,[Notes]
	  ,[Hydroxide]
	  ,[Chloride]
	  ,[Calcium]
	  ,0
	  ,[DateAnalyzed]
	  ,''
	  ,[id]
	  ,
	  ,[WithinSpecs]
	  ,[IsH2SPresent]
	  ,[Carbonate]
	  ,[FileName]

      
  FROM [LabTesting].[dbo].[SldWaterAnalysis]
	  )
	  
update [dbo].[WaterAnalysis] set (LabSampleDescription,LabSampleid,LabSampleName)=(select description,id,name from labsample where OldId=WaterAnalysis.OldSampleId)



insert into [dbo].[TestResultFile](
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[FileName]
      ,[OldId]
      ,[Content])
(SELECT 
0,
0,
'',
'', 
,[FileName]
[Id],
''
  FROM  [dbo].[SldTestResultFiles])
  
  
  insert into [dbo].[LabSample]( 
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[Comments]
      ,[LSD]
      ,[StorageLocation]
      ,[MTSNumber]
      ,[ServicePointName]
      ,[ClientCompanyName]
      ,[SampleType]
      ,[ContainerCount]
      ,[ClientCompanyId]
      ,[OldId]
      ,[SampleSource]
      ,[WellName]
      ,[Discarded]
      ,[HighProfile]
      ,[DateCollected]
      ,[ServicePointId]
      ,[LoginNo]
      ,[QuantityAndUnit]
  )
  
  (SELECT 
    0
      ,[ModifiedById]
	 ,[Name]
	  ,''
  ,[Comments]
   ,[LSD]
  ,[StorageLocation]
  ,[MTSNumber]
  ,[District]
  ,[ClientName]
  ,[SampleType]
  ,[ContainerCount]
  ,[ClientId]
  ,[Id]
  ,[SampleSource]
  ,[WellName]
  ,[Discarded]
  ,[HighProfile]
  ,[DateCollected]
  ,[DistrictId]
      ,[LoginNo]
      ,[Quantity]
  FROM [dbo].[SldLabSamples])
  
  
  insert into [dbo].[TestResult](
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[OldId]
      ,[TestType]
      ,[TestResultFileDescription]
      ,[TestResultFileid]
      ,[TestResultFileName]
      ,[Schedule]
      ,[TestDateTime]
      ,[InstrumentId]
      ,[TestIterationid])
	  (
	  SELECT 
	  0
      ,[ModifiedById]
	 ,''
	  ,''
	  ,[Id]
	  ,[TestType]
	  ,''
		,[TestResultFileId]
		,''
		,[Schedule]
		,[Date]
      ,[InstrumentId]
      ,[IterationId]
  FROM [LabTesting].[dbo].[SldTestResult]
	  )
	  ??这个表应该加个OldTestResultFileId.
	  update [dbo].[TestResult] set(,[TestResultFileDescription],[TestResultFileid],[TestResultFileName])=(SELECT [description],[Id],[name] from [dbo].[TestResultFile] where oldid=TestResult.OldTestResultFileId)
	  
	  
	  
	  insert into [dbo].[TestRequest](
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[WellName]
      ,[CementLoginNo]
      ,[TemplateBlendBase]
      ,[WellTMD]
      ,[RequestSource]
      ,[DateRequired]
      ,[CementSource]
      ,[WaterLoginNo]
      ,[BHCT]
      ,[WellPressure]
      ,[Type]
      ,[TechnicalServiceRepresentativeEmail]
      ,[ClientServiceRepresentativeEmail]
      ,[LoadAndGo]
      ,[TechnicalServiceRepresentative]
      ,[ProgramNumber]
      ,[ClientName]
      ,[OldId]
      ,[ClientServiceRepresentative]
      ,[IsOnePageReport]
      ,[WellSurfaceLocation]
      ,[BHST]
      ,[SpecificGravity]
      ,[WaterSource]
      ,[WellServicePoint]
      ,[TemplateJobType]
      ,[Status]
      ,[WellTVD]
      ,[TemplateBlendName]
      ,[WellDownholeLocation])
	  (
	  SELECT 
		0
      ,[ModifiedById]
	 ,''
	  ,''
	  ,[WellName]
	  ,[CementLoginNo]
	  ,[BlendBase]
	  ,[WellTMD]
	  ,[RequestSource]
	  ,[DateRequired]
	  ,[CementSource]
	  ,[BHCT]
	  ,[WellPressure]
	  ,[Type]
	  ,[TechnicalServiceRepresentativeEmail]
	  ,[ClientServiceRepresentativeEmail]
	  ,[LoadAndGo]
	  ,[TechnicalServiceRepresentative]
	  ,[ProgramNumber]
	  ,[ClientName]
	  ,[Id]
	  ,[ClientServiceRepresentative]
	  ,[OPR]
	  ,[WellSurfaceLocation]
	  ,[BHST]
	  ,[SpecificGravity]
	  ,[WaterSource]
	  ,[WellServicePoint]
	  ,[JobType]
	  ,[Status]
	  ,[WellTVD]
	  ,[BlendName]
	  ,[WellDownholeLocation]
  FROM [dbo].[SldTestRequests]
	  )
	  
	  
	  insert into [dbo].[TestOutput](
      [entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[Label]
      ,[Unit]
      ,[Sort]
      ,[OldId]
      ,[TestResultid]
      ,[Value])
	  (
	  SELECT
	  0
	  ,0
	  ,''
	  ,''
      ,[Label]
      ,[Unit]
	  ,[Sort]
	  ,[Id]
      ,[ResultId]
	  ,[Value]
  FROM [LabTesting].[dbo].[SldTestOutput]
	  )
	  
	  
	  insert into [dbo].[TestIteration](
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[LabTestListJson]
      ,[Salt]
      ,[TestRequestid]
      ,[CementSource]
      ,[OldId]
      ,[AdditiveListJson]
      ,[Comment]
      ,[WaterSource]
      ,[SGPowder]
      ,[WaterLoginNo]
      ,[IterationIndex]
      ,[SaltConcentration]
      ,[Density]
      ,[SGSlurry]
      ,[CementLoginNo])
	  (SELECT 
		 0
	   ,[ModifiedById]
	  ,''
	  ,''
		,''
		,[Tests]
		,[Salt]
		,[RequestId]
		,[CementSource]
		,[Id]
	  ,[Additives]
	  ,[Comment]
	  ,[WaterSource]
	,[SGPowder]
	,[WaterLoginNo]
	,[VersionId]
     ,[SaltConcentration] 
      ,[Density]
      ,[SGSlurry]
      ,[CementLoginNo]
  FROM [LabTesting].[dbo].[SldTestIterations])