@zhangyuan5 @wistaria623 @Alice0610 

A bug is found. Step to reproduce.

1. Haul all blend in a Bulk Plant Bin with a bulker crew
2. Load blend in the bin to Bulker

Expected Results:

1. Blend in bin is cleared. - Pass
2. Shipping Load Sheet status is Loaded - Pass
3. Right click on bin, this product haul should not show under any menu - Failed
4. The bulker number of this product haul show up in the bin list, the blend information is shown. - Failed.

Following changes are needed.

1. All bulkers in loaded status should be shown in Bulk Plant board. Each row will show for one product haul, if multiple loads in one product haul, blend in bin informations will be split into multiple rows.
2. Each bulker needs to have following contect menu items;
  - Reschedule Product Haul to allow change Expected on Location and bulker crew only. Crew list will show only the available crew with the same bulker.
  - Cancel Product Haul
  - Transfer blend. 
  - Print MTS





BlendHash





CNRL/Ensign 805
Sanjel/LLB BP
🚚🚛🔁