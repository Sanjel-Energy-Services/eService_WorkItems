### ~~Scenario~~ <u>Use Case</u> 1:Dispatcher schedules a product haul on BLEND column of Rig Board.

Actors: Dispatcher

Description: ~~This use case enables~~ Dispatcher ~~user to~~ schedule a product haul on BLEND column of rig board page.

~~Parameters:~~
~~Crew : SanjelCrewSchedule.Type = Planned~~
~~CrewType: SanjelCrew.Typeid = 2~~
~~Current datetime = onLocationTime~~

##### Preconditions:

- The user has access to E-Service Online and has permissions to schedule product haul.
- <u>A bulker crew is planned to work for the haul</u>
- <u>The bulker crew is currently</u> in ~~Bulker Crew Log Status is~~ **OffDuty** <u>status</u>.
- A **Pending** job has a blend needs to haul.

~~**ProductHaulLoad table** will add one more record and **ProductHaulLoadLifeStatus** will be **Scheduled**, **BlendShippingStatus** will be **Scheduled**.~~
~~**ShippingLoadSheet table** will add one more record and  **ShippingStatus** will be Scheduled.~~
~~**ProductHaul table** will add one more record and **ProductHaulLifeStatus** will be Scheduled.~~
~~**RigJobSanjelCrewSection table**  will add one more record and **Assignment Status** will be created and will be **Scheduled**.~~
~~**BulkerCrewLog table** will add one more record and Bulkercrewlogstatus  will be changed to **LoadRequested**.~~

~~Menu Display:~~
1. ~~Schedule Product Haul panel will always be displayed if there is data on BLEND column.~~
2. ~~Dispatcher could be able to view the newly added Product Haul information on Reschedule Product Haul panel~~
3. ~~Dispatcher could be able to view the newly added Product Haul information on Cancel Product Haul  panel~~
4. ~~Dispatcher could be able to view the newly added Product Haul information on On Location panel~~
5. ~~Dispatcher could be able to view the newly added Product Haul information on Reschedule Product Haul panel~~
6. ~~Dispatcher could be able to view the newly added Product Haul information on Cancel ProductHaulLoad panel~~
7. ~~Dispatcher could be able to view the newly added Product Haul information on Haul Blend panel~~

~~Business Logic:~~
~~Dispatcher will schedule a product haul on BLEND column of Rig Board and will be able to select a Sanjel Crew from the crew dropdown list. The dropdown list will only display crews who are in planned status and are belonged to Bulker crew type.~~ 

##### Basic Flow:

1. Dispatch locates a job has a blend needs to haul.
2. Dispatch starts to schedule the product haul on the blend, system will load the job and blend information.
   - Call Sheet Number
   - Blend name 
   - Mix Water
   - Blend Test
   - Rig Name
   - Bins assigned to the rig
3. Dispatch enters the blend amount to haul and indicates if it is a base blend tonnage or total blend tonnage.
4. Dispatch selects a Bulk Plant to load up the blend.
5. Dispatch leaves Go With Crew unchecked.
6. Dispatch enters the blend amount to offload to a bin(s)
7. Dispatch leaves Load to An Existing Haul unchecked
8. Dispatch enters Estimated Load Time
9. Dispatch enters Expected On Location Time
10. Dispatch enters Estimated Travel Time
11. Dispatch selects a planned crew
12. Dispatch enters pod allocations.
13. Dispatch writes comments
14. Dispatch completes the product haul.
15. System saves the product haul as Postconditions



##### Postconditions:

- A Blend Request (ProductHaulLoad) is scheduled
- A Product Haul is scheduled with Pod allocations specified
- A Shipping Load Sheet is scheduled with Blend Unload Sheet(s) specified.
- A crew assignement is scheduled (RigJobSanjelCrewSection)
- Bulker crew schedule is created for the round trip. Start Time = Expected On Location Time - Estimated Travel Time, End Time = Expected On Location Time + Estimated Travel Time. 
- The bulker crew status is in **LoadRequested** status



##### Alternative Flows

###### 5a. Schedule Product Haul Go With Crew

 	1. Dispatcher checks on Go With Crew
 	2. Skip basic flow step 7. System hides Blend amount to offload to a bin(s) 
 	3. Skip basic flow step 9. System hides Expected On Location Time.
 	4. Skip basic flow step 10. System hides Estimated Travel Time. It will be same as pumper crew.
 	5. Go to basic flow step 11.

######    Postcondition:

- Product Haul Expected On Location Time is same as job's Expected On Location Time
- Product Haul Estimated Travel Time is same as Job's Estimated Travel Time
- Shipping Load Sheet is scheduled without Blend Unload Sheet(s) specified.

###### 7a. Schedule Product Haul using existing haul

###### 	Precondition:

 - A product haul has been scheduled 

   

	1. Dispatch checks Load To An Existing Haul

	2. System hides following fields 

    - Expected On Location Time
    - Estimated Travel Time
    - Third Party option
    - Crew List

	3.  System displays Existing Haul list instead of Crew List

	4. Dispatch select an existing haul in Scheduled status.

	5. Go to basic flow step 12

    ###### Postcondition:

    - A Shipping Load Sheet is scheduled with Blend Unload Sheet(s) specified, links to existing product haul

      

      

#### Special Requirements

N/A