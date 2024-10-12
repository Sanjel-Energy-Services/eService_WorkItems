## Change Summary

### Title

Update Call Sheet from latest program revision

### Requestor

Jason Schneider/Chris Chubey

### Urgency

High

### Target System/Organization/Business Process

 <\<Application>>eProgram, <\<Application>>eService,<\<Application>>eServiceOnline, <\<Role>>Dispatch,<\<Role>>Client Solutions

## Business Vision

Keep job information updated to assure accurate job requirement information passed to operation crew.

## Change Details

### Current State

When client solution specialist requests a new program revision, job designer creates new program with new program ID and import to eProgarm.  Dispatch will be notified through email/phone/oral talk, and make corresponding changes manually.

### Target State

When client solution specialist requests a new program revision, job designer creates new program with same program ID, new revision number and import to eProgarm.  Dispatch will see an alert of the rig job created from this program on Rig Board. The alert is a amber color background in Company cell of the rig job. Dispatch is able to view the changes, accept changes, ignore changes and mark it for processing.

#### Data Fields to verify changes

- Complexity Matrix Score - Risk Matrix

- Pressure test value, using Estimated Max treating pressure 

- TVD - True Vertical Depth

- MD - True Measured Depth

- Casing Size (OD) - Casing pipes under same type according to job type. Each record has size and depth from/to. Any of this values is mismatched, it will be considered as change.

- Cement head/connection size (Top casing size) - Casing pipe which type is same as job type and Depth from is 0. This is the top pipe, its size is considered as Cement Head/Connection Size.

- Blend Change 
  
  Blend is Stage/Plug/Treatment Interval specific. Each operation event  under each Stage/Plug/Treatment Interval should have one blend + additives.  We need to check the blend and its additives change under the combination of each Stage/Plug/Treatment and Category.
  
  
  
  The categories are listed as following:
  
  - Preflush + additives
  - Preflush volume
  - Spacer + additives
  - Spacer Volume
  - Lead 1 blend + additives
  - Lead 1 Blend Quantity
  - Lead 2 blend + additives
  - Lead 2 blend Quantity
  - Lead 3 Blend  + additives
- Lead 3 Blend  Quantity
  - Lead 4 Blend  + additives
- Lead 4 Blend  Quantity
  - Tail Blend + additives
  - Tail Blend Quantity
  - Displacement additives
  - Displacement Volume
  
  
  
  ### Impacted Parties
  
- Dispatch can see all changes between originally selected program revision and latest revision.

- Dispatch can choose changes to apply to rig job.

- Dispatch can ignore new revision changes.

- Dispatch has to cancel or complete product haul if there is conflict among blend requirements.

  

### Success Criteria

-  After refreshing RigBoard page, the Company cell background shows  amber color if a new program revision is identified for the rig job.
- When right-click on a Company cell which background is amber color, context menu pops up with item "View Changes" .
- When click "View Changes" menu, program revision review page pops up, it shows selected revision and latest revision information side by side with checkboxes for different category items. Three buttons are displayed on the bottom, "Accept Changes", "Ignore Changes" and "Work on it Later". Checkboxes are defaulted as checked.
- When the checkboxes are checked and "Accept Changes" button is clicked, eService Online will verify if any change violates business rule. If validations are passed, rig job and associated call sheet is updated with new program revision data, Company cell background reset as normal,  call sheet base revision is updated as latest revision. If any validation is failed, detail conflict information will display for dispatch's reference to fix the conflict. 
- When "Ignore Changes" button is clicked, rig job max revision reference will be updated to latest revision. After refresh the RigBoard, Company cell background reset as normal.
- When "Work on it Later" button is clicked, no action will be taken against rig job data. Company cell background continues to be Amber.

  

### Wins/Benefits

- Maintain rig job data accuracy by aligning with the program revision change

