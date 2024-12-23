select 
ID as ID, 
'' as SYSTEM_ID,
1 as version, 
LAST_MODIFIED_USER_ID as MODIFIED_USER_ID, 
LAST_MODIFIED_USER_NAME as  MODIFIED_USER_NAME,
case 
	when LAST_MODIFIED_DATE_TIME = CAST('0001-01-01 00:00:00'as DATETIME2)
	THEN CAST('2016-06-01 00:00:00' as DATETIME)
	ELSE CAST(LAST_MODIFIED_DATE_TIME as DATETIME)
End as MODIFIED_DATE_TIME,
LAST_OPERATION_TYPE as OPERATION_TYPE,
case 
	when EFFECTIVE_START_DATE_TIME = CAST('0001-01-01 00:00:00'as DATETIME2)
	THEN CAST('2016-06-01 00:00:00' as DATETIME)
	ELSE CAST(EFFECTIVE_START_DATE_TIME as DATETIME)
End as EFFECTIVE_START_DATETIME,
case 
	when EFFECTIVE_END_DATE_TIME = CAST('0001-01-01 00:00:00'as DATETIME2)
	THEN CAST('2016-06-01 00:00:00' as DATETIME)
	ELSE CAST(EFFECTIVE_END_DATE_TIME as DATETIME)
End as EFFECTIVE_END_DATETIME,
0 as ENTITY_STATUS,
Amount,
ADDITIVE_BLEND_METHOD AS AdditiveBlendMethod,
ROOT_ID as RootId,
BLEND_CHEMICAL_ID AS BlendChemicalId,
BLEND_CHEMICAL_ID AS BlendChemicalSystemId,
IS_BASE_BLEND AS IsBaseBlend,
1 As MeasureUnitId, 
PARENT_ID AS BlendRecipe1Id,
PARENT_ID AS BlendRecipeSystemId,
ADDITION_METHOD AS AdditionMethod,
PARENT_ID AS ParentId
from Blend_Recipe_Chemical_Items where EFFECTIVE_END_DATE_TIME > GETDATE();