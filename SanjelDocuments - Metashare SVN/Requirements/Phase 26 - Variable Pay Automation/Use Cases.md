# Variable Pay Use Cases

## Definitions

- Hours of Service,  A.K.A. Length of the time for the job: From On Location Time to Off Location Time.
- Variable Pay Area: The well location that the job is completed (east or west of the 5th meridian).
- Variable Pay Position:  job position performed on job not the HR position held.
- Job Revenue: Approved ticket revenue.
- One way travel time: Crew travel from camp to well site location
- Two way travel time: The total time that the crew set out from camp and return to camp.
- One way travel distance: Crew travel from camp to well site location.
- Two way travel distance: The total distance that the crew set out from map and returned.
- Job Date: The date of crew is on location.
- Variable Pay Schedule: the rule set of the variable pay calculation to employee's work activities.





## eService Use Cases

### Dispatch

- When dispatch schedule a job, crews must be assigned from Rig Board. The crew information will be populated in Call Sheet



### Supervisor
- Supervisor loads  work assignments.
  - When supervisor creates a job package from a call sheet, all on site units and crew information will be populated in Crew and Units section. These information are carried over from Call Sheet. 
  - Supervisor needs to update the information in Crew and Units section as usual.
  - Supervisor can click on "Reload" button in Work Assignments section. eService will create work assignments based on the Crew and Units section data.
    - Each work assignment is for one employee on one work type. If an employee has hauled blend twice for a job, there will be two work assignments for him.
    - Work Assignment has following fields populated according to determined work type.
      - Employee Name
      - HR Position
      - Job Role
      - Work Type
      - Start Time (default as On Location Time)
      - End Time (default as Off Location Time)
      - Eligible Standby Hours?
      - Working Hours
      - Standby Hours
      - One Way? or Two Way?
      - Travel Distance
      - Travel Hours
      - MTS Number
      - Load Quantity
      - Description
- Supervisor updates a work assignment.
- Supervisor adds a new work assignment.
- Supervisor prints Employee Work Assignment Summary Sheet



### Manager

- Manager Approves Job Package. (Only newly added use case)

  - Manager enter pay area
  - Manager toggles if a job belongs to Multiple Well Project.
  - Manger toggles if a job meets Crew Efficiency Bonus criteria.
  - Manager reload work assignments if Crew and Units is changed.
  - Manager updates a work assignment.
  - Manager adds a new work assignment.

- Manager prints Employee Work Assignment Summary Sheet

  

### System (eService)

- Once a job is approved, System will sync all work assignments in job package to work assignment database.
- After the work assignments are synced to work assignment database, System will calculate pay entries(s) according to pay schedules and sync to Variable Pay App.



## Variable Pay App Use Case

### System (App)

- App displays pay entry list filtering by Pay Period, Service Point, Service Line.
- App displays employee pay summary list filtering by Pay Period, Service Point and Service Line.
- App displays pay period summary list filtering by Service Point and Service line.


### District Admin

- DA enters a pay entry based on submitted evidence, pay entry is saved in Pending status. Pay Entry has following columns:
  - Employee
  - Customer
  - Ticket Number (Job Number)
  - OVPP# (MTS Number, etc)
  - Job Date
  - Job Province
  - Pay Position
  - Pay Area
  - Pay Type
  - Revenue
  - Hours (Travel Hours, One Way  or Two Way determined by Pay Type;  Or Standby Hours determined by Pay Type)
  - Km (Travel Distance, One Way  or Two Way determined by Pay Type)
  - Load Quantity
  - Comments
  
- DA view a list of Pay Entry of a service point and a pay period. In

- DA adds a pay entry in Employee's 

- DA edits a pay entry. If the pay entry was approved, it will be changed to pending once being modified.

- DA deletes a pay entry or a batch of pay entries.

- DA views a list of Employee Pay Statement of a service point and a pay period.

  - Each employee has one row of his earnings by category and total amount within one pay period summary. Pay statement is home service point based.

- DA views a list of Pay Entry of an employee, a pay period, a service point and a service line.

- DA moves an employee's pay entries from one pay period to another.

- DA views a list of pay period summary of a service point and pay period.

  - Pay Period summary is home service point based.

- DA cut off a pay period of a service point and a service line.

- DA reopens a pay period of a service point and a service line.

- DA adds extra pay period.

  

### District Manager


- Manger view a list of Pay Entry of a service point, a service line and a pay period.
- Manager approves a pay entry or a batch of pay entries.
- Manager edits a pay entry. If the pay entry was approved, it will be changed to pending once being modified. The pay entry needs to be approved explicitly.
- Manager views a list of Employee Pay Summary of a service point, a service line and a pay period.

- Manager approves an employee's Pay Summary or a batch of Employee Pay Summaries.
- Manager approves a Pay Period Summary of a service point.



