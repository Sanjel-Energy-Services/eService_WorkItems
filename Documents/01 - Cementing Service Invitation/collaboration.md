<!-- Identifier: C-01-03 -->
<!-- Name: Cementing Service Invitation -->


```mermaid
sequenceDiagram
    actor Client 

box Sanjel
    actor Sales
    actor Engineering
    actor Operation
    actor Logistics
    actor accounting
end
    Client->>+Sales: Cementing Service Invitation
    Sales->>+accounting: Credit Checking
    accounting-->>-Sales: Credit Result
    Sales->>+Engineering: Request Job Design
    Engineering -->>-Sales: Job Design
    Sales->>Sales: Prepare Job Proposal & Bid
    Sales->>Sales: Sales Forecast
    Sales-->>-Client: Service Proposal & Bid
```