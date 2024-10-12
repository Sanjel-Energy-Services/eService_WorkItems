### Call Sheet & Job
```c#
    public enum EServiceEntityStatus
    {
        [EnumMember] [Description("Empty")] Empty = 0x0,
        [EnumMember] [Description("Ready")] Ready = 0x1,
        [EnumMember] [Description("In Progress")] InProgress = 0x2,
        [EnumMember] [Description("Transmitted")] Transmitted = 0x3,
        [EnumMember] [Description("Canceled")] Canceled = 0x4,
        [EnumMember] [Description("Locked")] Locked = 0x5,
        [EnumMember] [Description("In Route")] InRoute = 0x6,
        [EnumMember] [Description("Assembled")] Assembled = 0x7,
        [EnumMember] [Description("Received")] Received = 0x8,  
        [EnumMember] [Description("PreTransmitted")] PreTransmitted = 0x9,
        [EnumMember] [Description("Deleted")] Deleted = 0xA,
        [EnumMember] [Description("Pending")] Pending = 0xB,
        [EnumMember] [Description("Confirmed")] Confirmed = 0xC,
        [EnumMember] [Description("Scheduled")] Scheduled = 0xD,
        [EnumMember] [Description("Dispatched")] Dispatched = 0xE,
        [EnumMember] [Description("Completed")] Completed = 0xF,
        [EnumMember] [Description("Alerted")] Alerted = 0x10,
        [EnumMember] [Description("Expired")] Expired = 0x11,
       
        [EnumMember] [Description("Awaiting Approval")] AwaitingApproval = 0x200,
        [EnumMember] [Description("Approving")] Approving = 0x400,
        [EnumMember] [Description("Approved")] Approved = 0x800,

        [EnumMember] [Description("Exception")] Exception = 0x1000,
        [EnumMember] [Description("Succeed")] Succeed = 0x2000,
        [EnumMember] [Description("Failed")] Failed = 0x4000,
    }
```

### RigJob

```C#
	public enum JobLifeStatus
	{
		[EnumMember]
		[Description("None")]
		None = 0,
		
		[EnumMember]
		[Description("Alerted")]
		Alerted = 1,
		
		[EnumMember]
		[Description("Pending")]
		Pending = 2,
		
		[EnumMember]
		[Description("Confirmed")]
		Confirmed = 3,
		
		[EnumMember]
		[Description("Scheduled")]
		Scheduled = 4,
		
		[EnumMember]
		[Description("Dispatched")]
		Dispatched = 5,
		
		[EnumMember]
		[Description("Canceled")]
		Canceled = 6,
		
		[EnumMember]
		[Description("InProgress")]
		InProgress = 7,
		
		[EnumMember]
		[Description("Completed")]
		Completed = 8,
		
		[EnumMember]
		[Description("Deleted")]
		Deleted = 9,
		
	}
```



### Product Haul

```C#
	public enum ProductHaulStatus
	{
		[EnumMember]
		[Description("Empty")]
		Empty = 0,
		
		[EnumMember]
		[Description("Pending")]
		Pending = 1,
		
		[EnumMember]
		[Description("Scheduled")]
		Scheduled = 2,
		
		[EnumMember]
		[Description("In Progress")]
		InProgress = 3,
		
		[EnumMember]
		[Description("On Location")]
		OnLocation = 4,
		
		[EnumMember]
		[Description("Loading")]
		Loading = 5,
		
		[EnumMember]
		[Description("Loaded")]
		Loaded = 6,
		
		[EnumMember]
		[Description("Returned")]
		Returned = 7,
		
	}
```

### Product Haul Load (Blend Request)

```C#
	public enum ProductHaulLoadStatus
	{
		[EnumMember]
		[Description("Empty")]
		Empty = 0,
		
		[EnumMember]
		[Description("Scheduled")]
		Scheduled = 1,
		
		[EnumMember]
		[Description("OnLocation")]
		OnLocation = 2,
		
		[EnumMember]
		[Description("Blending")]
		Blending = 3,
		
		[EnumMember]
		[Description("BlendCompleted")]
		BlendCompleted = 4,
		
		[EnumMember]
		[Description("Loaded")]
		Loaded = 5,
		
		[EnumMember]
		[Description("HaulScheduled")]
		HaulScheduled = 6,
		
		[EnumMember]
		[Description("Stored")]
		Stored = 7,
		
		[EnumMember]
		[Description("JobCanceled")]
		JobCanceled = 8,
		
		[EnumMember]
		[Description("Recycled")]
		Recycled = 9,
		
		[EnumMember]
		[Description("FaultBlend")]
		FaultBlend = 10,
		
		[EnumMember]
		[Description("GoodToUse")]
		GoodToUse = 11,
		
		[EnumMember]
		[Description("Reblended")]
		Reblended = 12,
		
		[EnumMember]
		[Description("Ready")]
		Ready = 13,
		
		[EnumMember]
		[Description("PartialHaulScheduled")]
		PartialHaulScheduled = 14,
		
	}
```

### Shipping Load Sheet

```C#
	public enum ShippingStatus
	{
		[EnumMember]
		[Description("Empty")]
		Empty = 0,
		
		[EnumMember]
		[Description("Scheduled")]
		Scheduled = 1,
		
		[EnumMember]
		[Description("Loaded")]
		Loaded = 2,
		
		[EnumMember]
		[Description("OnLocation")]
		OnLocation = 3,
		
	}

```

### RigJobCrewSection (Job Assignment)

```C#
	public enum RigJobCrewSectionStatus
	{
		[EnumMember]
		[Description("Assigned")]
		Assigned = 1,
		
		[EnumMember]
		[Description("Scheduled")]
		Scheduled = 2,
		
		[EnumMember]
		[Description("Removed")]
		Removed = 3,
		
		[EnumMember]
		[Description("Called")]
		Called = 4,
		
		[EnumMember]
		[Description("Log On Duty")]
		LogOnDuty = 5,
		
		[EnumMember]
		[Description("Log Off Duty")]
		LogOffDuty = 6,
		
		[EnumMember]
		[Description("Loading")]
		Loading = 7,
		
		[EnumMember]
		[Description("Loaded")]
		Loaded = 8,
		
		[EnumMember]
		[Description("En Route")]
		EnRoute = 9,
		
		[EnumMember]
		[Description("On Location")]
		OnLocation = 10,
		
		[EnumMember]
		[Description("On Way In")]
		OnWayIn = 11,
		
		[EnumMember]
		[Description("Returned")]
		Returned = 12,
		
	}
```

### BulkerCrewLog

```C#
	public enum BulkerCrewStatus
	{
		[EnumMember]
		[Description("None")]
		None = 0,
		
		[EnumMember]
		[Description("Off Duty")]
		OffDuty = 1,
		
		[EnumMember]
		[Description("En Route")]
		EnRoute = 2,
		
		[EnumMember]
		[Description("Called")]
		Called = 3,
		
		[EnumMember]
		[Description("On Way In")]
		OnWayIn = 4,
		
		[EnumMember]
		[Description("GTG")]
		GoodToGo = 5,
		
		[EnumMember]
		[Description("Load Requested")]
		LoadRequested = 6,
		
		[EnumMember]
		[Description("Down")]
		Down = 7,
		
		[EnumMember]
		[Description("On Location")]
		OnLocation = 8,
		
		[EnumMember]
		[Description("Returned")]
		Returned = 9,
		
		[EnumMember]
		[Description("Loaded")]
		Loaded = 10,
		
		[EnumMember]
		[Description("Loading")]
		Loading = 11,
		
	}
```

### BlendShippingStatus (Blend Request needs it)

```C#
	public enum BlendShippingStatus
	{
		[EnumMember]
		[Description("Empty")]
		Empty = 0,
		
		[EnumMember]
		[Description("HaulScheduled")]
		HaulScheduled = 1,
		
		[EnumMember]
		[Description("ParitialHaulScheduled")]
		ParitialHaulScheduled = 2,
		
		[EnumMember]
		[Description("OnLocation")]
		OnLocation = 3,
		
	}
```

