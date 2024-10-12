## Workforce Readiness App Domain Model

```mermaid
classDiagram
class Employee
class Plan{
string Name
string Description
bool IsActive
PlanType PlanType
Employee CreatedBy
DateTime CreatedOn
}
class PlanItem{
Plan Plan
string Detials
string Description
bool isLMSItem
longString LMSCourseID
longString DocumentLink
bool IsActive
TrainingAdmin CreatedBy
DateTime CreatedOn
}
class AssignedPlan{
Plan Plan
DistrictAdmin AssignedBy
Employee AssignTo
DateTime DateAssigned
Employee DistrictManager
DateTime CompletedDateTime
DistrictManager ApprovedBy
Enum ApprovalStatus
DateTime ApprovalDateTime
DateTime ApprovalSentDateTime
bool IsActive
}
class AssignedPlanItem{
string Name
bool IsRequiredForProfessional
long string LMSCertificate
Employee SignedOffBy
DateTime SignedOffDateTime
Employee CompletedBy
DateTime CompletedDateTime
Enum PlanItemStatus
}
class AssignedPlanComment{
string Comments
Employee CreatedBy
DateTime CreatedDateTime
}
class AssignedPlanNotification{
AssignedPlan AssignedPlan
Employee SentBy
string Notification
Employee SentTo
}
class AssignedPlanMentor{
AssignedPlan AssignedPlan
Mentor Mentor
DistrictAdmin AssignedBy
}
class DistrictManager
class Mentor
DistrictManager--|>Employee
Mentor--|>Employee
Training Admin--|>Employee
District Admin--|>Employee
Plan *-- PlanItem
Plan --> PlanType
AssignedPlan --> Plan
AssignedPlan ..> DistrictAdmin:AssignedBy
AssignedPlan ..> DistrictManager:ApprovedBy
AssignedPlan --> Employee:AssignTo
AssignedPlanItem-->PlanItem
AssignedPlanItem..>AssignedPlanMentor:Sign Off By
AssignedPlanComment-->AssignedPlan
AssignedPlanNotification-->AssignedPlan
AssignedPlanMentor "0..*" --> "1" AssignedPlan
AssignedPlanMentor "0..*" --> "1" Mentor: Assigned To
AssignedPlanMentor ..> DistrictAdmin: Assigned By
PlanItem..>TrainingAdmin: Created By
Plan..>TrainingAdmin: Created By
AssignedPlanComment..>Employee:CreatedBy
AssignedPlanNotification..>Employee:CreatedBy
AssignedPlanItem ..> AssignedPlan: Reference
AssignedPlanItem ..> PlanItem: Reference

```
## AssignedPlanItem Life Cycle


```mermaid
stateDiagram
state "Assigned" as s1
state "InTraining" as s2
state "Completed" as s3
state "SignedOff" as s4
[*] --> s1
s1-->s2 :Mentor train employee
s2-->s3: Employee gain competency
s3 -->s4:Mentor sign off item
s1-->s3: Employee acknowlege competency


```

## AssiginedPlan Life Cycle


```mermaid
stateDiagram
state "Assigned" as s1
state "InProgress" as s2
state "Completed" as s3
state "Approved" as s4
[*] --> s1
s1-->s2 :Training is Started
s2-->s3: All items are completed
s3 -->s4:District Manager Approval
s4-->s2: Training Admin revoke approval


