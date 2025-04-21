```mermaid
sequenceDiagram
autonumber
actor Logistics
participant BlendRequest
participant FlushRequest
participant BulkPlantAPI
participant BPAVS
actor BPO
participant FlushRules

Logistics->>BlendRequest: Schedule
BlendRequest->>FlushRules: Check 
BlendRequest->>BlendRequest: Pre-determine if flush is required
BPAVS->>BulkPlantAPI: GetScheduledProductHaulLoadList
BPO->>BPAVS: Select a blend request for processing
BPAVS->>BulkPlantAPI: GetProductHaulLoadById 
BulkPlantAPI->>BlendRequest: Get Blend Request
alt Flush is not Required
BlendRequest-->>BulkPlantAPI: Return the blend request (BR 2)
BulkPlantAPI-->>BPAVS: Return the blend request (BR 2)
BPO->>BPAVS: Proceed blending (BR 2)
else Flush is required
BlendRequest->>BlendRequest: Find previous blend request (BR 1)
BlendRequest->>FlushRules: Check 
alt Flush is not Required
BlendRequest-->>BulkPlantAPI: Return the blend request (BR 2)
BulkPlantAPI-->>BPAVS: Return the blend request (BR 2)
BPO->>BPAVS: Proceed blending (BR 2)
else Flush is required
BPAVS->>BPO: Notify the flush is required.
alt Flush Now
BPO->>BPAVS: Confirm the material for flush and offload silo.
BPO->>BPAVS: Flush Now
BPAVS->>BulkPlantAPI: Flush Now (with material and offload silo)
FlushRequest-->>BulkPlantAPI: Return the flush request (BR 3)
BlendRequest->>FlushRequest: Create a flush request (BR 3)
BulkPlantAPI-->>BPAVS: Return the flush request (BR 3)
BPO->>BPAVS: Flush as normal blending (BR 3)
Note right of BPO: Go back to step 5
else Not flush
Note right of BPO: Go back to step 5
end
end

end

```





### Flush Request Explanation



- Flush Request is a special type of Blend Request
- Flush Request can be processed as same as Blend Request in BPAVS
- Auto-generated Flush Request is linked to the Blend Request required flush. Information can be copied from the Blend Request
- Flush Request can be created for flush purpose by BPAVS independently. Do we have this use case?
- Flush Request can be used to generate movement journal