<!-- Identifier: P-01-03  -->
<!-- Name: Bidding Result -->

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
    Client->>+Sales: Bidding Result
    alt Won
      Sales->>Operation: 01 - Notify
      Operation->>Operation: 02 - Operation Forecast
      Operation->>Operation: 03 - Resource Planning
      Operation->>Logistics: 04 - Notify
      Logistics->>Logistics: 05 - Material Forecast
    end
    opt Lost
      Sales->>Sales: 06 - Archive Proposal
    end

```