USE [SanjelDataUAT]
GO
/****** Object:  View [dbo].[UserPermission]    Script Date: 4/10/2023 10:36:50 PM ******/
DROP VIEW [dbo].[UserPermission]
GO
/****** Object:  View [dbo].[UserGroupUserPermission]    Script Date: 4/10/2023 10:36:50 PM ******/
DROP VIEW [dbo].[UserGroupUserPermission]
GO
/****** Object:  View [dbo].[UserGroup]    Script Date: 4/10/2023 10:36:50 PM ******/
DROP VIEW [dbo].[UserGroup]
GO
/****** Object:  View [dbo].[UnitLocation]    Script Date: 4/10/2023 10:36:50 PM ******/
DROP VIEW [dbo].[UnitLocation]
GO
/****** Object:  View [dbo].[RigJobSanjelCrewSectionList]    Script Date: 4/10/2023 10:36:50 PM ******/
DROP VIEW [dbo].[RigJobSanjelCrewSectionList]
GO
/****** Object:  View [dbo].[JobDesignPumpingJobSection]    Script Date: 4/10/2023 10:36:50 PM ******/
DROP VIEW [dbo].[JobDesignPumpingJobSection]
GO
/****** Object:  View [dbo].[JobDesignBlendSection]    Script Date: 4/10/2023 10:36:50 PM ******/
DROP VIEW [dbo].[JobDesignBlendSection]
GO
/****** Object:  View [dbo].[JobDesignBlendAdditiveSection]    Script Date: 4/10/2023 10:36:50 PM ******/
DROP VIEW [dbo].[JobDesignBlendAdditiveSection]
GO
/****** Object:  View [dbo].[JobDesign]    Script Date: 4/10/2023 10:36:50 PM ******/
DROP VIEW [dbo].[JobDesign]
GO
/****** Object:  View [dbo].[CallSheet]    Script Date: 4/10/2023 10:36:50 PM ******/
DROP VIEW [dbo].[CallSheet]
GO
/****** Object:  View [dbo].[BlendShippingFacade]    Script Date: 4/10/2023 10:36:50 PM ******/
DROP VIEW [dbo].[BlendShippingFacade]
GO
/****** Object:  View [dbo].[CallSheetBlendSection]    Script Date: 4/10/2023 10:36:50 PM ******/
DROP VIEW [dbo].[CallSheetBlendSection]
GO
/****** Object:  View [dbo].[CallSheetBlendAdditiveSection]    Script Date: 4/10/2023 10:36:50 PM ******/
DROP VIEW [dbo].[CallSheetBlendAdditiveSection]
GO
/****** Object:  View [dbo].[UserGroupSanjelUser]    Script Date: 4/10/2023 10:36:50 PM ******/
DROP VIEW [dbo].[UserGroupSanjelUser]
GO
/****** Object:  View [dbo].[SanjelUser]    Script Date: 4/10/2023 10:36:50 PM ******/
DROP VIEW [dbo].[SanjelUser]
GO
/****** Object:  View [dbo].[SanjelUser]    Script Date: 4/10/2023 10:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  View [dbo].[UserGroupSanjelUser]    Script Date: 4/10/2023 10:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  View [dbo].[CallSheetBlendAdditiveSection]    Script Date: 4/10/2023 10:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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

GO
/****** Object:  View [dbo].[CallSheetBlendSection]    Script Date: 4/10/2023 10:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	cast(null as varchar(100)) as CallSheetName,
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
GO
/****** Object:  View [dbo].[BlendShippingFacade]    Script Date: 4/10/2023 10:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BlendShippingFacade]
with view_metadata
AS
select
cast(CBS.id as int) as id,
cast(0 as int) as entity_status,
cast(0 as int) as owner_id,
cast((CBS.BlendFluidTypeName + ' + Additives')as varchar(100)) as name,
(CBS.BlendFluidTypeName + CAST((SELECT ' + ', CONVERT(DECIMAL(10,2),ISNULL(Amount, 0.00)), AdditiveAmountUnitDescription as [text()], ' ', AdditiveTypeName as [text()] FROM CallSheetBlendAdditiveSection where CallSheetBlendSectionid=SLS.BlendSectionId order by AdditiveTypeName FOR XML PATH(''), TYPE) AS NVARCHAR(400)))
 as description,
cast(CBS.CallSheetid as int) as CallSheetId,
cast(CBS.id as int) as BlendSectionId,
cast(CBS.BlendCategoryid as int) as BlendCategoryId,
cast(CBS.BlendCategorySystemId as int) as BlendCategorySystemId,
cast(CBS.BlendCategoryName as nvarchar(100)) as BlendCategoryName,
cast(CBS.BlendCategoryDescription as nvarchar(500)) as BlendCategoryDescription,
cast(CBS.BlendFluidTypeid as int) as BlendFluidTypeid,
cast(CBS.BlendFluidTypeSystemId as int) as BlendFluidTypeSystemId,
cast(CBS.BlendFluidTypeName as nvarchar(100)) as BlendFluidTypeName,
cast(CBS.BlendFluidTypeDescription as nvarchar(500)) as BlendFluidTypeDescription,
cast(CBS.BlendAmountUnitid as int) as BlendAmountUnitid,
cast(CBS.BlendAmountUnitSystemId as int) as BlendAmountUnitSystemId,
cast(CBS.BlendAmountUnitName as nvarchar(100)) as BlendAmountUnitName,
cast(CBS.BlendAmountUnitDescription as nvarchar(500)) as BlendAmountUnitDescription,
cast(null as nvarchar(500)) as ProgramId,
cast(CBS.Quantity as float) as TotalTonnage,
cast(CASE WHEN SLS.OnLocationTonnage is null THEN 0 ELSE SLS.OnLocationTonnage/1000 END as float) as OnLocationTonnage,
cast(CASE 
WHEN SLS.OnLocationTonnage >= (CBS.Quantity*1000) THEN '#00FF00'
WHEN SLS.ScheduledTonnage is null and SLS.OnLocationTonnage is null and SLS.BlendingTonnage is null THEN '#FF0000'
WHEN SLS.ScheduledTonnage is not null and SLS.OnLocationTonnage is null and SLS.BlendingTonnage is null THEN '#FFFF00'
--WHEN SLS.ScheduledTonnage is not null and SLS.OnLocationTonnage is null and SLS.BlendingTonnage is not null THEN '#FFBF00'
--WHEN SLS.ScheduledTonnage is null  and SLS.OnLocationTonnage is not null and SLS.BlendingTonnage is null and SLS.OnLocationTonnage < (CBS.Quantity*1000) THEN '#FFBF00'
--WHEN SLS.ScheduledTonnage is null  and SLS.OnLocationTonnage is not null and SLS.BlendingTonnage is not null and (SLS.BlendingTonnage + SLS.OnLocationTonnage) < (CBS.Quantity*1000) THEN '#FFBF00'
--WHEN SLS.ScheduledTonnage is not null  and SLS.OnLocationTonnage is not null and SLS.BlendingTonnage is null and (SLS.ScheduledTonnage + SLS.OnLocationTonnage) < (CBS.Quantity*1000) THEN '#FFBF00'
--WHEN SLS.ScheduledTonnage is not null  and SLS.OnLocationTonnage is not null and SLS.BlendingTonnage is not null and (SLS.ScheduledTonnage + SLS.OnLocationTonnage + SLS.BlendingTonnage) < (CBS.Quantity*1000) THEN '#FFBF00'
WHEN (SLS.ScheduledTonnage >= (CBS.Quantity*1000))  THEN '#FFFF00'
ELSE '#FFBF00' 
END
as nvarchar(10)) as StatusCode
from CallSheetBlendSection CBS
left outer join 
(select PHL.CallSheetId as CallSheetId,
	PHL.BlendSectionId as BlendSectionId,
	SUM(CASE WHEN SL.ShippingStatus = 3 THEN SL.LoadAmount END) as OnLocationTonnage, 
	SUM(CASE WHEN PHL.ProductHaulLoadLifeStatus = 1 THEN BaseAmount END) as ScheduledTonnage,
	SUM(CASE WHEN PHL.ProductHaulLoadLifeStatus in (3, 4) THEN LoadAmount END) as BlendingTonnage
	from ProductHaulLoad PHL 
	join ShippingLoadSheet SL on PHL.Id = SL.ProductHaulLoadid
	where PHL.callsheetid <>0 and SL.effective_end_datetime>GETDATE() and PHL.effective_end_datetime>getdate() group by PHL.CallSheetId, PHL.BlendSectionId) SLS 
on CBS.CallSheetId=SLS.CallSheetId and CBS.Id = SLS.BlendSectionId where CBS.IsNeedHaul = 1 or SLS.CallSheetId is not null;
GO
/****** Object:  View [dbo].[CallSheet]    Script Date: 4/10/2023 10:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	cast(CSH.FC_EXPECTED_TIME_ON_LOC as datetime2(7)) as ExpectedOnLocationTime
	from dbo.[SYN_ES_CALLSHEET_HEADERS] CSH 
GO
/****** Object:  View [dbo].[JobDesign]    Script Date: 4/10/2023 10:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	CHRG.TRAVEL_BASE_CHARGE as TravelBaseCharge
from 
	SYN_ES_programs PRG 
	inner join SYN_ES_PRG_COMPANY_INFO_SCTNS PCIS on PCIS.ROOT_ID = PRG.id
	inner join SYN_ES_COMPANIES COM on COM.Id = PCIS.COMPANY_ID
	inner join SYN_ES_PRG_CHRG_MTHD_DSCT_SCTNS CHRG on CHRG.ROOT_ID=PRG.id
where 
	PCIS.IS_CLIENT = 1
GO
/****** Object:  View [dbo].[JobDesignBlendAdditiveSection]    Script Date: 4/10/2023 10:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  View [dbo].[JobDesignBlendSection]    Script Date: 4/10/2023 10:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  View [dbo].[JobDesignPumpingJobSection]    Script Date: 4/10/2023 10:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
    cast(PPJS.JD_JOB_TYPE_NAME as nvarchar(500)) as JobTypeName
from 
    SYN_ES_PRG_PUMPING_JOB_SECTIONS PPJS
    --left join dbo.JobTimeReport r on r.JobTypeid = cast(PPJS.JD_JOB_TYPE_ID as int) and r.PumperCount = cast(1 as int)
    left join dbo.JobTimeReport r on r.JobTypeid = cast(PPJS.JD_JOB_TYPE_ID as int) and r.PumperCount = cast(iif(IsNull(PPJS.PUMPER_COUNT, 0) = 0, 1, PPJS.PUMPER_COUNT) as int)
;

GO
/****** Object:  View [dbo].[RigJobSanjelCrewSectionList]    Script Date: 4/10/2023 10:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RigJobSanjelCrewSectionList]
AS
SELECT  distinct
	 crewSection.id
	,crewSection.SanjelCrewid AS crewId,
	crewSection.effective_end_datetime AS crewsectionEffective_end_datetime
	--
	,rigJob.Rigid
	,rigJob.RigName
	,rigJob.RigDescription
	,rigJob.RigSystemId

	,rigJob.ClientCompanyid
	,rigJob.ClientCompanyName
	,rigJob.ClientCompanyDescription
	,rigJob.ClientCompanySystemId

	,rigJob.JobTypeid
	,rigJob.JobTypeName
	,rigJob.JobTypeDescription
	,rigJob.JobTypeSystemId

	,rigJob.ServicePointid
	,rigJob.ServicePointName
	,rigJob.ServicePointDescription
	,rigJob.ServicePointSystemId

	,rigJob.ClientConsultant1id
	,rigJob.ClientConsultant1Name
	,rigJob.ClientConsultant1Description
	,rigJob.ClientConsultant1SystemId

	,rigJob.ClientConsultant2id
	,rigJob.ClientConsultant2Name
	,rigJob.ClientConsultant2Description
	,rigJob.ClientConsultant2SystemId

	,rigJob.WellLocationTypeid
	,rigJob.WellLocationTypeName
	,rigJob.WellLocationTypeDescription
	,rigJob.WellLocationTypeSystemId


	,rigJob.id as rigJobId
	,rigJob.system_id
	,rigJob.version
	,rigJob.modified_user_id
	,rigJob.modified_user_name
	,rigJob.modified_datetime
	,rigJob.operation_type
	,rigJob.effective_start_datetime
	,rigJob.effective_end_datetime
	,rigJob.entity_status
	,rigJob.owner_id
	,rigJob.name
	,rigJob.description
	,rigJob.WellLocation
	,rigJob.IsProjectRig
	,rigJob.CallSheetId
	,rigJob.IsListed
	,rigJob.IsDownholeLocation
	,rigJob.JobNumber
	,rigJob.RigStatus
	,rigJob.IsHighProfile
	,rigJob.Directions
	,rigJob.IsNeedBins
	,rigJob.ProgramId
	,rigJob.Notes
	,rigJob.SurfaceLocation
	,rigJob.JobDateTime
	,rigJob.JobUniqueId
	,rigJob.IsServiceRig
	,rigJob.CallSheetNumber
	,rigJob.JobLifeStatus
	,rigJob.IsCoDCleared
	,rigJob.JobAlertId
	,rigJob.ClientCompanyShortName
	,rigJob.RiskMatrix
	,rigJob.ProgramRevision
	,rigJob.MaxProgramRevision
	,rigJob.Latitude
	,rigJob.Longitude
	,rigJob.PumperCount
	,rigJob.PreJobTesting
	,rigJob.JobDuration
FROM (select * FROM RigJobSanjelCrewSection where entity_status = 0 and effective_end_datetime>GETDATE()) AS crewSection
INNER JOIN RigJob AS rigJob ON RigJobid = rigJob.id
 
GO
/****** Object:  View [dbo].[UnitLocation]    Script Date: 4/10/2023 10:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[UnitLocation] 
as
with 
    motive as
    (
        SELECT  
            UnitNumber
            ,Lat                Latitude
            ,Lng                Longitude
            ,VehicleId
            ,LastRecordingTime
            ,DriverEmplNumber
            ,DriverEmail
            ,row_number() over (partition by UnitNumber order by LastRecordingTime desc, ProcessingDate desc) rn
        FROM 
            dbo.SYN_DW_Motive_LastLocations
        where
            1=1
            and LastRecordingTime is not null
    )
    ,merged as
    (
        select 
            *
            ,row_number() over (partition by UnitNumber order by LastRecordingTime desc) rn
        from
        (
            SELECT 
                VehicleName         UnitNumber
                ,Lat                Latitude
                ,Lng                Longitude
                ,VehicleID
                ,Time               LastRecordingTime
                ,null               DriverEmplNumber
                ,null               DriverEmail
                ,'InThink'          src
            FROM dbo.SYN_DW_InThink_LastLocations
            union all
            SELECT 
                UnitNumber
                ,Latitude
                ,Longitude
                ,VehicleID
                ,LastRecordingTime
                ,DriverEmplNumber
                ,DriverEmail
                ,'Motive'           src
            FROM motive
            WHERE rn = 1
        ) a
    ) 
    SELECT 
        cast(l.VehicleID as int)    id
        ,cast(l.VehicleID as int)   system_id
        ,1                          [version]
        ,0                          modified_user_id
        ,cast(NULL as nvarchar(255))    modified_user_name
        ,l.LastRecordingTime        modified_datetime
        ,1                          operation_type
        ,l.LastRecordingTime        effective_start_datetime
        ,cast('9999-12-31 23:59:59.0000000' as datetime2) effective_end_datetime
        ,0                          entity_status
        ,0                          owner_id
        ,cast(NULL as nvarchar(100))    [name]
        ,cast(l.src as nvarchar(500))   [description]
        ,e.Id                       Driverid
        ,e.name                     DriverName
        ,e.description              DriverDescription
        ,e.system_id                DriverSystemId
        ,u.id                       UnitId
        ,cast(l.Latitude as decimal(12,6)) Latitude
        ,cast(l.Longitude as decimal(12,6)) Longitude
        ,l.UnitNumber       
        ,u.name                     UnitName
        ,u.description              UnitDescription
        ,u.system_id                UnitSystemId
        ,u.UnitMainTypeid           UnitMainTypeid
        ,u.UnitMainTypeName         UnitMainTypeName
        ,u.UnitMainTypeDescription  UnitMainTypeDescription
        ,u.UnitMainTypeSystemId     UnitMainTypeSystemId
        ,u.UnitSubTypeid            UnitSubTypeid
        ,u.UnitSubTypeName          UnitSubTypeName
        ,u.UnitSubTypeDescription   UnitSubTypeDescription
        ,u.UnitSubTypeSystemId      UnitSubTypeSystemId
    FROM 
        merged l
        left join dbo.TruckUnit u on u.UnitNumber collate Latin1_General_CI_AS = l.UnitNumber and u.[effective_end_datetime] > getdate()
        left join dbo.Employee  e on e.EmployeeNumber = l.DriverEmplNumber and e.effective_end_datetime > getdate()
    where 
        l.rn = 1   
        and u.Id is not null
    ;
GO
/****** Object:  View [dbo].[UserGroup]    Script Date: 4/10/2023 10:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  View [dbo].[UserGroupUserPermission]    Script Date: 4/10/2023 10:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  View [dbo].[UserPermission]    Script Date: 4/10/2023 10:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
