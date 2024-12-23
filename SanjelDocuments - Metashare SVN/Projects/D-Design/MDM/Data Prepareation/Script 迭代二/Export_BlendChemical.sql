select 
bc.id,
bc.system_id,
bc.version,
bc.modified_user_id,
bc.modified_user_name,
bc.modified_datetime,
bc.operation_type,
bc.effective_start_datetime,
bc.effective_end_datetime,
bc.entity_status,
0 as owner_id,
bc.Name,
bc.Description,
bc.IsBaseEligible,
bc.BlendRecipeId,
bc.BlendFluidTypeId as BaseBlendTypeId,
bc.IsThixotropic,
bc.IsAdditiveEligible,
ad.Description as AdditiveTypeDescription,
bc.ProductId,
ad.system_id as AdditiveTypeSystemId,
bp.Name as BlendPrimaryCategoryName,
bc.BagSize,
bc.Density,
pd.Name as ProductName,
bp.Description as BlendPrimaryCategoryDescription,
bc.BlendPrimaryCategoryId,
bc.SpecificGravity,
bc.AdditiveTypeId,
br.system_id as BlendRecipeSystemId,
br.Description as BlendRecipeDescription,
bf.Name as BaseBlendTypeName,
bp.system_id as BlendPrimaryCategorySystemId,
bf.system_id as BaseBlendTypeSystemId,
pd.Description as ProductDescription,
bf.Description as BaseBlendTypeDescription,
br.Name as BlendRecipeName,
bc.Yield,
pd.system_id as ProductSystemId,
bc.MixWater,
ad.Name as AdditiveTypeName,
bc.AERCode
from BlendChemical bc 
left join Product pd on bc.ProductId=pd.id 
left join AdditiveType ad on bc.AdditiveTypeId=ad.id
left join BlendFluidType bf on bc.BlendFluidTypeId=bf.id
left join BlendPrimaryCategory bp on bc.BlendPrimaryCategoryId=bp.id
left join BlendRecipe br on bc.BlendRecipeId=br.id;