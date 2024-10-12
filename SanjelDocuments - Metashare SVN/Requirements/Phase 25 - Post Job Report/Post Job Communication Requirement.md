# Post Job Communication Requirement

## High Level Requirement



Currently field supervisor needs to compile a Post Job Communication document manually in a Word template and send to operation management and dispatch.  Most information are from service report in eService, these are duplicate effort wasted. For other information are in text format in word files, they are difficult to share across departments for maintenance and tracking purpose.

On another hand, the post job communication process collected field storage cement information which is key data to storage tracking function in eService Online, but these valuable data is not in the system.



## High Level Solution



- Implement Post Job Report in eService Express to allow field supervisor enter required information under a job. 
- Post Job Report will be sent to Dispatch and Operation in formatted email once the job is completed.
- Post Job Report data will be sent to server and associated with the job.
- Post Job Report data will be queryable 



## Business Process

The Post Job Report process has been established in operation. We only change the means to entry to information and email sending will be automated.



## Acceptance Criteria

- Post Job Report will pull cement information from service ticket to allow supervisor enter pumped volume once to eliminate double data entry.
- Post Job Report will pull storage information from service report which carried over from call sheet to allow field supervisor verify and update the actual volume on site.
- Post Job Report will pull unit information from service report to allow field supervisor entry maintenance record properly
- Post Job Report will allow field supervisor to enter other requirement information in text format.
- All information from Post Job Report will be associate with the job, the unit and queryable.
- Post Job Report will be sent to Dispatch and Operation Management in a formatted email, and can be queried after received on server.

## Tasks

1. Solution & Design - 40 hours
2. Add Post Job Report Interface to eService Express - 80 hours
3. Add local and server function to receive post job report - 80 hours
4. Add formatted email function -40 hours
5. Test and Deployment - 40 hours

## Limitation

So far we haven't analyzed the requirement of how the post job information is used. On eService Online - Bin Tracking project, we need the storage cement information, this will be included it that project. For other parties to access the information, we will need extra work to analyze and implement. 