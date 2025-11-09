<!--Identifier: P-01 -->

```mermaid
sequenceDiagram
box Oil & Gas Industry
    actor Client 
    actor Sanjel
end
    Client->>Sanjel: Cementing Service Invitation
    Sanjel->>Client: Service Proposal & Bidding
    Client->>Sanjel: Bidding Result
    Client->>Sanjel: Cementing Service Request
    Sanjel->>Sanjel: Perform Cementing Service
    Sanjel->>Client: Service Report & Invoice
    Client->>Sanjel: Make Payment
    Sanjel->>Sanjel: Post Job Analisys
    

```