# Post Job - User Story



1. Update Pumped Volume

   1.1 Populate blend list from service report which the blends in following categories:  Lead 1-4, Tail, Scavenger, Plug,  Extra Cement, Wet Shoe under Post Job - > Pumped Volume section.

   1.2 Supervisor clicks "Unlock", Expected Cement Top and columns Pumped Volume, Water Temp, Bulk Temp and Slurry Temp are enabled to allow updates.

   1.3 Supervisor clicks "Confirm", all updated value will update service report in eService. Total volume will be calculated automatically. Vice versa.

2. Update Storage Volume 

   2.1 Populate bin/bulker(include third party) information in eService Express, Post Job -> Storage Volume section. These information was originally from call sheet via RigBoard. Initial Tonnage was populated.

   2.2  Supervisor click "Unlock", then he is able to update initial tonnage if it was not correct. Fill in cement usage for each bin/bulker as following:

   - **Tonnage Pumped w/o additives (including Scavenger)**
   - **Tonnage Pumped with additives (including Scavenger)**
   - **Tonnage remaining in vessel after job**
   - **P-Tank/Mega Silo empty, blown off and ready for the next job?**

   2.3 Once the entered data is confirmed, this information will be sent to server.

   2.4 Modification is allowed, the information will be sent to server to update.

3. Update maintenance note

   3.1 Populate units/pumpers/bulkers , following by text box to allow enter maintenance note if needed.

   3.2 One extra text box not is needed for other maintenance notes if needed.

   3.3 Once the entered data is confirmed, this information is sent to server.

4. Update additional Information

   4.1 Show a free text box for supervisor to enter any additional information that needs to be entered.

   4.2 Once the entered data is confirmed, this information is sent to server.

5. Update incident information
    This requirements needs further investigation. A rule based post job check list may be a better solution.

6. Receive Post Job information On Server

   6.1 Database implementation for every piece of information.

   6.2  Job Package information verification when main package is received by eService.

   6.3 Email Notification when job package is received on server.

   6.4 Bin information update when storage cement volume update is received on Server, the result will be reflected on Rig Board.

7. Technical Story: eService Express local service infrastructure implementation

   7.1 Use MCC tool design and generate service to save the effort of writing code.

   7.2 Enable local API to work with existing eService Express application.
   
8. Technical Story: Messaging system upgrade to receive Information Pack handling dynamic types of data.

