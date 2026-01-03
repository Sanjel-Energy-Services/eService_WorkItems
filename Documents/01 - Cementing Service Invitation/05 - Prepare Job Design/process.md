<!-- Identifier: P-01 -->
<!-- Name: Prepare Job Design -->

```mermaid
flowchart TD
    S([Start]) -->A1[Engineer Create Program JDT file]
    A1-->A[Engineering Upload JDT]
    A--> B{Program Exists?}
    B -- Yes --> C[Duplicate detected]
    C --> D[Please re-import]
    B -- No --> E[Import successful]
    E --> F[Program ready]
    F --> O([End])
    D --> O
    
```

