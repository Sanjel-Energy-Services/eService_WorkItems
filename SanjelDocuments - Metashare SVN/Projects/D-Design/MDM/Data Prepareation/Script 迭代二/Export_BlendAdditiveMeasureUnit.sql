select 
mu.id, 
mu.system_id, 
mu.version, 
mu.modified_user_id, 
mu.modified_user_name, 
mu.modified_datetime, 
mu.operation_type, 
mu.effective_start_datetime, 
mu.effective_end_datetime, 
mu.entity_status, 
0 as owner_id,
mu.Name,
mu.Description,
mus.Description as MeasureUnitSystemDescription, 
mut.Name as MeaureUnitTypeName,
mus.system_id as MeasureUnitSystemSystemId,
mus.Name as MeasureUnitSystemName,
mu.MeasureUnitSystemId,
mu.Abbreviation,
mut.Description as MeaureUnitTypeDescription,
mut.system_id as MeaureUnitTypeSystemId, 
mu.MeaureUnitTypeId
from MeasureUnit mu 
left join MeasureUnitType mut on mu.MeaureUnitTypeId=mut.id 
left join MeausreUnitSystem mus on mu.MeasureUnitSystemId=mus.id
where mu.MeaureUnitTypeId=7 and mu.MeasureUnitSystemId=1;