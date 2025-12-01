<!-- Identifier: I-04-03 -->
<!-- Name: Cementing Service Request -->

```mermaid
sequenceDiagram
    actor Client 

box Sanjel
    actor Operation
    actor Logistics
    actor accounting
end
    Client->>Operation: Cementing Service Request
    Operation->>Operation: 01 - Find Program
    Operation->>Client: 02 - Request Job Info Confirmation
    Client-->>Operation: 03 - Confirm Job Infomation
    Operation->>Operation: 04 - Create Call Sheet
    Operation->>Operation: 05 - Plan Crew
    Operation->>Operation: 06 - Plan Equipment
    Operation->>Operation: 07 - Plan Material
    Operation-->>Logistics: 08 - Notify
    Logistics->>Logistics: 09 - Prepare Material
    Logistics->>Logistics: 0a - Deliver Material

```