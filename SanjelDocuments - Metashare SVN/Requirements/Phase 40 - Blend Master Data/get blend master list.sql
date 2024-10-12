select * from BlendRecipe where name like 'LCC-9' order by system_id desc;

select * from BlendChemicalSection where BlendRecipeId = 183  and effective_end_datetime > GETDATE() order by system_id desc;

select top(1000) * from rigjob order by system_id desc;

select top(1000) * from rigjob where effective_end_datetime between '2022-03-04 00:40:49.0570000' and '2022-03-04 00:42:49.0570000' order by system_id desc;

select JobIntervalTypeName, JobIntervalCount from JobType;

select * from BlendChemical where id = 227;


select * from rigjob where rigname = 'Savanna 634' order by system_id desc;

select * from rigjob where rigname = 'Bonanza 9' and IsListed = 1 and effective_end_datetime > Getdate()  order by system_id desc;

select top(100) * from rigjob where id = 65829 order by system_id desc;

--delete from RigJob where system_id = 261158;

select * from ProductHaulLoad where id = 29187 order by system_id;
-- blendSection Id = 1265867, 
-- 29188,  mix water = 0.546

select top(100) * from ProductHaulLoad order by system_id desc;

select B.Name,B.IsBaseEligible as IsBlend, B.IsAdditiveEligible as IsAdditive, IIF(B.blendrecipeid = 0 or B.blendrecipeid is null, 0, 1) as HasRecipe, P.InventoryNumber, P.PriceCode, B.Density, B.MixWater, B.Yield, B.SpecificGravity, B.BulkDensity, B.AERCode from BlendChemical B 
Join Product P on B.ProductId = P.Id
where B.effective_end_datetime > getdate() and B.name not like '%Additives' and P.effective_end_datetime > getdate();


select * from BlendChemical where effective_end_datetime > getdate();

select * from BlendChemical where name = 'Flyash'  and effective_end_datetime > getdate();


