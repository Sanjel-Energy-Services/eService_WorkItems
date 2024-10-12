/****** Object:  View [dbo].[JobDesignBlendAdditiveSection]    Script Date: 3/28/2023 9:54:48 PM ******/
DROP VIEW [dbo].[JobDesignBlendAdditiveSection]
GO

/****** Object:  View [dbo].[JobDesignBlendAdditiveSection]    Script Date: 3/28/2023 9:54:48 PM ******/
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

/****** Object:  View [dbo].[CallSheetBlendAdditiveSection]    Script Date: 3/28/2023 9:51:24 PM ******/
DROP VIEW [dbo].[CallSheetBlendAdditiveSection]
GO

/****** Object:  View [dbo].[CallSheetBlendAdditiveSection]    Script Date: 3/28/2023 9:51:24 PM ******/
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

ALTER TABLE [ShippingLoadSheet] ADD [ServicePointid] int NULL Default 0;
ALTER TABLE [ShippingLoadSheet] ADD [ServicePointSystemId] int NULL Default 0;
ALTER TABLE [ShippingLoadSheet] ADD [ServicePointName] [nvarchar](100) NULL;
ALTER TABLE [ShippingLoadSheet] ADD [ServicePointDescription] [nvarchar](500) NULL;
GO

-- Fix BlendShippingFacade

DROP VIEW [dbo].[BlendShippingFacade]
GO

/****** Object:  View [dbo].[BlendShippingFacade]    Script Date: 3/31/2023 1:25:06 PM ******/
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
cast(CASE WHEN SLS.ScheduledTonnage is null THEN '#FF0000'
WHEN SLS.ScheduledTonnage < (CBS.Quantity*1000) THEN '#FFBF00'
WHEN SLS.OnLocationTonnage > (CBS.Quantity*1000) THEN '#00FF00'
WHEN (SLS.ScheduledTonnage > (CBS.Quantity*1000))  THEN '#FFFF00'
ELSE '' 
END
as nvarchar(10)) as StatusCode
from CallSheetBlendSection CBS
join 
(select CallSheetId, 
	BlendSectionId,  
	SUM(CASE WHEN ShippingStatus = 3 THEN LoadAmount END) as OnLocationTonnage, 
	SUM(CASE WHEN ShippingStatus = 1 THEN LoadAmount END) as ScheduledTonnage 
	from ShippingLoadSheet where callsheetid <>0 and effective_end_datetime>GETDATE() group by CallSheetId, BlendSectionId) SLS 
on CBS.CallSheetId=SLS.CallSheetId and CBS.Id = SLS.BlendSectionId;
GO


