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