

- [x] Schedule Blend

- [x] Reschedule Blend

- [x] Cancel Blend

- [ ] Haul Blend

  - Remains Amount - Needs to be round to 2 decimals

  - [ ] Go with Crew

    ❌ When a blend request was hauled partially,  The shipping status should be updated to PartiallyHaulScheduled. The blend request should stay 

- [ ] Cancel Schedule Product Haul

❌ When a product haul is canceled, the shipping status in the related product haul load should be reset back to  PartiallyHaulScheduled or Empty. 



ProductHaulLoad is managed under three different business processes



1. ProductHaulLoadLifeStatus, it is manage the process of blending. It has following status.
   - Scheduled
   - Blending
   - BlendCompleted
   - Loaded
   - OnLocation
2. BlendShippingStatus
   - Empty
   - HaulScheduled - RemainsAmount must be less than 0
   - PartialHaulScheduled - RemainsAmount must be greater than 0
   - OnLocation - Will be updated as all related ShippingLoadSheets are on location

3. BlendTestingStatus - It only used when IsBlendTest is true.

   - None - We haven't implemented this status today.

     

