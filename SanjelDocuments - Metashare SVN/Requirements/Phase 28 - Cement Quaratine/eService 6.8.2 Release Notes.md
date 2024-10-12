# eService 6.8.2 Release Notes

## Major Changes

### Company Information section change

We had experienced a lot of challenges with client company and invoicing company validation in eservice. This major change has addressed most of the issues.

1. Add explicit flag "IS Client" in company information section, there must be one and only one company can be flagged as a client. There will be a data conversion with deployment. Imported programs, call sheets and jobs should be converted properly. No need to change Excel program.

![image](https://user-images.githubusercontent.com/55812393/129236528-4f173d4d-e3a2-490c-be3f-2314e1b4219c.png)

2. Existing "Is To Be Invoiced" flag indicates who is going to pay Sanjel. There must be one and only one company can be flagged as an invoicing company.

3. Company Type will be a label only. We can add more than two companies in call sheet to include all stakeholders. However, Job Design Template will stay with existing business rules of company type until corresponding change will be made.

4. Add a validation in Call Sheet to ask dispatch reselect the company in the dropdown list if there is no company id imported in program.

   ![image](https://user-images.githubusercontent.com/55812393/129236251-d546dbee-96db-4e16-8cee-a010433404bb.png)

5. COD customer will be checked again who is flagged with "To Be Invoiced".

6. Call Sheet, Field Service Ticket and Approved Service Ticket are updated to apply above changes. Clearly labels if the second company is a consulting company only or it is also be invoiced. The address will be always the invoicing company address.

![image](https://user-images.githubusercontent.com/55812393/129237788-94392cff-2c33-455f-b1e1-77c8d772fcd1.png)



### Eliminate Call Sheet Export/Import

As the network coverage getting significant improved, we can create job package online instead exporting to an USB file. This will save supervisor's time and avoid a couple of failure points.

1. Remove the "Export" button under "Call Sheet From Server" tab.
2. Remove the "Call Sheets From Local" , as it is no longer needed.

![image](https://user-images.githubusercontent.com/55812393/129239738-dfb5c481-ebd9-413b-bb92-8dd84f9e31f5.png)

**When creating a Job, there is a new option to select Call Sheet**

1.  Select dispatched Call Sheet while creating job package on local

    Note: Only Cal Sheet with a Ready status will show in the list

![image](https://user-images.githubusercontent.com/55812393/129240120-55759f8b-9e82-4d19-89b5-3aa6145aeeda.png)

2. All other functions are maintained same.



#### What to do if the call sheet is locked

Sometimes dispatch may need to create a job again from a call sheet. However, call sheet will be locked once it is used to create a job. Under following circumstances, you can handle it or work around it.

- Job is postponed and needs to be reschedule. Use "Postpone" function.
- Incomplete Job. Use "Input Call Sheet Number" function to work around. However, the RigBoard status will be incorrect, please notify IT.
- Issues in creating job. Use "Input Call Sheet Number" function to work around. 



### Push Back job for Re-approval

This change allows authorized personnel to push back an approved job package to "Awaiting Approval" status. 

Under "Job Packages From Server" tab, click on an approved job, the "Revert Approval" button will be enabled. Click on the button, the selected job will be sent back for re-approval.

Only the OVPP app will be updated by the changes after a re-approval. The changes will only be made to OIVPP if the pay period is not locked

Following Integrations **are not** triggered by the re-approval.

- AX - The changes in made in eService won't be updated automatically. Manual update in AX is needed. You must notify Accounting to make the changes.
- SCORE - The changes in made in eService won't be updated automatically. Manual update in score is needed. You must notify HSE to make the changes.



![image](https://user-images.githubusercontent.com/55812393/129241350-c34d1806-0489-4e51-9a3b-3b4b9d922038.png)

### No Service Report needed for Product Sale Job 

This change will make creating a job package for a Product Sale a lot simpler. A service report is not needed for a product sale, greatly simplifying the mandatory fields. Any validation in the job package header is still required.

### Depth label wording change

There are always different understanding of the direction of 'Depth From' and 'Depth To'. We reword these two terms to Depth Top and Depth Bottom in app and printout to clear up the inconsistency.

![image](https://user-images.githubusercontent.com/55812393/129244102-fdf7ea11-a2bc-4870-9fa8-0cbd7d3da4f1.png)

## Bug Fixes

- Search call sheets/jobs earlier than  2009 not working

- Pricing items missing in Service Ticket printout and total miscalculated. 

- Rig is not activated automatically when a call sheet is created using it.
