USE SanjelData
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SanjelUser]') AND type in (N'U'))
DROP TABLE [dbo].[SanjelUser]
GO

CREATE VIEW [dbo].[SanjelUser] as

	Select 
		u.id as [ID],
		 0 as [entity_status],
		 0 as [owner_id],
		 cast(Name as nvarchar(100)) as [Name],
		 cast(null as nvarchar(500)) as [description],
		 u.id as [system_id],
		 1 as [version],
		 0 as [modified_user_id],
		 cast(null as nvarchar(50)) as [modified_user_name],
		 cast('2021-12-31 23:59:59.0000000' as datetime2) as [modified_datetime],
		 1 as [operation_type],
		 cast('2021-12-31 23:59:59.0000000' as datetime2) as [effective_start_datetime],
		 cast('9999-12-31 23:59:59.0000000' as datetime2) as [effective_end_datetime],
		 cast(HASHED_PASSWORD as nvarchar(200)) as [HashedPassword],
		 u.DISTRICT_ID as [ServicePointid],
		 0 as [ServicePointSystemid],
		 cast(DISTRICT_NAME as nvarchar(50)) as [ServicePointName],
		 cast(null as nvarchar(500)) as [ServicePointDescription],
		 EMP_ID as [Employeeid],
		 0 as EmployeeSystemid,
		 cast(EMP_NAME as nvarchar(100)) as [EmployeeName],
		 cast(null as nvarchar(500)) as [EmployeeDescription],
		 cast(name+'@sanjel.com' as nvarchar(500)) as [EmailAddress]
	from 
		dbo.SYN_ES_SD_USERS U
		left join dbo.SYN_ES_EMPLOYEES EMP on EMP_ID = emp.id
	where
		EMP.[EFFECTIVE_END_DATE_TIME] > getdate()
		--or name in ('gwong', 'mscoulding', 'vhorobets', 'cearl', 'skaleru', 'cchan', 'clipman')
		or (EMP.[EFFECTIVE_END_DATE_TIME] is null and U.SANJEL_COMPANY_NAME = 'Sanjel Energy Services Inc.'); 
	-- Enable following condition in PRD
	--where EMP.[EFFECTIVE_END_DATE_TIME] > getdate();
GO
/****** Object:  View [dbo].[UserGroupSanjelUser]    Script Date: 5/23/2023 9:11:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserGroupSanjelUser]') AND type in (N'U'))
DROP TABLE [dbo].[UserGroupSanjelUser]
GO

CREATE View [dbo].[UserGroupSanjelUser] AS

	Select cast((ROW_NUMBER() over (Order by GU.User_ID, GU.GROUP_ID)) as int) as ID,
		 0 as [entity_status],
		 0 as [owner_id],
		 null as [Name],
		 null as [description],
		cast((ROW_NUMBER() over (Order by GU.User_ID, GU.GROUP_ID)) as int) as system_id,
		 1 as [version],
		 0 as [modified_user_id],
		 null as [modified_user_name],
		 cast('2021-12-31 23:59:59.0000000' as datetime2) as [modified_datetime],
		 1 as [operation_type],
		 cast('2021-12-31 23:59:59.0000000' as datetime2) as [effective_start_datetime],
		 cast('9999-12-31 23:59:59.0000000' as datetime2) as [effective_end_datetime],
			  U.ID as [SanjelUserid],
			  0 as [SanjelUserSystemid],
			  U.NAME as [SanjelUserName], null as [SanjelUserDescription],
			  G.ID as [UserGroupid],
			  0 as [UserGroupSystemid],
			  G.NAME as [UserGroupName],
			  null as [UserGroupDescription]
	from 
		dbo.SYN_ES_SD_GROUP_USERS GU
		Join SanjelUser U on GU.USER_ID = U.id
		join dbo.SYN_ES_SD_GROUPS G on GU.GROUP_ID = G.ID;
GO
/****** Object:  View [dbo].[CallSheet]    Script Date: 5/23/2023 9:11:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CallSheet]') AND type in (N'U'))
DROP TABLE [dbo].[CallSheet]
GO

CREATE VIEW [dbo].[CallSheet]
with view_metadata
AS
select 
	CSH.id as id,
    cast(0 as int) as entity_status,
	cast(0 as int) as owner_id,
    cast(null as varchar(100)) as name,
    cast(null as varchar(500)) as description,
	cast(CSH.CALL_SHEET_NUMBER as int) as CallSheetNumber,
	cast(CSH.STATUS as int) as status,
	cast(CSH.CIF_CALLOUT_DATETIME as datetime2(7)) as CallDateTime,
	cast(CSH.CIF_CALL_CREW_DATE_TIME as datetime2(7)) as CallCrewDateTime,
	cast(CSH.CIF_REQUESTED_DATE_TIME as datetime2(7)) as RequestedDateTime,
	cast(CSH.[FC_IS_EXPECTED_TIME_ON_LOC] as bit) as IsExpectedTimeOnLocation,
	cast(CSH.CIF_IS_THIS_CALL_MADE as bit) as IsThisCallMade,
	cast(CSH.[FC_ALERT_DATE_TIME] as datetime2(7)) as AlertDateTime,
	cast(CSH.[CIF_CALLOUT_CONSULTANT] as varchar(100)) as CalloutConsultant,
	cast(CSH.CIF_CALLOUT_CONSULTANT_CELL as varchar(30))  as  CalloutConsultantCellNumber,
	cast(CSH.CIF_CALLOUT_CONSULTANT_EMAIL as varchar(100))  as  CalloutConsultantEmail,
	cast(CSH.CIF_IS_LOAD_AND_GO as bit)  as  IsLoadAndGo,
	cast(CSH.WLI_WELL_LOCATION as nvarchar(100))  as  WellLocation,
	cast(CSH.WLI_WELL_LOCATION_TYPE_ID as int)  as  WellLocationTypeId,
	cast(0 as int) as WellLocationTypeSystemId,
	cast(CSH.WLI_WELL_LOCATION_TYPE_NAME as varchar(100)) as  WellLocationTypeName,
	cast(null as varchar(500)) as WellLocationTypeDescription,
	cast(CSH.WLI_DH_WELL_LOCATION as varchar(100)) as  DownHoleWellLocation,
	cast(CSH.WLI_DH_WELL_LOCATION_TYPE_ID as int) as  DownHoleWellLocationTypeId,
	cast(0 as int) as DownHoleWellLocationTypeSystemId,
	cast(CSH.WLI_DH_WELL_LOCATION_TYPE_NAME as varchar(100)) as DownHoleWellLocationTypeName,
	cast(null as varchar(500)) as DownHoleWellLocationTypeDescription,
	cast(CSH.WLI_DIRECTION_TO_LOCATION as varchar(1000))  as  DirectionToLocation,
	cast(CSH.WLI_WELL_NAME as varchar(100))  as  WellName,
	cast(CSH.FC_EXPECTED_TIME_ON_LOC as datetime2(7)) as ExpectedOnLocationTime,
	cast(CSH.JD_SERVICE_POINT_ID as int) as ServicePointid,
	cast(0 as int) as ServicePointSystemId,
	cast(CSH.JD_SERVICE_POINT_NAME as varchar(100)) as ServicePointName,
	cast(null as varchar(500)) as ServicePointDescription
	from dbo.[SYN_ES_CALLSHEET_HEADERS] CSH where CSH.STATUS in (1,2,5) and CSH.GENERATED_DATETIME > DateADD(Day, -30, GETDATE());
GO
/****** Object:  View [dbo].[CallSheetBlendSection]    Script Date: 5/23/2023 9:11:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CallSheetBlendSection]') AND type in (N'U'))
DROP TABLE [dbo].[CallSheetBlendSection]
GO

CREATE VIEW [dbo].[CallSheetBlendSection]
with view_metadata
AS
select 
	PBD.id as Id,
    cast(0 as int) as entity_status,
    cast(PBD.ROOT_ID as int) as owner_id,
    cast(null as varchar(100)) as name,
    cast(null as varchar(500)) as description,
	cast(BAMU.id as int) as BlendAmountUnitid,
	cast(BAMU.name as varchar(100)) as BlendAmountUnitName,
	cast(BAMU.description as varchar(500)) as BlendAmountUnitDescription,
	cast(BAMU.system_id as int) as BlendAmountUnitSystemId,
	cast(PBD.BLEND_CATEGORY_ID as int) as BlendCategoryid,
	cast(PBD.BLEND_CATEGORY_NAME as varchar(100)) as BlendCategoryName,
	cast(PBD.BLEND_CATEGORY_NAME as varchar(100)) as BlendCategoryDescription,
	cast(0 as int) as BlendCategorySystemId,
	cast(PBD.BLEND_FLUID_TYPE_ID as int) as BlendFluidTypeid,
	cast(PBD.BLEND_FLUID_TYPE_NAME as varchar(100)) as BlendFluidTypeName,
	cast(null as varchar(500)) as BlendFluidTypeDescription,
	cast(0 as int) as BlendFluidTypeSystemId,
	cast(PBD.ROOT_ID as int) as CallSheetid,
	cast(CS.CallSheetNumber as varchar(100)) as CallSheetName,
	cast(null as varchar(500)) as CallSheetDescription,
	cast(PBD.EVENT_NUMBER as int) as EventNumber,
	cast(PBD.NEED_FIELD_TESTING as bit) as IsNeedFieldTesting,
	cast(PBD.IS_NEED_HUAL as bit) as IsNeedHaul,
	cast(PBD.PILOT_TEST_ID as varchar(100)) as PilotTestId,
	cast(PBD.PILOT_TEST_ITERATION as int) as PilotTestIteration,
	cast(PBD.QUANTITY as float) as Quantity,
	cast(PBD.BLEND_HAULED_ON as varchar(100)) as BlendHaulOn,
	cast(PBD.DENSITY as float) as Density,
	cast(PBD.INTERVAL as int) as Interval,
	cast(PBD.IS_CLIENT_APPROVAL_REQUIRED as bit) as IsClientApprovalRequired,
	cast(PBD.ORIGINAL_QUANTITY as float) as OriginalQuantity,
	cast(PBD.MIX_WATER_REQUIREMENT as float) as MixWaterRequirement,
	cast(PBD.YIELD as float) as Yield,
	cast(PBD.SACK_WEIGHT as float) as SackWeight
from SYN_ES_PUMP_BLEND_SCTNS PBD 
Join BlendAdditiveMeasureUnit BAMU on PBD.BLEND_AMOUNT_UNIT_ABBR = BAMU.Abbreviation and BAMU.effective_end_datetime > GETDATE()
Join CallSheet CS on PBD.ROOT_ID = CS.ID
GO
/****** Object:  View [dbo].[CallSheetBlendAdditiveSection]    Script Date: 5/23/2023 9:11:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CallSheetBlendAdditiveSection]') AND type in (N'U'))
DROP TABLE [dbo].[CallSheetBlendAdditiveSection]
GO

CREATE VIEW [dbo].[CallSheetBlendAdditiveSection]
with view_metadata
AS
select 
	PBD.id as Id,
    cast(0 as int) as entity_status,
    cast(PBD.ROOT_ID as int) as owner_id,
    cast(null as varchar(100)) as name,
    cast(null as varchar(500)) as description,
	cast(PBD.ADDITION_METHOD_ID - 1 as int) as AdditiveBlendMethodid,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditiveBlendMethodName,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditiveBlendMethodDescription,
	cast(0 as int) as AdditiveBlendMethodSystemId,
	cast(PBD.ADDITION_METHOD_ID - 1 as int) as AdditionMethodid,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditionMethodName,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditionMethodDescription,
	cast(0 as int) as AdditionMethodSystemId,
	cast(BAMU.id as int) as AdditiveAmountUnitid,
	cast(BAMU.name as varchar(100)) as AdditiveAmountUnitName,
	cast(BAMU.description as varchar(500)) as AdditiveAmountUnitDescription,
	cast(BAMU.system_id as int) as AdditiveAmountUnitSystemId,
	cast(PBD.ADDITIVE_ID as int) as AdditiveTypeid,
	cast(PBD.ADDITIVE_NAME as varchar(100)) as AdditiveTypeName,
	cast(null as varchar(500)) as AdditiveTypeDescription,
	cast(0 as int) as AdditiveTypeSystemId,
	cast(PBD.PARENT_ID as int) as BlendSectionid,
	cast(null as varchar(100)) as BlendSectionName,
	cast(null as varchar(500)) as BlendSectionDescription,
	cast(PBD.PARENT_ID as int) as CallSheetBlendSectionid,
	cast(null as varchar(100)) as CallSheetBlendSectionName,
	cast(null as varchar(500)) as CallSheetBlendSectionDescription,
	cast(PBD.AMOUNT as float) as Amount,
	cast(PBD.BASE_NAME as varchar(255)) as BaseName

from dbo.SYN_ES_PUMP_BLEND_BLEND_ADDTV_SCTNS PBD 
Join BlendAdditiveMeasureUnit BAMU on PBD.AMOUNT_UNIT_ABBR = BAMU.Abbreviation and BAMU.effective_end_datetime > GETDATE()
Join CallSheet CS on PBD.ROOT_ID = CS.ID
GO

/****** Object:  View [dbo].[JobDesign]    Script Date: 5/23/2023 9:11:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JobDesign]') AND type in (N'U'))
DROP TABLE [dbo].[JobDesign]
GO

CREATE VIEW [dbo].[JobDesign]
AS
select 
	PRG.id as id,
	0 as entity_status,
	0 as owner_id,
	null as name,
	null as description,
	PRG.id as system_id, 
	cast(1 as int) as version,
	0 as modified_user_id,
	null as modified_user_name,
	cast(PRG.LAST_MODIFIED_DATE_TIME as datetime2) as modified_datetime,
	PRG.LAST_OPERATION_TYPE as operation_type,
	cast(PRG.EFFECTIVE_START_DATE_TIME as datetime2) as effective_start_datetime,
	cast(PRG.EFFECTIVE_END_DATE_TIME as datetime2) as effective_end_datetime,
	1 as PumperCount,
	PCIS.COMPANY_ID as ClientCompanyid,
	0 as ClientCompanySystemId,
	PCIS.COMPANY_NAME as ClientCompanyName,
	PCIS.COMPANY_NAME as ClientCompanyDescription,
	COM.SHORT_NAME as ClientCompanyShortName,
	cast(0 as bit) as PreJobTesting,
	PRG.JD_SERVICE_POINT_ID as ServicePointid,
	0 as ServicePointSystemId,
	JD_SERVICE_POINT_NAME as ServicePointName,
	JD_SERVICE_POINT_NAME as ServicePointDescription,
	WLI_RIG_ID as Rigid,
	0 as RigSystemId,
	WLI_RIG_NAME as RigName,
	WLI_RIG_NAME as RigDescription,
	ESTIMATE_START_DATE as JobDateTime,
	PROGRAM_ID as ProgramId,
	cast(8 as int) as JobDuration,
	cast(0 as float) as RiskMatrix,
	cast(null as nvarchar(100)) as JobTypeName,
	cast(null as nvarchar(500)) as JobTypeDescription,
	cast(0 as int) as JobTypeid,
	cast(0 as int) as JobTypeSystemId,
	REVISION_DESCRIPTION as RevisionDescription,
	WLI_WELL_LOCATION as SurfaceLocation,
	Revision as Revision,
	Well_Count as WellCount,
	WLI_DH_WELL_LOCATION as WellLocation,
	cast(isnull(Is_Multiple_Well, 0) as bit) as IsMultipleWell,
	PROGRAM_GENERATED_DATE as ProgramGeneratedDate,
	CHRG.TRAVEL_BASE_CHARGE as TravelBaseCharge,
	Is_Bid_Program as IsBidProgram, 
	cast(PROGRAM_EXPIRY_DATE as datetime2) as ProgramExpiryDate,
	cast(null as nvarchar(100)) as SalesProjectUid
from 
	SYN_ES_programs PRG 
	inner join SYN_ES_PRG_COMPANY_INFO_SCTNS PCIS on PCIS.ROOT_ID = PRG.id
	inner join SYN_ES_COMPANIES COM on COM.Id = PCIS.COMPANY_ID
	inner join SYN_ES_PRG_CHRG_MTHD_DSCT_SCTNS CHRG on CHRG.ROOT_ID=PRG.id
where 
	PCIS.IS_CLIENT = 1
GO
/****** Object:  View [dbo].[JobDesignBlendAdditiveSection]    Script Date: 5/23/2023 9:11:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JobDesignBlendAdditiveSection]') AND type in (N'U'))
DROP TABLE [dbo].[JobDesignBlendAdditiveSection]
GO

CREATE VIEW [dbo].[JobDesignBlendAdditiveSection]
with view_metadata
AS
select 
	PBD.id as Id,
	cast(0 as int) as entity_status,
	cast(PARENT_ID as int) as owner_id,
    cast(null as varchar(100)) as name,
    cast(null as varchar(500)) as description,
	cast(PBD.ADDITION_METHOD_ID -1 as int) as AdditiveBlendMethodid,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditiveBlendMethodName,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditiveBlendMethodDescription,
	cast(0 as int) as AdditiveBlendMethodSystemId,
	cast(PBD.ADDITION_METHOD_ID - 1 as int) as AdditionMethodid,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditionMethodName,
	cast(PBD.ADDITION_METHOD_NAME as varchar(100)) as AdditionMethodDescription,
	cast(0 as int) as AdditionMethodSystemId,
	cast(BAMU.id as int) as AdditiveAmountUnitid,
	cast(BAMU.name as varchar(100)) as AdditiveAmountUnitName,
	cast(BAMU.description as varchar(500)) as AdditiveAmountUnitDescription,
	cast(BAMU.system_id as int) as AdditiveAmountUnitSystemId,
	cast(PBD.ADDITIVE_ID as int) as AdditiveTypeid,
	cast(PBD.ADDITIVE_NAME as varchar(100)) as AdditiveTypeName,
	cast(null as varchar(500)) as AdditiveTypeDescription,
	cast(0 as int) as AdditiveTypeSystemId,
	cast(PBD.PARENT_ID as int) as BlendSectionid,
	cast(null as varchar(100)) as BlendSectionName,
	cast(null as varchar(500)) as BlendSectionDescription,
	cast(PBD.PARENT_ID as int) as JobDesignBlendSectionid,
	cast(null as varchar(100)) as JobDesignBlendSectionName,
	cast(null as varchar(500)) as JobDesignBlendSectionDescription,
	cast(PBD.AMOUNT as float) as Amount,
	cast(PBD.BASE_NAME as varchar(100)) as BaseName
from dbo.SYN_ES_PRG_BLEND_BLEND_ADDTV_SCTNS PBD 
Join BlendAdditiveMeasureUnit BAMU on PBD.AMOUNT_UNIT_ABBR = BAMU.Abbreviation and BAMU.effective_end_datetime > GETDATE()
GO
/****** Object:  View [dbo].[JobDesignBlendSection]    Script Date: 5/23/2023 9:11:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JobDesignBlendSection]') AND type in (N'U'))
DROP TABLE [dbo].[JobDesignBlendSection]
GO

CREATE VIEW [dbo].[JobDesignBlendSection]
with view_metadata
AS
select 
	PBD.id as Id,
    cast(0 as int) as entity_status,
	cast(PBD.PARENT_ID as int) as owner_id,
    cast(null as varchar(100)) as name,
    cast(null as varchar(500)) as description,
	cast(BAMU.id as int) as BlendAmountUnitid,
	cast(BAMU.name as varchar(100)) as BlendAmountUnitName,
	cast(BAMU.description as varchar(500)) as BlendAmountUnitDescription,
	cast(BAMU.system_id as int) as BlendAmountUnitSystemId,
	cast(PBD.BLEND_CATEGORY_ID as int) as BlendCategoryid,
	cast(PBD.BLEND_CATEGORY_NAME as varchar(100)) as BlendCategoryName,
	cast(PBD.BLEND_CATEGORY_NAME as varchar(100)) as BlendCategoryDescription,
	cast(0 as int) as BlendCategorySystemId,
	cast(PBD.BLEND_FLUID_TYPE_ID as int) as BlendFluidTypeid,
	cast(PBD.BLEND_FLUID_TYPE_NAME as varchar(100)) as BlendFluidTypeName,
	cast(null as varchar(500)) as BlendFluidTypeDescription,
	cast(0 as int) as BlendFluidTypeSystemId,
	cast(PBD.PARENT_ID as int) as JobDesignPumpingJobSectionid,
	cast(null as varchar(100)) as JobDesignPumpingJobSectionName,
	cast(null as varchar(500)) as JobDesignPumpingJobSectionDescription,
	cast(PBD.EVENT_NUMBER as int) as EventNumber,
	cast(PBD.NEED_FIELD_TESTING as bit) as IsNeedFieldTesting,
	cast(PBD.[IS_NEED_HUAL] as bit) as IsNeedHaul,
	cast(PBD.PILOT_TEST_ID as varchar(100)) as PilotTestId,
	cast(PBD.PILOT_TEST_ITERATION as int) as PilotTestIteration,
	cast(PBD.QUANTITY as float) as Quantity,
	cast(PBD.BLEND_HAULED_ON as varchar(200)) as BlendHaulOn,
	cast(PBD.DENSITY as [float]) as Density,
	cast(PBD.INTERVAL as int) as Interval,
	cast(PBD.IS_CLIENT_APPROVAL_REQUIRED as bit) as IsClientApprovalRequired,
	cast(PBD.ORIGINAL_QUANTITY as float) as OriginalQuantity,
	cast(PBD.MIX_WATER_REQUIREMENT as float) as MixWaterRequirement,
	cast(PBD.YIELD as float) as Yield,
	cast(PBD.SACK_WEIGHT as float) as SackWeight
from dbo.SYN_ES_PRG_BLEND_SCTNS PBD 
Join BlendAdditiveMeasureUnit BAMU on PBD.BLEND_AMOUNT_UNIT_ABBR = BAMU.Abbreviation and BAMU.effective_end_datetime > GETDATE()
GO
/****** Object:  View [dbo].[JobDesignPumpingJobSection]    Script Date: 5/23/2023 9:11:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JobDesignPumpingJobSection]') AND type in (N'U'))
DROP TABLE [dbo].[JobDesignPumpingJobSection]
GO

CREATE VIEW [dbo].[JobDesignPumpingJobSection]
with view_metadata
AS
select 
    cast(PPJS.ID as int)                as ID,
    cast(0 as int)                      as entity_status,
    cast(PPJS.ROOT_ID as int)           as owner_id,
    cast(null as nvarchar(100))       as name,
    cast(null as nvarchar(500))       as description,
	PPJS.id as system_id, 
cast(1 as int) as version,
0 as [modified_user_id],
null as [modified_user_name],
DATEADD(day, -1, CAST(GETDATE() AS datetime2)) as [modified_datetime],
cast (0 as int) as [operation_type],
DATEADD(day, -1, CAST(GETDATE() AS datetime2)) as [effective_start_datetime],
cast('9999-12-31 23:59:59.0000000' as datetime2) as [effective_end_datetime],
    --cast(8 as int)                        as JobDurationOld,
    --cast(iif(IsNull(PPJS.NUM_OF_STAGES - 1, 0) = 0, IsNull(r.PrepDuration, 0) + IsNull(r.PumpingDuration, 0) + IsNull(r.PostJobDuration, 0), 8) as int) as JobDuration, -- just a test before PPJS.PUMPING_DURATION added to the table
    --cast(iif(IsNull(PPJS.PUMPING_DURATION, 0) = 0, IsNull(r.PrepDuration, 0) + IsNull(r.PumpingDuration, 0) + IsNull(r.PostJobDuration, 0), 8) as int) as JobDuration,
    cast(iif(IsNull(PPJS.PUMPING_DURATION, 0) = 0, IsNull(r.PrepDuration, 0) + IsNull(r.PumpingDuration, 0) + IsNull(r.PostJobDuration, 0), PPJS.PUMPING_DURATION) as int) as JobDuration,
    cast(isnull(PPJS.RISK_MATRIX, 0) as float) as RiskMatrix,
    --cast(1 as int)                        as PumperCount,
    cast(iif(IsNull(PPJS.PUMPER_COUNT, 0) = 0, 1, PPJS.PUMPER_COUNT) as int)    as PumperCount,
    PPJS.ROOT_ID                        as JobDesignid,
    cast(0 as int)                      as JobDesignSystemId,
    cast(null as nvarchar(100))       as JobDesignName,
    cast(null as nvarchar(500))       as JobDesignDescription,
    cast(PPJS.JD_JOB_TYPE_ID as int)    as JobTypeid,
    cast(0 as int)                      as JobTypeSystemId,
    cast(null as nvarchar(500))       as JobTypeDescription,
    cast(PPJS.JD_JOB_TYPE_NAME as nvarchar(500)) as JobTypeName,
    cast(PPJS.EXECUTION_ORDER as int) as ExecutionOrder
from 
    SYN_ES_PRG_PUMPING_JOB_SECTIONS PPJS
    --left join dbo.JobTimeReport r on r.JobTypeid = cast(PPJS.JD_JOB_TYPE_ID as int) and r.PumperCount = cast(1 as int)
    left join dbo.JobTimeReport r on r.JobTypeid = cast(PPJS.JD_JOB_TYPE_ID as int) and r.PumperCount = cast(iif(IsNull(PPJS.PUMPER_COUNT, 0) = 0, 1, PPJS.PUMPER_COUNT) as int)
;
GO
/****** Object:  View [dbo].[RigJobSanjelCrewSectionList]    Script Date: 5/23/2023 9:11:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Object:  View [dbo].[UserGroup]    Script Date: 5/23/2023 9:11:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserGroup]') AND type in (N'U'))
DROP TABLE [dbo].[UserGroup]
GO
CREATE VIEW [dbo].[UserGroup] as

	Select 
		 id as [ID],
		 0 as [entity_status],
		 0 as [owner_id],
		 Name as [NAME],
		 null as [description],
		 id as [system_id],
		 1 as [version],
		 0 as [modified_user_id],
		 null as [modified_user_name],
		 cast('2021-12-31 23:59:59.0000000' as datetime2) as [modified_datetime],
		 1 as [operation_type],
		 cast('2021-12-31 23:59:59.0000000' as datetime2) as [effective_start_datetime],
		 cast('9999-12-31 23:59:59.0000000' as datetime2) as [effective_end_datetime]
	from 
		dbo.SYN_ES_SD_GROUPS;
GO
/****** Object:  View [dbo].[UserGroupUserPermission]    Script Date: 5/23/2023 9:11:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserGroupUserPermission]') AND type in (N'U'))
DROP TABLE [dbo].[UserGroupUserPermission]
GO
CREATE VIEW [dbo].[UserGroupUserPermission] AS

	Select
		cast((ROW_NUMBER() over (Order by GU.PERMISSION_ID, GU.GROUP_ID)) as int) as ID,
		 0 as [entity_status],
		 0 as [owner_id],
		 null as [Name],
		 null as [description],
		cast((ROW_NUMBER() over (Order by GU.PERMISSION_ID, GU.GROUP_ID)) as int) as system_id,
		 1 as [version],
		 0 as [modified_user_id],
		 null as [modified_user_name],
		 cast(Getdate() as datetime2) as [modified_datetime],
		 1 as [operation_type],
		 cast(Getdate() as datetime2) as [effective_start_datetime],
		 cast('9999-12-31 23:59:59.0000000' as datetime2) as [effective_end_datetime],
			  G.ID as [UserGroupid],
			  0 as [UserGroupSystemid],
			  G.NAME as [UserGroupName],
			  null as [UserGroupDescription],
			  u.ID as [UserPermissionid],
			  0 as [UserPermissionSystemid],
			  u.NAME as [UserPermissionName],
			  null as [UserPermissionDescription]
	from 
		dbo.SYN_ES_SD_GROUP_PERMISSIONS GU
		Join dbo.SYN_ES_SD_PERMISSIONS U on GU.PERMISSION_ID = U.id
		join dbo.SYN_ES_SD_GROUPS G on GU.GROUP_ID = G.ID;
GO
/****** Object:  View [dbo].[UserPermission]    Script Date: 5/23/2023 9:11:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPermission]') AND type in (N'U'))
DROP TABLE [dbo].[UserPermission]
GO
CREATE VIEW [dbo].[UserPermission] as

	Select 
		id as [ID],
		 0 as [entity_status],
		 0 as [owner_id],
		 Name as [Name],
		 null as [description],
		 id as [system_id],
		 1 as [version],
		 0 as [modified_user_id],
		 null as [modified_user_name],
		 cast('2021-12-31 23:59:59.0000000' as datetime2) as [modified_datetime],
		 1 as [operation_type],
		 cast('2021-12-31 23:59:59.0000000' as datetime2) as [effective_start_datetime],
		 cast('9999-12-31 23:59:59.0000000' as datetime2) as [effective_end_datetime]
	from 
		dbo.SYN_ES_SD_PERMISSIONS;
GO
