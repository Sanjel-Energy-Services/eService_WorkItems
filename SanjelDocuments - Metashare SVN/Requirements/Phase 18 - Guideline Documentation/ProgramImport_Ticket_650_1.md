## Change Summary

###  Title

Import multi-well and well count from Job Design Template

### Requestor

Jason Schneider

### Urgency

Intermediate

### Target System/Organization/Business Process

<\<Business Process>>Bidding

## Business Vision

Assist to calculate a bid potential revenue

## Change Details

When Client Solutions Representative receive a bid request from customer, he will know if the bid is for multiple wells and the count of wells. Normally customer will provide a sample well information for program design. Based on the program designed for the sample well and the count of wells, we can calculate the potential total revenue. This will help us to make decision on pricing strategy for the bid.

### Current State

Client Solutions Representative makes estimate manually.

### Target State

This data can be imported to data warehouse and present the estimate on BI tool.

### Impacted Parties

- Client Solution Representative, provide these information to Job Designer.

- Job Designer enter these information to Job Design Template while designing the program.
- Job Designer import these information with program to eProgram.
- ETL process will transfer these information to data warehouse.
- BI report will use these information for profitability analysis. 

### Success Criteria

- Is multi-well flag and well count is imported to eProgram properly.
- eProgram display these two new data fields properly.
- These two data present in data warehouse program data.

### Wins/Benefits

- Bid winning rate improves.



### Application Mockup

![ProgramHeader](https://user-images.githubusercontent.com/55812393/71131316-9cb11380-21b1-11ea-8f1f-aea13e79fe8c.png)