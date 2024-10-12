## Change Summary

### Title

Display new program revision alert on RigBoard and process the change

### Requestor

Jason Schneider/Chris Chubey

### Urgency

High

### Target System/Organization/Business Process

 <\<Application>>eProgram, <\<Application>>eService,<\<Application>>eServiceOnline, <\<Role>>Dispatch,<\<Role>>Client Solutions>>

## Business Vision

Provide live update for new program revision to avoid communication failure.

## Change Details

### Current State

When client solution specialist requests a new program revision, job designer creates new program with new program ID and import to eProgarm.  Dispatch will be notified through email/phone/oral talk, and make corresponding changes manually.

### Target State

When client solution specialist requests a new program revision, job designer creates new program with same program ID, new revision number and import to eProgarm.  Dispatch will see an alert of the rig job created from this program on Rig Board. The alert is a flashing amber color background in Company cell of the rig job. Dispatch is able to view the changes, accept changes, ignore changes and mark it for processing later.



### Impacted Parties

- Dispatch can see all changes between originally selected program revision and latest revision.

- Dispatch can choose changes to apply to rig job.

- Dispatch can ignore new revision changes.

- Dispatch has to cancel or complete product haul if there is conflict among blend requirements.

  

### Success Criteria

- After refreshing RigBoard page, the Company cell background shows flashing amber color if a new program revision is identified for the rig job.

- When mouse hovers over a Company cell which background is flashing amber color, context menu pops up with item "View Changes" .

- When click "View Changes" menu, program revision review page pops up, it shows selected revision and latest revision information side by side with checkboxes for different category items. (Category list will be provided later). Three buttons are displayed on the bottom, "Accept Changes", "Ignore Changes" and "Work on it Later".

- When the checkboxes are checked and "Accept Changes" button is clicked, eService Online will verify if any change violates business rule. If validations are passed, rig job is updated with new program revision data. If any validation is failed, detail conflict information will display for dispatch's reference to fix the conflict.

- When "Ignore Changes" button is clicked, rig job max revision reference will be updated to latest revision. After refresh the RigBoard, Company cell background stop flashing.

- When "Work on it Later" button is clicked, no action will be taken against rig job data. Company cell background continues flashing.

  

### Wins/Benefits

- Maintain rig job data accuracy by aligning with the program revision change

