## MasterData

#### Include MasterBase、MasterAdditive、MasterBaseBlend、MasterCustomer、MasterServicePoint,those is from database view.

```mermaid
classDiagram
class MasterBase{
+Id:int
+Name:string
}
class MasterAdditive{ }
class MasterBaseBlend{ }
class MasterServicePoint{ }
class MasterCustomer{
+Client_ID:int
+Company_name:string
}
MasterAdditive --|> MasterBase:泛化
MasterBaseBlend --|> MasterBase:泛化
MasterServicePoint --|> MasterBase:泛化

```

## SearchData

#### Include SearchResult,TestRequestType(enum)

```mermaid
classDiagram

class SearchResult{
+Id:int
+Type:TestRequestType
+JobType:string
+IterationId:string
+VersionId:int
+ProgramNumber:string
+BlendName:string
+BlendBase:string
+BHCT:decimal?
+BHST:decimal?
+ClientName:string
+Additives:string
+Density:decimal
+Label:string
+Date:DateTime
+Value:string
+TT40:string
+TT100:string
+FluidLoss:string
+FreeWaterAngle:string
+FreeWater:string
}
class TestRequestType{<<enum>> }
SearchResult --> TestRequestType:关联
```

## SldTest

#### Include TrackedEntity、SldTestIteration、SldTestRequest、SldLabSample、SldQualityControl、SldTestOutput、SldTestResult、SldTestResultFile、SldWaterAnalysis

```mermaid
classDiagram
graph LR
class TrackedEntity{
+CreatedOn:DateTimeOffset
+CreatedById:string
+CreatedBy:SldUser
+ModifiedOn:DateTimeOffset
+ModifiedById:string
+ModifiedBy:SldUser
}
class SldUser{ 
+FirstName:string
+LastNamestring
+Enabled:bool
+UpdatedRequest:ICollection<SldTestRequest>
+CreatedRequest:ICollection<SldTestRequest>
+UpdatedTestIterations:ICollection<SldTestIteration>
+CreatedTestIterations:ICollection<SldTestIteration>
+CreatedLabSample:ICollection<SldLabSample>
+UpdatedLabSample:ICollection<SldLabSample>
+CreatedWaterAnalysis:Collection<SldWaterAnalysis>
+UpdatedWaterAnalysis:ICollection<SldWaterAnalysis>
+CreatedQualityControl:ICollection<SldQualityControl>
+UpdatedQualityControl:ICollection<SldQualityControl>
}

class SldTestRequest{
+Id:int
+AppId:string
+Type:TestRequestType
+RequestSource:LabTestRequestSource
+Status:TestRequestStatus
+JobType:string
+DateRequired:DateTime?
+ProgramNumber:string
+BlendName:string
+BlendBase:string
+BHCT:decimal?
+BHST:decimal?
+WaterLoginNo:int?
+MixWater:MixWater
+CementLoginNo:int?
+CementSource:CementSource
+SpecificGravity:bool
+LoadAndGo:bool
+OPR:bool
+ClientName:string
+ClientServiceRepresentative:string
+ClientServiceRepresentativeEmail:string
+TechnicalServiceRepresentative:string
+TechnicalServiceRepresentativeEmail:string
+WellName:string
+WellServicePoint:string
+WellDownholeLocation:string
+WellSurfaceLocation:string
+WellTMD:decimal?
+WellTVD:decimal?
+WellPressure:decimal
+Iterations:ICollection<SldTestIteration>
}
class SldTestRequestExtensions{
+FormatId(this SldTestRequest request)
+FormatComment(string comment, string comment_to_add)
+ToTestRequestResponse(this SldTestRequest request, int versionId)
}
class SldTestIteration{
+Id:Guid
+int VersionId
+bool SGSlurry
+bool SGPowder
+List<Additive> Additives
+decimal Density
+string Comment
+string Salt
+decimal? SaltConcentration
+List<Sld.LabTest.Models.LabTest> Tests
+int RequestId
+SldTestRequest Request
+ICollection<SldTestResult> Results
+
+
+
+
}
class SldTestIterationExtensions{
+ToSldTestRequest(SldTestIteration, SldTestRequest):SldTestRequest
}

class SldTestResult{
+Id:Guid
+Date:DateTime
+InstrumentId:string
+Schedule:string
+IterationId:Guid
+TestType:LabTestType
+Iteration:SldTestIteration
+ICollection<SldTestOutput> TestOutputs
+Guid TestResultFileId
+SldTestResultFile TestResultFile
+AddTestOutput(SldTestOutput testOutput):void
+AddTestsResultFile(SldTestResultFile testResultFile):void
}

class SldLabSample{ 
+Id:Guid
+LoginNo:int
+Name:string
+SampleType:SampleType
+DistrictId:int?
+District:string
+HighProfile:bool
+LSD:string
+ClientId:int?
+ClientName:string
+WellName:string
+Quantity:string
+ContainerCount:string
+StorageLocation:string
+Discarded:bool
+Comments:string
+DateCollected:DateTime?
+SampleSource:string
+MTSNumber:decimal?

}
class SldLabSampleExtension{
+ToLabSampleResponse(SldLabSample sample,  WaterAnalysisTestResponse waterResponse, QualityControlResponse qcResponse, IMapper map)
}

class SldQualityControl{
+Id:int
+AppId:string
+SampleId:Guid
+Type:TestRequestType
+TT40:decimal?
+TT100:decimal?
+InitialBC:decimal?
+Rheology:decimal?
+TenSecGelStrength:decimal?
+TenMinGelStrength:decimal?
+Density:decimal?
+ProductionWeek:DateTime
+Blaine:decimal?
+RetainedSieve:decimal?
+VicatInitialSet:decimal?
+OneDay:decimal?
+FreeWater:decimal?
+SpecificGravitydecimal?
+LabSample:SldLabSample
}
class SldQualityControlExtensions{
+FormatId(this SldQualityControl request)
}
class SldTestOutput{
+Id:Guid
+Label:string
+Sort:string
+Value:decimal
+Unitstring
+ResultId:Guid
+SldTestResult Result
+SldTestOutput()
+SldTestOutput(this string label, decimal value, string unit, string sort)
}
class SldTestResultFile{
+Id:Guid
+FileName:string
+Content:byte[]
+TestResults:ICollection<SldTestResult>
+SldTestResultFile()
+SldTestResultFile(string fileName, byte[] content)
}
class SldWaterAnalysis{
+Id:Guid
+SampleId:Guid
+SalesRep:string
+WaterSource:string 
+LabAnalyst:string
+Notes:string
+DateAnalyzed:DateTime? 
+AnalysisMethod:string
+PH:decimal?
+SpecificGravity:decimal?
+IsH2SPresent:bool?
+PAlkanity:decimal?
+TAlkanity:decimal?
+Hydroxide:decimal?
+Carbonate:decimal?
+Bicarbonate:decimal?
+Chloride:decimal?
+Sulfate:decimal?
+Calcium:decimal?
+Iron:decimal?
+Magnesium:decimal?
+Sodium:decimal?
+Colour:string
+Appearance:string
+Odour:string
+RemainingVolume:decimal?
+WithinSpecs:bool?
+Content:byte[]
+LabSample:SldLabSample
+FileName:string
}
class SldWaterAnalysisExtension{
+SldWaterAnalysis ToWaterAnalysisRequest(WaterAnalysisTestRequest water, SldWaterAnalysis dbWater)
+WaterAnalysisTestResponse ToWaterAnalysisTestResponse (SldWaterAnalysis water,  IMapper map)
}


class TestRequestType{
<<enum>> 
+Unknown = 0
+BlendTest = 1
+ExperimentalTest = 2
+WaterAnalysisTest = 3
+QualityControlTest = 4
}
class LabTestRequestSource{
<<enum>> 
+HangFire=0
+WebForm=1
}
class TestRequestStatus{
<<enum>>
  +New = 0
  +InProgress = 1
  +Completed = 2
  +Cancelled = 3
}
class MixWater{
<<enum>> 
+Unknown = 0
+Tap = 1
+Field = 2
}
class CementSource{
<<enum>> 
+Unknown = 0
+Lab = 1
+Field = 2
+BulkPlant = 3 
}


class WaterAnalysisTestRequest{  }
class WaterAnalysisTestResponse{  }

class LabSampleResponse{ }
class QualityControlResponse{ }


TrackedEntity --> SldUser:关联
SldTestRequest "*" --> "1" SldUser:关联
SldTestIteration "*" --> "1" SldUser:关联
SldLabSample "*" --> "1" SldUser:关联
SldWaterAnalysis "*" --> "1" SldUser:关联
SldQualityControl "*" --> "1" SldUser:关联

TrackedEntity <|-- SldQualityControl:泛化
SldQualityControlExtensions ..> SldQualityControl:依赖

TrackedEntity <|-- SldTestRequest:泛化
SldTestRequest "*" <-- "1" SldTestIteration:关联
SldTestRequest o-- TestRequestType:聚合
SldTestRequest o-- LabTestRequestSource:聚合
SldTestRequest o-- TestRequestStatus:聚合
SldTestRequest o-- MixWater:聚合
SldTestRequest o-- CementSource:聚合
SldTestRequestExtensions ..> SldTestRequest:依赖
SldTestIterationExtensions ..> SldTestIteration:依赖

TrackedEntity <|-- SldTestIteration:泛化
TrackedEntity <|-- SldTestResult:泛化
SldTestIteration "*" <-- "1" SldTestResult:关联

SldTestResult o-- SldTestOutput:聚合
SldTestResultFile o-- SldTestResult:聚合

SldLabSample --|> TrackedEntity:泛化
SldLabSampleExtension ..> SldLabSample:依赖

SldWaterAnalysis --|> TrackedEntity:泛化
SldWaterAnalysisExtension ..> SldWaterAnalysis:依赖

SldWaterAnalysis ..> WaterAnalysisTestRequest:依赖
SldWaterAnalysis ..> WaterAnalysisTestResponse:依赖

SldQualityControl o-- TestRequestType:聚合
SldLabSample ..> LabSampleResponse:依赖
SldLabSample ..> WaterAnalysisTestResponse:依赖
SldLabSample ..> QualityControlResponse:依赖
```



