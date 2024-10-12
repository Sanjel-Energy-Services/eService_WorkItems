# Product Haul Clean up

## Haul Blend

Haul Blend is to schedule a blend shipping (Product Haul). To reduce data entry efforts, following actions can be triggered with certain context, related information can be carried over automatically.



- Haul Blend on Bulk Plant Board
  - Haul Blend from BlendRequest of Program Blend
    - Find active call sheets match same base blend with the blend request 
    - If a call sheet is selected, carry over information from the blend request and call sheet
    - If no call sheet is selected, fill in the information needed
    - Remains Amount = BlendRequest Total Tonnage - SUM(Shipping Load Amount from the SameBlend Request)
  - Haul Blend from BlendRequest of Call Sheet Blend
    - Carry over information from the the blend request and call sheet
    - Remains Amount = BlendRequest Total Tonnage - SUM(Shipping Load Amount from the SameBlend Request)
  - Haul Blend from Bulk Plant Bin
    - Remains Amount = Quantity of the Bulk Plant Bin
    - So we don't show Remains Amount in the "Haul Blend - Blend In Bin form".
    - If last blend request id is available with a Bulk Plant bin, save it in the Shipping Load Sheet for reference. We cannot guarantee the blend request id is correct, however it can be used for analysis after fact to help improve the process.

- Haul Blend From Rig Board
  - This equals "Haul Blend from BlendRequest of Call Sheet Blend" from Bulk 

### Quantity of Bulk Plant bin

Quantity of Bulk Plant bin is updated in following actions:

- Load Blend Request to Bin (Addition)
- Adjust Blend Amount (Change)
- Empty Bin (Zero)
- Load Up Bulker ( Subtract. **To be built**)
- On Location (Subtract. If Load Up Bulker doesn't exist, On Location actions from Job Completion will trigger the Quantity update)
- Transfer Blend. Out (Subtract), In (Addition)

### Complicated Scenario







## Transfer Blend





## Haul Back





## MTS on server





## Shipping Schedule List





## Blend Request List





## Load Blend to Bulker

