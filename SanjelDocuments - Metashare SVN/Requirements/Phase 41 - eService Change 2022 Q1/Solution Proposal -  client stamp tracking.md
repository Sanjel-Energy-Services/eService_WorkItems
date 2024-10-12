## Solution Proposal for Client stamp tracking

The solution will be implemented in eService application. The tracking flags are mandatory in eService for field ticketing and manager approval. This will help enforce the business process and allow all parties to be aware of client stamp missing  and the causes.

Once the data is submitted to server, it will be exposed to AR and sales in BI dataset for further tracking and analysis.

 This process will not block current process for invoice generation and OVPP processing.


### Business Process for client stamp tracking

```mermaid
flowchart TD
A[Supervisor completes field ticket] --> B{Has a Client Stamp Captured?}
B--Yes-->C[Submit Ticket]
B--No-->D[Fill out Reason for not capturing Client stamp]
D-->C
C-->E[District Manager approves field Ticket]
E --> F{Has a Client Stamp Captured?}
F--Yes-->G[/Approved Ticket/]
F--No-->H[Fill out Reason for not capturing Client stamp]
H-->G
G-->I[/Invoice/]

```
### Solution Description

1. If the field supervisor has captured client stamp, he will toggle the checkbox "Is a Client Stamp Captured?" and fills in the stamp information.
2. If for any reason, the field supervisor is not able to capture the client stamp, he needs to fill out the reason in "Reason for not capturing Client Stamp"
3. The "Client Stamp Details" is mandatory for field ticket.
4. The supervisor submit ticket server
5. When district manager approves the ticket, the "Has a Client Stamp Captured?" checkbox will carry over the value from service ticket, district manager can modify it if field flag is wrong.
6. If for any reason, the checkbox is not toggled, the district manager needs to fill out the reason in "Reason for not capturing Client Stamp" within "Client Stamp Upon Approval".
7. Once the ticket is approved, the invoice will be generated.
8. All above tracking information will be available in daily job data in PowerBI. Sales and AR can use it for tracking and analysis purpose

### UI Mock

- Job Package From Local
![UI Mock](https://user-images.githubusercontent.com/55812393/159193891-627d97c0-a828-450d-93a5-a0e3a74a9424.png)
- Job Packages Awaiting Approval
![UI Mock_Approval](https://user-images.githubusercontent.com/55812393/158705914-b8a1e5a0-ccbf-4c06-b745-8e78a6ee9dd4.png)

