[TOC]

# eService Online Development Log

## Product Haul

### Schedule Product Haul

#### UC001.1-Schedule Product Haul From Rig Job Blend  (Not Blend Test all checkboxs is not checked)

- [ ] Step 16. Save 
  - [ ] Database record review
    - [x]  Name is trimmed which caused by a create crew bug
    - [x] Description. Need a space between Rig Name and Bin Name
    - [x] ExpectedOnLocationTime is not saved in database
    - [x] Driver name is not formatted properly
    - [x] BulkUnit is not populated
    - [x] Driver 2 information is not populated
    - [x] Description, WorkerName,  is not populated in Unit Schedule/WorkerSchedule from CrewSchedule, 
    - [ ] CrewScheduleType/WorkerScheduleTyp/UnitScheduleType is not populated(might be not defined.)

#### UC001.5-Schedule Product Haul From Rig Job Blend  (Go With Crew checked)

Step 16. Save 

- [ ] Database record review
  - [x] Expected On Location Time is using current time stamp. It should use the the job date time, that is the pumper crew Expected On Location Time

#### UC001.1 Schedule Product Haul From Rig Job Blend  (Not Blend Test all checkboxs is not checked)

- [ ] Step 23 mouse move to "cancel Product Haul" Triangle  icon
  - [x] the menu should disabled

#### UC001.3 Schedule Blend From Bin(Load to An Existing Haul checkboxs is checked)

- [ ] Step 15 mouse move to second level Context menu "[Crew Description]-[Expected On Location Time]" of the show sheet's one Triangle  icon
  - [x] the uc007.1 schedule blend do not show and disabled.
- [ ] Step 18 mouse move to second level Context menu "[Crew Description]-[Expected On Location Time]" of the show sheet's one Triangle  icon
  - [x] the uc007.1 schedule blend do not show and disabled.

#### UC001.9 Schedule Product Haul From Rig Job Blend (Verify Bulk Plant Bin amount)

- [x] step 10 Click "Save" button
  - [x] confirm message is not  properly.[Bulk plant bin amount verification in schedule product haul message is not properly. #30]

### Reschedule Product Haul 

#### UC005.1-Reschedule Product Haul From Rig Job Blend (Update Time Fields)
- [ ] Step 7. Save 
  - [ ] Database record review
    - [x] Estimated Load Time is not saved
    - [x] Estimated Travel Time is not saved.
    - [x] Expected On Location Time is not saved
    - [ ] Driver Name/Description should reference Employee Name/Description
    
#### UC005.2-Reschedule Product Haul From Rig Job Blend  (Change to Go with crew)

- [ ] Step 7. Save 

  - [ ] Database record review
    - [x] Estimated Load Time is not saved if it is changed at same time.
    - [x] Expected On Location Time is not updated to related call sheet job time
    - [x] Product Haul Description is not update according to the changes.
    - [x] Product Haul Name is not update according to the changes.
    - [x] Product Haul Load Estimated Load Time, Product Haul Name, Product Haul Description never updated


#### UC005.4-Reschedule Product Haul From Rig Job Blend  (Change to Third party)

- [ ] Step 6. Save
  - [ ] Database record review
    - [x] Third party Driver and contact information are not updated accordingly.

### Reschedule Product Haul Load

#### UC006.1-Reschedule Product Haul Load From Blend  (Base Blend Tonnage And Total Blend Tonnage And Comments)

- [ ] Step 9. Click third level Context menu "[Base Blend]+Additives-[Amount]" of the show sheet's one
  - [x] Base Blend Tonnage And Total Blend Tonnage didn't checked with data

#### UC006.8-Reschedule Product Haul Load From Blend  (Cancel Load to An Existing Haul、 Estimated Load Time And Expected On Location Time And Estimated Travel Time)

- [x] Step 16. click "Load to An Existing Haul"
  - [x] Estimated Load Time don't saved.
  - [x] Expected On Location Time don't saved.

- [x] step 5.click "Load to An Existing Haul"
  - [x] should not show error message "Bin is required"

#### UC006.9-Reschedule Product Haul Load From Blend  (Cancel Load to An Existing Haul、Go with Crew)

- [ ] Step 12.click "Load to An Existing Haul"
  - [x] go with crew is not checked,go with crew is not saved

#### UC006.10-Reschedule Product Haul Load From Blend  (Cancel Load to An Existing Haul、Cancel Go with Crew)

- [x] Step 5 click "Load to An Existing Haul"
  - [x] Expected On Location Time and Estimated Travel Time is not hide

### Schedule Blend From Rig Bin

#### UC007.1-Schedule Blend From Bin(No checkboxs checked)

- [ ] Initial form loading
  - [ ] Blend Test is not enabled

- [x] Step 20. Save
  - [x] Database record review
    - [x] CustomerId is not saved.

#### UC007.3 Schedule Blend From Bin(Load to An Existing Haul checkboxs is checked)

- [x] Step 24 mouse move to "[Crew Description]-[Expected On Location Time]"  arrow  icon
  - [x] the uc001.1 schedule product haul  do not show and disabled.
- [x] Step 26 mouse move to "Cancel blend"  arrow  icon
  - [x] second level Context menu should  "[Crew Description]-[Expected On Location Time]",but it's the third level context menu

### Reschedule Blend From Rig Bin

#### UC008.1-ReSchedule Blend From Bin(No checkbox was checked. Test amount/mix water change)

- [x] Step 4. mouse move to "Re-schedule Product Haul"  arrow  icon
  - [x] Second Level menu is not shown
- [x] Step 7. Click on "[Base Blend]+Additives-[Amount]t",  A Diaglog form pops up with title "[Base Blend]+Additives-[Amount]t".
  - [x] Bulk Plant is not loaded correctly
- [ ] Step 10. Save
  - [ ] Database record review
    - [ ] Modified_user_name is not filled
    - [ ] Description is not updated with new value.
    - [ ] Well Location , Yield, SackWeight, Density data lost.

#### UC008.2-ReSchedule Blend From Bin(change Existing Haul)

- [x] Step 10. Click "Save" button
  - [x] can't save "existing haul"

#### UC008.3-ReSchedule Blend From Bin(cancel Load to An Existing Haul,Estimated Load Time、Expected On Location Time、Estimated Travel Time update)

- [x] Step 14. Click "Save" button
  - [x] can't save "Estimated Travel Time"

#### UC008.4-ReSchedule Blend From Bin(cancel Load to An Existing Haul,Third Party)

- [x] Step 14. Click "Save" button
  - [x] can't save "Third Party" turn on

#### UC008.5-ReSchedule Blend From Bin(cancel Load to An Existing Haul,Cancel Third Party)

- [x] Step 14. Click "Save" button
  - [x] can't save "Third Party" turn off

### Cancel Blend From Rig Bin

#### UC0018.2-Cancel blend for rig board of bind(three level menu)

- [ ] Step 5. click "yes" Button
  - [x] can not save without error

### Cancel Blend From Rig Board

#### UC0019.3-context menu for rig board(schedule product haul and schedule blend)

- [ ] Step10. mouse move to "[Crew Description]-[Expected On Location Time]"  
  - [x] just schedule blend should disabled
- [ ] Step13. mouse move to "[Crew Description]-[Expected On Location Time]"  
  - [x] just schedule blend should disabled

## Adjust Blend Amount

#### UC004.1-Adjust Blend Amount

- [ ] step 5.Click "Save" button
  - [x] the quantity is not saved.[Add ability to Update quantity of Bin to Rig Board #35]

## Crew Management

### Create Crew

- [x] Description is trimmed some how. Example " Gaine, Christopher | Haffner, Christopher | 4460 2/11/2022", unit number is cut off. 
- [ ] Worker name and description in worker section are null, this cause problem when the work name is needed. Solution should be in Employee master data integration. 
- [ ] Delete crew didn't delete worker section and unit section
- [ ] Create Crew can use employee name field than using First name and last name in the fly.

## Bulk Plant Board & Rig Board

### Release Bin

- [x] A confirmation window should pop up to display current blend and amount if any
- [x] If this is one pod of a bin, all pod information should be displayed, and all pods must be released at same time.
- [ ] Database Record Review
  - [x] The BinInformation Record should be deleted, which entity_status should be 1

## Master Data Management

### Employee Data sync from ADP

- [ ] Name is used for preferred first name, like "Adam Wang"
- [ ] Description is used for formal name with Employee Number, like "Wang, Zhong (1195)"

## Refresh Cache

### Periodically refresh the cache

- [x] eService Online auto cache refresh #31

## Empty Bin

### empty bin #15

- [x] We need to apply this feature on RigBoard. Same logic applies.
- [x] The problem needs to be fixed:After the action, it should return the page where the action was against.

## Add blend description display

### Add blend description display in Adjust Blend Amount #32

- [x] Display BlendChemical description in Adjust Blend Amount form.

## completing a job

### Clear All Cement while completing a job #3

- [x] Clear All Cement while completing a job #33

## Job Date out of range caused 

### Job Date out of range caused rigboard screw up #31

- [x] Fix 2: In eService Online, reschedule a job should have a validation to prevent the error

## Old Load Sheet cannot be printed

### Old Load Sheet cannot be printed due to crew was deleted #12

- [x] When printing an aged load sheet, if the crew was deleted, printing will throw out exception. The reference from product haul to sanjel crew is based live data. Reference Data should be retained for printing only.

## Set On Location for Product Haul scheduled on Rig Bin 

### Set On Location for Product Haul scheduled on Rig Bin #34

- [x] Add "On Location" menu in context menu of Rig Bin, under "Cancel Blend".This is for set "On Location" flag for the product hauls and product haul loads scheduled from Rig Bin.The menu display style logic is same as "Cancel Blend".The menu action logic is same as "On Location" menu on the Blend column.

## Spare Crew is not released

### Spare Crew is not released when a job is completed #5

- [x] Bulker Crew is released when product haul is on location or go with crew/job complete.Pumper Crew is released when job completes.Spare Crew is created as pickup with driver, but it is forgot to release when job completes.