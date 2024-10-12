# Haul Blend

```mermaid
flowchart TD
A([A. Haul Blend])-->B[B. Get Blend Request Info]
B-->C{{C. Found Blend Request?}}
C--Yes-->D[/D. Populate Blend Request Info needed for MTS/]
C--No-->E[/E. Enter Info needed for MTS\]
D-->F{{F. Is the Blend Request Correct?}}
F--Yes-->M[M.Set Haul Amount]
F--No-->H{{H. Is correct Blend request available?}}
H--No-->I[I. Set No Blend Requst]
H--Yes-->J[J. Select correct Blend Request]
I-->E
J-->D
E-->M
M-->G[[G. Set Crew schedule]]
G-->K[K. Create Product Haul]

K-->L([L. End])


```

## Use Case Scenario Breakdown

Precondition must satisfy all decision nodes' requirement.

### Haul Blend on Rig Job Blend

Start point is on the available blend request in the menu. 

```mermaid
flowchart LR
A((A))-->B((B))-->D((D))-->M((M))-->G((G))-->K((K))-->L((L))

```
```mermaid
flowchart TD
A([A. Haul Blend on Rig Job Blend])-->B[B. Get Blend Request Info]
B-->D[/D. Populate Blend Request Info needed for MTS/]
D-->M[M.Set Haul Amount]
M-->G[[G. Set Crew schedule]]
G-->K[K. Create Product Haul]
K-->L([L. End])


```

### Haul Blend On Bulk Plant Bin

#### Bin Information has last blend request id and it is the correct one.

```mermaid
flowchart LR
A((A))-->B((B))-->C((C))-->D((D))-->F((F))-->M((M))-->G((G))-->K((K))-->L((L))
```
#### Bin Information has last blend request id and it is not correct one and correct one is available in the list.

```mermaid
flowchart LR
A((A))-->B((B))-->C((C))-->D((D))-->F((F))-->H((H))-->J((J))-->D1((D))-->F1((F))-->M((M))-->G((G))-->K((K))-->L((L))
```
#### Bin Information has last blend request id and it is not correct one and correct one is not available in the list.

```mermaid
flowchart LR
A((A))-->B((B))-->C((C))-->D((D))-->F((F))-->H((H))-->I((I))-->E((E))-->M((M))-->G((G))-->K((K))-->L((L))
```
#### Bin Information doesn't  has last blend request id and correct one is not available in the list.

```mermaid
flowchart LR
A((A))-->B((B))-->C((C))-->D((D))-->F((F))-->H((H))-->I((I))-->E((E))-->M((M))-->G((G))-->K((K))-->L((L))
```

