## Requirement Collection - Sanjel

- Normally business requirement will be registered as a ticket in eService_WorkItems.

## Workload Planning - Sanjel

- When a requirement ticket is assigned to Metashare team for future iteration, it will be assigned to eService Sustainment Project without status.

## Iteration Planning - Sanjel & Metashare

### Ticket triage - Sanjel

- When Sanjel is planning for a development iteration, the ticket will be moved to Backlog column. The iteration label will be set.

### Analysis - Metashare

- Metashare investigates the issue and clarify with Sanjel in ticket comments. Ticket body content should be updated once consensus is made.

### Design & Estimate - Metashare

- Metashare can break down big task to small tasks by creating new issues in the corresponding repositories. The parent task should be referenced in child tasks.
  - For example, if a feature requirement have functions across multiple repositories, it should be slitted to specific tasks in every repository.

- The parent task must be kept under eService_WorkItems as a shell to track the overall progress. The estimate hours and remain hours should reflect the total hours of its child tasks.
- The end tasks must be transferred to an application repository, so it can be linked to check-ins and pull requests.
- Every end tasks must have Estimate Hours filled in.

### Iteration Scoping - Sanjel

- Sanjel will review the task in back log per iteration, adjust the iteration label after evaluate the total estimate.



## Iteration Execution - Metashare

- When an iteration starts, Metashare needs to move all tickets for this iteration to Todo column.
- Team member picks up a ticket to work on, the ticket needs to be moved to In Progress column.
- Team member needs to update the remain hours by the end of day.  Remain hours is the latest estimate for the effort needed. It can be greater than original estimate.  
- Team member needs to accumulate the workhours when remain hours is updated in actual hours. 
- When a task is moved to Test column, the remain hours needs to be set as 0.
- When a task is moved by to In Progress column when the test fails, the new remain hours should be estimated right away.
- All non-development tasks can be add as an item in eService Sustainment Project without converting to an issue. The Estimate Hours, Remain Hours and Actual Hours rules apply.



## Project Management

- Metashare needs to monitor the total effort for current iteration to keep it under budget. 

- The final total hours will be the number for Sanjel payment, the details will be exported as attachment.

  

  