





## Issue Reference

All numbers like #44, they are the issue numbers in eService_WorkItems repository.
https://github.com/Sanjel-Energy-Services/eService_WorkItems/issues

Document folder SVN: SanjelDocuments\Requirements\Phase 44 - eService change 2022 Q3





## eServiceMDM

### Master Data Update

- Move HSE reference data from eService6 database to SanjelData

  - HSESeverityMatrixtype (115) to SeverityMatrixtype in MMC

  - HSEIncidentType (116) to IncidentType in MMC

  - HSEPerformanceMetric (117) to PerformanceMetric in MMC

  - Add PotentialSeverity (new) in MMC - Add to common type (120)

  - Add QualityObservationType (new) in MMC - Add to common type (121)

- [ ] Tasks

  - [x] Add above entities to SanjelData Model in MMC

  - [ ] Create database script to load up Incident Type, Performance Metric, Actual Severity, PotentialSeverity and QualityObservationType data according to the document. Data items are  in “HSE Change” folder, "eService Job Performance Changes.xlsx" file

  - [ ] Update Type_values view script to use master data from SanjelData database for above types.



###  eService

#### Feature Q3_22_S1 Update Performance section in eService

- [ ] Add required new properties in related entities in SanjelCommonLibrary.
- [ ] Add "Quality Observations" section in "Job Performance" Control in SanjelCommonLibrary.
- [ ] Update "Job Performance" presenters in SanjelCommonLibrary
- [ ] Update Controllers and related presenters in SanjelEservice.
- [ ] Add "Incident Details" section in "Job Performance" Control in SanjelCommonLibrary.
- [ ] Update "Job Performance" presenters in SanjelCommonLibrary
- [ ] Update Conterollers and related presenters in SanjelEservice.

Details is in “HSE Change” folder.

*** Nov 2, requirement change. Brief description for Quality Observations is changed location. See the details file. ***

#### Feature Q3_22_S2 Client Stamp Logic Update

If client stamp is not captured in field, the manager cannot enter the stamps after the stamp is captured while approval.

Refer to "Solution Proposal -  client stamp tracking_v2.md" under eService folder



#### Feature Q3_22_S3 Third Party Head & Plugs

If the head and plugs are provided by third part, more information needed.

Refer to "Solution Proposal - Head and plug.md" under eService folder



#### Feature Q3_22_S4   Changes from Price line items with Quantity 0

This feature depends on **Feature Q3_22_P1 Set Expiry Date in program**

### TODO

Job Date out of range caused rigboard screw up #31
o	Fix 1: In eService, call sheet validation should pop up alert if job date is in future. When a job is going to be started, the expected job date should be no longer than 24 hours. Job creation validation should be in place.

### eProgram



#### Feature Q3_22_P1 Set Expiry Date in program

Add Expiry Date and Expired status in Program.

Details refer to "Solution Proposal - Program Expiry" under eProgram folder.



#### Q3_22_P2 Import price line items with Quantity 0

Ability to import 0 quantity items to Miscellaneous Section section

Details refer to "Solution Proposal - Import 0 Quantity Item" under eProgram folder.



#### Q3_22_P3 Import Pilot Test Reference

Ability to import pilot test items to Blend ection

Details refer to "Solution Proposal - Import Pilot Test Reference" under eProgram folder.

### 

### eServiceOnline







*** STOP Here ****





#### Feature Q3_22_O1 Rig Job Postpone function not working corretly

If a crew is called out (job status is In Progress), and the clients call for a postpone.
If the crew is released, that means the crew needs to be call out again. The job needs to be pushed back to  confirmed or pending. The call sheet needs to be reset to ready.
If the crew is not released, that means the crew will continue to work on it later. Then the job status can be either stay at scheduled, dispatch or in progress.

Solution: Add a status dropdown list to allow dispatch indicate where the job is pushed back to. 















2. Casing Info string number ordering not correct #37
   o	Ryan G reported call sheet #1098300 casing info not ordering correctly. It was created from PRG2101611 - Issue is replicated.
   o	Create call sheet from program. Casing string numbers are imported as 1,2,2,2. This leads to a conceptual model question: the different size intermediate casing pipes should be considered as one string or different strings?
   o	When a record is modified and updated, the whole string numbers will be reported as 1,2,3,4. If the edited record is not the first one, its string number will be compared to all other string numbers, and calculated as new inserted string.
   o	Need to clarify the conceptual model first and give out solution.
   Jason's answer: the different size intermediate casing pipes should be considered as one string or different strings – one string
   So the string numbers in the 3 intermediate record should be 2, not 2,3,4. Is it right?
   I guess we # them as Surface is one string, the intermediate is the second string which is made up of 3 parts – need to put in depth order. If 1,2,2,2 or 1,2,3,4 which ever way is correct. Just need to order in depth order as well.


5.	
6.	Rig not set back to correct rig job listed after a rig job change rig #33
o	A call sheet was created with rig A and changed to rig B later. Rig A is left as open record which will not going to show on the board for future actions.
o	Solution: Set Rig A to last job to be listed.
	Test Steps:
	In eServiceOnline, find a rig which job 1 completed already. We call this rig as Rig A.
	In eService, create a call sheet 2 with with Rig A.
	In eServiceOnline, it shows Rig A job 2 status as pending or confirmed, you may find the call sheet 2 number in tooltips when you move mouse over Job Date.
	In eServiceOnline, find another rig with job completed already. We call this rig as Rig B
	Go to eService, open call sheet 2, change rig from Rig A to Rig B, then save.
	In eServiceOnline, it should show Rig B job 2 status as pending, you may find the call sheet 2 number in tooltips when you move mouse over Job Date.
	In eServiceOnline, it should show Rig A job 1 completed.

eServiceOnline:
1.	Rig Job Postpone function not working correctly. #44
o	Add status to push job to another status
	In progress – postponed – in progress
2.	Job Date out of range caused rigboard screw up #31
o	Fix 2: In eService Online, reschedule a job should have a validation to prevent the error



Update locked call sheet with specific permission, not change status, not integration triggerd. #55
o	Ability to modify eService data after call sheet is locked
	Who has permission?