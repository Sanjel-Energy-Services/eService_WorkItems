## TestRequest table

### Property: Status

```c#
public enum TestRequestStatus
{
	[EnumMember]
	[Description("NewRequest")]
	NewRequest = 0,
	
	[EnumMember]
	[Description("InProgress")]
	InProgress = 1,
	
	[EnumMember]
	[Description("Completed")]
	Completed = 2,
	
	[EnumMember]
	[Description("Cancelled")]
	Cancelled = 3
}
```

### Property: EngineerApprovalStatus, ClientApprovalStatus, DistrictApprovalStatus, RegionalApprovalStatus

```c#
public enum ApprovalStatus
{
	[EnumMember]
	[Description("NotRequired")]
	NotRequired = 0,
	
	[EnumMember]
	[Description("Required")]
	Required = 1,
	
	[EnumMember]
	[Description("SentForApproval")]
	SentForApproval = 2,
	
	[EnumMember]
	[Description("Approved")]
	Approved = 4,
	
	[EnumMember]
	[Description("FailedRetestRequried")]
	FailedRetestRequried = 8,
	
	[EnumMember]
	[Description("FailedReblendRequired")]
	FailedReblendRequired = 16,
	
	[EnumMember]
	[Description("Unsalvageable")]
	Unsalvageable = 32,
	
	[EnumMember]
	[Description("Pending")]
	Pending = 128,
	
	[EnumMember]
	[Description("Declined")]
	Declined = 256
}
```

## Entity RigJob

### Property: JobLifeStatus

```c#
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
	Deleted = 9
}
```

### Property: DistrictApprovalStatus, RegionalApprovalStatus, SalesExecutiveApprovalSatus,OperationExecutiveApprovalStatus

```c#
public enum ApprovalStatus
{
	[EnumMember]
	[Description("NotRequired")]
	NotRequired = 0,
	
	[EnumMember]
	[Description("Required")]
	Required = 1,
	
	[EnumMember]
	[Description("SentForApproval")]
	SentForApproval = 2,
	
	[EnumMember]
	[Description("Approved")]
	Approved = 4,
	
	[EnumMember]
	[Description("FailedRetestRequried")]
	FailedRetestRequried = 8,
	
	[EnumMember]
	[Description("FailedReblendRequired")]
	FailedReblendRequired = 16,
	
	[EnumMember]
	[Description("Unsalvageable")]
	Unsalvageable = 32,
	
	[EnumMember]
	[Description("Pending")]
	Pending = 128,
	
	[EnumMember]
	[Description("Declined")]
	Declined = 256
}
```

## ProductHaulLoad table (Batch Request)

### Property: ProductHaulLoadLifeStatus

```c#
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
		
		[EnumMember]
		[Description("BpoConfirmed")]
		BpoConfirmed = 15,
		
		[EnumMember]
		[Description("BlendingCanCommence")]
		BlendingCanCommence = 16
    }
```

