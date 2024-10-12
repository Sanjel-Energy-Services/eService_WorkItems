-- water base recipe change to BVOB
  select * from BlendChemicalSection where id in (524,525,532,533,534,535,536,562,563) and effective_end_datetime > GETDATE();

   select * from BlendChemicalSection where effective_end_datetime > GETDATE() order by system_id desc;


  Update BlendChemicalSection set AdditionMethodName = 'BVOB', AdditionMethodDescription = 'BVOB', AdditionMethodId = 5, AdditionMethodSystemId = 13, 
  AdditiveBlendMethodName ='WaterBase', AdditiveBlendMethodDescription = 'WaterBase', AdditiveBlendMethodId =4, AdditiveBlendMethodSystemId = 10,
  UnitName = 'Cubic Meters', UnitDescription = 'Cubic Meters', UnitId = 7, UnitSystemId = 15, Amount = 1 where  id in (524,525,532,533,534,535,536,562,563) and effective_end_datetime > GETDATE();


select BR.NAME, BCS.system_id, BCS.BlendChemicalName, bcs.Amount, 
bcs.AdditionMethodName, bcs.AdditiveBlendMethodName, 
bcs.UnitId, bcs.UnitSystemId, bcs.UnitName, bcs.UnitDescription
from BlendChemicalSection BCS 
join BlendRecipe BR on BCS.BlendRecipeId = BR.id
 where BCS.IsBaseBlend = 1 and BCS.effective_end_datetime > GETDATE()
  and BR.effective_end_datetime > GETDATE() and BR.name like '%Additives' and bcs.AdditionMethodId = 1;

-- For blend + Additivies,  Base Blend should be amount of total tonnage

  update BlendChemicalSection set Amount = 100
  where system_id in (
  select BCS.system_id
from BlendChemicalSection BCS 
join BlendRecipe BR on BCS.BlendRecipeId = BR.id
 where BCS.IsBaseBlend = 1 and BCS.effective_end_datetime > GETDATE()
  and BR.effective_end_datetime > GETDATE() and BR.name like '%Additives' and bcs.AdditionMethodId = 1
  );


  select * from BlendAdditiveMeasureUnit;

  select BR.NAME, BCS.system_id, BCS.BlendChemicalName, bcs.Amount, 
bcs.AdditionMethodName, bcs.AdditiveBlendMethodName, 
bcs.UnitId, bcs.UnitSystemId, bcs.UnitName, bcs.UnitDescription
from BlendChemicalSection BCS 
join BlendRecipe BR on BCS.BlendRecipeId = BR.id
 where BCS.IsBaseBlend = 1 and BCS.effective_end_datetime > GETDATE()
  and BR.effective_end_datetime > GETDATE() and BR.name not like '%Additives' and bcs.AdditionMethodId = 1;

  -- For BWOC  blend product,  Base Blend should be amount of total tonnage

  update BlendChemicalSection set UnitId = 5, UnitSystemId= 13, UnitName='Kilograms'
  where system_id in (
  select BCS.system_id
from BlendChemicalSection BCS 
join BlendRecipe BR on BCS.BlendRecipeId = BR.id
 where BCS.IsBaseBlend = 1 and BCS.effective_end_datetime > GETDATE()
  and BR.effective_end_datetime > GETDATE() and BR.name not like '%Additives' and bcs.AdditionMethodId = 1
  );


	select BR.NAME, BCS.system_id, BCS.BlendChemicalName, bcs.Amount, 
bcs.AdditionMethodName, bcs.AdditiveBlendMethodName, 
bcs.UnitId, bcs.UnitSystemId, bcs.UnitName, bcs.UnitDescription
from BlendChemicalSection BCS 
join BlendRecipe BR on BCS.BlendRecipeId = BR.id
 where BCS.IsBaseBlend = 0 and BCS.effective_end_datetime > GETDATE()
  and BR.effective_end_datetime > GETDATE() and BR.name not like '%Additives' and bcs.AdditionMethodId = 1;

  -- For BWOC  blend product,  Additive Blend should be amount of  tonnage
   update BlendChemicalSection set UnitId = 5, UnitSystemId= 13, UnitName='Kilograms'
  where system_id in (
  select BCS.system_id
from BlendChemicalSection BCS 
join BlendRecipe BR on BCS.BlendRecipeId = BR.id
 where BCS.IsBaseBlend = 0 and BCS.effective_end_datetime > GETDATE()
  and BR.effective_end_datetime > GETDATE() and BR.name not like '%Additives' and bcs.AdditionMethodId = 1
  );
      


  select * from BlendAdditiveMeasureUnit;

  select * from AdditiveBlendMethod;

  	select BR.NAME, BCS.system_id, BCS.BlendChemicalName, bcs.Amount, 
bcs.AdditionMethodName, bcs.AdditiveBlendMethodName, 
bcs.UnitId, bcs.UnitSystemId, bcs.UnitName, bcs.UnitDescription,  BCS.IsBaseBlend 
from BlendChemicalSection BCS 
join BlendRecipe BR on BCS.BlendRecipeId = BR.id
 where BCS.effective_end_datetime > GETDATE()
  and BR.effective_end_datetime > GETDATE() and BR.name not like '%Additives' and bcs.AdditionMethodId = 2;

    -- For BWOB  blend product,  Additive Blend should be amount of  tonnage
  update BlendChemicalSection set UnitId = 5, UnitSystemId= 13, UnitName='Kilograms'
  where system_id in (
  select BCS.system_id
  from BlendChemicalSection BCS 
join BlendRecipe BR on BCS.BlendRecipeId = BR.id
 where BCS.effective_end_datetime > GETDATE()
  and BR.effective_end_datetime > GETDATE() and BR.name not like '%Additives' and bcs.AdditionMethodId = 2);


