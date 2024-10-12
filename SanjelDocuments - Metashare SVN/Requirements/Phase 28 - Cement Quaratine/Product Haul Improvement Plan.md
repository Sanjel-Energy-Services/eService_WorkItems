# Product Haul Improvement Plan



### 1. Schedule Blend Request only

This will allow scheduling blend request without knowing:

- Shipping schedule.
- Bulker crew
- Bulk Plant Storage



#### Menu for Scheduling Blend Request Only over Blend columns on RigBoard

![Menu_Schedule_BlendRequest_from_Blend](https://user-images.githubusercontent.com/55812393/174885396-4861bec1-8fbe-4778-bbd5-0b2543d4eb86.png)

1. Schedule Blend.

   - Create product load sheet in Scheduled status.

   - No Bin is required. Only bulk plant bin is listed for selection. If a bin is selected, the blend will be flagged stored in bulk plant bin. 

   - Blend Test flag is optional. No bin list update if blend test is checked. Carry over blend test flag from call sheet as usual. Blend Test flag will request Date Required for further Lab  Testing integration.

   - Blend Request will be available to BPAVS.

   - Estimated Load Time is helping dispatch/BPO to prioritize the blend request.

     ![Schedule_Blend_Request_From_Blend](https://user-images.githubusercontent.com/55812393/174883421-5afbc9ea-4207-49e6-9123-b69199fc8394.png)

2. Reschedule Blend.

   - Allow modification to amount, mix water, blend test flag, bulk plant, bin and comments only if the blend request is Scheduled status. 

   UI is same as  "Schedule Blend".

   

3. Cancel Blend.

   - Allow cancellation of a blend request only if the blend request is Scheduled status.

     

4. Haul Blend. This is Product Haul Process separated from before and add pod load/split bin load function. 

   1. Default to load to one bin.
   2. Pod Load is optional. We will allow Bulk Plant operator to fill out the pod loads in BPAVS.

![Haul_Blend_From_Blend_from_Blend](https://user-images.githubusercontent.com/55812393/174887959-4e898b49-ea42-48ea-b992-3adcad002f80.png)

To support split load to rig bin. We need extend single bin number to a multiple bin structure.



### 2. Original Schedule Product Haul Change

![v2_Schedule_Product_Haul_From_Blend](https://user-images.githubusercontent.com/55812393/174892474-a4e50136-2d97-42fa-939c-944db51d92e8.png)

### 3. Original Schedule Blend From Rig Bin Change

Same Rig bin change and pod allocation change as above.



### 4. Haul Blend from Bulk Plant Bin

Here we have two scenarios to handle.

- The blend was scheduled from rig board, it has call sheet number associated, it will be same function as you click "Haul Blend" over the blend on RigBoard.
- The blend was scheduled from a program. Here is the place to associate it with a call sheet.

![v2_Haul_Blend_From_BulkPlant_Bin](https://user-images.githubusercontent.com/55812393/174894942-143eda91-e67e-4ec9-b9bd-e0a403956958.png)

### 5. Auto load after blending is completed

Currently, BPAVS doesn't have the function for Load action. Once the blending process is completed, the load sheet will be set as following status automatically.

1. If the product haul has been set for the load sheet, status Loaded will be set.
2. If the blend load sheet is scheduled to a bulk plant bin, and blend testing is not required. Status Ready will be set.
3. If the blend load sheet is scheduled to a bulk plant bin, and blend testing is required. Status Stored will be set. At same time the Blend Test process will be activated, another flag BlendTestingStatus will reflect the testing process.

BPAVS requirement: If load sheet doesn't have destination bin in bulk plant, bulk plant operator needs to fill in and post back through API.

### 6. Pod Loads and Shipping Load Sheet

We will need separate load sheets to handle splitting loads function, which means one bigger blend request will be hauled couple times. Or the blend was requested by program, it needs to be back-linked to a job which is going to consume it. They are the subset of original load sheet only covers certain sub-statuses. Shipping Load Sheet is invisible to user. 

Bulkers and B-Trains have up to 4 pods. MTS requires the weight of product in each pod. This is related to Product Haul. Each pod will have the reference to the Shipping Load Sheet.  The pods allocation can be entered by dispatch or BPO in BPAVS.

BPAVS requirement: Post pod allocation data to server through API.

### 7. Product Haul is MTS

We have all information related to product shipping at backend so far. That means MTS is on server already. BAPVS will be able to load up MTS from server and print out.

BPAVS requirement: Retrieve MTS from server through API.

### 8. Blend Test flag change

We are going to remove the logic between blend test flag and the destination location. From the feedback, we may need to perform blend test regardless the blend will be stored in Bulk Plant bin or haul to rig bin or remote bulk plant bin.

The Blend Test flag will be purely used to trigger test request after the blending is completed.

BPAVS requirement: Post sample information for Lab Database integration.

### 9. Fault blend process 

All fault blend will stay in storage as Fault status. Includes following scenarios:

- Test failed awaiting for approval
- Test failed not approved.
- Good blend but Job canceled.
- Fault blend by interrupted blending. 
- Recycled.

Further action will set the blend specific status for future use.

Any blended product can be reblend to another blend. This falls to the fault blend process. The blend reusability is bound to storage content property. The last load sheet is accessible to everything storage that not empty.  Re-blend may also need blend log for original blend accuracy. Re-blend process should happen against storage.

#### Test Failed blend approval

If a blend request is completed and lab test is failed, the blend request needs to be put into a workflow for approval. Lab Database integration is needed to view test request and test result for reference. Before the integration happens, a single action for approval and disapproval is needed. Once the blend is approved to use as is, the load sheet status is changed to Ready. 

![v2_Menu_Schedule_BlendRequest_From_Bulk_Plant_Bin](https://user-images.githubusercontent.com/55812393/174911665-ab4191d3-178d-4c19-95ba-be8ced5bdc1b.png)

### 10. Transfer Blend

Blend can be transferred from one storage to anther at same location.

### 11. Blend On Location

We have a major issue to mark the blend is on location to remove it from the Bulk Plant board and also wrong the status in database which drag down the performance.

Current mechanism is only handling the load sheet which associated with a call sheet. When a dispatch marks a job as "Completed", there is a checkbox for him to confirm the blends are on location, the bin are emptied and crew/equipment are released. But it is not enough to maintain the data accuracy and integrity. eService also completes the job automatically when the job package is received on server. This automation doesn't give the opportunities for dispatch to mark some exceptions.

We may give a interim status "Field Job Completed" on rig board, this will alert dispatch to complete the job explicitly to assure blends, equipment, crew are released or processed.



### 12. Product Haul Board  change

Product Haul board is showing all blend requests as a dashboard, but it doesn't have proper filters and functions to help dispatch or BPOs. We still have some gaps in business process not being closed by the features proposed above. We may add functions on Product Haul Board to close the gaps. Feedback is needed.

Dispatch or Logistics Coordinator can also change the blend request order by updating the estimated load time.















