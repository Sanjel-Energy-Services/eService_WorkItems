# Use Cases

**Use case 1**: After user Schedules a product haul,  assignment status  will be changed  to Scheduled.

Actors: E-Service Online User 

Description: This use case enables E-program user to schedule product haul.

Preconditions:

* The user has access to E-program and has permissions to schedule product haul.

Postconditions:

* Assignment Status will be changed to Scheduled.
* Bulker Crew Log Status will be changed to LoadRequested if  Bulker Crew Status is set as OffDuty.

Flow of Events:

* The  E-program User is able to login E-Service Online system and click on Rig Board.
* The system will display a list of company information. User should be able to click on bin and schedule a product haul. 
* The user  clicks a bin and schedule a product haul.
* System will display the order in scheduled status.
* Bulker Crew Log Status will be changed to LoadRequested if the initial status is OffDuty.

**Use Case 2**: If there is no product haul scheduled for a crew and bulker crew status is set as Off Duty. Once user has scheduled a product haul for the crew in Rig Board,  assignment status on Digital Resource Board  will be changed to Scheduled.  

Actors: E-Service Online User

Description: This use case enables the E-Service Online User to manually schedule a product haul for a crew of a company.

Preconditions: 

- The user  should be able to login E-program.
- The crew should be in OFF-DUTY status.

Postconditions: 

- The  product haul will be scheduled and Bulker Crew Log Status will be changed to LoadRequested.

Flow of Events:

1. The  E-Service Online  user clicks BIN of a company and should be able to click Schedule a Product Haul. 

2. The user could fill in all the details to schedule a product hall.

3. The Bulker Crew Log Status will be changed to LoadRequested.

   

   **Use Case 3**: User should be able to change Product Haul status from scheduled status to  OnLocation status.

   Actors: E-Service Online User

   Description: This use case enables the E-Service Online User to manually schedule a product haul for a crew of a company.

   Preconditions: 

   - The user  should be able to login E-program.
   - The crew should be in OFF-DUTY status.

   Postconditions: 

   - The  product haul will be scheduled and Bulker Crew Log Status will be changed to LoadRequested.

​     Flow of Events:

1. The  E-Service Online  user clicks BIN of a company and should be able to click Schedule a Product Haul. 

2. The user could fill in all the details to schedule a product hall.

3. The Bulker Crew  will be able to change the crew status to Scheduled, or Loading, or Loaded, Enroute.

4. Once E-Service Online user changed the Product Haul status to OnLocation, Assignment status will be changed to OnLocation.

   

   **Use Case 4**: User should be able to change Product Haul status from scheduled status to  OnLocation status.

   Actors: E-Service Online User

   Description: This use case enables the E-Service Online User to  change  a product haul from Scheduled status to OnLocation status.

   **Preconditions:** 

   - The user  should be able to login E-Service Online system.
   - The  Bulker Crew Log Status is Called or Loading, or Loaded, or Enroute.

   **Postconditions:** 

   -  Bulker Crew Log Status will be changed to OnLocation.

   ​     Flow of Events:

   1. The  E-Service Online  user clicks BIN of a company and should be able to click Schedule a Product Haul. 

   2. The user could fill in all the details to schedule a product hall.

   3. The Bulker Crew  will be able to change the crew status to  Called, Loading, Loaded, EnRoute.

   4. Once E-Service Online user changed the Product Haul status to OnLocation, Bulker Crew Log Status will be changed to OnLocation.

      **Use Case 5**: E-Service Online User should be able to  cancel a product haul which is in Scheduled status.  

      Actors: E-Service Online User

      Description: This use case enables the E-Service Online User to  change  a product haul from Scheduled status to Removed status.

      **Preconditions:** 

      - The user  should be able to login E-Service Online system.

      - The  Bulker Crew Log Status is Called or Loading, or Loaded, or Enroute.

        **Postconditions:** 

         Bulker Crew Log Status will be changed to OnLocation.

        ​     Flow of Events:

        1. The  E-Service Online  user clicks BIN of a company and should be able to click Schedule a Product Haul. 
        2. The user could fill in all the details to schedule a product hall.
        3. Once E-Service Online user Cancel the Product Haul, the Product Haul will disappear from the page. Assignment Status of the product haul will be changed to Removed.

        **Use case 6**: After user cancels a product haul,  Bulker Crew Log Status  will be  changed to  OffDuty if there is no following available product haul.

        Actors: E-Service Online User 

        Description: This use case enables E-Service Online user to cancel a scheduled product haul.

        **Preconditions:**

        * The user has access to E-Service Online system and has permissions to cancel a scheduled product haul.
        * Bulker Crew Log Status  is LoadRequested or Called.
        * There is no following available haul request for the crew.

        **Postconditions:**

        * Assignment Status is Removed.
        * Bulker Crew Log Status is  OffDuty.

        Flow of Events:

        * The  E-Service Online User logins E-Service Online system and click on Rig Board.

        * The system will display a list of company information. User should be able to click on bin and schedule a product haul. 

        * The user  clicks a bin and schedule a product haul.

        * System will display the order in scheduled status.

        * Builker Crew status is in LoadRequested or Called status.

        * After user cancel the product haul, system will display the Bulker Crew Log Status as OffDuty.

          **Use case 7**: After user cancels a product haul,  Bulker Crew Log Status  will be  changed to   Load Requested if next haul is available. Assignment status will be changed to Removed.

          Actors: E-Service Online User 

          Description: This use case enables E-Service Online user to cancel a scheduled product haul.

          Preconditions:

          * The user has access to E-Service Online system and has permissions to cancel a scheduled product haul.
          * Bulker Crew Log Status  is LoadRequested, Called.

          Postconditions:

          * Assignment Status will be changed from Scheduled to Removed.
          * Bulker Crew Log Status will be set as  LoadRequest if next haul available.

          Flow of Events:

          * The  E-Service Online User logins E-Service Online system and click on Rig Board.

          * The system will display a list of company information. User should be able to click on bin and schedule a product haul. 

          * The user  clicks a bin and schedule a product haul.

          * System will display the order in scheduled status.

          * Builker Crew status is in LoadRequested or Called status.

          * After user cancel the product haul, system will display the Bulker Crew Log Status as OffDuty.

            
