ALTER TABLE [dbo].[BlendRecipe] ADD [UnitName] [nvarchar](255) NULL;
ALTER TABLE [dbo].[BlendRecipe] ADD [UnitSystemId] [int] NULL;
ALTER TABLE [dbo].[BlendRecipe] ADD [Unitid] [int] NULL;
ALTER TABLE [dbo].[BlendRecipe] ADD [UnitDescription] [nvarchar](255) NULL;

ALTER TABLE [dbo].[ProductHaulLoad] ADD [UnitName] [nvarchar](255) NULL;
ALTER TABLE [dbo].[ProductHaulLoad] ADD [UnitSystemId] [int] NULL;
ALTER TABLE [dbo].[ProductHaulLoad] ADD [Unitid] [int] NULL;
ALTER TABLE [dbo].[ProductHaulLoad] ADD [UnitDescription] [nvarchar](255) NULL;

update ProductHaulLoad set TotalBlendWeight= TotalBlendWeight/1000,  UnitName='Cubic Meters', UnitSystemId=15, Unitid=7, UnitDescription='Cubic Meters' where id in 
(select P.Id from ProductHaulLoad  P
join [eservice6].dbo.PUMP_BLEND_SCTNS B on P.BlendSectionId = B.ID
where B.BLEND_AMOUNT_UNIT_ABBR = 'm3');

