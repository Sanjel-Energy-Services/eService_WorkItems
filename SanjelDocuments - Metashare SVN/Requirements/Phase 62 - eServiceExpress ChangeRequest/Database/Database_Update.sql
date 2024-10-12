-- Prepare reference data
-- GitLink TastId https://github.com/Sanjel-Energy-Services/eServiceExpress/issues/18
Use [##SanjelData##]
Go
CREATE TABLE [ChangeRequest] ([id] [int] NOT NULL,[entity_status] [int] NULL,owner_id int NULL,name [nvarchar](100) NULL,description [nvarchar](500) NULL,system_id [int] IDENTITY(1,1) Not NULL,version [int] NULL,modified_user_id [int] NULL,modified_user_name nvarchar(255),modified_datetime datetime2,operation_type  [int] NULL,effective_start_datetime datetime2,effective_end_datetime datetime2,[JobUniqueId] nvarchar(255),[JobNumber] nvarchar(255),[JobType] nvarchar(255),[RigName] nvarchar(255),[ServicePoint] nvarchar(255),[Supervisor] nvarchar(255),[JobDateTime] datetime,[ClientCompany] nvarchar(255),[ClientRep] nvarchar(255),[WellName] nvarchar(255),[DownHoleLocation] nvarchar(255),[SurfaceLocation] nvarchar(255),[Status] int,[ChangeRequestType] int,[Reason] int,[RiskPreMOC] int,[RiskPostMOC] int,[IsApprovalRequired] bit,[IsOSRSignatureRequired] bit,[OSRSignedBy] nvarchar(255),[ApprovedBy] nvarchar(255),[DescriptionOfChange] ntext,[DescriptionOfControl] ntext,[LocalId] int);

