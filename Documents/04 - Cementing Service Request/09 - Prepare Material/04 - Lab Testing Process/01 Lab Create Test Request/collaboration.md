<!-- Identifier: C-04-09-04-01 -->
<!-- Name:  Lab Create Test Request -->

##### Lab Technician Create Test Request

```mermaid
sequenceDiagram
actor LabTec as Lab Technician 
box Lab Database App
participant TestRequest
end


LabTec->>TestRequest: Manually Create Test Request
TestRequest->>TestRequest: Set Status as Ready
TestRequest-->>LabTec: WF Notification of test request

```

##### Engineer Submit Test Request

```mermaid
sequenceDiagram
actor LabTec as Lab Technician 
box Lab Database App
participant TestRequest
participant Hangfire
participant TestRequirement
end
box eServiceOnline
participant BatchRequest
end
actor Engineer

%%LabTec->>TestRequest: Manually Create Test Request
%%TestRequest->>TestRequest: Set Status as Ready
%%TestRequest-->>LabTec: WF Notification of test request
Engineer->>Hangfire: Drop Test Request from Template
Hangfire->>TestRequest: import test request


alt Non-Field Blend Test
  TestRequest->>TestRequest: Create TestRequest
  TestRequest->>TestRequest:Set Status as Ready 
  %%BatchRequest->>BatchRequest:Set TestingStatus as None
  TestRequest-->>LabTec: WF Notification of test request
else Field Blend Test
  TestRequest->>TestRequirement: Create TestRequirement
   TestRequirement->>BatchRequest: Matching BatchRequest 
    TestRequirement->>TestRequest: Create Test Request for matched Batch Requests 
    TestRequest->>TestRequest:Set Status as pending
alt At least one sample is scanned
    TestRequest->>TestRequest: Set Status as Ready
    %%BatchRequest->>BatchRequest:Set TestingStatus as Ready
  else All samples not scanned
    TestRequest->>TestRequest: Set Status as Pending
    %%BatchRequest->>BatchRequest:Set TestingStatus as Pending
  end
	TestRequest-->>LabTec: WF Notification of test request
end
```

### Logistics Dispatch Create Batch Request

```mermaid
sequenceDiagram
box Lab Database App
participant TestRequest
participant TestRequirement
end
box eServiceOnline
participant BatchRequest
end
actor Logi as Logistic Dispatch

Logi->>BatchRequest: Create Batch Request
    alt Need Field Blend Test
        BatchRequest->>TestRequirement: Find TestRequirement
           alt TestRequirement is found
                BatchRequest->>TestRequest: Create Test Request
                TestRequest->>TestRequest:Set Status as Pending
                %%BatchRequest->>BatchRequest:Set TestingStatus as Pending
                %%alt At least one sample is scanned
    %%TestRequest->>TestRequest: Set Status as Ready
 %% else All samples not scanned
   %% TestRequest->>TestRequest: Set Status as Pending
  %%end
  			else Test Requirement is NOT found
    			BatchRequest-->>Engineer: WF Notification "Submit Test Request"
          end
     else do not Need Field Blend Test 
        %%BatchRequest->>BatchRequest:Set TestingStatus as None
    end
 BatchRequest-->>Logi: WF Notification "Batch Request is Created"
```

### BPO blends a batch request

```mermaid
sequenceDiagram


%%actor Logi as Logistic Dispatch
actor BPO
%%actor Engineer
box Eservice Systems
   participant ESO as eServiceOnline
   participant BPAVS as BPAVS
   participant API as API
   participant LabDB as LabDatabase
    end
actor LabTec as Lab Technician
ESO-->>BPO:Notify Batch Request is created
BPO->>BPAVS: Confirm and Process a Blend
BPAVS->>BPAVS: Collect BlendSample(Blend Sample:Collected)
BPAVS->>API: Create Lab Sample Info if testing required (Pending)
API->>LabDB: Create Lab Sample Info (Pending)
 BPO->>LabDB: Ship Samples when Blending completed
 BPAVS->>BPAVS: Set Blend Sample status as Shipped
 ESO->>ESO:Set Batch Request TestingStatus as SampleSentToLab
LabTec->>LabDB: Scan Samples
LabDB-->LabTec:Confirmation of Status Update
LabDB->>LabDB: Set Test Request Status as Ready if it is Pending
%% ESO->>ESO:Set Batch Request TestingStatus as Ready
LabDB-->>LabTec: WF Notification of new test request
    
```



