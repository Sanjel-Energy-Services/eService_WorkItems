<!-- Identifier: V -->

# Abbreviations

- **UWI**: Unique Well Identifier, it defines bottom-hole location
- **GL**: Ground Level
- **KB**: Kelly Bushing(a component on the drilling rig floor used as a reference point for depth measurements).
- **GL to KB**: It indicates the **vertical distance between the ground level and the kelly bushing**. This offset is important because most well depth measurements (e.g., Measured Depth (MD) or True Vertical Depth (TVD)) are referenced to the KB rather than the ground level.
- **MD**: Measure Depth
- **TVD**: True Vertical Depth
- **SS Depth**: Sub-Sea Depth

# BusinessEntities

- SalesProject
- DrillOrder
- JobOrder
- JobDesign
- JobDesignBlendSection
- JobDesignPumpingJobSection
- CallSheet
- CallSheetBlendSection
- CallSheetBlendAdditiveSection
- ProductHaul
- ProductHaulLoad
- ShippingLoadSheet
- ProductLoadSection
- BlendUnloadSheet
- BlendShippingFacade
- PodLoad
- BinInformation
- BinLoadHistory
- Bin
- BlendChemical
- Rig
- WorkingServicePoint
- RigJob
- RigJobSanjelCrewSection
- RigJobThirdPartyBulkerCrewSection
- BulkerCrewLog
- SanjelCrew
- SanjelCrewWorkerSection
- SanjelCrewTruckUnitSection
- SanjelCrewSchedule
- UnitSchedule
- UnitLocation
- WorkerSchedule
- VesselCount
- UnitCount
- ContractorCompany
- ClientConsultant
- JobTimeReport
- RigWorkReport
- PayPeriod
- PayPeriodSummary
- PaySummary
- PayEntry
- PayArea
- PayPosition
- PayPositionMapping
- PayrollExportMapping
- PayType
- PaySummaryType
- LabSample
- TestRequest
- TestIteration
- TestResult
- TestData
- QualityControl
- WaterAnalysis
- TestOutput
- TestIterationLabTest
- TestIterationBlendSection
- TestIterationBlendAdditiveSection
- BlendSample
- BlendLog
- BlendCut
- BlendTankLog
- CutSize
- CutDetail
- ProgramRequest
- StickDiagramTemplate
- Plan
- PlanItem
- AssignedPlan
- AssignedPlanItem
- AssignedPlanNotification
- AssignedPlanMentor
- AssignedPlanComment
- AssignedPlanStatus
- AssignedPlanItemStatus
- AssignedPlanTimeLine
- PlanType
- PositionFamily
- Certificate


# Sterotypes
- <<businessEntities>>: Represents a core business object or concept within the domain.
- <<actor>>: Represents a user or external system that interacts with the domain.
- <<systemActor>>: Represents an external system that interacts with the domain.
- <<lifeCycleState>>: Represents the various states an entity can be in throughout its lifecycle.
- <<businessActor>>: Represents a business entity that plays a role in the domain.
- <<Testcase>>: Represents a specific test case or scenario within the domain.
- <<UserStory>>: Represents a user story that describes a feature or requirement from the user's perspective.
- <<UseCase>>: Represents a use case that describes a specific interaction or functionality within the domain.
- <<BusinessProcess>>: Represents a business process that outlines a series of activities or tasks within the domain.


# System Actors
- Workflow
- LabDB
- eProgram
- eService
- RigBoard

# Terminology Notes
- Workflow: Formal name for the system actor. In some documents it may appear as "Workflow System"; treat them as the same actor.
- LabDB: Formal name for the lab system actor. In some documents it may appear as "LabDatabase"; treat them as the same actor.
- Engineer: Formal name for the engineering business actor. In some documents it may appear as "Engineering"; treat them as the same actor.
- Lab Technician: Formal name for the lab technician business actor. In some documents it may appear as "LabTech" or "Lab Staff"; treat them as the same actor.

# Business Actors
- Client
- Sanjel
- Sales
- Engineer
- Operation
- Logistics Dispatch
- Bulk Plant Operator
- Lab Technician
- Bulker Crew
- Third Party Bulker Crew
- Dispatch
