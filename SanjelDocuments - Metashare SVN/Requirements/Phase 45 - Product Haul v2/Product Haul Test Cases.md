# Product Haul Test Cases

## On Rig Job Blend

- [x] Schedule Blend Request From Rig Job Blend

  - Horizon 22, 23.6t, ECOLite 1325 - 12t - LLB Bulk Plant - Silo 5
  - ❌Blend color is not changed from red to yellow.

- [ ] Reschedule Blend Request From RigJob Blend

  - Change to 10t, GP Bulk Plant - N1
  - "Go With Crew"  shows up twice - Top one is general "Go With Crew", lower one is per shipping load sheet.
  - ✨If ShippingLoadSheet has Product Haul Load id, means it was scheduled blend request and haul together, the amount should be changed at same time.

- [ ] Print Load Sheet

  - [x] Original prinout

    ✨Product Haul Page Improvement List
    - Product Haul list needs to be seperated from Blend Request list. Existing Product Haul List can be Blend Request List. MTS will be product haul page

    ✨Print MTS page 

    ❓Review the Blend Breakdown Sheet and Blend Load Sheet usage.

- [x] Cancel Blend Request

- [ ] Haul Blend

  ❓Blend Amount is not necessary, only Total Tonnage should be good.

  ❓Amount should add UOM at the end of 

  - [ ] Schedule a new crew

  ❌ProductHaulLoad.BlendShipping is not set.

  ❌SanjelCrewSchedule.Schedule Type is not set. The type is designed for DRB, consolidation will be needed in future

  ❓BlendUnloadSheet can we get rid of 0 quantity records?

  ❓Pod Load can we get rid of 0 quantity records?

  

- [ ] Schedule Product Haul

  ❌Schedule a product haul, color changed to orange when no haul is on location yet

- [ ] Reschedule Product Haul

  ❌Label for ShippingLoadSheet 1

  ❌SanjelCrewSchedule is not updated with Pumper Crew schedule

  

- [ ] OnLocation Product Haul

  - [x] ✔Job is not done, but OnLocationed product is not shown
  - [ ] ❓If Product Haul is GoWithCrew, it cannot be OnLocation from UI, it should be OnLocation by completing job.


## On Rig Job Bin

- [ ] Schedule Product Haul - Shipping load sheet and blend request should be always aligned.

  ❌"Go With Crew" should not show up

  ❌ClientReprentative, programId not populated in shipping load sheet

  ✨Add program revision

- [ ] Reschedule Product Haul 
  ❌"Go With Crew" should not show up, and it shows up twice

  ❓What if the blend request is changed, how will product haul be updated?
  
  ✨Bind blend request with shipping load sheet together 


- [ ] Cancel Product Haul 

  - [ ] If Blend Request is processed, it cannot be canceled. Only product haul can be canceled. ❓How to change the blend load location then?

- [ ] On Location Product Haul Blend

​	❌Base Blend Name is not shown.

​	❌Shipping information is not shown properly

- [ ] On Location Product Haul 

​	❌Base Blend Name is not shown.

​	❌Shipping information is not shown properly



## On Bulk Plant Bin

- [x] Schedule Blend Request
  - [x] ✔Customer information is not populated
  - [ ] ❌Capacity validation is not working. If the bin is empty, it should be calculated by the blend schedueled bulk density against bin volume.
  - [ ] ✨Add program revision
- [ ] Reschedule Blend Request
- [x] Cancel Blend Request
- [ ] Haul Blend
  - [ ] ❌Call Sheet should be blank if don't know
  - [ ] ✨Blend Amount should be changed to Blend Total Tonnage and display total tonnage
  - [ ] ✨Use call sheet list over customer and rig.
  - [ ] ❌Shipping Load sheet missing bulk plant property and Estimate Load time
  - [ ] ✨Get Call sheet number from blend section, use view entity will be much faster.
- [ ] Reschedule Product Haul
  - [ ] ❌Shipping Load sheet description is not updated
  - [x] ❌Bulk Plant product haul should not be shown after on location
- [ ] On Location Product Haul
  - [ ] ✨Should allow shipping load sheet On Location separately
- [ ] ✨Product haul need a function “Load Blend”

## Other

- [ ] SanjelCrewSchedule, populate schedule type 
- [ ] WorkerSchedule, populate schedule type
- [ ] UnitSchedule, populate schedule type

## eService WCF Service Update

- [x] ✨Rig Job lat/long update

  - [ ] Create call sheet

- [x] Export locked call sheet

  

- [x] Save call sheet after locked

# Data Preparation



- [ ] ❌Populate shipping loadsheet description 

## 

- [ ] 

## Color Scheme

- Red – Needs haul
- Yellow – Haul scheduled
- Orange – Partially on location
- Green – All on location