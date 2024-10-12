## Solution Proposal - Import Pilot Test Reference

### Summary

- We need to import pilot test reference on per blend level. 
- Only need to import the data in database, don't need to show in UI right now.

##### Import File Sample

![Import_Pilot_Test](https://user-images.githubusercontent.com/55812393/202305617-e2ecd5d2-c067-4daa-a72e-de25aba8b9c7.png)


### Business Process for client stamp tracking

```mermaid
flowchart TD
A[Sales prepares a progrm import csv file] -->B[Open eProgram]
B-->C[Click New button]
C-->D[Click Finish button]
D-->E[Check data table PRG_BLEND_SCTNS]
E-->F[Check the Last two columns value in latest records]
F-->G[End]




```

### Solution Description

- [ ] Add PilotTestId(string), PilotTestIteration(int) in BlendSection class in SanjelCommonLibrary.

- [ ] Add two new columns according to above definition to PRG_BLEND_SCTNS, PUMP_BLEND_SCTNS, PSPT_BLEND_SCTNS tables.

- [ ] Update BlendSectionDao in SanjeleService for the new fields.

- [ ] Update work book template and update import mapping for above to data items in SanjelClientSoultionTool.

  

### UI Mock

N/A
