<!-- Identifier: I-01-03-AR-01-05 -->
Certainly! Below is the **full English text extraction** of the document **"Program_Request_Management_FRD 1.docx"**, with **all images replaced by textual descriptions** and the **original structure and content preserved**:

---

**Sanjel Energy Services**  
**Program Request Management Module**  
**Functional Requirements Document (FRD)**

---

### Table of Contents
1. Introduction  
2. High-Level Workflow  
3. Functional Requirements  
4. Non-Functional Requirements  
5. Reporting & Analytics  
6. Future Enhancements  

---

## 1. Introduction

**1.1 Purpose**  
This document defines the functional requirements for the Program Request Management Module. The system will automate and standardize the intake, assignment, prioritization, review, approval, and tracking of job design program requests.

**1.2 Objectives**  
- Streamline program request handling  
- Eliminate manual assignment of Engineers  
- Ensure approvals align with complexity matrix and service lines  
- Prioritize requests based on due date  
- Notify stakeholders at key stages  
- Maintain auditability and reporting for all requests  

**1.3 Scope**  
The system will support requests submitted by Sales, Clients, or Dispatch. It will integrate with FreshService or a new custom application, manage approvals per complexity matrix, and generate reports on request progress, classification, and outcomes.

---

## 2. User Roles

**2.1 Sales / Dispatch**  
Responsibilities:
- Submit program requests via email forwarding or portal form  
- Attach supporting documents (stick diagrams, licenses, client data)  
- Receive acknowledgement and completion notifications  
- Access program status visualization to track request progress  
- Review program once approved for pricing or client submission  

Permissions:
- Create requests  
- View status of their submitted requests  
- Download final program documents  
- Search requests by client, date, or Program ID (limited to their submissions)

**2.2 Engineer**  
Responsibilities:
- Receive auto-assigned program requests  
- Draft, revise, and prepare job design programs  
- Trigger auto reviewer or Approval Assignment/Notification to mapped Agent  
- Address review/approval comments and resubmit programs  
- Upload final versions of program documents  

Permissions:
- View and edit assigned requests  
- Upload and manage draft documents  
- View Review/approval history for their programs  
- Search requests within their assigned clients

**2.3 Manager – Engineering**  
Responsibilities:
- Assign requests without a mapped Engineer  
- Oversee Engineer workload distribution  
- Review and approve job types with yellow and red matrix scores  
- Ensure timely resolution of urgent or escalated requests  

Permissions:
- View all program requests across service lines  
- Override auto-assignment rules if needed  
- Approve/reject requests according to matrix rules  
- Generate workload and performance reports

**2.4 Director / VP (Sales & Engineering)**  
Responsibilities:
- Provide top-level approval for **Black** matrix programs  
- Oversee compliance with approval rules  
- Review metrics for program performance and approval cycles  

Permissions:
- Approve/reject high-complexity (Black) requests  
- Access full system reports and analytics  
- View historical program archives across service lines

**2.5 Approvers (Peer / Lead / Manager / Director) Engineers**  
Responsibilities:
- Review assigned programs based on matrix color  
- Approve or reject with comments  
- Ensure compliance with standards before release  

Permissions:
- Approve/reject requests with role-based visibility  
- Add review notes  
- View program lifecycle and history

**2.6 Operations / Field Team**  
Responsibilities:
- Access approved programs for execution  
- Download final PumpingPDFPrograms for field operations  
- Provide feedback into system for continuous improvement  

Permissions:
- Read-only access to approved requests  
- Search historical programs by client, location, or service line

**2.7 System (Fresh Service / Custom App)**  
Responsibilities:
- Auto-assign requests based on mapping  
- Generate Program IDs  
- Send notifications at each workflow stage  
- Track timestamps for all lifecycle events  
- Log all actions for audit purposes  

Permissions:
- Full automation rights  
- Access to all system data for reporting and analytics

---

## 3. High-Level Workflow

1. Sales/Dispatch submits a program request  
2. System logs the request and generates a Program ID  
3. Request is auto-assigned to the correct Engineer based on company mapping  
4. Request is prioritized based on due date and matrix color  
5. Request undergoes reviews/approvals according to matrix rules  
6. Notifications sent to Sales, Engineers, Approvers  
7. Approved program is returned to Sales or directly to Client  
8. Program is archived and logged in database

---

## 4. Functional Requirements

**4.1 Request Intake / Metadata Fields**  
System shall support request submission via:
- Email forwarding (to: **help_6@sanjel.freshservice.com**)  
- Web portal form  

Standard Fields (from FreshService):  
Subject, Requester, State, Status, Priority, Assigned To, Department, Source, Created Date, Due Date, Closed Date, Approval Status, etc.

Required Custom Fields:
- Client  
- Request Type (e.g., program generation, RFP, revision, simulation, RFI, RFQ)  
- Program Type (Surface, Intermediate, Production)  
- Complexity Matrix (CM) Color  
- Service Line (Primary, Remedial, Stimulation, Infrastructure)  
- Rig Name and #  
- Well Location / Pad Name / Area Name  
- Time to Complete (Days)  
- Late (Yes/No)  

Field Display Customization:
- Users can select which fields to display in their task view  
- Each user’s view is customizable and independent

**[Image Description: A screenshot showing a field selector interface with checkboxes for customizing visible columns in a task list]**

**4.2 Request Summary in Subject Line**  
When a request is submitted via email or form, the system shall generate a dynamic subject summary including:
- Client name  
- Request type  
- Service line  
- Unique identifier (e.g., LSD or pad)  
- Bid indicator (if applicable)  

This replaces the static subject line for better visibility.

**[Image Description: A screenshot of a ticket list showing dynamic subject lines with client name, service line, and job type]**

**4.3 Ticket View Configuration**  
Engineers shall see a structured layout including:
- Details  
- Related Tickets  
- Tasks  
- Reviews  
- Approvals  
- Activity  
- Resolution (with notes)  
- Full email content  
- All attachments (emails + files)  

**[Image Description: A screenshot of a ticket view with tabs labeled Details, Tasks, Reviews, Approvals, Activity, Resolution, and Attachments]**

**4.4 Auto-Assignment**  
System maintains a **Company–Engineer mapping table**.  
Rules:
- If company exists → assign to mapped Engineer  
- If no mapping → assign to Manager–Engineering  
- If urgent or after hours → route to on-call Engineer  

Notifications:
- Email with clickable link  
- In-app notification

**[Image Description: A flowchart showing auto-assignment logic based on company mapping and urgency]**

**4.5 Prioritization**  
Priority is assigned based on due date:
- Urgent: <4 hours  
- High: Same day  
- Medium: Within 2 days  
- Low: >2 days  

**[Image Description: A mobile screenshot showing priority labels on a ticket list]**

**4.6 Review**  
When Engineer marks program as “sent for review”, system notifies assigned reviewers via:
- Email with link  
- In-app notification  

**4.7 Approvals**  
Approval workflow based on matrix color:
- Green → Peer Review  
- Yellow → Manager/Lead Review  
- Red → Manager Approval  
- Black → Manager + Director/VP Approval  

System logs:
- Date/time  
- Decision (approved/rejected)  
- Comments  

**[Image Description: A diagram showing approval flow by color-coded matrix]**

**4.8 Multi-Level & Multi-Job Approvals**  
Each job type in a request follows its own approval path based on matrix color.  
MVP: Highest authority can approve entire request  
Future: Job-by-job approval

**[Image Description: A table showing example of multi-job approval with different matrix colors]**

**4.9 Classification**  
Requestors must classify requests as:
- Bid  
- Price Quote  
- Awarded Work  

Used for reporting and conversion tracking.

**4.10 Document Management**  
Supports:
- Direct upload  
- External linking (eService, SharePoint)  
- Version history  
- Access during review/approval  
- Audit retention

**4.11 Status (Time Tracking)**  
System captures timestamps for each stage:
- Open  
- Received  
- Pending  
- In Progress  
- Completed  
- Awaiting Review  
- Reviewed  
- Awaiting Approval  
- Approved  
- Sent to Sales / Awaiting Pricing  
- Unacknowledged  
- Acknowledged  
- Sent for Review  
- Sent for Approval  

**[Image Description: A vertical timeline showing status transitions with timestamps]**

**4.12 Quantifying Requests**  
Engineers manually input **level of effort estimate** (hours or complexity score).  
Future: Auto-calculation based on job attributes.

**4.13 Service Line Differentiation**  
Requests are tagged with:
- Primary  
- Remedial  
- Stimulation  
- Infrastructure  

Determines approval workflow and reporting filters.

**4.14 Step-by-Step Visualization**  
System provides a **visual tracker** showing:
1. Request Received  
2. Assignment to Engineer  
3. Draft in Progress  
4. Under Review/Approval  
5. Approved / Rejected  
6. Ready for Pricing  
7. Executed / Lost Bid / Invoiced  

Users can toggle between high-level and detailed views.

**4.15 Search Functionality**  
Search filters include:
- Depth range  
- Temperature range  
- Products used  
- Geographic area  
- Client name  
- Program ID  
- Job type or matrix color  

Results:
- Return in <3 seconds  
- Sortable columns (date, status, client)

---

## 5. Non-Functional Requirements

- Integration: FreshService APIs or custom app  
- Usability: Auto-populate fields, simple interface  
- Performance: Ticket creation <2s, search <3s  
- Auditability: Log all actions, assignments, approvals, comments  
- Security: Role-based access control

---

## 6. Reporting & Analytics

- Turnaround Time (avg, by company/Engineer)  
- Program distribution by matrix color  
- Lost bids vs. won %  
- Workload by Engineer  
- Approval cycle duration  
- Requests by type: Bid, Quote, Awarded Work

---

## 7. Future Enhancements

- Automated prioritization engine  
- AI-driven Engineer assignment  
- Configurable workflows per service line  
- Granular per-job approvals for multi-job programs

---

如需将此内容导出为 **Word、PDF、Excel、Confluence 或 JIRA 格式**，或进一步拆分为 **用户故事 / 用例 / 测试场景**，请继续提出。