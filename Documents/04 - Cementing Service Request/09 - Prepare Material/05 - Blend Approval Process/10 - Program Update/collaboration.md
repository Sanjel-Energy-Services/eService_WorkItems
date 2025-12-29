<!-- Identifier: C-04-09-05-10 -->
<!-- Name: Program Update -->

```mermaid
sequenceDiagram
    participant Workflow
    actor Engineering
    participant eProgram
    participant eService
    participant RigBoard
    actor Dispatch
    participant JobStatus

    Workflow->>Engineering: 1 Request Program Update (Test Results Received)
    Engineering->>Engineering: 2 Clone original program template
    alt Is original program Multi-Well?
        alt Change applies to one job only?
            alt Is original program for this job?
                Engineering->>Engineering: 3A Increase Build Number by 1
            else Not original program for this job
                Engineering->>Engineering: 3B Enter Call Sheet Number
                Engineering->>Engineering: 3C Enter Build Number as 1
            end
            Engineering->>Engineering: 4 Update program per lab test result
            Note over Engineering,eProgram: Do NOT revise Master/Multi-Well template
            Engineering-->>eProgram: 5 Import revised program (Job specific)
        else Change applies to multiple jobs
            Engineering->>Engineering: 3 Increase program revision by one
            Engineering->>Engineering: 4 Update program according to test result
            Engineering-->>eProgram: 5 Import revised program
        end
    else Not Multi-Well
        Engineering->>Engineering: 3 Increase program revision by one
        Engineering->>Engineering: 4 Update program according to test result
        Engineering-->>eProgram: 5 Import revised program
    end
        eService-->>Dispatch: 6 Show 'Program Updated' on affected call sheet in eService
        RigBoard-->>Dispatch: 7 Show 'Program Updated' on affected call sheet on Rig Board
        JobStatus-->>Dispatch: 8 Show 'Program Updated' on affected call sheet on Rig Board
        Workflow->>Dispatch: 9 Acknowledge and proceed with updated program

```