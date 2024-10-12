CREATE TABLE [IncidentType] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2);

CREATE TABLE [PerformanceMetric] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2);

CREATE TABLE [PotentialSeverity] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2);

CREATE TABLE [QualityObservationType] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2);

CREATE TABLE [SeverityMatrixtype] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2);

---SeverityMatrixtype
INSERT INTO [SanjelData].[dbo].[SeverityMatrixtype]([id],  [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) 
SELECT  [TYPE_INDEX] [id],1 [version],15112 [modified_user_id],'Awang' [modified_user_name],'2022-11-01 00:00:00.0000000' [modified_datetime],3 [operation_type], '2016-06-01 00:00:00.0000000' [effective_start_datetime],'9999-12-31 00:00:00.0000000' [effective_end_datetime], 0 [entity_status],0 [owner_id], [DESCRIPTION]  [name], [DESCRIPTION]  [description] FROM [eservice6].[dbo].[TYPE_VALUES_ConvertedToView] WHERE [TYPE_ID] = N'115' ORDER BY [TYPE_INDEX]

INSERT INTO [SanjelData].[dbo].[SeverityMatrixtype]([id],  [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) 
values
(21 ,1 ,15112 ,'Awang' ,'2022-11-01 00:00:00.0000000' ,3 , '2016-06-01 00:00:00.0000000' ,'9999-12-31 00:00:00.0000000' , 0 ,0 , '0 - Cement in Pipe (< 10m) - Drilling Out'  , '0 - Cement in Pipe (< 10m) - Drilling Out'  ),
(22 ,1 ,15112 ,'Awang' ,'2022-11-01 00:00:00.0000000' ,3 , '2016-06-01 00:00:00.0000000' ,'9999-12-31 00:00:00.0000000' , 0 ,0 , '1 - Cement in Pipe (< 10m) - Drilling Out'  , '1 - Cement in Pipe (< 10m) - Drilling Out'  ),
(23 ,1 ,15112 ,'Awang' ,'2022-11-01 00:00:00.0000000' ,3 , '2016-06-01 00:00:00.0000000' ,'9999-12-31 00:00:00.0000000' , 0 ,0 , '2 - Cement in Pipe (> 10m < 100m) - Drilling Out'  , '2 - Cement in Pipe (> 10m < 100m) - Drilling Out'  ),
(24 ,1 ,15112 ,'Awang' ,'2022-11-01 00:00:00.0000000' ,3 , '2016-06-01 00:00:00.0000000' ,'9999-12-31 00:00:00.0000000' , 0 ,0 , '3 - Cement in Pipe (> 100m < 250m) - Drilling Out'  , '3 - Cement in Pipe (> 100m < 250m) - Drilling Out'  ),
(25 ,1 ,15112 ,'Awang' ,'2022-11-01 00:00:00.0000000' ,3 , '2016-06-01 00:00:00.0000000' ,'9999-12-31 00:00:00.0000000' , 0 ,0 , '4 - Cement in Pipe (> 250m) - Drilling Out'  , '4 - Cement in Pipe (> 250m) - Drilling Out'  )



---IncidentType
INSERT INTO [SanjelData].[dbo].[IncidentType]([id],  [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) 
SELECT  [TYPE_INDEX] [id],1 [version],15112 [modified_user_id],'Awang' [modified_user_name],'2022-11-01 00:00:00.0000000' [modified_datetime],3 [operation_type], '2016-06-01 00:00:00.0000000' [effective_start_datetime],'9999-12-31 00:00:00.0000000' [effective_end_datetime], 0 [entity_status],0 [owner_id], [DESCRIPTION]  [name], [DESCRIPTION]  [description] FROM [eservice6].[dbo].[TYPE_VALUES_ConvertedToView] WHERE [TYPE_ID] = N'116' ORDER BY [TYPE_INDEX]


INSERT INTO [SanjelData].[dbo].[IncidentType]([id],  [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) 
values
(60 ,1 ,15112 ,'Awang' ,'2022-11-01 00:00:00.0000000' ,3 , '2016-06-01 00:00:00.0000000' ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Higher than Expected Pressure'  , 'Higher than Expected Pressure'  ),
(61 ,1 ,15112 ,'Awang' ,'2022-11-01 00:00:00.0000000' ,3 , '2016-06-01 00:00:00.0000000' ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Cement Left in Pipe'  , 'Cement Left in Pipe'  )


---PerformanceMetric
INSERT INTO [SanjelData].[dbo].[PerformanceMetric]([id],  [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) 
SELECT  [TYPE_INDEX] [id],1 [version],15112 [modified_user_id],'Awang' [modified_user_name],'2022-11-01 00:00:00.0000000' [modified_datetime],3 [operation_type], '2016-06-01 00:00:00.0000000' [effective_start_datetime],'9999-12-31 00:00:00.0000000' [effective_end_datetime], 0 [entity_status],0 [owner_id], [DESCRIPTION]  [name], [DESCRIPTION]  [description] FROM [eservice6].[dbo].[TYPE_VALUES_ConvertedToView] WHERE [TYPE_ID] = N'117' ORDER BY [TYPE_INDEX]


---PotentialSeverity
INSERT INTO [SanjelData].[dbo].[PotentialSeverity]([id],  [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) 
values
(0 ,1 ,15112 ,'Awang' ,'2022-11-01 00:00:00.0000000' ,3 , '2016-06-01 00:00:00.0000000' ,'9999-12-31 00:00:00.0000000' , 0 ,0 , null  ,null  ),
(1 ,1 ,15112 ,'Awang' ,'2022-11-01 00:00:00.0000000' ,3 , '2016-06-01 00:00:00.0000000' ,'9999-12-31 00:00:00.0000000' , 0 ,0 , '0-Inconsequential'  , '0-Inconsequential'  ),
(2 ,1 ,15112 ,'Awang' ,'2022-11-01 00:00:00.0000000' ,3 , '2016-06-01 00:00:00.0000000' ,'9999-12-31 00:00:00.0000000' , 0 ,0 , '1-Minor'  , '1-Minor'  ),
(3 ,1 ,15112 ,'Awang' ,'2022-11-01 00:00:00.0000000' ,3 , '2016-06-01 00:00:00.0000000' ,'9999-12-31 00:00:00.0000000' , 0 ,0 , '2-Serious'  , '2-Serious'  ),
(4 ,1 ,15112 ,'Awang' ,'2022-11-01 00:00:00.0000000' ,3 , '2016-06-01 00:00:00.0000000' ,'9999-12-31 00:00:00.0000000' , 0 ,0 , '3-Major'  , '3-Major'  ),
(5 ,1 ,15112 ,'Awang' ,'2022-11-01 00:00:00.0000000' ,3 , '2016-06-01 00:00:00.0000000' ,'9999-12-31 00:00:00.0000000' , 0 ,0 , '4-Critical'  , '4-Critical'  ),
(6 ,1 ,15112 ,'Awang' ,'2022-11-01 00:00:00.0000000' ,3 , '2016-06-01 00:00:00.0000000' ,'9999-12-31 00:00:00.0000000' , 0 ,0 , '5-Catastrophic'  , '5-Catastrophic'  )




---QualityObservationType
INSERT INTO [SanjelData].[dbo].[QualityObservationType]([id],  [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) 
values
(0 ,1 ,15112 ,'Awang' ,'2022-11-01 00:00:00.0000000' ,3 , '2016-06-01 00:00:00.0000000' ,'9999-12-31 00:00:00.0000000' , 0 ,0 , null  , null  ),
(1 ,1 ,15112 ,'Awang' ,'2022-11-01 00:00:00.0000000' ,3 , '2016-06-01 00:00:00.0000000' ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Equipment'  , 'Equipment'  ),
(2 ,1 ,15112 ,'Awang' ,'2022-11-01 00:00:00.0000000' ,3 , '2016-06-01 00:00:00.0000000' ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Job Design'  , 'Job Design'  ),
(3 ,1 ,15112 ,'Awang' ,'2022-11-01 00:00:00.0000000' ,3 , '2016-06-01 00:00:00.0000000' ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Process'  , 'Process'  ),
(4 ,1 ,15112 ,'Awang' ,'2022-11-01 00:00:00.0000000' ,3 , '2016-06-01 00:00:00.0000000' ,'9999-12-31 00:00:00.0000000' , 0 ,0 , 'Product'  , 'Product'  )
