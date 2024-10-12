--https://github.com/Sanjel-Energy-Services/eServiceOnline/issues/213

Use [##SanjelData##]
Go
--modify TABLE
ALTER TABLE [BinNote] ADD [PodIndex] int NOT NULL Default 1
GO
-- Process Historical data
 update  [BinNote] Set modified_datetime=GETDATE(),
  effective_end_datetime = GETDATE(),
  operation_type=3

--https://github.com/Sanjel-Energy-Services/eServiceOnline/issues/223
USE [##SanjelData##]
GO

/****** Object:  View [dbo].[BlendShippingFacade]    Script Date: 2023/12/5 15:45:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[BlendShippingFacade]
with view_metadata
AS
select
cast(CBS.id as int) as id,
cast(0 as int) as entity_status,
cast(0 as int) as owner_id,
cast((CBS.BlendFluidTypeName + case when CAST((SELECT  Amount FROM CallSheetBlendAdditiveSection where CallSheetBlendSectionid=SLS.BlendSectionId  order by AdditiveTypeName  FOR XML PATH(''), TYPE) AS NVARCHAR(400)) is null
then ''else ' + Additives'end)as varchar(100)) as name,
(CBS.BlendFluidTypeName +isnull(CAST((SELECT ' + ', CONVERT(DECIMAL(10,2),ISNULL(Amount, 0.00)), AdditiveAmountUnitDescription as [text()], ' ', AdditiveTypeName as [text()] FROM CallSheetBlendAdditiveSection where CallSheetBlendSectionid=SLS.BlendSectionId order by AdditiveTypeName FOR XML PATH(''), TYPE) AS NVARCHAR(400)),''))
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
as nvarchar(10)) as StatusCode,
CS.ServicePointid as ServicePointid,
CS.ServicePointSystemId as ServicePointSystemId,
CS.ServicePointName as ServicePointName,
CS.ServicePointDescription as ServicePointDescription
from CallSheetBlendSection CBS
left outer join [BlendProgress] SLS on CBS.CallSheetId=SLS.CallSheetId and CBS.Id = SLS.BlendSectionId 
join [CallSheet] CS on CBS.CallSheetid = CS.Id
where CBS.IsNeedHaul = 1 or SLS.CallSheetId is not null;
GO


