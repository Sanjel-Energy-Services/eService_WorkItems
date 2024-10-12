## Change Summary

###  Title

Import Delivery Distance from Job Design Template

### Requestor

Jason Schneider

### Urgency

Intermediate

### Target System/Organization/Business Process

<\<Business Process>>Bidding

## Business Vision

Material delivery cost is an import portion of a job. Delivery distance is the distance from Bulk Plant to the job site. Sometimes material is delivered from further Bulk Plant, that means delivery cost will be much higher. This will help profitability analysis.

## Change Details

When Job Designer is making a real job program, he will query which warehouse has the required material and enter the distance from warehouse  to job site. 

### Current State

This data is no captured.

### Target State

All programs will be imported to eProgram with the delivery distance.

### Impacted Parties

- Job Designer enter delivery distance to Job Design Template while designing the program.

- Job Designer import this with program to eProgram.
- ETL process will transfer this flag to data warehouse.
- BI report will use these information for profitability analysis. 

### Success Criteria

- Import delivery distance to eProgram properly.
- eProgram display delivery distance data fields properly.
- This data present in data warehouse program data.

### Wins/Benefits

- Understand profitability better.



### Application Mockup

![ProgramHeader](https://user-images.githubusercontent.com/55812393/71131316-9cb11380-21b1-11ea-8f1f-aea13e79fe8c.png)