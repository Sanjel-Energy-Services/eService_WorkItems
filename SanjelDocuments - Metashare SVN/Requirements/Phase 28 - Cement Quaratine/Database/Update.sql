ALTER TABLE ProductHaulLoad ADD SiteName nvarchar(255) NUL;
ALTER TABLE ProductHaulLoad ADD StorageName nvarchar(255) NUL;
ALTER TABLE ProductHaulLoad ADD DriverName nvarchar(255) NUL;

ALTER TABLE WorkAssignment ADD JobIndex int NULL;

ALTER TABLE Bin ADD PodCount int NULL;
ALTER TABLE Bin ADD Volume int NULL;

-- Blend cut structure


USE [SanjelData]
GO

/****** Object:  Table [dbo].[StoragePod]    Script Date: 7/7/2021 3:12:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[StoragePod](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[Binid] [int] NULL,
	[BinSystemId] [int] NULL,
	[BinName] [nvarchar](100) NULL,
	[BinDescription] [nvarchar](255) NULL,
	[Volume] [float] NULL
) ON [PRIMARY]
GO



ALTER TABLE [BlendChemical] ADD [GelPercentage] [float] NUL;
ALTER TABLE [BlendChemical] ADD [[SackWeight]] [float] NUL;

--ALTER TABLE [BlendChemical] ALTER COLUMN [GelPercentage] [float] NULL;
--ALTER TABLE [BlendChemical] ALTER COLUMN [SackWeight] [float] NULL;

ALTER TABLE [BlendChemical] ADD [AdditiveBlendMethodid] [int] NULL;
ALTER TABLE [BlendChemical] ADD [AdditiveBlendMethodSystemId] [int] NULL;
ALTER TABLE [BlendChemical] ADD [AdditiveBlendMethodName] [nvarchar](255) NULL;
ALTER TABLE [BlendChemical] ADD [AdditiveBlendMethodDescription] [int] NULL;


ALTER TABLE [BlendChemical] ADD [BlendAdditiveMeasureUnitid] [int] NULL;
ALTER TABLE [BlendChemical] ADD [BlendAdditiveMeasureUnitSystemId] [int] NULL;
ALTER TABLE [BlendChemical] ADD [BlendAdditiveMeasureUnitName] [nvarchar](255) NULL;
ALTER TABLE [BlendChemical] ADD [BlendAdditiveMeasureUnitDescription] [int] NULL;


ALTER TABLE [Rig] ADD [OperationSiteType] [int] NULL;
update rig set [OperationSiteType] = 1;



USE [eservice6]
GO

/****** Object:  View [dbo].[RIGS]    Script Date: 7/28/2021 11:42:09 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
Drop view [dbo].[RIGS];
Go
CREATE VIEW [dbo].[RIGS] AS 
	with orderedRecords as (
		select ROW_NUMBER() OVER (Partition By Id ORDER BY Version desc) as rowNum, *
		from SanjelData.dbo.Rig
	)
	select
		id							ID,
		name						NAME,
		RigNumber					RIG_NO,
		DrillingCompanyid			DRILLINGCOMPANY_ID,
		DrillingCompanyName			DRILLINGCOMPANY_NAME,
		Status						STATUS,				
		IsServiceRig				IS_SERVICE_RIG,
		IsDeleted					IS_DELETED,
		IsTopDrive					IS_TOP_DRIVE,
		cast(SizeName as float)		SIZE_TYPE_VALUE,	
		NULL						SIZE_TYPE_UNIT,		
		RigSizeid					RIG_SIZE_TYPE_ID,
		RigSizeName					RIG_SIZE_TYPE_NAME,
		ThreadTypeid				THREAD_TYPE_ID,
		ThreadTypeName				THREAD_TYPE_NAME,	--?? does not match for some recs 
		version						VERSION,
		CAST(modified_user_id as int)	LAST_MODIFIED_USER_ID,
		modified_user_name			LAST_MODIFIED_USER_NAME,
		modified_datetime			LAST_MODIFIED_DATE_TIME,
		operation_type				LAST_OPERATION_TYPE,
		effective_start_datetime	EFFECTIVE_START_DATE_TIME,
		effective_end_datetime		EFFECTIVE_END_DATE_TIME,
		IsProjectRig				IS_PROJECT_RIG
	from orderedRecords where OperationSiteType=1 and rowNum = 1;
GO

ALTER TABLE [CrewEfficiencyBonusPaySchedule] ADD [ServiceLineid] [int] NULL;
ALTER TABLE [CrewEfficiencyBonusPaySchedule] ADD [ServiceLineSystemId] [int] NULL;
ALTER TABLE [CrewEfficiencyBonusPaySchedule] ADD [ServiceLineName] [nvarchar](255) NULL;
ALTER TABLE [CrewEfficiencyBonusPaySchedule] ADD [ServiceLineDescription] [nvarchar](255) NULL;


USE [SanjelData]
GO
SET IDENTITY_INSERT [dbo].[CrewEfficiencyBonusPaySchedule] ON 
GO
INSERT [dbo].[CrewEfficiencyBonusPaySchedule] ([id], [entity_status], [owner_id], [name], [description], [PayAsPositionName], [PayRatio], [PayAsPositionDescription], [PayAsPositionid], [ServiceLineid], [ServiceLineSystemId], [ServiceLineName], [ServiceLineDescription]) VALUES (1, 0, 0, NULL, NULL, N'Operator 3', 0.5, N'Operator 3 - Primary Cementing', 7, 13, 4, N'Primary Cementing', N'Primary Cementing')
GO
INSERT [dbo].[CrewEfficiencyBonusPaySchedule] ([id], [entity_status], [owner_id], [name], [description], [PayAsPositionName], [PayRatio], [PayAsPositionDescription], [PayAsPositionid], [ServiceLineid], [ServiceLineSystemId], [ServiceLineName], [ServiceLineDescription]) VALUES (2, 0, 0, NULL, NULL, N'Operator - Remedial', 0.5, N'Operator - Remedial', 10, 12, 3, N'Remedial Cementing', N'Remedial Cementing')
GO
SET IDENTITY_INSERT [dbo].[CrewEfficiencyBonusPaySchedule] OFF
GO
-- OCT 26, Update product haul model 


--ALTER TABLE ProductHaulLoad DROP COLUMN [SiteName];
--ALTER TABLE ProductHaulLoad DROP COLUMN [StorageName];

ALTER TABLE [BlendCut] ADD [BulkPlantOperator] nvarchar(255) NULL;
