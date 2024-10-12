# Product Haul Enhancement Design Proposal

### Requirements Highlight

To enhance eService Online to support creating product haul without call sheet, we have identified scenarios in following groups:

- Schedule blend & haul for job site.

- Schedule blend & haul for project work.

- Schedule blend for product sale.

- Schedule blend/product transfer among bulk plant, project bulk plant and rig .

  

Detail scenarios refers to Blend Request Scenarios document and Process Diagram

### Process Enforcement

To implement above requirements, we need following business process in place to work with software functions.

- Product sale must have a call sheet.
- Job associated blend must have a call sheet
- Project associated pre-blend must have a program.

### New to Scope

Currently we may have a bulk plant blends for multiple districts. BPAVS use service point to filter scheduled product hauls, it won't show the ones in another district. We will provide a dropdown to default bulk plant by service point, but dispatch can still change it if the blend will happen in another bulk plant. 

### Software Design

 To satisfy the above requirements, we propose UI designs.

#### Design 1: Utilize Rig Board as the single operation interface

- Add Sanjel bulk plant/project bulk plant in the same way as a rig and attach storage to it, it will allow dispatch to schedule load request towards bulk plant under "no call sheet" scenarios.
![ScheduleProducHaul-S7-1](https://user-images.githubusercontent.com/55812393/119878901-e85c0680-bee7-11eb-8e6d-48cd27573678.png)
- Add product sale customer in the same way as a drilling company and also in the same way as a rig, it will allow dispatch to schedule load request in same way as regular jobs.
- Tweaking current product haul form in different format to fit different schedule needs.

  - Scenario 3, Schedule a blend for a job and load to a bin attached to bulk plant awaiting blend test (Has call sheet)

    1. Schedule a product haul as usual
        ![image](https://user-images.githubusercontent.com/55812393/128249544-2cf12265-fb59-4f38-9aa5-c926ab4ce55e.png)
    2. You will see a new checkbox "Blend Test".
    ![image](https://user-images.githubusercontent.com/55812393/128376514-1619d661-6530-4383-b0ae-bda3db81e55d.png)
    3. If you check "Blend Test", it will hide the data fields for hauling product to rig. There bulk plant list will be defaulted by service point. The storages in this bulk plant will be listed. If you don't choose a Storage number. Bulk plant operation will pick up one when he is doing blending in BPAVS.
    ![ScheduleProducHaul-S3](https://user-images.githubusercontent.com/55812393/128252467-34ae32ab-ef5c-4f2b-b751-e7e31c18628d.png)
  
  - Scenario 4/5, Schedule a haul to transfer pre-blended blend to a bin attached to a rig for a job (Has call sheet), or go with crew.
  
    1. Once a blend is scheduled for testing, you can find it under "Re-schedule Product Haul", there will be a sub-menu called "Blend in Test".

![ScheduleProducHaul-S4-1](https://user-images.githubusercontent.com/55812393/119880271-4f2def80-bee9-11eb-969c-48a03714018b.png)

2. When you click on the product schedule, a schedule interface which is similar to classic schedule product haul interface. You can enter the amount will be haul away. It will take out the blend from bulk plant storage and load to bulker and ship to field job.

![image](https://user-images.githubusercontent.com/55812393/128255692-9f9fd3bb-041b-4658-a9da-1be2cc7dc95e.png)

- ​	Scenario 6. Schedule a blend haul for a project to a storage attached to a rig (No call sheet). 

  1. Start from a bin attached to customer project bulk plant, select "Schedule a blend".
  
  ![image](https://user-images.githubusercontent.com/55812393/119878901-e85c0680-bee7-11eb-8e6d-48cd27573678.png)
  
  ​		2. Customer name will be carried in, customer's programs will be populated. Select one program, the needed blends will be populated. Select one blend to continue as usual without checking "Blend Test" 

![image](https://user-images.githubusercontent.com/55812393/128375856-c2cc1c2c-c08e-4bb1-be29-7ee75258fb5a.png)

- Scenario 7.  Schedule a blend and transfer to a bin attached to bulk plant (No call sheet)

  1. Start from a bin attached to customer project bulk plant, select "Schedule a blend".
  
   ![image](https://user-images.githubusercontent.com/55812393/119878901-e85c0680-bee7-11eb-8e6d-48cd27573678.png)
  
  2. Customer name will be carried in, customer's programs will be populated. Select one program, the needed blends will be populated. Select one blend and  check "Blend Test".

![image](https://user-images.githubusercontent.com/55812393/128375217-3849787c-b0a5-4096-98c1-5aa6ebec56ef.png)



- Scenario 15. Schedule a haul for blended product from one location to another (Bulk Plant storage or Project storage or Rig storage) (No call sheet)

  1. Start from a bin. Select "Transfer a blend".

   ![image](https://user-images.githubusercontent.com/55812393/119878901-e85c0680-bee7-11eb-8e6d-48cd27573678.png)

  2. The information of blend will be loaded up from database, fill out transfer amount and product haul information. Call Sheet Number or Program Id will show up to indicate where the recipe was from

![image](https://user-images.githubusercontent.com/55812393/128380217-eb48da17-6160-4eba-a3b3-93e2c63d3c39.png)

#### Design 2: Create separate dashboard for load request

- Create load request board and add new functions on this board. The list style is similar to current Product Haul page in eService Online. The UI design will be similar to Rig Board.

![LoadRequestBoard](https://user-images.githubusercontent.com/55812393/119881235-4be73380-beea-11eb-95da-236a2506ec79.png)

### Next step

The analysis and design have considered requirements in the same domain but not in the project scope.  We are able to support followings down the road.

- Blend verification process.  Load request will be fed into BPAVS for blending, sampling and loading,  blend result with loaded destination can be posted back to server side.
- Blend Testing process. BPAVS will generate sample labels, test request will be  able to generate and send to Lab Database app.
- Electronic MTS.  MTS data will be accessible everywhere.
- Blend storage tracking. Tracking blend in and out for all storages on site to replace current spreadsheet tracker.
