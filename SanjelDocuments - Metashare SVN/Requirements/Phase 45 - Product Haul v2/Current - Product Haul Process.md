# Product Haul Process 



## Scenarios

### 1. Schedule blend haul from a Rig Job Blend

**Precondition**:

- Rig Job is in Pending, Confirm, Scheduled, Dispatch or In Progress status

  

```mermaid
graph TD
A["Start<br>1"] --> B["Dispatch choose a blend from a job"] 
B-->B1["Dispatch click &quot;Schedule Product Haul&quot;"]
B1 --> C["Dispatch enter the blend amount"]
C-->R["Dispatch mark Blend Testing flag if needed"]
R-->C1["Dispatch choose a Bulk Plant"]
C1-->D["Dispatch fill out the destination storage and load amount"]
D-->E["Dispatch determine if this blend will load to an existing haul"]
E--Yes<br>1.1-->F["System get existing scheduled hauls"]
F-->G["Dispatch choose an existing haul"]
G-->S
E--No<br>1.2-->H["Dispatch choose a Sanjel/Third Party bulker crew"]
H-->I["Dispatch set pod allocation"]
I-->K["Dispatch determine if the haul will go with crew"]
K--Yes<br>1.2.1-->L1["Dispatch set up estimate load time"]
K--No<br>1.2.2-->L["Dispatch set up expected on location times"]
L-->L1
L1-->S["System generates blend breakdown and load sheet"]
S-->T["System generates crew schedule"]
T-->U["System generate ship loading sheet"]

```

**Post condition**

- Blend Request is created (ProductHaulLoad)
- Product Haul, shipping loading sheet, crew assignment and schedule are created (ProductHaul, RigJobSanjelCrewSection, SanjelCrewSchedule, ThirdPartyCrewSchedule, ShippingLoadSheet, BlendUnloadSheet,)
- Blend Breakdown Sheet and Load Sheet can be printed from "Product Haul" board
- Blend Breakdown Sheet and Load Sheet are available in BPAVS
- *Material Transfer Sheet (MTS) can be printed from "Product Haul" board* -- not implemented yet.
- Blend color coding on RigBoard is changed according to the status of all blend requests and product hauls over this blend



### Bulk Plant Process

```mermaid
graph TD
A["Start"]-->B["BPAVS retrieve load sheets"]
B-->C["BPO choose one load sheet to process blend"]
C-->C1["BPO notifies dispatch blending"]
C1-->C2["Is the blend for product Haul"]
C2--No-->D["BPO review load sheet and fill in destination storage"]
C2--Yes-->D1["BPO fill in pod allocation if needed"]
D1-->I["BPO print MTS"]
I-->E["BPO use BPAVS to mix blend "]
D-->E
E-->K["BPAVS update load sheet status as Blend Completed"]
K-- Not Product Haul-->H1["BPO load the blend from Blend Train to storage"]
K--Is a Prodcut Haull -->H2["BPO load the blend from Blend Train to bulker"]
H2-->J["BPO leave MTS to bulker driver"]
J-->L["System update load sheet status as Blend Loaded"]
H1-->M["System update load sheet status as Stored"]
```

### 3. Schedule a blend for a job and load to a bin attached to bulk plant awaiting blend test (Has call sheet)



#### Dispatch Process

```mermaid
graph TD
A["Start"] --> B["Dispatch choose a blend from a job"] 
B --> C["Dispatch enter the blend amount"]
C-->D["Dispatch choose the storage which the blend will be transferred to"]
D-->L["System generates blend breakdown and load sheet"]
L-->M["Dipatch email pdf documents(program, callsheet,load sheet) as load request to BPO"]
M-->N["BPO confirm the request is recieved"]

```

#### Bulk Plant Process

```mermaid
graph TD
A["Start"]-->B["BPAVS retrieve load sheets"]
B-->C["BPO choose on load sheet to process blend"]
C-->C1["BPO notifies dispatch blending by update load sheet status to BLENDING"]
C1-->D["BPO set cuts"]
D-->E["BPAVS set cut sheet based on cuts and material feeding rules"]
E-->F["BPO feed material int to Blend Tank 1 by following cut sheet"]
F-->G["Transfer material to Blend Tank 2"]
G-->R{"Is last cut?"}
R--Yes-->I["BPO notifies dispatch blend complete by update load sheet status to BLENDCOMPLETED"]
R--No-->E
I-->H["BPO transfer the blend from Blend Train to storage in Bulk Plant"]
H-->J["Load sheet set as Quarantined"]
J-->K{Need Testing?}
K--Yes-->M[[Lab Process]]
K--No-->N[[Haul Blend Process]]
```

#### Lab Process

```mermaid
graph TD
A["Blend Needs Testing"]-->B["BPAVS will take samples and send test requests to Lab Testing Database(Requested)"]
B-->C["Lab run test trough iterations until meets criteria(Testing) and send load sheet status as TESTING"]
C-->D{"Is testing passed?"}
D--Yes-->E["Set load sheet status as PASS"]
D--No-->F["Set load sheet status as FAIL"]
F-->G["Approval for use as is"]
E-->I["Set load sheet status as READY"]
I-->H[[Haul Blend Process]]
G-->J{"Approved us as is?"}
J--Yes-->I
J--No-->K[[Fault Blend Process]]
```



### 4. Schedule a haul to transfer pre-blended blend to a bin attached to a rig for a job (Has call sheet)

