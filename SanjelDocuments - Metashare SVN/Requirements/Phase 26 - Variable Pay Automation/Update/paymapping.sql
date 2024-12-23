USE [SanjelData]
GO
/****** Object:  Table [dbo].[PayrollExportMapping]    Script Date: 6/9/2021 2:30:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE PayPeriod ADD PayPeriodNumber int;
GO
Update PayPeriod set PayPeriodNumber = id + 16 where id between 1 and 11;
Update PayPeriod set PayPeriodNumber = id - 11 where id between 12 and 37;
Update PayPeriod set PayPeriodNumber = id - 37 where id between 38 and 40;
Go
CREATE TABLE [dbo].[PayrollExportMapping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[ServiceLineName] [nvarchar](255) NULL,
	[ServiceLineSystemId] [int] NULL,
	[PayTypeName] [nvarchar](255) NULL,
	[PayTypeDescription] [nvarchar](255) NULL,
	[EarningCode] [nvarchar](255) NULL,
	[ServiceLineDescription] [nvarchar](255) NULL,
	[PayTypeid] [int] NULL,
	[PayrollDescription] [nvarchar](255) NULL,
	[ServiceLineid] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PayrollExportMapping] ON 

INSERT [dbo].[PayrollExportMapping] ([id], [entity_status], [owner_id], [name], [description], [ServiceLineName], [ServiceLineSystemId], [PayTypeName], [PayTypeDescription], [EarningCode], [ServiceLineDescription], [PayTypeid], [PayrollDescription], [ServiceLineid]) VALUES (1, 0, 0, NULL, NULL, N'Primary Cementing', 4, N'Variable Pay', N'Variable Pay', N'19', N'Primary Cementing', 1, N'HOS PRIM', 13)
INSERT [dbo].[PayrollExportMapping] ([id], [entity_status], [owner_id], [name], [description], [ServiceLineName], [ServiceLineSystemId], [PayTypeName], [PayTypeDescription], [EarningCode], [ServiceLineDescription], [PayTypeid], [PayrollDescription], [ServiceLineid]) VALUES (2, 0, 0, NULL, NULL, N'Primary Cementing', 4, N'OVPP', N'OVPP', N'66', N'Primary Cementing', 2, N'OVPP', 13)
INSERT [dbo].[PayrollExportMapping] ([id], [entity_status], [owner_id], [name], [description], [ServiceLineName], [ServiceLineSystemId], [PayTypeName], [PayTypeDescription], [EarningCode], [ServiceLineDescription], [PayTypeid], [PayrollDescription], [ServiceLineid]) VALUES (3, 0, 0, NULL, NULL, N'Primary Cementing', 4, N'Standby/Ext', N'Standby/Ext', N'68', N'Primary Cementing', 3, N'Standby', 13)
INSERT [dbo].[PayrollExportMapping] ([id], [entity_status], [owner_id], [name], [description], [ServiceLineName], [ServiceLineSystemId], [PayTypeName], [PayTypeDescription], [EarningCode], [ServiceLineDescription], [PayTypeid], [PayrollDescription], [ServiceLineid]) VALUES (4, 0, 0, NULL, NULL, NULL, 0, N'MealAllowance', N'MealAllowance', N'69', NULL, 4, N'MealAllowance', 0)
INSERT [dbo].[PayrollExportMapping] ([id], [entity_status], [owner_id], [name], [description], [ServiceLineName], [ServiceLineSystemId], [PayTypeName], [PayTypeDescription], [EarningCode], [ServiceLineDescription], [PayTypeid], [PayrollDescription], [ServiceLineid]) VALUES (5, 0, 0, NULL, NULL, N'Remedial Cementing', 3, N'OVPP', N'OVPP', N'23', N'Remedial Cementing', 2, N'RTBA', 12)
INSERT [dbo].[PayrollExportMapping] ([id], [entity_status], [owner_id], [name], [description], [ServiceLineName], [ServiceLineSystemId], [PayTypeName], [PayTypeDescription], [EarningCode], [ServiceLineDescription], [PayTypeid], [PayrollDescription], [ServiceLineid]) VALUES (6, 0, 0, NULL, NULL, N'Remedial Cementing', 3, N'Standby/Ext', N'Standby/Ext', N'12', N'Remedial Cementing', 3, N'EXTLPrem', 12)
INSERT [dbo].[PayrollExportMapping] ([id], [entity_status], [owner_id], [name], [description], [ServiceLineName], [ServiceLineSystemId], [PayTypeName], [PayTypeDescription], [EarningCode], [ServiceLineDescription], [PayTypeid], [PayrollDescription], [ServiceLineid]) VALUES (7, 0, 0, NULL, NULL, N'Remedial Cementing', 3, N'Variable Pay', N'Variable Pay', N'37', N'Remedial Cementing', 1, N'HOS REM', 12)
SET IDENTITY_INSERT [dbo].[PayrollExportMapping] OFF


ALTER TABLE ProductHaulLoad ADD SiteName nvarchar(255) NUL;
ALTER TABLE ProductHaulLoad ADD StorageName nvarchar(255) NUL;
ALTER TABLE ProductHaulLoad ADD DriverName nvarchar(255) NUL;


USE [SanjelData]
GO
/****** Object:  Table [dbo].[MonthlyJobCountIncentiveSchedule]    Script Date: 6/10/2021 10:48:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonthlyJobCountIncentiveSchedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[JobCount] [int] NULL,
	[Amount] [float] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ON 
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (1, 0, 0, N'', N'', 1, 0)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (2, 0, 0, N'', N'', 2, 0)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (3, 0, 0, N'', N'', 3, 0)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (4, 0, 0, N'', N'', 4, 0)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (5, 0, 0, N'', N'', 5, 0)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (6, 0, 0, N'', N'', 6, 0)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (7, 0, 0, N'', N'', 7, 0)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (8, 0, 0, N'', N'', 8, 0)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (9, 0, 0, N'', N'', 9, 0)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (10, 0, 0, N'', N'', 10, 0)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (11, 0, 0, N'', N'', 11, 100)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (12, 0, 0, N'', N'', 12, 100)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (13, 0, 0, N'', N'', 13, 100)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (14, 0, 0, N'', N'', 14, 100)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (15, 0, 0, N'', N'', 15, 100)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (16, 0, 0, N'', N'', 16, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (17, 0, 0, N'', N'', 17, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (18, 0, 0, N'', N'', 18, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (19, 0, 0, N'', N'', 19, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (20, 0, 0, N'', N'', 20, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (21, 0, 0, N'', N'', 21, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (22, 0, 0, N'', N'', 22, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (23, 0, 0, N'', N'', 23, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (24, 0, 0, N'', N'', 24, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (25, 0, 0, N'', N'', 25, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (26, 0, 0, N'', N'', 26, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (27, 0, 0, N'', N'', 27, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (28, 0, 0, N'', N'', 28, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (29, 0, 0, N'', N'', 29, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (30, 0, 0, N'', N'', 30, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (31, 0, 0, N'', N'', 31, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (32, 0, 0, N'', N'', 32, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (33, 0, 0, N'', N'', 33, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (34, 0, 0, N'', N'', 34, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (35, 0, 0, N'', N'', 35, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (36, 0, 0, N'', N'', 36, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (37, 0, 0, N'', N'', 37, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (38, 0, 0, N'', N'', 38, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (39, 0, 0, N'', N'', 39, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (40, 0, 0, N'', N'', 40, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (41, 0, 0, N'', N'', 41, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (42, 0, 0, N'', N'', 42, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (43, 0, 0, N'', N'', 43, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (44, 0, 0, N'', N'', 44, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (45, 0, 0, N'', N'', 45, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (46, 0, 0, N'', N'', 46, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (47, 0, 0, N'', N'', 47, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (48, 0, 0, N'', N'', 48, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (49, 0, 0, N'', N'', 49, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (50, 0, 0, N'', N'', 50, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (51, 0, 0, N'', N'', 51, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (52, 0, 0, N'', N'', 52, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (53, 0, 0, N'', N'', 53, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (54, 0, 0, N'', N'', 54, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (55, 0, 0, N'', N'', 55, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (56, 0, 0, N'', N'', 56, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (57, 0, 0, N'', N'', 57, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (58, 0, 0, N'', N'', 58, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (59, 0, 0, N'', N'', 59, 150)
GO
INSERT [dbo].[MonthlyJobCountIncentiveSchedule] ([id], [entity_status], [owner_id], [name], [description], [JobCount], [Amount]) VALUES (60, 0, 0, N'', N'', 60, 150)
GO
SET IDENTITY_INSERT [dbo].[MonthlyJobCountIncentiveSchedule] OFF
GO

USE [SanjelData]
GO
/****** Object:  Table [dbo].[PayrollExportMapping]    Script Date: 6/10/2021 11:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE [dbo].[PayrollExportMapping];
GO
CREATE TABLE [dbo].[PayrollExportMapping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_status] [int] NULL,
	[owner_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[ServiceLineName] [nvarchar](255) NULL,
	[ServiceLineSystemId] [int] NULL,
	[PayTypeName] [nvarchar](255) NULL,
	[PayTypeDescription] [nvarchar](255) NULL,
	[EarningCode] [nvarchar](255) NULL,
	[ServiceLineDescription] [nvarchar](255) NULL,
	[PayTypeid] [int] NULL,
	[PayrollDescription] [nvarchar](255) NULL,
	[ServiceLineid] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PayrollExportMapping] ON 
GO
INSERT [dbo].[PayrollExportMapping] ([id], [entity_status], [owner_id], [name], [description], [ServiceLineName], [ServiceLineSystemId], [PayTypeName], [PayTypeDescription], [EarningCode], [ServiceLineDescription], [PayTypeid], [PayrollDescription], [ServiceLineid]) VALUES (1, 0, 0, NULL, NULL, N'Primary Cementing', 4, N'Hot Shot', N'Hot Shot', N'66', N'Primary Cementing', 3, N'OVPP', 13)
GO
INSERT [dbo].[PayrollExportMapping] ([id], [entity_status], [owner_id], [name], [description], [ServiceLineName], [ServiceLineSystemId], [PayTypeName], [PayTypeDescription], [EarningCode], [ServiceLineDescription], [PayTypeid], [PayrollDescription], [ServiceLineid]) VALUES (2, 0, 0, NULL, NULL, N'Primary Cementing', 4, N'Extended Travel', N'Extended Travel', N'66', N'Primary Cementing', 2, N'OVPP', 13)
GO
INSERT [dbo].[PayrollExportMapping] ([id], [entity_status], [owner_id], [name], [description], [ServiceLineName], [ServiceLineSystemId], [PayTypeName], [PayTypeDescription], [EarningCode], [ServiceLineDescription], [PayTypeid], [PayrollDescription], [ServiceLineid]) VALUES (3, 0, 0, NULL, NULL, N'Primary Cementing', 4, N'Standby', N'Standby', N'68', N'Primary Cementing', 9, N'Standby', 13)
GO
INSERT [dbo].[PayrollExportMapping] ([id], [entity_status], [owner_id], [name], [description], [ServiceLineName], [ServiceLineSystemId], [PayTypeName], [PayTypeDescription], [EarningCode], [ServiceLineDescription], [PayTypeid], [PayrollDescription], [ServiceLineid]) VALUES (4, 0, 0, NULL, NULL, NULL, 0, N'MealAllowance', N'MealAllowance', N'69', NULL, 4, N'MealAllowance', 0)
GO
INSERT [dbo].[PayrollExportMapping] ([id], [entity_status], [owner_id], [name], [description], [ServiceLineName], [ServiceLineSystemId], [PayTypeName], [PayTypeDescription], [EarningCode], [ServiceLineDescription], [PayTypeid], [PayrollDescription], [ServiceLineid]) VALUES (5, 0, 0, NULL, NULL, N'Remedial Cementing', 3, N'RTBA', N'Remedial Travel Bonus Adjustment', N'23', N'Remedial Cementing', 11, N'RTBA', 12)
GO
INSERT [dbo].[PayrollExportMapping] ([id], [entity_status], [owner_id], [name], [description], [ServiceLineName], [ServiceLineSystemId], [PayTypeName], [PayTypeDescription], [EarningCode], [ServiceLineDescription], [PayTypeid], [PayrollDescription], [ServiceLineid]) VALUES (6, 0, 0, NULL, NULL, N'Remedial Cementing', 3, N'Extend Location Premium', N'Extend Location Premium', N'12', N'Remedial Cementing', 13, N'EXTLPrem', 12)
GO
INSERT [dbo].[PayrollExportMapping] ([id], [entity_status], [owner_id], [name], [description], [ServiceLineName], [ServiceLineSystemId], [PayTypeName], [PayTypeDescription], [EarningCode], [ServiceLineDescription], [PayTypeid], [PayrollDescription], [ServiceLineid]) VALUES (7, 0, 0, NULL, NULL, N'Remedial Cementing', 3, N'Base Variable Pay', N'Base Variable Pay', N'37', N'Remedial Cementing', 1, N'HOS REM', 12)
GO
INSERT [dbo].[PayrollExportMapping] ([id], [entity_status], [owner_id], [name], [description], [ServiceLineName], [ServiceLineSystemId], [PayTypeName], [PayTypeDescription], [EarningCode], [ServiceLineDescription], [PayTypeid], [PayrollDescription], [ServiceLineid]) VALUES (8, 0, 0, NULL, NULL, NULL, 0, N'Monthly Job Count  Incentive', N'Monthly Job Count  Incentive', N'71', NULL, 14, N'JOBCNTIN', 0)
GO
INSERT [dbo].[PayrollExportMapping] ([id], [entity_status], [owner_id], [name], [description], [ServiceLineName], [ServiceLineSystemId], [PayTypeName], [PayTypeDescription], [EarningCode], [ServiceLineDescription], [PayTypeid], [PayrollDescription], [ServiceLineid]) VALUES (9, 0, 0, NULL, NULL, N'Primary Cementing', 4, N'Base Variable Pay', N'Base Variable Pay', N'19', N'Primary Cementing', 1, N'HOS PRIM', 13)
GO
INSERT [dbo].[PayrollExportMapping] ([id], [entity_status], [owner_id], [name], [description], [ServiceLineName], [ServiceLineSystemId], [PayTypeName], [PayTypeDescription], [EarningCode], [ServiceLineDescription], [PayTypeid], [PayrollDescription], [ServiceLineid]) VALUES (10, 0, 0, NULL, NULL, N'Primary Cementing', 4, N'Crew Efficiency Bonus', N'Crew Efficiency Bonus', N'19', N'Primary Cementing', 8, N'HOS PRIM', 13)
GO
INSERT [dbo].[PayrollExportMapping] ([id], [entity_status], [owner_id], [name], [description], [ServiceLineName], [ServiceLineSystemId], [PayTypeName], [PayTypeDescription], [EarningCode], [ServiceLineDescription], [PayTypeid], [PayrollDescription], [ServiceLineid]) VALUES (11, 0, 0, NULL, NULL, N'Primary Cementing', 4, N'Product Haul', N'Product Haul', N'66', N'Primary Cementing', 4, N'OVPP', 13)
GO
INSERT [dbo].[PayrollExportMapping] ([id], [entity_status], [owner_id], [name], [description], [ServiceLineName], [ServiceLineSystemId], [PayTypeName], [PayTypeDescription], [EarningCode], [ServiceLineDescription], [PayTypeid], [PayrollDescription], [ServiceLineid]) VALUES (12, 0, 0, NULL, NULL, N'Primary Cementing', 4, N'B-Train', N'B-Train', N'66', N'Primary Cementing', 5, N'OVPP', 13)
GO
INSERT [dbo].[PayrollExportMapping] ([id], [entity_status], [owner_id], [name], [description], [ServiceLineName], [ServiceLineSystemId], [PayTypeName], [PayTypeDescription], [EarningCode], [ServiceLineDescription], [PayTypeid], [PayrollDescription], [ServiceLineid]) VALUES (13, 0, 0, NULL, NULL, N'Primary Cementing', 4, N'Chemical Van', N'Chemical Van', N'66', N'Primary Cementing', 6, N'OVPP', 13)
GO
INSERT [dbo].[PayrollExportMapping] ([id], [entity_status], [owner_id], [name], [description], [ServiceLineName], [ServiceLineSystemId], [PayTypeName], [PayTypeDescription], [EarningCode], [ServiceLineDescription], [PayTypeid], [PayrollDescription], [ServiceLineid]) VALUES (14, 0, 0, NULL, NULL, N'Primary Cementing', 4, N'Self-Load', N'Self-Load', N'66', N'Primary Cementing', 7, N'OVPP', 13)
GO
SET IDENTITY_INSERT [dbo].[PayrollExportMapping] OFF
GO


