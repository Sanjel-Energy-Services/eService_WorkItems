```mermaid
sequenceDiagram
	participant ESO as eServiceOnline
	participant BPAVS
	ESO->>BPAVS: Load Sheet List
	BPAVS->>BPAVS: Select A Load Sheet 
	ESO->>BPAVS: Get A Load Sheet 
	alt is blend
	BPAVS->>BPAVS: Break down into cuts
    loop Every cut
		BPAVS->>BPAVS: Blend cut
		BPAVS->>BPAVS: Load cut to bulker/storage
		BPAVS->>ESO: Post cut sheet
    end
		BPAVS->>ESO: Post Load Sheet completed
	end
	opt is transfer
		BPAVS->>BPAVS: Load cut to bulker
		BPAVS->>ESO: Post Load Sheet completed
	end

```

```mermaid
classDiagram
	class LoadSheet {
        + Id
        + CallsheetNumber
        + StartTime
        + EndTime
        + Status
        + BlendRecipe
        + TargetWeight
        + ActualWeight
        + IsAHaul?
        + MTSNumber
        + UnitNumber
        + LoadFrom
        + LoadDestination
        + CutCount
	}
	
	class BlendCut {
        + Id
        + ProductHaulLoadId
        + CutDetails
        + Status
        + StartTime
        + EndTime
        + TargetWeight
        + ActualWeight
        + BlendTemp
        + SequenceNumber
	}
	
	class BlendSample {
		+ Id
		+ BlendCutId
		+ ProductHaulLoadId
		+ TimeStamp
		+ Label
	}
	
	class Storage {
		+ Id
		+ StorageType
		+ PodCount
		+ TotalVolume
	}
	
	class StoragePod {
		+ Id
		+ storageId
		+ Volume
	}
	
	class CutDetail {
		+ CutSheetId
		+ Chemical
		+ TargetWeight
		+ ActualWeight
		+ StartTime
		+ Endtime
		+ Lot #
		+ Status
	}
	
	class CutTransfer {
		+ CutSheetId
        + LoadFrom
        + LoadDestination
		+ Weight
	}
	LoadSheet "1" <-- "*" BlendCut
	BlendCut "1" <-- "*" BlendSample
	BlendCut "1" *-- CutDetail
	BlendCut "1" *-- CutTransfer
	BlendCut ..> Storage
 	Storage "1" *--> "1..4" StoragePod
 	
```

### Design Highlights

- Capture all timestamps per actions
- Data post on cut level.  Can be on chemical level if needed.
- MTS only generated on transfer to bulker/B-Train for a haul.
- MTS will be saved on server to be accessed across all system if needed.
- Load sheet also covers blend transfer request.
- Future movement journal integration with AX



### Design Details



#### Cut Status

