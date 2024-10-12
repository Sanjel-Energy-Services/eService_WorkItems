# Use Cases

**Use case 1**:  User changes Bulker Crew status to **Called** ,  Assignment Status and Product Hual Status will be changed  to **Scheduled**.

Actors: E-Service Online User 

Description: This use case enables E-Service Online user to change Bulker Crew status to Called.

Preconditions:

* The user has access to E-Service Online and has permissions to change Bulker Crew Status.

Postconditions:

* Assignment Status will be changed to Scheduled.
* Bulker Crew Log Status will be changed to Scheduled.

Flow of Events:

* The  E-Service Online system User is able to login E-Service Online system.

* User changes the crew status to Called.

* Assignment Status should be changed to Scheduled.

* Product Haul Status should be changed to Scheduled.

  

**Use Case 2**: User changes Bulker Crew status to  **Loading**.

Actors: E-Service Online User

Description: This use case enables the E-Service Online User to  change Bulker Crew Status to **Loading**.

Preconditions: 

- The user  should be able to login  E-Service Online system.
- Assignment Status and  Product Haul Status should be Scheduled.

Postconditions: 

- The  product haul will be in Progress and Assignment Status will be changed to  Loading.

Flow of Events:

1. The  E-Service Online  user  changes Bulker Crew status to Loading.

2. Assignment Status will be changed to Loading.

3. Product Haul Status will be changed to In Progress.

   

   **Use Case 3**: User should be able to change  Bulker Crew Status to Loaded.

   Actors: E-Service Online User

   Description: This use case enables the E-Service Online User to  change Bulker Crew Status to Loaded.

   Preconditions: 

   - Assignment Status is Scheduled or Loading.
   - Product Haul Status is Scheduled.

   Postconditions: 

   -  Assignment Status will be changed to Loaded.
   - Product Haul Status will changed to In Progress.

​     Flow of Events:

1. The  E-Service Online  user  will be able to change Bulker Crew status to Loaded.

2. Assignment Status will be changed to Loaded status if previous status is Scheduled or Loading.

3. Product Haul Status will be changed to In Progress.

   

   **Use Case 4**: User should be able to change Bulker Crew Status to Enroute.

   Actors: E-Service Online User

   Description: This use case enables the E-Service Online User to  change  Bulker Crew Status to Enroute.

   **Preconditions:** 

   - The user  should be able to login E-Service Online system.
   - The  Bulker Crew Log Status is Called or Loading, or Loaded, or Enroute.

   **Postconditions:** 

   -  Assignment Status will be Scheduled, Loading, Loaded

   ​     Flow of Events:

   1.  

   2.  

   3.  

   4.  

      
