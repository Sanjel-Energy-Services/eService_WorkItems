<!-- Identifier: C-01 -->
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
    Client->>+Sales: 1. Cementing Service Invitation
    Sales->>+accounting: 2. Credit Checking
    accounting-->>-Sales: 3. Credit Result
    Sales->>+Engineering: 4. Request Job Design
    Engineering->>+ Engineering: 5. Prepare Job Design
    Engineering -->>-Sales: 6. Job Design
    Sales->>Sales: 7. Prepare Job Proposal & Bid
    Sales->>Sales: 8. Sales Forecast
    Sales-->>-Client: 9. Service Proposal & Bid
```