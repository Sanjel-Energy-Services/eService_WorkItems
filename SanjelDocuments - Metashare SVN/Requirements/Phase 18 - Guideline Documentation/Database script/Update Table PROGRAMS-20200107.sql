ALTER TABLE  [eservice6].[dbo].[PROGRAMS] Add	[Well_Count] [int] NULL
ALTER TABLE  [eservice6].[dbo].[PROGRAMS] Add	[Is_Multiple_Well] [bit] NULL
ALTER TABLE  [eservice6].[dbo].[PROGRAMS] Add	[Is_Bid_Program] [bit] NULL
ALTER TABLE  [eservice6].[dbo].[PROGRAMS] Add 	[Delivery_Distance] [float] NULL
ALTER TABLE [eservice6].[dbo].[PRG_PUMPING_JOB_SECTIONS] Add  [RISK_MATRIX] [float] NULL
ALTER TABLE [eservice6].[dbo].[CALLSHEET_HEADERS] Add  [RISK_MATRIX] [float] NULL



commit;

ALTER TABLE [SanjelData].[dbo].[RigJob] Add  [RiskMatrix] [float] NULL
commit;


-- Feb 20, 2020 Fix adjust tma not saved
ALTER TABLE [eservice6].[dbo].[CALLSHEET_HEADERS] Add  [ADJUSTED_TMA_PERCENTAGE] DECIMAL(5,2) NULL
ALTER TABLE [eservice6].[dbo].[CALLSHEET_HEADERS] Add  [ADJUSTED_TMA_METHOD] [int] NULL
