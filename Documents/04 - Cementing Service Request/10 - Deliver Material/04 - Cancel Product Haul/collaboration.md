<!-- Identifier: P-04 -->
<!-- Name: Cancel Product Haul -->

```mermaid

sequenceDiagram
    actor Logi as Logistic Dispatch

    box Sanjel
       %%participant Bin
        participant HaulBlend
        participant CrewSchedule
        participant Popup as Cancel Product Haul Popup
         %%participant Bulker Crew
        
        participant ShippingLoadSheet
        participant UnitScheule
    end
   Logi->>CrewSchedule:Cancel Haul Blen
   %%Bin->>CrewSchedule: crewschedule related to this bin
   CrewSchedule->>ShippingLoadSheet: load sheeto related to this CrewSchedule
   ShippingLoadSheet->>Popup:list all load sheets with checkboxes  
   Logi->>Popup: Select which Shipping Load Sheet(s) to cancel
   
   alt Logi clicks "Yes"
        Popup->>ShippingLoadSheet: Cancel selected request Sheet(s)
        Popup->>Logi:the load sheet was cancelled
         Logi->>ShippingLoadSheet:Update ShippingLoad information
   CrewSchedule->>UnitScheule: Update Unit Schedule
   HaulBlend-->>Logi:Remove or Update
        %%HaulBlend-->>Logi:Remove or Update
    else User clicks "No"
        Popup-->>Logi: Close popup with no changes
    end

```



