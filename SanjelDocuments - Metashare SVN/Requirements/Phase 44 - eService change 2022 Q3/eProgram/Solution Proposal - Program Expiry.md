## Solution Proposal - Program Expiry

Sales would like to manage the program status for downstream process.

- [ ] Upon import, a program will default to 8 months (or another reasonable timeframe) that it will remain active. 

- [ ] Upon import, Status = “Ready”
- [ ] After 8 months from import date, status = “Expired”
- [ ] Only “Ready” programs will be available to the Rig Board / Call sheets etc.
- [ ] This expiry date can managed within eProgram 
- [ ] The date can be extended/modified if required
- [ ] An expired program will not be available for call sheet creation or the other functions of the DRB


### Business Process for Program Expiry Status management

```mermaid
flowchart TD
A[Sales prepares a progrm import csv file] -->B[Open eProgram]
B-->C[Click New button]
C-->D[Click Finish button]
D-->M{Program passes validation?}
M--Yes-->E[Confirm Save the program]
M--No-->N[Save Program as InProgress status in database]
E-->H[Set ProgramGeneratedDate]
H-->G[Set ProgramExpiryDate = ProgramGeneratedDate + 240 days]
G-->I[Save Program  as Reday status in the database]
N-->Z[Finish]
I-->Z

```

### Solution Description

- [x] Add Expired status to eServiceEntityStatus in SanjelCommonLibrary

- [x] Add ProgramExpiryDate to Program Entity in SanjelCommonLibrary

- [ ] Add ProgramExpiryDate  column to PROGRAMS table.

- [ ] Update ProgramDao in eService for database save and read.

- [ ] Update Program Header control to add "Program Expiry Date" control and update presenter correspondingly.

- [ ] Update the logic to determine the program expiry date and status.

  





### UI Mock



- Add "Program Expiry Date" control to Program Header.

![ProgramExpiryChange](https://user-images.githubusercontent.com/55812393/199605702-c0d74c84-8bb8-4790-ba4e-018b2a1a184f.png)

- Show new program status properly

![ProgramStatus](https://user-images.githubusercontent.com/55812393/199606437-b64c608d-d584-4d33-a0a8-854e5d03c652.png)



### Test File

Under "Program Expiry import files". 

If you need to test import repeatedly, change the Program ID to a different number.

