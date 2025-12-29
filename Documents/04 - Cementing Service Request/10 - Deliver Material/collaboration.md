<!-- Identifier: C-04-0a-03 -->
<!-- Name: Deliver Material -->

```mermaid
sequenceDiagram
    actor Logistics

box Product Haul System
    participant ProductHaulBoard
end
    Logistics->>ProductHaulBoard: 01 - Schedule Product Haul
    Logistics->>ProductHaulBoard: 02 - View Product Haul
    Logistics->>ProductHaulBoard: 03 - Re-Schedule Product Haul
    Logistics->>ProductHaulBoard: 04 - Cancel Product Haul

```