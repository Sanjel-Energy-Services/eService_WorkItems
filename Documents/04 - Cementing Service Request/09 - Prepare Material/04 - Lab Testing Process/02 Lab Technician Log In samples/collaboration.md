<!-- Identifier: C-04-09-04-02 -->
<!-- Name:  Lab Technician Log In Samples -->

```mermaid
sequenceDiagram
    actor BPO as Buck Plant Operator
    box Eservice Systems
    participant BPAVS as BPAVS
    participant API as API
    participant LabDB as LabDB
    end
    
    BPO->>BPAVS: Process a Blend
    BPAVS->>BPAVS: Collect BlendSample(Collected)
    alt IsBlendTest = true
        BPAVS->>API: Create Lab Sample (Pending,**include the lab information**)
        API->>LabDB: Create Lab Sample Info (Pending,**include the lab information**)
        BPO->>LabDB: Ship Samples when Blending completed
    else IsBlendTest = false
        note over BPAVS: Do not create Lab Sample
        note over BPO,LabDB: Do not ship sample to Lab
    end
```



```mermaid

sequenceDiagram
    actor LabTec as Lab Technician
    box Eservice Systems
    participant LabDB as LabDatabase
    participant BPAVS as BPAVS
    end

    LabTec->>LabDB: Scan Sample
    LabDB->>LabDB: Find pending lab Sample by barcode
    alt Sample Found
        LabDB->>LabDB: Update lab Sample Status to Received
        LabDB->>BPAVS: Update Blend Sample Status to LabReceived
    else Sample Not Found
        LabDB->>LabDB: The sample status remains Pending
    end
    LabDB-->>LabTec: Confirmation of Status Update


```





