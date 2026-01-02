```mermaid
flowchart TD
    A[Engineering Upload JDT] --> B{Program Exists?}
    B -- Yes --> C[Duplicate detected]
    C --> D[Please re-import]
    B -- No --> E[Import successful]
    E --> F[Program ready]
```

