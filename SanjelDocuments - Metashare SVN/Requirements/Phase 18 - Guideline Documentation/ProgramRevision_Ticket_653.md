## Change Summary

### Title

Implement program revisions

### Requestor

Jason Schneider

### Urgency

High

### Target System/Organization/Business Process

<\<Business Process>>Program Management, <\<Application>>eProgram, <\<Application>>eService, <\<Application>>eServiceOnline, <\<Role>>Client Solutions>>,<\<Role>>Dispatch,<\<Role>>Field Supervisor

## Business Vision

Responding to customer's change request and convey the change to operation in proper time manner. This will help to assure the job quality and improve customer satisfaction. 

## Change Details

Currently when a revision is created, a new number is created and imported. In this way, the system does not know that this is a revision and causes confusion with the proper program number. When a revision is created, the same PRG number should remain, and a revision number be added to this number.

Once we have a consistent program number plus revision number, we will know program change after call sheet is changed from previous revision and be able to update the change to call sheet by following customer's decision.

### Current State

Once program is imported it cannot be updated from program change, the change can only be implemented either by re-import program with a new program number or manual communication.

### Target State

Client Solution Specialist can maintain an unique program number through biding and operation process. Program revision will be used to track modification to the program made by shareholders.  After the call sheet is created from a program, an alter will be raised if there is a new revision created for the program. The program revision will be available to all parties involved to all parties in operation process to assure information accuracy.

### Impacted Parties

- Client Solution Specialist may request the program revise upon client's request or job information change.
- Technical Specialist will increase revision number in Job Design Template for the program revised upon Client Solution Specialist's request.
- Technical Specialist will import the revised program exported from Job Design Template to eProgram.
- eProgram will create a new program record with same program id and new revision number.
- When Dispatch creates  a Call Sheet from a program id,  he will able to select one revision if there are many. The Call Sheet will be created from the selected program record determined by program id and revision number.
- When a program is revised after the Call Sheet is created,  a notification will be sent to Dispatch by email and also on Rig Board. Dispatch will determine if Call Sheet needs to be updated with new program revision.

### Success Criteria

- eProgram import program file with revision number properly. 
- eProgram display revision number properly.
- eService display revision options after program is entered.
- eService load up selected revision program information properly.
- eService create call sheet from selected revision program properly.
- eService can notify Dispatch when a call sheet is open and the originated program has a new revision, and also allow Dispatch to decide if update call sheet from newly selected program revision.
- eService can update Call Sheet from newly selected program revision properly.
- eService Online can show an indicator on Rig Board  regarding the originated program has a new revision. 
- Dispatch can trigger Rig Job/Call Sheet update from newly selected program revision from Rig Board.

### Wins/Benefits

- Manage program consistently.
- Assure job information accurate while executing operations.



