```mermaid
graph LR

classDef compeleted  fill:green,color:white,font-weight:bold,stroke-width:2px,stroke:yellow
classDef halfdone  fill:yellow,color:black,font-weight:bold,stroke-width:2px,stroke:red
A[Schedule blend request from call sheet Update]
B[Blend Calculator Upgrade]
C{{BPAVS Blending}}
D{{BPAVS Post back}}
E[("Bin/Blend<br/>Database")]
F[Schedule blend from program]
G[Schedule blend transfer request]
H{{BPAVS transfer}}
I[Movement Journal Integration]
J[/BPO enter blend sheet/]
K[Electronic MTS]
L[/Enter Product Sale in program/call sheet/]
P[Call sheet/Job package decoupling]
M[Request blend by modifying existing blend]
N[BP Variable Pay]
O[Bulk Plant storage numbering]
Q[(Load<br/>Sheet<br/> Database<br/>Upgrade)]
R[UI for scheduling blend without call sheet]
S[Blend/Load decoupling]
T[Scheudle product transfer]
U{OR}
V[/Manual blending/]
W[/Manual transfer/]
X[Storage Tracking]
Y[Load Blend]
Z[Haul Blend]
Z:::halfdone-.->S
Y:::compeleted-.->S
Q-.->S:::compeleted
A:::halfdone-.->L:::compeleted
L-.->P:::compeleted
A-.->S
H-.->Q
K-.->E:::halfdone
C-.->Q:::compeleted
D-.->C:::compeleted
G-.->R:::halfdone
E-.->U
F:::compeleted-.->R
I-.->E
D-.->H
N-.->I
T-.->R
S-.->O:::compeleted
U-.->J
U-.->D:::halfdone
V-.->Q
J-.->V
W-.->Q
J-.->W
X-.->E
Z-.->Y
R-.->M
R-.->S
M-.->B:::halfdone

```



Goal

- Every batch blend has a blend request
- Fail blend request should be generated from a blend request
- Every batch blend offload  destination should be captured
- Every blend/product haul transfer/haul needs to be captured
- 
