CREATE TABLE [dbo].[PSPT_TEST_REQUEST_SCTNS](
	[ID] [int] NOT NULL,
	[ROOT_ID] [int] NULL,
	[PARENT_ID] [int] NULL,
	[TT100] [bit] NULL,
	[TT100_MIN] [int] NULL,
	[TT100_MAX] [int] NULL,
	[TT70] [bit] NULL,
	[TT70_MIN] [int] NULL,
	[TT70_MAX] [int] NULL,
	[TT40] [bit] NULL,
	[TT40_MIN] [int] NULL,
	[TT40_MAX] [int] NULL,
	[HESITATION_REQUIRED] [bit] NULL,
	[HESITATION_COMMENTS] [nvarchar](200) NULL,
	[FREE_WATER] [bit] NULL,
	[FREE_WATER_MAX] [float] NULL,
	[RHEOLOGY] [bit] NULL,
	[RHEOLOGY_MIN] [float] NULL,
	[RHEOLOGY_MAX] [float] NULL,
	[SGSA] [bit] NULL,
	[SGSA_MIN] [float] NULL,
	[SGSA_MAX] [float] NULL,
	[MAX_CRITICAL_INTERVAL] [bit] NULL,
	[MAX_CRITICAL_INTERVAL_MAX] [int] NULL,
	[COMPRESSIVE_STRENTH] [bit] NULL,
	[COMP_STR_MPA_MIN] [float] NULL,
	[COMP_STR_MPA_MAX] [float] NULL,
	[COMP_STR_HRS_MIN] [float] NULL,
	[COMP_STR_HRS_MAX] [float] NULL,
	[DATE_REQUIRED] [datetime2](7) NULL,
	[FLUID_LOSS] [bit] NULL,
	[FLUID_LOSS_MAX] [float] NULL,
	[FLUID_LOSS_ANGLE] [float] NULL,
	[PREHYDRATE_ADDITIVES] [bit] NULL,
	[MIX_WATER_SOURCE] [nvarchar](200) NULL,
	[CEMENT_SOURCE] [nvarchar](200) NULL,
	[ONE_PAGE_REPORT] [bit] NULL,
	[SG_SLURRY] [bit] NULL,
	[SG_POWDER] [bit] NULL,
	[LOADAND_GO] [bit] NULL,
	[VERSION] [int] NULL
	);
	
CREATE TABLE [dbo].[PRG_TEST_REQUEST_SCTNS](
	[ID] [int] NOT NULL,
	[ROOT_ID] [int] NULL,
	[PARENT_ID] [int] NULL,
	[TT100] [bit] NULL,
	[TT100_MIN] [int] NULL,
	[TT100_MAX] [int] NULL,
	[TT70] [bit] NULL,
	[TT70_MIN] [int] NULL,
	[TT70_MAX] [int] NULL,
	[TT40] [bit] NULL,
	[TT40_MIN] [int] NULL,
	[TT40_MAX] [int] NULL,
	[HESITATION_REQUIRED] [bit] NULL,
	[HESITATION_COMMENTS] [nvarchar](200) NULL,
	[FREE_WATER] [bit] NULL,
	[FREE_WATER_MAX] [float] NULL,
	[RHEOLOGY] [bit] NULL,
	[RHEOLOGY_MIN] [float] NULL,
	[RHEOLOGY_MAX] [float] NULL,
	[SGSA] [bit] NULL,
	[SGSA_MIN] [float] NULL,
	[SGSA_MAX] [float] NULL,
	[MAX_CRITICAL_INTERVAL] [bit] NULL,
	[MAX_CRITICAL_INTERVAL_MAX] [int] NULL,
	[COMPRESSIVE_STRENTH] [bit] NULL,
	[COMP_STR_MPA_MIN] [float] NULL,
	[COMP_STR_MPA_MAX] [float] NULL,
	[COMP_STR_HRS_MIN] [float] NULL,
	[COMP_STR_HRS_MAX] [float] NULL,
	[DATE_REQUIRED] [datetime2](7) NULL,
	[FLUID_LOSS] [bit] NULL,
	[FLUID_LOSS_MAX] [float] NULL,
	[FLUID_LOSS_ANGLE] [float] NULL,
	[PREHYDRATE_ADDITIVES] [bit] NULL,
	[MIX_WATER_SOURCE] [nvarchar](200) NULL,
	[CEMENT_SOURCE] [nvarchar](200) NULL,
	[ONE_PAGE_REPORT] [bit] NULL,
	[SG_SLURRY] [bit] NULL,
	[SG_POWDER] [bit] NULL,
	[LOADAND_GO] [bit] NULL,
	[VERSION] [int] NULL
	);
	
CREATE TABLE [dbo].[PUMP_TEST_REQUEST_SCTNS](
	[ID] [int] NOT NULL,
	[ROOT_ID] [int] NULL,
	[PARENT_ID] [int] NULL,
	[TT100] [bit] NULL,
	[TT100_MIN] [int] NULL,
	[TT100_MAX] [int] NULL,
	[TT70] [bit] NULL,
	[TT70_MIN] [int] NULL,
	[TT70_MAX] [int] NULL,
	[TT40] [bit] NULL,
	[TT40_MIN] [int] NULL,
	[TT40_MAX] [int] NULL,
	[HESITATION_REQUIRED] [bit] NULL,
	[HESITATION_COMMENTS] [nvarchar](200) NULL,
	[FREE_WATER] [bit] NULL,
	[FREE_WATER_MAX] [float] NULL,
	[RHEOLOGY] [bit] NULL,
	[RHEOLOGY_MIN] [float] NULL,
	[RHEOLOGY_MAX] [float] NULL,
	[SGSA] [bit] NULL,
	[SGSA_MIN] [float] NULL,
	[SGSA_MAX] [float] NULL,
	[MAX_CRITICAL_INTERVAL] [bit] NULL,
	[MAX_CRITICAL_INTERVAL_MAX] [int] NULL,
	[COMPRESSIVE_STRENTH] [bit] NULL,
	[COMP_STR_MPA_MIN] [float] NULL,
	[COMP_STR_MPA_MAX] [float] NULL,
	[COMP_STR_HRS_MIN] [float] NULL,
	[COMP_STR_HRS_MAX] [float] NULL,
	[DATE_REQUIRED] [datetime2](7) NULL,
	[FLUID_LOSS] [bit] NULL,
	[FLUID_LOSS_MAX] [float] NULL,
	[FLUID_LOSS_ANGLE] [float] NULL,
	[PREHYDRATE_ADDITIVES] [bit] NULL,
	[MIX_WATER_SOURCE] [nvarchar](200) NULL,
	[CEMENT_SOURCE] [nvarchar](200) NULL,
	[ONE_PAGE_REPORT] [bit] NULL,
	[SG_SLURRY] [bit] NULL,
	[SG_POWDER] [bit] NULL,
	[LOADAND_GO] [bit] NULL,
	[VERSION] [int] NULL
	);
	
CREATE SEQUENCE [dbo].[SEQ_PRG_TEST_REQUEST_SCTNS] 
 AS [numeric](28, 0)
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 999999999999999999999999999
 CACHE  20 
GO
CREATE SEQUENCE [dbo].[SEQ_PUMP_TEST_REQUEST_SCTNS] 
 AS [numeric](28, 0)
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 999999999999999999999999999
 CACHE  20 
GO
CREATE SEQUENCE [dbo].[SEQ_PSPT_TEST_REQUEST_SCTNS] 
 AS [numeric](28, 0)
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 999999999999999999999999999
 CACHE  20 
GO

ALTER TABLE [PUMP_TEST_REQUEST_SCTNS] ADD [VERSION] [int] NULL;
ALTER TABLE [PSPT_TEST_REQUEST_SCTNS] ADD [VERSION] [int] NULL;
ALTER TABLE [PRG_TEST_REQUEST_SCTNS] ADD [VERSION] [int] NULL;