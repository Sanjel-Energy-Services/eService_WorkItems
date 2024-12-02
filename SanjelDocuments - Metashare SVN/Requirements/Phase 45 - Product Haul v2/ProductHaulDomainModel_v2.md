### Domain Model

```mermaid
classDiagram
class Bin
class ProductHaul
class ProductHaulLoad
class RigJobSanjelCrewSection
class RigJobThirdPartyCrewSection
class SanjelCrewSchedule
class ThirdPartyCrewSchedule
class UnitSchedule
class WorkerSchedule
class RigJob
class SanjelCrew
class ThirdPartyCrew
class RigJobCrewSection
class Employee
class TruckUnit
ProductHaul"0..1"<--"1..*" ProductHaulLoad
SanjelCrew o-- TruckUnit
SanjelCrew o-- Employee
RigJobCrewSection "0..*" -->"0..1"RigJob
RigJobCrewSection "0..*" -->"0..1"ProductHaul
RigJobSanjelCrewSection" 1"<--"1"SanjelCrewSchedule
RigJobThirdPartyCrewSection "1"<--"1"ThirdPartyCrewSchedule
RigJobSanjelCrewSection "1..*"-->"1"SanjelCrew
RigJobThirdPartyCrewSection "1..*" -->"1"ThirdPartyCrew
RigJobCrewSection<|--RigJobSanjelCrewSection
RigJobCrewSection<|--RigJobThirdPartyCrewSection
UnitSchedule"1..*"-->"1"TruckUnit
WorkerSchedule"1..*"-->"1"Employee
SanjelCrewSchedule *--> UnitSchedule
SanjelCrewSchedule *--> WorkerSchedule
ProductHaulLoad"Destination"-->"0..1"Bin


```

## Refactor version 1

## Domain Model

```mermaid
classDiagram
class Bin
class ProductHaul
class ProductHaulLoad {
<<BlendRequest>>
+ BlendTestingStatus
}
class RigJobSanjelCrewSection
class RigJobThirdPartyCrewSection
class SanjelCrewSchedule
class ThirdPartyCrewSchedule
class UnitSchedule
class WorkerSchedule
class RigJob
class SanjelCrew
class ThirdPartyCrew
class RigJobCrewSection
class Employee
class TruckUnit
class ShippingLoadSheet {
+ Rig
+ CallSheetNumber
+ Client
+ ClientRep
+ Destination
+ BlendDescription
+ BlendShippingStatus
+ IsGoWithCrew
}
class PodLoad {
+ PodIndex
+ LoadAmount
}
class BlendUnloadSheet {
+Weight
}
class BinInformation 
class LabSample
ProductHaul"0..1"<--"1..*" ProductHaulLoad
RigJobSanjelCrewSection --> ProductHaul
SanjelCrew o-- TruckUnit
SanjelCrew o-- Employee
RigJobCrewSection "0..*" -->"0..1"RigJob
RigJobCrewSection "0..*" -->"0..1"ProductHaul
RigJobSanjelCrewSection" 1"<--"1"SanjelCrewSchedule
RigJobThirdPartyCrewSection "1"<--"1"ThirdPartyCrewSchedule
RigJobSanjelCrewSection "1..*"-->"1"SanjelCrew
RigJobThirdPartyCrewSection "1..*" -->"1"ThirdPartyCrew
RigJobCrewSection<|--RigJobSanjelCrewSection
RigJobCrewSection<|--RigJobThirdPartyCrewSection
UnitSchedule"1..*"-->"1"TruckUnit
WorkerSchedule"1..*"-->"1"Employee
SanjelCrewSchedule *--> UnitSchedule
SanjelCrewSchedule *--> WorkerSchedule
ProductHaulLoad"Destination"-->"0..1"BinInformation
ProductHaul *--> ShippingLoadSheet
ProductHaul *--> PodLoad
PodLoad --> ShippingLoadSheet
ShippingLoadSheet"SourceStorage"-->"0..1"BinInformation
ShippingLoadSheet *-- BlendUnloadSheet
ShippingLoadSheet --> ProductHaulLoad
BlendUnloadSheet "DestinationStorage"-->BinInformation
BinInformation -->ProductHaulLoad
LabSample-->ProductHaulLoad
BinInformation-->Bin
```
### Product Haul Load State Machine



```mermaid
stateDiagram

classDef stateInPro fill:green,color:white,font-weight:bold,stroke-width:2px,stroke:yellow
classDef statePartiallyInPro fill:yellow,color:black,font-weight:bold,stroke-width:2px,stroke:red


state is_product_haul <<choice>>
state is_blend_test_passed <<choice>>
state is_approved <<choice>>
state is_stored_for_future <<choice>>
state has_mistake <<choice>>
state need_testing <<choice>>
state is_reblend <<choice>>
state BPAVS {
s3: Blending
s3-->has_mistake
s4: BlendCompleted
}
state BlendTest {
s8: TestRequestReceived
s9: Testing
s20: Tested
s15:Approved
s18:Pass
s11:Fail
is_blend_test_passed-->s18:Pass
is_blend_test_passed-->s11:Fail
s11-->is_approved:Approval for use as is
}
s1:::stateInPro: Scheduled
s2:::statePartiallyInPro: OnLocation
s5:::statePartiallyInPro: Loaded
s6: HaulScheduled
s21: PartialHaulScheduled
s7:::statePartiallyInPro: Stored
s10:Ready
s13: Deleted
s14:JobCanceled

[*]-->s1: Blend Request
s1-->s3:::stateInPro
has_mistake-->s4:::stateInPro: no mistake
has_mistake-->s19: has mistake
s19-->is_reblend
s4-->is_product_haul
is_product_haul-->need_testing: Loaded to Bulk Plant Bin
need_testing-->s7:Need Testing
s7-->s8
need_testing-->s10: No Testing
s18-->s10
s8-->s9
s9-->s20
s20-->is_blend_test_passed
is_approved-->s15:Approved
is_approved-->is_reblend:Not Approved
s14-->is_stored_for_future
is_stored_for_future-->s16: Loaded to Bulk Plant Bin for future use
is_stored_for_future-->s12:Recyle
is_product_haul-->s5: Loaded to bulker for hauling
s15-->s10
s10-->s6: Haul Blend
s10-->s21: Haul Blend Partially
s21-->s6: Haul Blend
s6-->s5: Loaded to bulker
s5-->s2: Loaded to Rig Bin or Go with Crew on location
state FaultBlend {
s19:Fault
is_reblend-->is_stored_for_future:Not Reblend
is_reblend-->s17: Loaded to Bulk Plant Bin
s16:GoodToUse
s17:Reblended
s12:Recycled
}
s2-->[*]
s12-->[*]
s16-->[*]
s17-->[*]
s5-->s14:Job Canceled
s6-->s14:Job Canceled
s10-->s14:Job Canceled
s4-->s14:Job Canceled
s1-->s13: Canceled (Haul or Job)
s13-->[*]

```

### Product Haul Load State Machine Breakdown

#### Blend Request State Machine

```mermaid
stateDiagram
state is_product_haul <<choice>>
state is_stored_for_future <<choice>>
state has_mistake <<choice>>
state is_reblend <<choice>>
s1: Scheduled
s3: Blending
s3-->has_mistake
s4: BlendCompleted
s2: OnLocation
s5: Loaded
s7: Stored
s13: Deleted
s14:JobCanceled

[*]-->s1: Blend Request
s1-->s3
has_mistake-->s4: no mistake
has_mistake-->s19: has mistake
s19-->is_reblend
s4-->is_product_haul
is_product_haul-->s7: Loaded to Bulk Plant Bin
is_product_haul-->s5: Loaded to bulker for hauling
s7-->s5:Haul Blend
s14-->is_stored_for_future
is_stored_for_future-->s16: Loaded to Bulk Plant Bin for future use
is_stored_for_future-->s12:Recyle
s5-->s2: Loaded to Rig Bin or Go with Crew on location
state FaultBlend {
s19:Fault
is_reblend-->is_stored_for_future:Not Reblend
is_reblend-->s17: Loaded to Bulk Plant Bin
s16:GoodToUse
s17:Reblended
s12:Recycled
}
s2-->[*]
s12-->[*]
s16-->[*]
s17-->[*]
s5-->s14:Job Canceled
s7-->s14:Job Canceled
s4-->s14:Job Canceled
s1-->s13: Canceled (Haul or Job)
s13-->[*]
```

#### Blend Request status Definition

- Scheduled: Blend Request is scheduled.
- Blending: Blend Request is picked by in BPAVS, blending process is started.
- BlendCompleted: Blending process is completed, blend is ready to load to Bins or Bulker
- Loaded: Blend is loaded to Bulker
- Stored: Blend is loaded to Bulk Plant bins.
- OnLocation: Full amount of blend are shipped on location by product hauls.



#### Product Haul Status Definition

- Scheduled: A bulker is scheduled to haul specific blend either from bulk plant bins or blend request.

- Loaded: The blend is loaded to bulker

- OnLocation: The haul is completed, the blend is loaded to rig bins or pumped.

  

#### Blend Shipping State Machine





```mermaid
stateDiagram
s1:HaulScheduled
s2:PartialHaulScheduled
s3:OnLocation
[*]-->s1
[*]-->s2
s2-->s1
s1-->s3
s3-->[*]
```





#### Blend Testing State Machine

```mermaid
stateDiagram
state is_blend_test_passed <<choice>>
state is_approved <<choice>>
state is_stored_for_future <<choice>>
state is_reblend <<choice>>
state BlendTest {
s8: TestRequested
s9: Testing
s15:Approved
s18:Pass
s11:Fail
s21:Denied
is_blend_test_passed-->s18:Pass
is_blend_test_passed-->s11:Fail
s11-->is_approved:Approval for use as is
}

[*]-->s8
s19-->is_reblend
s8-->s9
s9-->is_blend_test_passed
is_approved-->s15:Approved
is_approved-->s21:Not Approved
is_stored_for_future-->s16: Loaded to Bulk Plant Bin for future use
is_stored_for_future-->s12:Recyle
state FaultBlend {
s19:Fault
is_reblend-->is_stored_for_future:Not Reblend
is_reblend-->s17: Loaded to Bulk Plant Bin
s16:GoodToUse
s17:Reblended
s12:Recycled
}
s21-->s19
s18-->[*]
s12-->[*]
s16-->[*]
s17-->[*]
s15-->[*]

```

### Shipping Status
```mermaid
stateDiagram
s1:Scheduled
s2:Loaded
s3:OnLocation
[*]-->s1
s1-->s2
s2-->s3
s3-->[*]
```
### Lab Sample State Machine

```mermaid
stateDiagram
s1: Captured
s2: Shipped
s3: Received
[*]-->s1
s1-->s2
s2-->s3
s3-->[*]

```



## Process View





## Wish List

- Schedule blend request without bin
  - BPAVS need to fill in the bin and update backend

- Schedule product haul with two bins - spit load
- Destination bins on MTS
- BPAVS need to be able to update "Loaded" status
- BPAVS sampling function and auto log in Lab Database
- Re-blend with blended blend.



### Blend Request Process

```mermaid
sequenceDiagram
actor Client
box Sanjel
actor Dispatch
actor Logistics
actor BulkerCrew
actor Engineer
participant RigJob
participant ProductHaul
participant BlendRequest
participant TestRequest
actor Lab
end
Client->>Dispatch: Send Job Request
Dispatch->>RigJob: Comfirm a Job
RigJob-->>Logistics: Need a blend
alt Store Blend on lease
Logistics->>ProductHaul:Schedule a product haul
ProductHaul->>BlendRequest:CreateBlendRequest
else Store Blend in district
Logistics->>BlendRequest:CreateBlendRequest
end
Note right of BlendRequest: Send notification to BP <br> and stake holders
BlendRequest->>TestRequest:Create Test Request
TestRequest-->>Lab:Send to Lab


```

### Blending and Testing Process

```mermaid
sequenceDiagram
actor Dispatch
actor Logistics
actor BulkerCrew
participant BlendRequest
actor BPO
participant RigBin
participant BPBin
participant TestRequest
participant BlendSample
actor Lab
participant TestResult
BlendRequest->>BPO: Notify
BPO->>BPO: Confirm, Blend  
BPO->>BlendSample: Sample cement
BPO->>Lab: Ship Sample
alt Store Blend on lease
BPO->>Dispatch: Send MTS
BPO->>Logistics: Send MTS
Logistics->>BulkerCrew: Track cement to Location
BulkerCrew->>RigBin: Load Blend to Rig Bin
else Store Blend in district
BPO->>BPBin:Load Blend To BP Bin
end
Lab-->>TestRequest: Confirm Test Request
Lab-->>BlendRequest: Confirm Sample Recipe
Lab->>TestResult:Run Test


```

### Client Approval Process

```mermaid
sequenceDiagram
actor Client
box Sanjel
actor Dispatch
actor Logistics
actor Engineer
participant RigJob
actor Lab
participant TestResult
end

Lab->>TestResult:Run Test
alt Pass
alt Client Approval Required
TestResult-->>Dispatch:Client Approval Required
Dispatch->>Client: Send Test Result for Approval
Client->>Dispatch: Return approval decision
alt Client Approved
Dispatch->>RigJob:Designate to approve to Pump
Note right of Dispatch: Communicate client approval
else No
Dispatch->>Logistics:Communicate client decline
Logistics->>Engineer: Review for salvageability
end
else No
TestResult-->>RigJob:Designate to approve to Pump
end
else Fail
Logistics->>Engineer: Review for salvageability
end
```



### Review fail blend salvageability

```mermaid
sequenceDiagram
actor Logistics
actor Engineer
participant RigJob
participant BlendRequest
Logistics->>Engineer: Review for salvageability
Note right of Logistics: Blend Request<br>Test Result
Engineer->>Engineer: Analyze and Redesign
alt Savageable
Engineer->>RigJob:Revise Program, Update Blend
Engineer->>Logistics: Confirm Course of action
alt Dry Blend
Logistics->>Logistics: Re-blend process
else Prehydrate
Engineer->>Logistics: Prehydrate process
end
Logistics->>BlendRequest: Crew Re-blend request
else No
Engineer->>Logistics:Notify the blend not Savageable
Logistics->>Logistics: Disposal process
Logistics->>BlendRequest:Create new blend request
end
BlendRequest->>BlendRequest: Regular process

```

### Integration and trigger Points

- Test Request creation 
  - Currently, test request is submitted from program. This may need to move to blend request creation. It will need to support multiple cuts/re-blend/prehydrate processes. Workflow? Maybe
- Blend Sample login
  - Blend sample data is available to populate blend sample list in Lab Database for the blend sample login process. Workflow?No
- Test Result Publish
  - Pass
    - RigJob testing status update. Workflow: Yes
    - Blend Request testing status update. Workflow: Yes
  - Fail
    - Engineer Approval Request Creation. Data model doesn't exist. New entity is needed.
- Client Approval Request
  - Blend Request blend testing status needs to be enhanced. Workflow: Yes
  - Client Approval Request Creation. Data model doesn't exist. New entity is needed.
- Client Approved
  - RigJob testing status update. Workflow: Yes
  - Blend Request testing status update. Workflow: Yes
- Client Decline
  - RigJob testing status update. Workflow: Yes
  - Blend Request testing status update. Workflow: Yes
  - Engineer Approval Request creation. Workflow: Yes

- Engineer Approved
  - Call Sheet blend update. Process TBD
  - Blend Request turn over
    - Prehydrate
    - Re-blend
- Engineer Decline
  - Blend Request testing status update. 
  - Blend dispose process TBD
  - New blend request creation.

- Blending progress within Test Request in Lab DB. Workflow: No



All trigger point may send out notification.

Approval form can be available on both a mobile notification and eService Applications.
