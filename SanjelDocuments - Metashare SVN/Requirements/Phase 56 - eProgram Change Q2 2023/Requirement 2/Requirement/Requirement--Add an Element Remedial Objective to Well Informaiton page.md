**Requirement:**

* Add  Well Type dropdown list to Well information page of Program Header 

* Add Well Objective dropdown list to Well information page of Program Header 

* Add Remedial Objective dropdown list to Well information page of Program Header 

* Hide Country dropdown list, not delete

* Hide County/Parish dropdown list, not delete

  Type: String

​      

Well Objective dropdown list will consist of the following items:

- Oil
- Gas
- Water
- SAGD
- Carbon Dioxide
- CCUS
- CCS
- Acid
- Waste
- Helium
- Potash
- Geothermal
- Hydrogen
- Lithium

Well Type dropdown list will consist of the following items:

- Producer
- Injector
- Disposal
- Observation
- Core Hole

Remedial Objective dropdown list  will consist of the following items:

1. SCVF repair

2. Gas migration repair

3. Abandonment

4. Water shut-off

5. Casing repair

6. Shoe squeeze

7. TOL squeeze

8. Zone isolation

   ## Master Data

   Well Type, Well Objective, Remedial Objective master data are defined in SanjelData library and saved in SanjelData database.

   For eService and eProgram, they are defined as CommonType. This data is in Type_Values view in eService6 database to get data from SanjelData database.

   

   ## Downstream UI

   These three dropdown lists are editable in eProgram. Same UI control will be resued in CallSheet and Job. All of these values should be carried over, but the dropdownlists should be disabled, so the value can be viewed but not change.

   ![image-20230506140735923](C:\Users\sunting\AppData\Roaming\Typora\typora-user-images\image-20230506140735923.png)

![image-20230506110434217](C:\Users\sunting\AppData\Roaming\Typora\typora-user-images\image-20230506110434217.png

<img src="C:\Users\sunting\AppData\Roaming\Typora\typora-user-images\image-20230506140323973.png" alt="image-20230506140323973" style="zoom:80%;" />

User   Story:

User would like to import the data of Well Type, Well Objective and Remedial Objective to E-program system. These



Use Case 1: Import the data of Well Type, Well Objective and Remedial Objective into E-program

Actors: E-program User

Description: This use case enables the E-program User to import the data of Well Type, Well Objective and  Remedial Objective into E-Program.

Preconditions: 

- The user is logged in to E-Program.
- The user has the necessary permissions to import  Well Type, Well Objective and  Remedial Objective.

Postconditions: 

- The  Well Type, Well Objective and  Remedial Objective are successfully imported into Remedial Objective.

Flow of Events:

1. The  E-Program user selects the "Import" option.

2. The system prompts the user to select the file containing Well Type, Well Objective and  Remedial Objective.

3. The user selects the file and uploads it to the system.

4. The system verifies the data and displays any errors or warnings.

5. If there are no errors or warnings, the system imports the sales forecast numbers and iterations into eProgram.

6. The system notifies the user that the import was successful.

   