## Solution Proposal - Import 0 Quantity Item

### Summary

In currently program import process, if a pricing item quantity is 0, it is not allowed to be imported.

We will need to allow import additional items to Miscellaneous Section with 0 Quantity.

- Ability to import 0 quantity items to this section

- Maintain quantity check on other sections.

  



##### Import File Sample

![Import_file_Quantity_0](https://user-images.githubusercontent.com/55812393/199888007-214e01ce-f7f4-45c1-b729-80ae5ca3037a.png)



##### Imported Program Sample

![Imported_program_Quantity_0](https://user-images.githubusercontent.com/55812393/199888292-43db5de5-b3b1-4e80-ba9c-8c4f8a6c9a75.png)


### Business Process for client stamp tracking

```mermaid
flowchart TD
A[Sales prepares a progrm import csv file] -->B[Open eProgram]
B-->C[Click New button]
C-->D[Click Finish button]
D-->E[Check Billing Section's  bundle name]
E-->F{"Is  #quot;Miscellaneous Items#quot;"}
F--No-->G[Check the line item]
G-->H{"quantity = 0?"}
H--Yes-->I[Add to error item list]
H--No-->M{Finish?}
M--Yes-->N
M--No-->G
F--Yes-->K[Check the line item]
K-->R{Finish?}
R--Yes-->N{Any error?}
R--No-->K
N--Yes-->S[Failed]
N--No-->T[Validation Passed]
T-->U[Save Program]



```

### Solution Description

- [ ] Update line item calculation logic to allow line price section quantity equal 0 under "Miscellaneous Section" Section.
- [ ] Quantity 0 may affect the who billing section calculation. Need further test to correct bug if any. the PriceLIneItemSection is in SanjelCommonLibrary.

### UI Mock

N/A
