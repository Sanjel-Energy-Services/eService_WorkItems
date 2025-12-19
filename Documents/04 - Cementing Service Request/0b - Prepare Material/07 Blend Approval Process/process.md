<!-- Identifier: P-04-0b-07-03 -->
<!-- Name:  Blend Approval Process -->

```mermaid
flowchart TD
    A[Start: Blend Approval Process]-->R[Lab reviews test results]
    R --> D{Decision}
    D -->|Approved| N1[Notify Logistics Dispatch: Blend Approved]
    D -->|Not Approved| F[Fail Blend Process]
    N1 --> Z[End]
    F --> Z[End]
```
