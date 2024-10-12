# Variable Pay Automation Requirement



## High Level Solution Discussion

The solution would utilize existing technology as much as possible.

- Manager approval to happen in eService, during ticket approval
- Preview of bonus amounts available to manager when approving
- Corrections would happen in eService to keep all data consistent
- Possibly need to create interface for manager or DA to make  changes to job ticket
- Current variable pay  sheet in eService would need to change
- Would create a flexible solution with each type of variable pay as a Variable Pay Component
- Phased approach. Start with variable pay, then address OVPP types in subsequent releases if possible and desired
- Excel sheets would remain in place for pay types that have not been     automated.

 

Attached are the current Variable Pay Calculator. And the primary and Remedial bonus documents from HR.

 

Note: Please use variable pay when naming items and not to refer to anything as bonus. 

 

## Variable Pay Factors



- Hours of Service
- Revenue - Service Ticket Amount (Approved)
- Job Quality and Execution Compliance
- Health, Safety & Environment incidents and performance
- Number of Customer jobs completed



## Business Process

Not change business process in earlier stages.





## Detail Design

- Improve data accuracy related to Variable Pay calculation in eService.
- Implement approval for above data in eService.
- Rename existing Job Bonus section for Variable Pay data management. The initial data is imported from Unit/Personnel  Section. Manager may modify data while approving the job, includes:
  - Job Position
  - Travel Km
  - Standby Hours

- Mechanism to componentize the Variable Pay modules, this will decouple the calculation for each compensation or incentive type, provide a flexibility for future business optimization.

- Necessary master data implementation

- Possible manual modification user interface may be needed.

- Payment schedule is needed to export payroll statement



## Phase 1 - Revenue based Variable Pay 



### Acceptance Criteria

1.  Master Data implementation.  Related master data needs to be implemented, maintenance user interface and API are needed.
   - Job Position
   - Variable Pay Schedule
   - Variable Pay Area
   - Variable Types - this is indicator for different variable pay component. 
2. Manager can modify job position in eService Variable Pay section.
3. Variable Pay can be calculated based on eService Variable Pay section data.
4. Manager can preview bonus calculation during approval
5. Variable pay calculation API to feed eService Data to Variable Pay Calculator, parameters include date range, district.

### Tasks

1. Solution design - 40 hours
2. Master Data Model implementation - 20 hours.
3. Variable Pay component implementation - 60 hours. 
4. eService modification - 20 hours.
5. Variable pay calculation API  -  30 hours.
6. Variable Pay Calculator modification - 20 hours.
7. Deployment and test - 40 hours.
8. Existing BI enhancement - ?



### Limitation

There are limitations due to data missing or not being verified in eService, these are not considered in above estimation.

- Failed job, coded 9000. This flag was disabled in current eService version. Variable Pay cannot disabled without this flag.
- Multiple well project. We don't have an effective identifier for multiple well project in eService.



## Questions

1. For monthly job count incentive, 
   - Will failed jobs and incomplete jobs be counted? 
   - Will multiple well project jobs in a single day  be counted as one job? Or each job be counted individually?
2. How to calculate working hours for multiple well project in a day - for a single client (24 hours)? Is it for a calendar day? Or just consecutive 24 hours? Which time point need to be used as start time?  