# Product Haul Component



## Definitions

### Storage Vessels

- Bulk Plant Storage – any storage resides in the Bulk Plant. We need to number them and enter in the system, both eServiceOnline and BPAVS will  reference same list of storage.
- Project Storage - remote storage for blended product that is NOT assigned to a rig. I assume most of these storages have bin number. We need to number the rest.
- Rig Storage – storage assigned to a rig. All of these storages have bin number.

### Blend Request



### Product Haul

## Systems in Collaboration

### eServiceOnline



### eService



### BPAVS





## Implemented Scenarios



### 1. Schedule blend haul to a bin attached to a rig for a job (Has call sheet)

- Existing Rig Board function

### 2. Schedule blend haul to a job go with crew (Has call sheet)

- Existing Rig Board function

### 3. Schedule a blend for a job and load to a bin attached to bulk plant awaiting blend test (Has call sheet)

 - Need to number silos/bins in Bulk Plant
 - Treat Bulk Plant as Rig, the silos and bins can be attached to Bulk Plant
 - Need blend database to store the blend information

### 6. Schedule a blend haul for a project to a storage attached to a rig (No call sheet)

- Need program to provide recipe
- Or blend database is needed for storing recipe
- Combination of Scenario 7 and Scenario 15, mechanism is similar to Scenario 1

### 

## Pending Development Scenarios



### 4. Schedule a haul to transfer pre-blended blend to a bin attached to a rig for a job (Has call sheet)

- Need blend database to store the blend information associated to the call sheet.
- Select bulker (Sanjel or 3rd Party)
- Scenario 1 is one step of Scenario 3 and 4 
- Mock S4-1, All blend in test are listed under one second level sub menu,  third level sub menu show passed blend as enabled, still testing blend as disabled. 
  - Before we have functions to update test status, all blends are enabled. Dispatch manage them manually.

### 5. Schedule a haul to transfer pre-blended blend to go with crew (Has call sheet)

- Need blend database to store the blend information associated to the call sheet.
- Select bulker (Sanjel or 3rd Party)
- Scenario 2 is one step of Scenario 3 and 5
- Mock S4-1 support this scenario

### 7. Schedule a blend and transfer to a bin attached to bulk plant (No call sheet)

- Need to number silos/bins in Bulk Plant
 - Treat Bulk Plant as Rig, the silos and bins can be attached to Bulk Plant
 - Need program

### workaround- 8. Schedule a blend for product sale with customer's recipe and haul to customer's location (Has call sheet)

- Need customer's recipe to be entered in program and call sheet is created from the program.
- Select bulker  (Sanjel or 3rd Party)
- Free-text loading destination (Location)
- Call Sheet doesn't have a rig, need to create a fake rig for customer. Then the  process will be same as job blend haul.
- May need break down to blend and haul two steps

### workaround- 9. Schedule a blend for product sale with customer's recipe and load to customer's bulker (Has call sheet)

- Need customer's recipe is entered in program and call sheet is created from the program.
- Free-text destination (Bulker) , add customer bulker as third party bulker
- Call Sheet doesn't have a rig, need to create a fake rig for customer. Then the  process will be same as job blend haul.

### workaround-10. Schedule a blend for product sale with Sanjel blend recipe and haul to customer's location (Has call sheet)

- Need program and call sheet is created from the program
- Select bulker (Sanjel or 3rd Party),add customer bulker as third party bulker
- Call Sheet doesn't have a rig
- May need break down to blend and haul two steps

### workaround-11. Schedule a blend for product sale with Sanjel blend recipe and load to customer's bulker (Has call sheet)

- Need program and call sheet is created from the program
- Free-text loading destination (Bulker)
- Call Sheet doesn't have a rig
- May need  break down to blend and haul two steps upon customer request sample testing

### workaround-12. Schedule a neat blend for product sale and haul to customer's location (Has call sheet)

- Need program and call sheet is created from the program
- Call Sheet doesn't have a rig 
- This may be treated as same as 10, no blending process will be handled by BPAVS

### workaround-13. Schedule a neat blend for product sale and  load to customer's bulker (Has call sheet)

- Need program and call sheet is created from the program
- Call Sheet doesn't have a rig

- This may be treated as same as 10, no blending process will be handled by BPAVS

### Not in scope - 14. Schedule a blend by using a previous blend to modify into a new blend. (Has call sheet, may apply to 1, 2,3,10,11)

- Need blend database to storing the historical blend records also for the returned blend.
- Need blend calculator upgrade 

### 15. Schedule a haul for blended product from one location to another (Bulk Plant storage or Project storage or Rig storage) (No call sheet)

- Need to number silos/bins in Bulk Plant
- Need blend database to storing the historical blend records also for the returned blend.
- Need blend information for the content stored in a bin/silo. 
- Same function as Scenario 4, but start points may be different 

### Not in scope - 16. Schedule a product transfer from one Bulk Plant to another (No call sheet)

- Similar to scenario 15, but for inventory product only.

###  Not in scope - 17. Return Cement from job into storage attached to bulk plant (Refer to Call Sheet)

- Need to number silos/bins in Bulk Plant
- Current process use original MTS to ship it back, BPO determine the storage and track it on whiteboard or spreadsheet tracker.

### Not in scope - 18. Pre-hydrated/Add-On-Fly additives load
- May be multiple load sheets, these additives are loaded once.



## Additional function discovered

- Load Request Board, specifically use the track load requests. 
- Auto-generate load request email





## Project Goal

- Implement blend schedule process to utilize blend calculator in most of scenarios

- Implement blend haul process for product transfer, product sale and blend quarantine needs

  

## Technical Goal

- Eliminate Call Sheet Export/Import 

- Decouple header and service line specific section to achieve more flexible solutions.

- Decouple blend request and shipping request in product haul to achieve more flexible solutions.

- Implement blend database for all blend using in jobs and also interim blends.

- Enhance blend calculator to handle preblended blend modification.

- Managing bulk plant storage in bin information systems.

- Implement storage master database with pod structure

  

## Design Ideas

- Upgrade concept "Rig" to "Operation Site", use same mechanism to process storage relations.

  - Add type to the entity
    - Operation Rig (Cement Jobs, Remedial Jobs)
    - Customer Site (for Product Sale, Project Camp )
    - Bulk Plant (Sanjel Bulk Plant)
  - Show Operation site on RigBoard as single RigJob on the bottom.
  - Schedule product transfer between Bulk Plant

- Upgrade concept Bin and Bulker as storage

  - Implement pod structure
    - Give the pod  unique identifier, can be referenced independently.
    - Add pod capacity information.
  - Implement bulk capacity reference
    - Bulk Density calculation
  - Add storage total capacity
  - Implement Storage Content Tracking
    - Implement pod level tracking
    - Overlap with blend database
    - Pop up operation page for storage tracking

- Program back tracing

  - Start from Bin attached to rig
    - Schedule same blend for same program
    - Find future program for same client if the bin is empty.
    - Business Gap: Program expected start date and expected rig not updated in system, has sent Jeff and Brett Henry to ask.

- Separate blend and load process

  - Per blend product haul two steps operation, blend and load.
  - Two step can be combined as one
  - Blend and load to bulk plant storage.
  - Haul preblended product from bulk plant storage to job site.



## Project Scope

- Completed Items
  - Done - Eliminate Call Sheet Export/Import
  - Done for product sale - Eliminate unnecessary validations for non-operation  call sheet/job.
  - Done - Company Information Section Refactoring.
  - Done - "Revert Approval" button.
  - Done - Master data. 
    - Storage and cement transfer bulker pod level numbering, include Sanjel Bulk Plant, Project Bulk Plant, Bulker, B-Train, P-Tank, Silos, PIG LBT, etc.
    - Rig. Operation site concept implementation to extend Rig Board to support non-job associated blend and haul.

  - Done - Process enforcement
    - Product sale must have a call sheet.
    - Job associated blend must have a call sheet
    - Project associated pre-blend must have a program.

- Pending Items
  - Workaround 8-13 by following approach
    - Add fake rig for product sale customer to work through call sheet and Rig Board process.
    - Add customer's bulker as third party bulker crew if needed.
- Scenario 1 - 7, 15
- Bug fixes

## Question

Do we have the scenarios that multiple load sheets of same blend to load up one storage?
