## Change Summary

###  Title

Import "Is a Bid Program" flag from Job Design Template

### Requestor

Jason Schneider

### Urgency

Intermediate

### Target System/Organization/Business Process

<\<Business Process>>Bidding

## Business Vision

Differentiate bid program from real program, get better understanding the percentage of bid programs leads to a real job. And also help to find out why some bids are lost.

## Change Details

When Client Solutions Representative receive a bid request from customer, Job Designer will design a bid program as a proposal. If Sanjel wins the bid, the program will be updated as a real job program.

### Current State

Only won programs are imported to eProgram.

### Target State

All programs will be imported to eProgram with the "Is a bid program" flag.

### Impacted Parties

- Job Designer enter this flag to Job Design Template while designing the program.

- Job Designer import this with program to eProgram.
- ETL process will transfer this flag to data warehouse.
- BI report will use these information for profitability analysis. 

### Success Criteria

- Is a bid program to eProgram properly.
- eProgram display this flag data fields properly.
- This data present in data warehouse program data.

### Wins/Benefits

- Understand competition result



### Application Mockup

![ProgramHeader](https://user-images.githubusercontent.com/55812393/71131316-9cb11380-21b1-11ea-8f1f-aea13e79fe8c.png)