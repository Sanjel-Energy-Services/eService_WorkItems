# General Requirement Idea

Email from Jason:



Hello Adam

As per our discussion:

Please let me know if I missed anything.

Drill order / iteration will come from the program

If a program is added to a sales forecast project without an iteration, this will be defaulted to all 1’s with the execution order within the program

We will begin to import the iteration #’s and sales forecast #

The sales forecast # will be editable in eProgram so that they can be added and in the future we will create linkage within the system

The programs in the sales forecast will be a long list, which may create errors – too long

Need to determine – can a program be associated with multiple sales projects. Discussion with sales

Use eProgram status of “Active” programs to be available to the sales forecast

Modification / changing of a program in the sales forecast will create a new drill order

 

Work for eProgram:

- Need status “Active”
- Import Sales Forecast Number
- Import Iteration
- Ability to add/edit Sales Forecast Number
- Add bid flag – can import and turn on and off in eProgram

 

Sales Discussion:

- Need to determine – can a program be associated with multiple sales projects. Discussion with sales
- If we do not specify a bid or representative program, do we have a  defaulted program?
  - What are the business rules around this?
- Can only primary & won/ongoing/other programs be available to     create call sheets? Future linkage?
  - What are the business rules around this?



## ChatGPT Analysis



### User story format

Sure, here are some more granular user stories based on the information provided:

User Story 1: As a sales forecast project user, I want to be able to import sales forecast number and iterations  from a program so that I can accurately track and analyze sales performance.

Details:

- The program will default to all 1’s with the execution order within the program if there is no  iteration value in program template imported.
- Sales forecast numbers will be imported into eProgram from program template.
- Iterations will be imported into eProgram from program template.

User Story 2: As a sales forecast project user, I want to be able to add and edit sales forecast numbers so that I can keep track of changing sales forecasts.

Details:

- Sales forecast numbers will be editable in eProgram.
- The system will allow for the creation of a linkage between sales forecast numbers and programs in the future.

User Story 3: As a sales forecast project user, I want to be able to associate programs with multiple sales projects so that I can more efficiently manage my sales data.

Details:

- A discussion with sales is needed to determine if a program can be associated with multiple sales projects.
- The system will allow for the association of programs with multiple sales projects.

User Story 4: As a sales forecast project user, I want to be able to turn bid flags on and off in eProgram so that I can easily identify important sales opportunities.

Details:

- A bid flag will be available in eProgram.
- The bid flag can be turned on and off in eProgram.

User Story 5: As a sales forecast project user, I want to be able to modify programs without creating a new drill order so that I can make updates without causing confusion or errors.

Details:

- Modification of a program in the sales forecast will create a new drill order.
- The system will be modified to allow for program modifications without creating a new drill order.

User Story 6: As a sales forecast project user, I want to only see primary & won/ongoing/other programs available to create call sheets so that I can focus on relevant data.

Details:

- The system will only display primary & won/ongoing/other programs for the creation of call sheets.
- Business rules around the display of call sheets will be defined.





### Use Case format

Sure, here are the completed versions of all the use cases based on the user stories:

Use Case 1: Import Sales Forecast Numbers and Iterations

Actors: Sales Forecast Project User

Description: This use case enables the Sales Forecast Project User to import sales forecast numbers and iterations into eProgram.

Preconditions: 
- The user is logged in to eProgram.
- The user has the necessary permissions to import sales forecast numbers and iterations.

Postconditions: 
- The sales forecast numbers and iterations are successfully imported into eProgram.

Flow of Events:
1. The Sales Forecast Project User selects the "Import Sales Forecast Numbers and Iterations" option.
2. The system prompts the user to select the file containing the sales forecast numbers and iterations.
3. The user selects the file and uploads it to the system.
4. The system verifies the data and displays any errors or warnings.
5. If there are no errors or warnings, the system imports the sales forecast numbers and iterations into eProgram.
6. The system notifies the user that the import was successful.



Use Case 2: Add/Edit Sales Forecast References

Actors: Sales Forecast Project User

Description: This use case enables the Sales Forecast Project User to manually add or edit sales forecast references for a program in eProgram.

Preconditions: 
- The user is logged in to eProgram.
- The user has the necessary permissions to add or edit sales forecast references.

Postconditions: 
- The sales forecast references are successfully added or edited for the selected program in eProgram.

Flow of Events:
1. The Sales Forecast Project User selects the "Add/Edit Sales Forecast References" option.

2. The system displays a list of existing programs.

3. The user selects the program to add or edit sales forecast references for.

4. The user enters the sales forecast reference (a string used to reference a sales forecast in another system) in a text box or form.

5. The user clicks the "Save" button.

6. The system verifies the data and displays any errors or warnings.

7. If there are no errors or warnings, the system adds or edits the sales forecast reference for the selected program in eProgram.

8. The system notifies the user that the sales forecast reference was successfully added or edited.

   

Use Case 3: Associate Programs with Multiple Sales Projects

Actors: Sales Forecast Project User

Description: This use case enables the Sales Forecast Project User to associate programs with multiple sales projects in eProgram.

Preconditions: 
- The user is logged in to eProgram.
- The user has the necessary permissions to associate programs with multiple sales projects.

Postconditions: 
- The programs are successfully associated with multiple sales projects in eProgram.

Flow of Events:
1. The Sales Forecast Project User selects the "Associate Programs with Multiple Sales Projects" option.
2. The system displays a list of existing programs.
3. The user selects the program to associate with multiple sales projects.
4. The user selects the sales projects to associate with the program.
5. The user clicks the "Save" button.
6. The system verifies the data and displays any errors or warnings.
7. If there are no errors or warnings, the system associates the program with the selected sales projects in eProgram.
8. The system notifies the user that the program was successfully associated with the selected sales projects.

Use Case 4: Turn Bid Flags On and Off

Actors: Sales Forecast Project User

Description: This use case enables the Sales Forecast Project User to turn bid flags on and off in eProgram.

Preconditions: 
- The user is logged in to eProgram.
- The user has the necessary permissions to turn bid flags on and off.

Postconditions: 
- The bid flag is successfully turned on or off for the selected program in eProgram.

Flow of Events:
1. The Sales Forecast Project User selects the "Turn Bid Flags On and Off" option.
2. The system displays a list of existing programs.
3. The user selects the program to turn the bid flag on or off.
4. The user toggles the bid flag to the desired setting.
5. The user clicks the "Save" button.
6. The system verifies the data and displays any errors or warnings.
7. If there are no errors or warnings, the system turns the bid flag on or off for the selected program in eProgram.
8. The system notifies the user that the bid flag was successfully turned on or off for the selected program.

Use Case 5: Modify Program in Sales Forecast

Actors: Sales Forecast Project User

Description: This use case enables the Sales Forecast Project User to modify a program in the sales forecast in eProgram.

Preconditions: 
- The user is logged in to eProgram.
- The user has the necessary permissions to modify programs in the sales forecast.

Postconditions: 
- The program in the sales forecast is successfully modified in eProgram.

Flow of Events:
1. The Sales Forecast Project User selects the "Modify Program in Sales Forecast" option.
2. The system displays a list of existing programs in the sales forecast.
3. The user selects the program to modify.
4. The user modifies the program details as needed.
5. The user clicks the "Save" button.
6. The system verifies the data and displays any errors or warnings.
7. If there are no errors or warnings, the system modifies the program in the sales forecast in eProgram.
8. The system notifies the user that the program was successfully modified in the sales forecast.

Use Case 6: Create Call Sheet for Sales Project

Actors: Sales Forecast Project User

Description: This use case enables the Sales Forecast Project User to create a call sheet for a sales project in eProgram.

Preconditions: 
- The user is logged in to eProgram.
- The user has the necessary permissions to create call sheets for sales projects.

Postconditions: 
- The call sheet is successfully created for the selected sales project in eProgram.

Flow of Events:
1. The Sales Forecast Project User selects the "Create Call Sheet for Sales Project" option.
2. The system displays a list of existing sales projects.
3. The user selects the sales project to create a call sheet for.
4. The system displays a list of available programs that can be added to the call sheet.
5. The user selects the program(s) to add to the call sheet.
6. The user clicks the "Create Call Sheet" button.
7. The system verifies the data and displays any errors or warnings.
8. If there are no errors or warnings, the system creates the call sheet for the selected sales project in eProgram.
9. The system notifies the user that the call sheet was successfully created for the selected sales project.

Note: The specific details of the call sheet (e.g., format, content, etc.) are not specified in this use case, as they may vary depending on the specific requirements of the project.