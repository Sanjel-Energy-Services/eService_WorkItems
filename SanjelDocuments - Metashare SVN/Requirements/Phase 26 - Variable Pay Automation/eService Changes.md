# eService Changes

## Pay Area is mandatory for job approval

1. Bonus Area is renamed as Pay Area and data list is updated to "E" and "W".
2. Within job approval, it is mandatory, data validation is enforced.



## Work Assignment  is mandator for field supervisor

 

1. "Job Bonuses" Section is renamed to "Work Assignments". 
2. Auto data populate is allowed by clicking "Reload" button, data is pulled from "Crew and Units" section above, which is from call sheet.
3.  Job Role is mandatory, "Supervisor","Operator" and "Support". By default it is calculated from Crew and Units information automatically. It can be corrected if calculation is not correct.
4. Work Type is mandatory. ,By default it is calculated from Job, Crew and Units information automatically. eService also supports manually data entry for field work assignment, e.g. Self Load, etc.
5. Eligible Standby Hours. This flag indicates that the customer agrees to pay standby hours, and the "Standby Hours" field will be enabled to allow enter data.
6. One Way or Two way. We have different pay rules based on one-way or two-way Travel distance or travel hours. The work assignment must be clearly flagged the entered distance and hour one-way or two-way.
7. MTS Number is optional, it is for reference to Product Haul, Equipment Haul, etc.
8. Description is optional, by default it carries from Crew and Units section description. Manual data entry and modification is allowed.



## Employee Work Assignment Summary Sheet

1. Employee Bonus Summary Summary Sheet is designed as Employee Work Assignment Summary Sheet.
2. Detail information has been enhanced to fit variable pay calculation needs.



## Add Programed Amount/Volume to product section for reference.

- Add a read-only field by blend amount, named Programmed Amount/Volume.
- This field carries the blend amount/volume imported from program template through call sheet, field ticket and approved ticket.



## Bug fix

- Exception while updating company information in the job on server.  (Under testing )