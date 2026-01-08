<!-- Identifier: D-01-04 -->
```mermaid
classDiagram
class ProgramRequest {
	+string Subject
	+string AFENumber
	+Well Well
	+List~Contact~ OSRContacts
	+List~Contact~ ClientContacts
	+List~Contact~ ServiceProviderContacts
	+string StickDiagramLink
	+CasingString CasingString
	+CementDetail CementDetail
	+string OffsetPadInfoAndHoleProblems
	+string ProgramId
	+string StickDiagramPath
	+DateTime DueDate
	+Employee AssignTo
	+Employee Requester
	+ProgramRequestPriority Priority
	+ProgramRequestStatus Status
	+ClientCompany ClientCompany
}

class ProgramRequestStatus{
	<<enumeration>>
	Open
	Pending
	Received
	InProgress
	Completed
	AcceptEngineeringDesign
	AwaitingReview
	Reviewed
	AwaitingApproval
	Approved
	SentToSales
	AwaitingPricing
	Unacknowledged
	Acknowledged
	SentForReview
	SentForApproval
}

class ProgramRequestPriority{
	<<enumeration>>
	Urgent
	High
	Medium
	Low
	Normal
}
class Employee
class ClientCompany

class Well {
	+string SurfaceLocation
	+List~Formation~ Formations
	+List~DepthInfo~ DepthInfo
	+List~OpenHole~ OpenHole
}
class WellLog {
	+string LogType
	+string LoggingCompany
	+Comments
	+Well Well
}
class BottomHoleAssembly {
	+string Component
	+string Bit
	+string Motor
	+string Telemetry
	+string Subs
	+string NMDC
	+string Collars
	+string DrillingJars
	+string HWDP
	+string DPtoSurface
	+Well Well
}
class RigSetting {
	+decimal GroundLevel
	+decimal KBElevation
	+decimal GLtoKB
	+Rig Rig
}
class Rig
class Contact {
	+string Title
	+string Name
	+string PhoneNumber
	+string Email
	+string Comments
}
class Formation {
	+FormationType FormationType
	+decimal MeasuredDepth
	+decimal TrueVertialDepth
	+decimal MaxiMumPressure
	+decimal MaximumPressureGradient
	+decimal MaximumEstimatedMudDensity
	+decimal ExpectedMudDensity
	+decimal H2SConcentration
	+bool IsLossCirculationZone
	+bool IsOverPressureZone
}
class FormationType
class DepthInfo {
	+string Label
	+decimal MeasuredDepth
	+decimal TrueVertialDepth
}
class Pipe {
	+decimal InsideDiameter
	+GradeType Grade
	+Decimal Weight
	+ThreadType ThreadType
}
class OpenHole
	Well *--> OpenHole
class CasingPipe
	Well *--> CasingPipe
	CasingPipe --|> Pipe
class CasingString {
	+ Well
	+ CasingType
	+CasingPipe CasingPipe
	+string WiperPlugType
	+string WiperPlugSupplier
	+CentralizerDetail CentralizerDetail
	+string CompletionSystemUsed
}
class CentralizerDetail {
	+string Supplier
	+string Type
	+string Spacing
}
class CementDetail {
	+CasingType CasingType
	+string PlacementInterval
	+decimal DepthFrom
	+decimal DepthTo
	+decimal ExpectedTemperature
	+List<BlendSection> BlendSections
}
class BlendSection {
	+BlendCategory BlendCategory
	+BlendFluidType BlendFludeType
	+decimal Quantity
	+BlendAmountUnit UOM
	+string Density
	+decimal Excess
	+decimal DepthFrom
}
class Mud {
	+CasingType CasingType
	+string MudSystem
	+decimal Density
	+string PH
	+string Viscosity
	+string FluidLoss
	+decimal Oil2WaterRatio
	+decimal SaltConcentration
	+string Contingency
}
class WellConfiguration{
	+string Label
	+decimal MeasureDepth
	+decimal SSDepth
	+decimal TrueVerticalDepth
}

CementDetail *--> BlendSection
CasingString o--> CasingPipe
CasingString *--> CentralizerDetail
ProgramRequest-->Well
Well-->WellLog
ProgramRequest-->RigSetting
ProgramRequest*-->Contact:ClientContacts
ProgramRequest*-->Contact:OSRContacts
ProgramRequest*-->Contact:ServiceProviderContacts
RigSetting-->Rig
Well *--> Formation
Well *--> DepthInfo

BottomHoleAssembly --> Well
Formation --> FormationType
ProgramRequest *--> CementDetail
CasingString "*"--> "1" Well
Mud "*"--> "1" Well
WellConfiguration "*"--> "1" Well
```































Questions:

1. Section 6, what does SS Depth stand for?
1. Section 7, need explanation line by line for BHA? What is important to us. The mapping template has current data structure. I set up a new structure called BottomHoleAssembly. Please review the mapping document. If any field needs to be split further, please provide the definition and parsing rules
1. There are notations for the depth in the  Well Configuration (Section 6), please clarify following definition. They are refered in BHA and Casing Information
   - Surface: Ground Level, should be 0
   - SCP: Surface Casing Point. 
   - Base of Groundwater
   - ICP: Intermediate Casing Point.
   - KOP: ?
   - ICP: Intermediate Casing Point
   - Build
   - Tangent
   - Casing XO
   - Heel
   - Turn
   - EOT
   - TD
   - Drill Out: Actual drilling depth to be updated while drilling happens.
