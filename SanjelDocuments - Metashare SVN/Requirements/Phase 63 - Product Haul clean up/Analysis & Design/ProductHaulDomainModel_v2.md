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
ShippingLoadSheet "0..*"-->"0..1"RigJob
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
### Product Haul State Machine

```mermaid
stateDiagram
s1: Scheduled
s2: Loading
s3: Loaded
s4: InPorgress
s5: OnLocation
s6: Returned
[*]-->s1
[*]-->s5
s1-->s2 : Load Blend to Bulker,Partial loaded
s2-->s3 : Load Blend to Bulker,Full loaded
s1-->s3 : Load Blend to Bulker,Full loaded
s3-->s4
s4-->s5 
s5-->s6 
s5-->[*]
s6-->[*]
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