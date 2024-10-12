
ALTER TABLE [eservice6].[dbo].[RPT_UNIT_SCTNS] ADD [CREW_ID] int NULL ;
ALTER TABLE [eservice6].[dbo].[RPT_3RD_PARTY_UNIT_SCTNS] ADD [CREW_ID] int NULL ;

update [eservice6].[dbo].[COUNTRIES] set VERSION = VERSION + 1, LAST_MODIFIED_DATE_TIME = GETDATE(), EFFECTIVE_END_DATE_TIME = GETDATE() where id <>1;

--导入Country数据
insert into SanjelData.[dbo].Country(
id,
version,
name,
description,
ISOAlpha2,
ISOAlpha3,
ISONumber,
PercentFuelSurcharge,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
select 
ID as id, 
VERSION as version, 
NAME as name,
NAME as description,
ISO as ISOAlpha2,
ISO3 as ISOAlpha3,
NUMCODE as ISONumber,
SURCHARGE_PERCENT as PercentFuelSurcharge,
LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,
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
0 as owner_id
from Eservice6.dbo.COUNTRIES b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;

--导入ProvinceOrState数据

update [eservice6].[dbo].PROVINCE_STATES set VERSION = VERSION + 1, LAST_MODIFIED_DATE_TIME = GETDATE(), EFFECTIVE_END_DATE_TIME = GETDATE() where COUNTRY_ID <>1;

insert into SanjelData.[dbo].ProvinceOrState(
id,
version,
name,
description,
PercentSalesSurcharge,
Countryid,
Capital,
Code,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
select 
ID as id, 
VERSION as version, 
NAME as name,
NAME as description,
SURCHARGE_PERCENT as PercentFuelSurcharge,
COUNTRY_ID as Countryid,
CAPITAL as Capital,
CODE as Code,
LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,
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
0 as owner_id
from Eservice6.dbo.PROVINCE_STATES b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;

UPDATE SanjelData.[dbo].ProvinceOrState SET CountrySystemId = r.system_id,CountryName = r.name,CountryDescription = r.description FROM SanjelData.[dbo].ProvinceOrState u,(SELECT * FROM SanjelData.[dbo].Country) r WHERE u.Countryid=r.id;


-- Import UnitMainType data 
insert into SanjelData.[dbo].UnitMainType(
id,
name,
description,
version,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id)
select 
ID as id, 
DESCRIPTION as name, 
DESCRIPTION as description, 
VERSION as version, 
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
0 as owner_id
from Eservice6.dbo.VEHICLE_TYPES UMT where UMT.EFFECTIVE_END_DATE_TIME > GETDATE() ;

-- Import UnitSubType data 
insert into SanjelData.[dbo].UnitSubType(
id,
name,
description,
UnitMainTypeid,
version,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id)
select 
ID as id, 
VEHICLE_SUB_TYPE_NAME as name, 
VEHICLE_SUB_TYPE_NAME as description, 
VEHICLE_TYPE_ID as UnitMainTypeid, 
VERSION as version, 
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
0 as owner_id
from Eservice6.dbo.VEHICLE_SUB_TYPES UST where UST.EFFECTIVE_END_DATE_TIME > GETDATE() ;

UPDATE SanjelData.[dbo].UnitSubType SET UnitMainTypeSystemId = r.system_id,UnitMainTypeName = r.name,UnitMainTypeDescription = r.description FROM SanjelData.[dbo].UnitSubType u,(SELECT * FROM SanjelData.[dbo].UnitMainType) r WHERE u.UnitMainTypeid=r.id;

--导入ServiceLine数据
insert into SanjelData.[dbo].ServiceLine(
id,
version,
name,
description,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
select 
ID as id, 
VERSION as version, 
NAME as name,
DESCRIPTION as description,
LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,
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
0 as owner_id
from Eservice6.dbo.SERVICE_LINES b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;

-- Import ServicePoint data
insert into SanjelData.[dbo].ServicePoint(
id,
name,
version,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id)
select 
ID as id, 
NAME as name, 
VERSION as version, 
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
0 as owner_id
from Eservice6.dbo.SERVICE_POINTS OSP where OSP.EFFECTIVE_END_DATE_TIME > GETDATE() ;

--导入ShiftType数据
insert into SanjelData.[dbo].ShiftType(
id,
version,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id,
name,
description)
select 
TYPE_INDEX as ID, 
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
0 as owner_id,
DESCRIPTION as NAME,
DESCRIPTION as DESCRIPTION
from Eservice6.dbo.TYPE_VALUES where type_id = 104 and EFFECTIVE_END_DATE_TIME > GETDATE();

--导入ThreadType数据
insert into SanjelData.[dbo].ThreadType(
id,
version,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id,
name,
description)
select 
TYPE_INDEX as ID, 
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
0 as owner_id,
DESCRIPTION as NAME,
DESCRIPTION as DESCRIPTION
from Eservice6.dbo.TYPE_VALUES where type_id = 32 and EFFECTIVE_END_DATE_TIME > GETDATE();



--SanjelCompany
insert into SanjelData.[dbo].SanjelCompany(
id,
name,
version,
Countryid,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id)
select 
ID as id, 
NAME as name, 
VERSION as version, 
COUNTRY_ID as Countryid, 
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
0 as owner_id
from Eservice6.dbo.SANJEL_COMPANIES s where s.EFFECTIVE_END_DATE_TIME > GETDATE() ;


UPDATE SanjelData.[dbo].SanjelCompany SET CountrySystemId = r.system_id,CountryName = r.name,CountryDescription = r.description FROM SanjelData.[dbo].SanjelCompany u,(SELECT * FROM SanjelData.[dbo].Country) r WHERE u.Countryid=r.id;


--导入RigSize数据
SET IDENTITY_INSERT SanjelData.[dbo].[RigSize] ON
GO
INSERT INTO SanjelData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'1', N'1', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, null, null)
GO
GO
INSERT INTO SanjelData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'2', N'2', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'60.33', N'60.33', null, N'60.33')
GO
GO
INSERT INTO SanjelData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'3', N'3', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'73.0', N'73.0', null, N'73.0')
GO
GO
INSERT INTO SanjelData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'4', N'4', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'88.90', N'88.90', null, N'88.90')
GO
GO
INSERT INTO SanjelData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'5', N'5', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'114.30', N'114.30', null, N'114.30')
GO
GO
INSERT INTO SanjelData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'6', N'6', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'139.70', N'139.70', null, N'139.70')
GO
GO
INSERT INTO SanjelData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'7', N'7', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'177.80', N'177.80', null, N'177.80')
GO
GO
INSERT INTO SanjelData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'8', N'8', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'219.00', N'219.00', null, N'219.00')
GO
GO
INSERT INTO SanjelData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'9', N'9', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'244.50', N'244.50', null, N'244.50')
GO
GO
INSERT INTO SanjelData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'10', N'10', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'273.00', N'273.00', null, N'273.00')
GO
GO
INSERT INTO SanjelData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'11', N'11', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'298.50', N'298.50', null, N'298.50')
GO
GO
INSERT INTO SanjelData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'12', N'12', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'339.70', N'339.70', null, N'339.70')
GO
GO
INSERT INTO SanjelData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'13', N'13', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'406.40', N'406.40', null, N'406.40')
GO
GO
INSERT INTO SanjelData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'14', N'14', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'50.80', N'50.80', null, N'50.80')
GO
GO
INSERT INTO SanjelData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'15', N'15', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'76.20', N'76.20', null, N'76.20')
GO
GO
INSERT INTO SanjelData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'16', N'16', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'101.60', N'101.60', null, N'101.60')
GO
GO
INSERT INTO SanjelData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'17', N'17', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'193.70', N'193.70', null, N'193.70')
GO
GO
INSERT INTO SanjelData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'18', N'18', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'127.00', N'127.00', null, N'127.00')
GO
GO
INSERT INTO SanjelData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'19', N'19', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'168.28', N'168.28', null, N'168.28')
GO
GO
SET IDENTITY_INSERT SanjelData.[dbo].[RigSize] OFF
GO

--导入rigsizeType数据
insert into SanjelData.[dbo].RigSizeType(
id,
version,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id,
name,
description)
select 
TYPE_INDEX as ID, 
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
0 as owner_id,
DESCRIPTION as NAME,
DESCRIPTION as DESCRIPTION
from Eservice6.dbo.TYPE_VALUES where type_id = 56 and EFFECTIVE_END_DATE_TIME > GETDATE();


--导入BinType数据
insert into SanjelData.[dbo].BinType(
id,
version,
name,
description,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
select 
ID as id, 
VERSION as version, 
DESCRIPTION as name,
DESCRIPTION as  description,
LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,

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
0 as owner_id
from Eservice6.dbo.BIN_TYPES b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;

--导入BlendCategory数据
insert into SanjelData.[dbo].BlendCategory(
id,
version,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id,
name,
description)
select 
TYPE_INDEX as ID, 
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
0 as owner_id,
DESCRIPTION as NAME,
DESCRIPTION as DESCRIPTION
from Eservice6.dbo.TYPE_VALUES where type_id = 6 and DESCRIPTION is not null and EFFECTIVE_END_DATE_TIME > GETDATE();

insert into SanjelData.[dbo].BonusPosition(
id,
name,
description,
ServiceLineid,
version,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id)
select 
ID as id, 
DESCRIPTION as name, 
DESCRIPTION as description, 
SERVICE_LINE_ID as ServiceLineid, 
VERSION as version, 
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
0 as owner_id
from Eservice6.dbo.BONUS_POSITIONS BP where BP.EFFECTIVE_END_DATE_TIME > GETDATE() ;

UPDATE SanjelData.[dbo].BonusPosition SET ServiceLineSystemId = r.system_id,ServiceLineName = r.name,ServiceLineDescription = r.description FROM SanjelData.[dbo].BonusPosition u,(SELECT * FROM SanjelData.[dbo].ServiceLine) r WHERE u.ServiceLineid=r.id;


--导入ClientCompany数据
insert into SanjelData.[dbo].ClientCompany(
id,
version,
name,
description,
BillingAddressPostalCode,
BillingAddressProvinceOrStateid,
AddressCity,
BillingAddressStreet4,
BillingAddressStreet3,
AddressPostalCode,
ShortName,
BillingAddressStreet,
AddressStreet2,
SanjelCompanyid,
AddressStreet,
AddressStreet3,
BillingAddressStreet2,
AddressProvinceOrStateid,
IsCODCustomer,
BillingAddressCity,
AddressStreet4,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
SELECT 
ID AS id,
VERSION AS version,
NAME AS name,
NAME AS description,
BILLING_ADDRESS_POSTAL_ZIP AS BillingAddressPostalCode,
BILLING_ADDRESS_PROV_STATE_ID AS BillingAddressProvinceOrStateid,
ADDRESS_CITY AS AddressCity,
BILLING_ADDRESS_STREET4 AS BillingAddressStreet4,
BILLING_ADDRESS_STREET3 AS BillingAddressStreet3,
ADDRESS_POSTAL_ZIP AS AddressPostalCode,
SHORT_NAME AS ShortName,
BILLING_ADDRESS_STREET AS BillingAddressStreet,
ADDRESS_STREET2 AS AddressStreet2,
SANJEL_COMPANY_ID AS SanjelCompanyid,
ADDRESS_STREET AS AddressStreet,
ADDRESS_STREET3 AS AddressStreet3,
BILLING_ADDRESS_STREET2 AS BillingAddressStreet2,
ADDRESS_PROV_STATE_ID AS AddressProvinceOrStateid,
IS_COD_CUSTOMER AS IsCODCustomer,
BILLING_ADDRESS_CITY AS BillingAddressCity,
ADDRESS_STREET4 AS AddressStreet4,
LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,
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
0 as owner_id
FROM Eservice6.dbo.COMPANIES 
where Eservice6.dbo.COMPANIES.EFFECTIVE_END_DATE_TIME > GETDATE() AND ID IN
(SELECT COMPANY_ID FROM Eservice6.dbo.COMPANIES_WITH_TYPES WHERE TYPE_ID!=3);

UPDATE SanjelData.[dbo].ClientCompany SET BillingAddressProvinceOrStateSystemId = r.system_id,BillingAddressProvinceOrStateName = r.name,BillingAddressProvinceOrStateDescription = r.description FROM SanjelData.[dbo].ClientCompany u,(SELECT * FROM SanjelData.[dbo].ProvinceOrState) r WHERE u.BillingAddressProvinceOrStateid=r.id;
UPDATE SanjelData.[dbo].ClientCompany SET AddressProvinceOrStateSystemId = r.system_id,AddressProvinceOrStateName = r.name,AddressProvinceOrStateDescription = r.description FROM SanjelData.[dbo].ClientCompany u,(SELECT * FROM SanjelData.[dbo].ProvinceOrState) r WHERE u.AddressProvinceOrStateid=r.id;
UPDATE SanjelData.[dbo].ClientCompany SET SanjelCompanySystemId = r.system_id,SanjelCompanyName = r.name,SanjelCompanyDescription = r.description FROM SanjelData.[dbo].ClientCompany u,(SELECT * FROM SanjelData.[dbo].SanjelCompany) r WHERE u.SanjelCompanyid=r.id;


--导入ClientConsultant数据
insert into SanjelData.[dbo].ClientConsultant(
id,
version,
name,
description,
Phone2,
Email,
WorkShiftid,
WorkShiftName,
Cell,
Clientid,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
select 
ID as id, 
VERSION as version, 
NAME as name,
NAME as description,
PHONE2 as  Phone2,
EMAIL as  Email,
WORK_SHIFT_TYPE_ID as  WorkShiftid,
WORK_SHIFT_TYPE_NAME as  WorkShiftName,
CELL as  Cell,
CLIENT_ID  as Clientid,
LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,

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
0 as owner_id
from Eservice6.dbo.CLIENT_CONSULTANTS b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;

UPDATE SanjelData.[dbo].ClientConsultant SET WorkShiftSystemId = r.system_id,WorkShiftName = r.name,WorkShiftDescription = r.description FROM SanjelData.[dbo].ClientConsultant e,(SELECT * FROM SanjelData.[dbo].ShiftType) r WHERE e.WorkShiftid=r.id;


insert into SanjelData.[dbo].ContractorCompany(
id,
name,
description,
version,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id)
select 
ID as id, 
NAME as name, 
NAME as description, 
VERSION as version, 
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
0 as owner_id
from Eservice6.dbo.CONTRACTOR_COMPANIES c where c.EFFECTIVE_END_DATE_TIME > GETDATE() ;




SET IDENTITY_INSERT SanjelData.[dbo].[CrewPosition] ON
GO
INSERT INTO SanjelData.[dbo].[CrewPosition] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'0', N'0', N'Supervisor', N'Supervisor')
GO
GO
INSERT INTO SanjelData.[dbo].[CrewPosition] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'0', N'0', N'Crew Member', N'Crew Member')
GO
GO
SET IDENTITY_INSERT SanjelData.[dbo].[CrewPosition] OFF
GO

--导入bin数据
insert into SanjelData.[dbo].Bin(
id,
version,
description,
name,
BinTypeid,
HomeServicePointid,
WorkingServicePointid,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
select 
ID as id, 
VERSION as version, 
DESCRIPTION as description,
BIN_NUMBER as  name,
BIN_TYPE_ID as BinTypeid,
DISTRICT_ID as HomeServicePointid,
DISTRICT_ID as WorkingServicePointid,
LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,

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
0 as owner_id
from Eservice6.dbo.BINS b where b.EFFECTIVE_END_DATE_TIME > GETDATE();

UPDATE SanjelData.[dbo].Bin SET BinStatus=0 where BinStatus IS NULL;
UPDATE SanjelData.[dbo].Bin SET HomeServicePointSystemId = r.system_id,HomeServicePointName = r.name,HomeServicePointDescription = r.description FROM SanjelData.[dbo].Bin e,(SELECT * FROM SanjelData.[dbo].ServicePoint) r WHERE e.HomeServicePointid=r.id;
UPDATE SanjelData.[dbo].Bin SET WorkingServicePointSystemId = r.system_id,WorkingServicePointName = r.name,WorkingServicePointDescription = r.description FROM SanjelData.[dbo].Bin e,(SELECT * FROM SanjelData.[dbo].ServicePoint) r WHERE e.WorkingServicePointid=r.id;
UPDATE SanjelData.[dbo].Bin SET BinTypeSystemId = r.system_id,BinTypeName = r.name,BinTypeDescription = r.description FROM SanjelData.[dbo].Bin e,(SELECT * FROM SanjelData.[dbo].BinType) r WHERE e.BinTypeid=r.id;

-- Import CrewType data
SET IDENTITY_INSERT SanjelData.[dbo].[CrewType] ON
GO
INSERT INTO SanjelData.[dbo].[CrewType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'0', N'0', N'Pumper Crew', N'Pumper Crew')
GO
GO
INSERT INTO SanjelData.[dbo].[CrewType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'0', N'0', N'Bulker Crew', N'Bulker Crew')
GO
GO
INSERT INTO SanjelData.[dbo].[CrewType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'3', N'0', N'0', N'Third Party Bulker Crew', N'Third Party Bulker Crew')
GO
GO
INSERT INTO SanjelData.[dbo].[CrewType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'4', N'0', N'0', N'Spare Crew', N'Spare Crew')
GO
GO
SET IDENTITY_INSERT SanjelData.[dbo].[CrewType] OFF
GO

--导入DrillingCompany数据
insert into SanjelData.[dbo].DrillingCompany(
id,
version,
name,
description,
BillingAddressPostalCode,
BillingAddressProvinceOrStateid,
AddressCity,
BillingAddressStreet4,
BillingAddressStreet3,
AddressPostalCode,
ShortName,
BillingAddressStreet,
AddressStreet2,
SanjelCompanyid,
AddressStreet,
AddressStreet3,
BillingAddressStreet2,
AddressProvinceOrStateid,
IsCODCustomer,
BillingAddressCity,
AddressStreet4,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
SELECT 
ID AS id,
VERSION AS version,
NAME AS name,
NAME AS description,
BILLING_ADDRESS_POSTAL_ZIP AS BillingAddressPostalCode,
BILLING_ADDRESS_PROV_STATE_ID AS BillingAddressProvinceOrStateid,
ADDRESS_CITY AS AddressCity,
BILLING_ADDRESS_STREET4 AS BillingAddressStreet4,
BILLING_ADDRESS_STREET3 AS BillingAddressStreet3,
ADDRESS_POSTAL_ZIP AS AddressPostalCode,
SHORT_NAME AS ShortName,
BILLING_ADDRESS_STREET AS BillingAddressStreet,
ADDRESS_STREET2 AS AddressStreet2,
SANJEL_COMPANY_ID AS SanjelCompanyid,
ADDRESS_STREET AS AddressStreet,
ADDRESS_STREET3 AS AddressStreet3,
BILLING_ADDRESS_STREET2 AS BillingAddressStreet2,
ADDRESS_PROV_STATE_ID AS AddressProvinceOrStateid,
IS_COD_CUSTOMER AS IsCODCustomer,
BILLING_ADDRESS_CITY AS BillingAddressCity,
ADDRESS_STREET4 AS AddressStreet4,
LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,
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
0 as owner_id
FROM Eservice6.dbo.COMPANIES 
where Eservice6.dbo.COMPANIES.EFFECTIVE_END_DATE_TIME > GETDATE() AND ID IN
(SELECT COMPANY_ID FROM Eservice6.dbo.COMPANIES_WITH_TYPES WHERE TYPE_ID=3);

UPDATE SanjelData.[dbo].DrillingCompany SET BillingAddressProvinceOrStateSystemId = r.system_id,BillingAddressProvinceOrStateName = r.name,BillingAddressProvinceOrStateDescription = r.description FROM SanjelData.[dbo].DrillingCompany u,(SELECT * FROM SanjelData.[dbo].ProvinceOrState) r WHERE u.BillingAddressProvinceOrStateid=r.id;
UPDATE SanjelData.[dbo].DrillingCompany SET AddressProvinceOrStateSystemId = r.system_id,AddressProvinceOrStateName = r.name,AddressProvinceOrStateDescription = r.description FROM SanjelData.[dbo].DrillingCompany u,(SELECT * FROM SanjelData.[dbo].ProvinceOrState) r WHERE u.AddressProvinceOrStateid=r.id;
UPDATE SanjelData.[dbo].DrillingCompany SET SanjelCompanySystemId = r.system_id,SanjelCompanyName = r.name,SanjelCompanyDescription = r.description FROM SanjelData.[dbo].DrillingCompany u,(SELECT * FROM SanjelData.[dbo].SanjelCompany) r WHERE u.SanjelCompanyid=r.id;


-- Import TruckUnit data 
insert into SanjelData.[dbo].TruckUnit(
id,
UnitNumber,
ServicePointId,
UnitMainTypeid,
UnitSubtypeid,
version,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id)
select 
ID as id, 
UNIT_NUMBER as UnitNumber, 
DISTRICT_ID as ServicePointId, 
UNIT_MAIN_TYPE_ID as UnitMainTypeid, 
UNIT_SUB_TYPE_ID as  UnitSubtypeid, 
VERSION as version, 
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
0 as owner_id
from Eservice6.dbo.TRUCK_UNITS OSP where OSP.EFFECTIVE_END_DATE_TIME > GETDATE() ;

UPDATE SanjelData.[dbo].TruckUnit SET UnitMainTypeSystemId = r.system_id,UnitMainTypeName = r.name,UnitMainTypeDescription = r.description FROM SanjelData.[dbo].TruckUnit t,(SELECT * FROM SanjelData.[dbo].UnitMainType) r WHERE t.UnitMainTypeid=r.id;
UPDATE SanjelData.[dbo].TruckUnit SET UnitSubTypeSystemId = r.system_id,UnitSubTypeName = r.name,UnitSubTypeDescription = r.description FROM SanjelData.[dbo].TruckUnit t,(SELECT * FROM SanjelData.[dbo].UnitSubType) r WHERE t.UnitSubTypeid=r.id;
UPDATE SanjelData.[dbo].TruckUnit SET ServicePointSystemId = r.system_id,ServicePointName = r.name,ServicePointDescription = r.description FROM SanjelData.[dbo].TruckUnit t,(SELECT * FROM SanjelData.[dbo].ServicePoint) r WHERE t.ServicePointid=r.id;

-- Import Employee data
insert into SanjelData.[dbo].Employee(
id,
FirstName,
MiddleName,
LastName,
EmployeeNumber,
ServicePointId,
ServiceLineid,
BonusPositionid,
PreferedFirstName,
version,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id)
select 
ID as id, 
FIRST_NAME as FirstName, 
MIDDLE_NAME as MiddleName, 
LAST_NAME as LastName, 
EMPLOYEE_NUMBER as  EmployeeNumber,
DISTRICT_ID as ServicePointId, 
SERVICE_LINE_ID as ServiceLineid,
DEFAULT_BONUS_POSITION_ID as BonusPositionid,
PREFER_FIRST_NAME as  PreferedFirstName, 
VERSION as version, 
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
0 as owner_id
from Eservice6.dbo.EMPLOYEES OSP where OSP.EFFECTIVE_END_DATE_TIME > GETDATE() ;

UPDATE SanjelData.[dbo].Employee SET BonusPositionid = 0 WHERE BonusPositionid is NULL;
UPDATE SanjelData.[dbo].Employee SET BonusPositionSystemId = r.system_id,BonusPositionName = r.name,BonusPositionDescription = r.description FROM SanjelData.[dbo].Employee e,(SELECT * FROM SanjelData.[dbo].BonusPosition) r WHERE e.BonusPositionid=r.ID;
UPDATE SanjelData.[dbo].Employee SET ServicePointSystemId = r.system_id,ServicePointName = r.name,ServicePointDescription = r.description FROM SanjelData.[dbo].Employee e,(SELECT * FROM SanjelData.[dbo].ServicePoint) r WHERE e.ServicePointid=r.ID;
UPDATE SanjelData.[dbo].Employee SET ServiceLineSystemId = r.system_id,ServiceLineName = r.name,ServiceLineDescription = r.description FROM SanjelData.[dbo].Employee e,(SELECT * FROM SanjelData.[dbo].ServiceLine) r WHERE e.ServiceLineid=r.ID;


--导入WellLocationType数据
SET IDENTITY_INSERT SanjelData.[dbo].[WellLocationType] ON
GO
INSERT INTO SanjelData.[dbo].[WellLocationType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'1', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'General', N'General')
GO
GO
INSERT INTO SanjelData.[dbo].[WellLocationType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'2', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'Geo', N'Geo')
GO
GO
INSERT INTO SanjelData.[dbo].[WellLocationType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'3', N'3', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'Torrent', N'Torrent')
GO
GO
INSERT INTO SanjelData.[dbo].[WellLocationType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'4', N'4', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'Usa', N'Usa')
GO
GO
INSERT INTO SanjelData.[dbo].[WellLocationType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'5', N'5', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'NTS', N'NTS')
GO
GO
SET IDENTITY_INSERT SanjelData.[dbo].[WellLocationType] OFF
GO

SET IDENTITY_INSERT SanjelData.[dbo].[BlendAdditiveMeasureUnit] ON
GO
INSERT INTO SanjelData.[dbo].[BlendAdditiveMeasureUnit] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [MeaureUnitTypeName], [Abbreviation], [MeaureUnitTypeDescription], [MeaureUnitTypeSystemId], [MeasureUnitSystemDescription], [MeasureUnitSystemId], [MeasureUnitSystemSystemId], [MeaureUnitTypeId], [MeasureUnitSystemName]) VALUES (N'5', N'13', N'1', N'0', N'', N'2008-03-20 15:21:11.0000000', null, N'2016-06-01 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Kilograms', N'', N'Weight', N'kg', N'', N'28', N'', N'1', N'5', N'2', N'Metric')
GO
GO
INSERT INTO SanjelData.[dbo].[BlendAdditiveMeasureUnit] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [MeaureUnitTypeName], [Abbreviation], [MeaureUnitTypeDescription], [MeaureUnitTypeSystemId], [MeasureUnitSystemDescription], [MeasureUnitSystemId], [MeasureUnitSystemSystemId], [MeaureUnitTypeId], [MeasureUnitSystemName]) VALUES (N'6', N'14', N'1', N'0', N'', N'2008-03-20 15:21:11.0000000', null, N'2016-06-01 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Liters', N'', N'Volume', N'l', N'', N'29', N'', N'1', N'5', N'3', N'Metric')
GO
GO
SET IDENTITY_INSERT SanjelData.[dbo].[BlendAdditiveMeasureUnit] OFF
GO

--导入jobType数据
insert into SanjelData.[dbo].jobType(
id,
version,
name,
description,
ServiceLineid,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
select 
ID as id, 
VERSION as version, 
NAME as name,
DESCRIPTION as description,
SERVICE_LINE_ID as ServiceLineid,
LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,
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
0 as owner_id
from Eservice6.dbo.JOB_TYPES b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;

UPDATE SanjelData.[dbo].jobType SET ServiceLineSystemId = r.system_id,ServiceLineName = r.name,ServiceLineDescription = r.description FROM SanjelData.[dbo].jobType e,(SELECT * FROM SanjelData.[dbo].ServiceLine) r WHERE e.ServiceLineid=r.ID;


--导入productHaul数据
insert into SanjelData.dbo.productHaul(
id,
version,
Comments,
Driverid,
Driver2id,
BulkUnitid,
TractorUnitid,
IsThirdParty,
ContractorCompanyid,
ContractorCompanyName,
ThirdPartyUnitNumber,
SupplierContactName,
SupplierContactNumber,
IsGoWithCrew,
ProductHaulLifeStatus,
Crewid,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
select 
ID as id, 
VERSION as version, 
COMMENTS as Comments,
DRIVER_ID as Driverid,
DRIVER2_ID as Driver2id,
BULK_UNIT_ID as BulkUnitid,
TRACTOR_UNIT_ID as TractorUnitid,
IS_THIRD_PARTY as IsThirdParty,
SUPPLIER_COMPANY_ID as ContractorCompanyid,
SUPPLIER_COMPANY_NAME as ContractorCompanyName,
THIRD_PARTY_UNIT_NUMBER as ThirdPartyUnitNumber,
SUPPLIER_CONTACT_NAME as SupplierContactName,
SUPPLIER_CONTACT_NUMBER as SupplierContactNumber,
IS_GO_WITH_CREW as IsGoWithCrew,
PRODUCT_HAUL_LIFE_STATUS as ProductHaulLifeStatus,
CREW_ID as Crewid,
LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,
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
0 as owner_id
from Eservice6.dbo.PRODUCT_HAUL b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;


--导入ProductHaulLoad数据
insert into SanjelData.[dbo].ProductHaulLoad(
id,
version,
ExpectedOnLocationTime,
JobDate,
CallSheetNumber,
IsGoWithCrew,
ServicePointid,
JobTypeid,
BinName,
Binid,
BlendChemicalid,
IsTotalBlendTonnage,
OnLocationTime,
Comments,
ProductHaulLoadLifeStatus,
ProductHaulid,
LoadSheetSerialNumber,
TotalBlendWeight,
BaseBlendWeight,
BlendCategoryid,
BlendSectionId,
WellLocation,
Customerid,
MixWater,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
select 
ID as id, 
VERSION as version, 
EXPECTED_ON_LOCATION_TIME as ExpectedOnLocationTime,
JOB_DATE as JobDate,
CALL_SHEET_NUMBER as CallSheetNumber,
IS_GO_WITH_CREW as IsGoWithCrew,
SERVICE_POINT_ID as ServicePointid,
JOB_TYPE_ID as JobTypeid,
BIN_NUMBER as BinName,
BIN_ID as Binid,
BASE_BLEND_CHEMICAL_ID  as BlendChemicalid,
IS_TOTAL_BLEND_TONNAGE as IsTotalBlendTonnage,
ON_LOCATION_TIME as OnLocationTime,
COMMENTS as Comments,
PRODUCT_HAUL_LOAD_LIFE_STATUS as ProductHaulLoadLifeStatus,
ROOT_ID as ProductHaulid,
LOAD_SHEET_SERIAL_NUMBER as LoadSheetSerialNumber,
TOTAL_BLEND_WEIGHT as TotalBlendWeight,
BASE_BLEND_WEIGHT as BaseBlendWeight,
BLEND_CATEGORY_ID as BlendCategoryid,
BLEND_SECTION_ID as BlendSectionId,
WELL_LOCATION as WellLocation,
CUSTOMER_COMPANY_ID as Customerid,
MIX_WATER as MixWater,

LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,
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
ROOT_ID as owner_id
from Eservice6.dbo.PH_PRODUCT_HAUL_LOAD_SCTNS b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;

UPDATE SanjelData.[dbo].ProductHaulLoad SET ProductHaulLoadLifeStatus = 0 WHERE ProductHaulLoadLifeStatus IS NULL;
UPDATE SanjelData.[dbo].ProductHaulLoad SET ServicePointSystemId = r.system_id,ServicePointName = r.name,ServicePointDescription = r.description FROM SanjelData.[dbo].ProductHaulLoad e,(SELECT * FROM SanjelData.[dbo].ServicePoint) r WHERE e.ServicePointid=r.id;
UPDATE SanjelData.[dbo].ProductHaulLoad SET BlendChemicalSystemId = r.system_id,BlendChemicalName = r.name,BlendChemicalDescription = r.description FROM SanjelData.[dbo].ProductHaulLoad e,(SELECT * FROM SanjelData.[dbo].BlendChemical) r WHERE e.BlendChemicalid=r.id;
UPDATE SanjelData.[dbo].ProductHaulLoad SET ProductHaulSystemId = r.system_id,ProductHaulName = r.name,ProductHaulDescription = r.description FROM SanjelData.[dbo].ProductHaulLoad e,(SELECT * FROM SanjelData.[dbo].ProductHaul) r WHERE e.ProductHaulid=r.id;
UPDATE SanjelData.[dbo].ProductHaulLoad SET BlendCategorySystemId = r.system_id,BlendCategoryName = r.name,BlendCategoryDescription = r.description FROM SanjelData.[dbo].ProductHaulLoad e,(SELECT * FROM SanjelData.[dbo].BlendCategory) r WHERE e.BlendCategoryid=r.id;
UPDATE SanjelData.[dbo].ProductHaulLoad SET CustomerSystemId = r.system_id,CustomerName = r.name,CustomerDescription = r.description FROM SanjelData.[dbo].ProductHaulLoad e,(SELECT * FROM SanjelData.[dbo].ClientCompany) r WHERE e.Customerid=r.id;
UPDATE SanjelData.[dbo].ProductHaulLoad SET JobTypeSystemId = r.system_id,JobTypeName = r.name,JobTypeDescription = r.description FROM SanjelData.[dbo].ProductHaulLoad e,(SELECT * FROM SanjelData.[dbo].JobType) r WHERE e.JobTypeid=r.id;
UPDATE SanjelData.[dbo].ProductHaulLoad SET BinSystemId = r.system_id,BinName = r.name,BinDescription = r.description FROM SanjelData.[dbo].ProductHaulLoad e,(SELECT * FROM SanjelData.[dbo].Bin) r WHERE e.Binid=r.id;

--导入ProductLoadSection数据
insert into SanjelData.[dbo].ProductLoadSection(
id,
RequiredAmount,
BlendAdditiveMeasureUnitid,
BagSize,
BlendChemicalid,
AdditiveBlendMethodid,
IsFromBase,
NumberOfBags,
LoadedAmount,
ProductHaulLoadid,
entity_status,
owner_id
)
select 
ID as id, 
REQUIRED_AMOUNT as RequiredAmount, 
5 as BlendAdditiveMeasureUnitid, 
BAG_SIZE as BagSize, 
BLEND_CHEMICAL_ID as BlendChemicalid, 
ADDITIVE_BLEND_METHOD as AdditiveBlendMethodid, 
IS_FROM_BASE as IsFromBase, 
NUMBER_OF_BAGS as NumberOfBags, 
LOADED_AMOUNT as LoadedAmount, 
PARENT_ID as ProductHaulLoadid, 
0 as ENTITY_STATUS,
ROOT_ID as owner_id
from Eservice6.dbo.PH_PRODUCT_LOAD_SCTNS;

UPDATE SanjelData.[dbo].ProductLoadSection SET BlendAdditiveMeasureUnitSystemId = r.system_id,BlendAdditiveMeasureUnitName = r.name,BlendAdditiveMeasureUnitDescription = r.description FROM SanjelData.[dbo].ProductLoadSection e,(SELECT * FROM SanjelData.[dbo].BlendAdditiveMeasureUnit) r WHERE e.BlendAdditiveMeasureUnitid=r.id;
UPDATE SanjelData.[dbo].ProductLoadSection SET BlendChemicalSystemId = r.system_id,BlendChemicalName = r.name,BlendChemicalDescription = r.description FROM SanjelData.[dbo].ProductLoadSection e,(SELECT * FROM SanjelData.[dbo].BlendChemical) r WHERE e.BlendChemicalid=r.id;
UPDATE SanjelData.[dbo].ProductLoadSection SET AdditiveBlendMethodSystemId = r.system_id,AdditiveBlendMethodName = r.name,AdditiveBlendMethodDescription = r.description FROM SanjelData.[dbo].ProductLoadSection e,(SELECT * FROM SanjelData.[dbo].AdditiveBlendMethod) r WHERE e.AdditiveBlendMethodid=r.id;
UPDATE SanjelData.[dbo].ProductLoadSection SET ProductHaulLoadSystemId = r.system_id,ProductHaulLoadName = r.name,ProductHaulLoadDescription = r.description FROM SanjelData.[dbo].ProductLoadSection e,(SELECT * FROM SanjelData.[dbo].ProductHaulLoad) r WHERE e.ProductHaulLoadid=r.id;
UPDATE SanjelData.[dbo].ProductLoadSection SET version=1,modified_user_id=0,operation_type=1;
UPDATE SanjelData.[dbo].ProductLoadSection SET modified_datetime = r.modified_datetime,effective_start_datetime = r.effective_start_datetime,effective_end_datetime = r.effective_end_datetime FROM SanjelData.[dbo].ProductLoadSection e,(SELECT * FROM SanjelData.[dbo].ProductHaulLoad) r WHERE e.ProductHaulLoadid=r.id;

--导入Rig数据
insert into SanjelData.[dbo].Rig(
id,
version,
name,
description,
DrillingCompanyid,
DrillingCompanyName,
ThreadTypeid,
IsServiceRig,
RigNumber,
IsProjectRig,
IsDeleted,
IsTopDrive,
RigSizeid,
ThreadTypeName,
Sizeid,
RigSizeName,
SizeName,
Status,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
select 
ID as id, 
VERSION as version, 
NAME as name,
NAME as description,
DRILLINGCOMPANY_ID as DrillingCompanyid,
DRILLINGCOMPANY_NAME as DrillingCompanyName,
THREAD_TYPE_ID as ThreadTypeid,
IS_SERVICE_RIG as IsServiceRig,
RIG_NO as RigNumber,
IS_PROJECT_RIG as IsProjectRig,
IS_DELETED as IsDeleted,
IS_TOP_DRIVE as IsTopDrive,
RIG_SIZE_TYPE_ID as RigSizeid,
THREAD_TYPE_NAME as ThreadTypeName,
0 as Sizeid,
RIG_SIZE_TYPE_NAME RigSizeName,
null as SizeName,
STATUS as Status,
LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,
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
0 as owner_id
from Eservice6.dbo.RIGS b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;

UPDATE SanjelData.[dbo].Rig SET DrillingCompanySystemId = r.system_id,DrillingCompanyName = r.name,DrillingCompanyDescription = r.description FROM SanjelData.[dbo].Rig e,(SELECT * FROM SanjelData.[dbo].DrillingCompany) r WHERE e.DrillingCompanyid=r.id;
UPDATE SanjelData.[dbo].Rig SET ThreadTypeSystemId = r.system_id,ThreadTypeName = r.name,ThreadTypeDescription = r.description FROM SanjelData.[dbo].Rig e,(SELECT * FROM SanjelData.[dbo].ThreadType) r WHERE e.ThreadTypeid=r.id;
UPDATE SanjelData.[dbo].Rig SET RigSizeSystemId = r.system_id,RigSizeName = r.name,RigSizeDescription = r.description FROM SanjelData.[dbo].Rig e,(SELECT * FROM SanjelData.[dbo].RigSizeType) r WHERE e.RigSizeid=r.id;
UPDATE SanjelData.[dbo].Rig SET SizeName = r.SIZE_TYPE_VALUE FROM SanjelData.[dbo].Rig e,(SELECT * FROM Eservice6.dbo.RIGS) r WHERE e.id=r.ID;
UPDATE SanjelData.[dbo].Rig SET SizeSystemId = r.system_id,Sizeid = r.id,SizeDescription = r.description FROM SanjelData.[dbo].Rig e,(SELECT * FROM SanjelData.[dbo].RigSize) r WHERE e.SizeName=r.value;


insert into SanjelData.[dbo].RigBinSection(
id,
Binid,
BinName,
Rigid,
RigName,
entity_status,
owner_id
)
select 
ID as id, 
BIN_ID as Binid, 
BIN_NUMBER as BinName,
RIG_ID as  Rigid,
RIG_NAME as RigName,
0 as ENTITY_STATUS,
0 as owner_id
from Eservice6.dbo.BIN_ASSIGNMENT b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;

UPDATE SanjelData.dbo.RigBinSection SET version=1,modified_user_id=0,modified_datetime=GETDATE() ,effective_start_datetime=GETDATE() ,effective_end_datetime=N'9999-12-31 23:59:59.9970000',operation_type=1;

UPDATE SanjelData.[dbo].RigBinSection SET BinSystemId = r.system_id,BinName = r.name,BinDescription = r.description FROM SanjelData.[dbo].RigBinSection e,(SELECT * FROM SanjelData.[dbo].Bin) r WHERE e.Binid=r.id;
UPDATE SanjelData.[dbo].RigBinSection SET RigSystemId = r.system_id,RigName = r.name,RigDescription = r.description FROM SanjelData.[dbo].RigBinSection e,(SELECT * FROM SanjelData.[dbo].Rig) r WHERE e.Rigid=r.id;

--导入rigJob数据

update Eservice6.dbo.RIG_JOB set EFFECTIVE_END_DATE_TIME = GETDATE() where IS_LISTED = 0 and JOB_DATE_TIME < GETDATE();


insert into SanjelData.[dbo].RigJob(
id,
version,
JobLifeStatus,
Rigid,
Directions,
IsListed,
Notes,
IsDownholeLocation,
ClientConsultant2id,
IsNeedBins,
JobAlertId,
IsHighProfile,
JobDateTime,
ServicePointid,
WellLocationTypeid,
CallSheetId,
CallSheetNumber,
IsCoDCleared,
ProgramId,
SurfaceLocation,
WellLocation,
JobUniqueId,
ClientConsultant1id,
JobTypeid,
ClientCompanyid,
IsServiceRig,
IsProjectRig,
RigStatus,
ClientCompanyShortName,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
select 
ID as id, 
VERSION as version, 
JOB_LIFE_STATUS as JobLifeStatus,
RIG_ID as Rigid,
DIRECTION as Directions,
IS_LISTED as IsListed,
NOTES as Notes,
IS_DOWNHOLE_LOCATION as IsDownholeLocation,
CLIENT_CONSULTANT2_ID as ClientConsultant2id,
IS_NEED_BIN as IsNeedBins,
JOB_ALERT_ID as JobAlertId,
IS_HIGH_PROFILE_JOB as IsHighProfile,
JOB_DATE_TIME as JobDateTime,
SERVICE_POINT_ID as ServicePointid,
WELL_LOCATION_TYPE_ID as WellLocationTypeid,
CALL_SHEET_ID as CallSheetId,
CALL_SHEET_NUMBER as CallSheetNumber,
IS_COD_CLEARED as IsCoDCleared,
PROGRAM_ID as ProgramId,
SURFACE_LOCATION as SurfaceLocation,
WELL_LOCATION as WellLocation,
JOB_UNIQUE_ID as JobUniqueId,
CLIENT_CONSULTANT1_ID  as ClientConsultant1id,
JOB_TYPE_ID as JobTypeid,
CLIENT_COMPANY_ID as ClientCompanyid,
IS_SERVICE_RIG as IsServiceRig,
IS_PROJECT_RIG as IsProjectRig,
RIG_STATUS as RigStatus,
CLIENT_COMPANY_SHORTNAME as ClientCompanyShortName,
LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,

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
0 as owner_id
from Eservice6.dbo.RIG_JOB b;

UPDATE SanjelData.[dbo].RigJob SET JobTypeSystemId = r.system_id,JobTypeName = r.name,JobTypeDescription = r.description FROM SanjelData.[dbo].RigJob e,(SELECT * FROM SanjelData.[dbo].JobType) r WHERE e.JobTypeid=r.id;
UPDATE SanjelData.[dbo].RigJob SET ClientConsultant1SystemId = r.system_id,ClientConsultant1Name = r.name,ClientConsultant1Description = r.description FROM SanjelData.[dbo].RigJob e,(SELECT * FROM SanjelData.[dbo].ClientConsultant) r WHERE e.ClientConsultant1id=r.id;
UPDATE SanjelData.[dbo].RigJob SET ClientConsultant2SystemId = r.system_id,ClientConsultant2Name = r.name,ClientConsultant2Description = r.description FROM SanjelData.[dbo].RigJob e,(SELECT * FROM SanjelData.[dbo].ClientConsultant) r WHERE e.ClientConsultant2id=r.id;
UPDATE SanjelData.[dbo].RigJob SET WellLocationTypeSystemId = r.system_id,WellLocationTypeName = r.name,WellLocationTypeDescription = r.description FROM SanjelData.[dbo].RigJob e,(SELECT * FROM SanjelData.[dbo].WellLocationType) r WHERE e.WellLocationTypeid=r.id;
UPDATE SanjelData.[dbo].RigJob SET ClientCompanySystemId = r.system_id,ClientCompanyName = r.name,ClientCompanyDescription = r.description FROM SanjelData.[dbo].RigJob e,(SELECT * FROM SanjelData.[dbo].ClientCompany) r WHERE e.ClientCompanyid=r.id;
UPDATE SanjelData.[dbo].RigJob SET RigSystemId = r.system_id,RigName = r.name,RigDescription = r.description FROM SanjelData.[dbo].RigJob e,(SELECT * FROM SanjelData.[dbo].Rig) r WHERE e.Rigid=r.id;
UPDATE SanjelData.[dbo].RigJob SET ServicePointSystemId = r.system_id,ServicePointName = r.name,ServicePointDescription = r.description FROM SanjelData.[dbo].RigJob e,(SELECT * FROM SanjelData.[dbo].ServicePoint) r WHERE e.ServicePointid=r.id;
UPDATE SanjelData.[dbo].RigJob SET RigStatus=0 WHERE RigStatus IS NULL AND JobLifeStatus != 1;

-- Make all previous completed job product haul as on location

UPDATE SanjelData.dbo.ProductHaulLoad SET ProductHaulLoadLifeStatus=2 
 FROM SanjelData.dbo.ProductHaulLoad p,(SELECT id,CallSheetNumber,JobLifeStatus FROM RigJob WHERE JobLifeStatus=8) r WHERE p.CallSheetNumber=r.CallSheetNumber;


Update ProductHaul set ProductHaulLifeStatus = 4 where id in (
select distinct ProductHaulid from ProductHaulLoad where ProductHaulid in 
(
select ProductHaulid from ProductHaulLoad group by ProductHaulid having count(distinct ProductHaulLoadLifeStatus) = 1
)
and ProductHaulLoadLifeStatus = 2
)
;
  
--UPDATE SanjelData.[dbo].productHaul SET ProductHaulLifeStatusSystemId = r.system_id,ProductHaulLifeStatusName = r.name,ProductHaulLifeStatusDescription = r.description
-- FROM SanjelData.[dbo].productHaul e,(SELECT * FROM SanjelData.[dbo].ProductHaulStatus) r WHERE e.ProductHaulLifeStatusid=r.id;


-- Import SanjelCrew test data
SET IDENTITY_INSERT SanjelData.[dbo].[SanjelCrew] ON
GO
INSERT INTO SanjelData.[dbo].[SanjelCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Notes], [WorkingServicePointid], [HomeServicePointDescription], [WorkingServicePointDescription], [HomeServicePointid], [WorkingServicePointSystemId], [HomeServicePointName], [WorkingServicePointName], [HomeServicePointSystemId], [Typeid]) VALUES (N'1', N'1', N'1', N'0', null, N'2019-04-16 15:41:15.1170000', N'1', N'2019-04-16 15:41:15.1130000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, N'test data', N'61', null, null, N'61', N'1', N'Lloydminster', N'Lloydminster', N'1', N'1');
--INSERT INTO SanjelData.[dbo].[SanjelCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Notes], [WorkingServicePointid], [HomeServicePointDescription], [WorkingServicePointDescription], [HomeServicePointid], [WorkingServicePointSystemId], [HomeServicePointName], [WorkingServicePointName], [HomeServicePointSystemId], [Typeid]) VALUES (N'2', N'2', N'1', null, null, N'2019-04-16 15:41:15.1170000', N'1', N'2019-04-16 15:41:15.1130000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, N'test data', N'65', null, null, N'65', N'3', N'Lac La Biche', N'Lac La Biche', N'3', N'1');
--INSERT INTO SanjelData.[dbo].[SanjelCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Notes], [WorkingServicePointid], [HomeServicePointDescription], [WorkingServicePointDescription], [HomeServicePointid], [WorkingServicePointSystemId], [HomeServicePointName], [WorkingServicePointName], [HomeServicePointSystemId], [Typeid]) VALUES (N'3', N'3', N'1', null, null, N'2019-04-16 15:41:15.1170000', N'1', N'2019-04-16 15:41:15.1130000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, N'test data', N'66', null, null, N'66', N'4', N'Fort St. John', N'Fort St. John', N'4', N'1');
--INSERT INTO SanjelData.[dbo].[SanjelCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Notes], [WorkingServicePointid], [HomeServicePointDescription], [WorkingServicePointDescription], [HomeServicePointid], [WorkingServicePointSystemId], [HomeServicePointName], [WorkingServicePointName], [HomeServicePointSystemId], [Typeid]) VALUES (N'4', N'4', N'1', null, null, N'2019-04-16 15:41:15.1170000', N'1', N'2019-04-16 15:41:15.1130000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, N'test data', N'67', null, null, N'67', N'5', N'Edmonton', N'Edmonton', N'5', N'1');
--INSERT INTO SanjelData.[dbo].[SanjelCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Notes], [WorkingServicePointid], [HomeServicePointDescription], [WorkingServicePointDescription], [HomeServicePointid], [WorkingServicePointSystemId], [HomeServicePointName], [WorkingServicePointName], [HomeServicePointSystemId], [Typeid]) VALUES (N'5', N'5', N'1', null, null, N'2019-04-16 15:41:15.1170000', N'1', N'2019-04-16 15:41:15.1130000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, N'test data', N'69', null, null, N'69', N'6', N'Brooks', N'Brooks', N'6', N'1');
--INSERT INTO SanjelData.[dbo].[SanjelCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Notes], [WorkingServicePointid], [HomeServicePointDescription], [WorkingServicePointDescription], [HomeServicePointid], [WorkingServicePointSystemId], [HomeServicePointName], [WorkingServicePointName], [HomeServicePointSystemId], [Typeid]) VALUES (N'6', N'6', N'1', null, null, N'2019-04-16 15:41:15.1170000', N'1', N'2019-04-16 15:41:15.1130000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, N'test data', N'70', null, null, N'70', N'7', N'Swift Current', N'Swift Current', N'7', N'1');
--INSERT INTO SanjelData.[dbo].[SanjelCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Notes], [WorkingServicePointid], [HomeServicePointDescription], [WorkingServicePointDescription], [HomeServicePointid], [WorkingServicePointSystemId], [HomeServicePointName], [WorkingServicePointName], [HomeServicePointSystemId], [Typeid]) VALUES (N'7', N'7', N'1', null, null, N'2019-04-16 15:41:15.1170000', N'1', N'2019-04-16 15:41:15.1130000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, N'test data', N'71', null, null, N'71', N'8', N'Grande Prairie', N'Grande Prairie', N'8', N'1');
--INSERT INTO SanjelData.[dbo].[SanjelCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Notes], [WorkingServicePointid], [HomeServicePointDescription], [WorkingServicePointDescription], [HomeServicePointid], [WorkingServicePointSystemId], [HomeServicePointName], [WorkingServicePointName], [HomeServicePointSystemId], [Typeid]) VALUES (N'8', N'8', N'1', null, null, N'2019-04-16 15:41:15.1170000', N'1', N'2019-04-16 15:41:15.1130000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, N'test data', N'72', null, null, N'72', N'9', N'Estevan', N'Estevan', N'9', N'1');
--INSERT INTO SanjelData.[dbo].[SanjelCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Notes], [WorkingServicePointid], [HomeServicePointDescription], [WorkingServicePointDescription], [HomeServicePointid], [WorkingServicePointSystemId], [HomeServicePointName], [WorkingServicePointName], [HomeServicePointSystemId], [Typeid]) VALUES (N'9', N'9', N'1', null, null, N'2019-04-16 15:41:15.1170000', N'1', N'2019-04-16 15:41:15.1130000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, N'test data', N'81', null, null, N'81', N'10', N'Edson', N'Edson', N'10', N'1');
--INSERT INTO SanjelData.[dbo].[SanjelCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Notes], [WorkingServicePointid], [HomeServicePointDescription], [WorkingServicePointDescription], [HomeServicePointid], [WorkingServicePointSystemId], [HomeServicePointName], [WorkingServicePointName], [HomeServicePointSystemId], [Typeid]) VALUES (N'10', N'10', N'1', null, null, N'2019-04-16 15:41:15.1170000', N'1', N'2019-04-16 15:41:15.1130000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, N'test data', N'85', null, null, N'85', N'11', N'Red Deer', N'Red Deer', N'11', N'1');
--INSERT INTO SanjelData.[dbo].[SanjelCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Notes], [WorkingServicePointid], [HomeServicePointDescription], [WorkingServicePointDescription], [HomeServicePointid], [WorkingServicePointSystemId], [HomeServicePointName], [WorkingServicePointName], [HomeServicePointSystemId], [Typeid]) VALUES (N'11', N'11', N'1', null, null, N'2019-04-16 15:41:15.1170000', N'1', N'2019-04-16 15:41:15.1130000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, N'test data', N'88', null, null, N'88', N'12', N'Kindersley', N'Kindersley', N'12', N'1');
GO
SET IDENTITY_INSERT SanjelData.[dbo].[SanjelCrew] OFF
GO

UPDATE SanjelData.[dbo].SanjelCrew SET  TypeName = r.name,TypeDescription = r.description FROM SanjelData.[dbo].SanjelCrew e,(SELECT * FROM SanjelData.[dbo].CrewType) r WHERE e.Typeid=r.id;
UPDATE SanjelData.[dbo].SanjelCrew SET HomeServicePointSystemId = r.system_id, HomeServicePointName = r.name,HomeServicePointDescription = r.description FROM SanjelData.[dbo].SanjelCrew e,(SELECT * FROM SanjelData.[dbo].ServicePoint) r WHERE e.HomeServicePointid=r.id;
UPDATE SanjelData.[dbo].SanjelCrew SET WorkingServicePointSystemId = r.system_id, WorkingServicePointName = r.name,WorkingServicePointDescription = r.description FROM SanjelData.[dbo].SanjelCrew e,(SELECT * FROM SanjelData.[dbo].ServicePoint) r WHERE e.WorkingServicePointid=r.id;


-- Import ThirdPartyBulkerCrew test data
SET IDENTITY_INSERT SanjelData.[dbo].[ThirdPartyBulkerCrew] ON
GO
INSERT INTO SanjelData.[dbo].[ThirdPartyBulkerCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [ContractorCompanyName], [ContractorCompanySystemId], [ContractorCompanyid], [ContractorCompanyDescription], [SupplierContactName], [SupplierContactNumber], [Typeid], [Notes], [ThirdPartyUnitNumber]) VALUES (N'1', N'1', N'1', N'0', null, N'2019-04-16 15:47:43.5070000', N'1', N'2019-04-16 15:47:43.5070000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'Fox Bros Trucking | ', null, N'Fox Bros Trucking', N'10', N'10', N'Fox Bros Trucking', null, null, N'3', N'test data', null)
GO
GO
SET IDENTITY_INSERT SanjelData.[dbo].[ThirdPartyBulkerCrew] OFF
GO

UPDATE SanjelData.[dbo].ThirdPartyBulkerCrew SET TypeName = r.name,TypeDescription = r.description FROM SanjelData.[dbo].ThirdPartyBulkerCrew e,(SELECT * FROM SanjelData.[dbo].CrewType) r WHERE e.Typeid=r.id;


--导入UnitOfMeasureSystemOfUnits数据
SET IDENTITY_INSERT SanjelData.[dbo].[UnitOfMeasureSystemOfUnits] ON
GO
INSERT INTO SanjelData.[dbo].[UnitOfMeasureSystemOfUnits] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'0', N'1', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'None', N'None')
GO
GO
INSERT INTO SanjelData.[dbo].[UnitOfMeasureSystemOfUnits] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'2', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Metric', N'Metric units')
GO
GO
INSERT INTO SanjelData.[dbo].[UnitOfMeasureSystemOfUnits] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'3', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'US', N'United States customary units')
GO
GO
SET IDENTITY_INSERT SanjelData.[dbo].[UnitOfMeasureSystemOfUnits] OFF
GO

--导入UnitOfMeasureType数据
SET IDENTITY_INSERT SanjelData.[dbo].[UnitOfMeasureType] ON
GO
INSERT INTO SanjelData.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'2', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Length', N'Length')
GO
GO
SET IDENTITY_INSERT SanjelData.[dbo].[UnitOfMeasureType] OFF
GO

--导入UnitOfMeasure数据
insert into SanjelData.[dbo].UnitOfMeasure(
id,
version,
name,
description,
UnitOfMeasureSystemOfUnitsid,
BaseMultiplier,
IsUseBaseMultiplier,
SecondaryUnitOfMeasureid,
UnitOfMeasureTypeid,
IsCompositeUnit,
PrimaryUnitOfMeasureid,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id
)
select 
ID as id, 
VERSION as version, 
NAME as name,
DESCRIPTION as description,
SYSTEM_OF_UNIT as UnitOfMeasureSystemOfUnitsid,
BASE_MULTIPLIER as BaseMultiplier,
IS_USE_BASE_MULTIPLIER as IsUseBaseMultiplier,
SECONDARY_UOM_ID as SecondaryUnitOfMeasureid,
UNIT_CLASS as UnitOfMeasureTypeid,
IS_COMPOSITE_UNIT as IsCompositeUnit,
PRIMARY_UOM_ID as PrimaryUnitOfMeasureid,

LAST_MODIFIED_USER_ID as modified_user_id, 
LAST_MODIFIED_USER_NAME as modified_user_name,
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
0 as owner_id
from Eservice6.dbo.UNIT_OF_MEASURE b where b.EFFECTIVE_END_DATE_TIME > GETDATE() and b.NAME='mm' ;

UPDATE SanjelData.[dbo].UnitOfMeasure SET UnitOfMeasureSystemOfUnitsSystemId = r.system_id,UnitOfMeasureSystemOfUnitsName = r.name,UnitOfMeasureSystemOfUnitsDescription = r.description FROM SanjelData.[dbo].UnitOfMeasure e,(SELECT * FROM SanjelData.[dbo].UnitOfMeasureSystemOfUnits) r WHERE e.UnitOfMeasureSystemOfUnitsid=r.id;
UPDATE SanjelData.[dbo].UnitOfMeasure SET SecondaryUnitOfMeasureSystemId = r.system_id,SecondaryUnitOfMeasureName = r.name,SecondaryUnitOfMeasureDescription = r.description FROM SanjelData.[dbo].UnitOfMeasure e,(SELECT * FROM SanjelData.[dbo].UnitOfMeasure) r WHERE e.SecondaryUnitOfMeasureid=r.id;
UPDATE SanjelData.[dbo].UnitOfMeasure SET PrimaryUnitOfMeasureSystemId = r.system_id,PrimaryUnitOfMeasureName = r.name,PrimaryUnitOfMeasureDescription = r.description FROM SanjelData.[dbo].UnitOfMeasure e,(SELECT * FROM SanjelData.[dbo].UnitOfMeasure) r WHERE e.PrimaryUnitOfMeasureid=r.id;

-- Records of UnitScheduleType
SET IDENTITY_INSERT SanjelData.[dbo].[UnitScheduleType] ON
GO
INSERT INTO SanjelData.[dbo].[UnitScheduleType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'1', null, null, N'Maintenance', N'Maintenance')
GO
GO
INSERT INTO SanjelData.[dbo].[UnitScheduleType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'2', null, null, N'Breakdown', N'Breakdown')
GO
GO
INSERT INTO SanjelData.[dbo].[UnitScheduleType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'3', null, null, N'Repair', N'Repair')
GO
GO
INSERT INTO SanjelData.[dbo].[UnitScheduleType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'4', null, null, N'Parked', N'Parked')
GO
GO
SET IDENTITY_INSERT SanjelData.[dbo].[UnitScheduleType] OFF
GO

-- Records of WorkerScheduleType
SET IDENTITY_INSERT SanjelData.[dbo].[WorkerScheduleType] ON
GO
INSERT INTO SanjelData.[dbo].[WorkerScheduleType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'1', null, null, N'Sickness', N'Sickness')
GO
GO
INSERT INTO SanjelData.[dbo].[WorkerScheduleType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'2', null, null, N'Personal Leave', N'Personal Leave')
GO
GO
INSERT INTO SanjelData.[dbo].[WorkerScheduleType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'3', null, null, N'Family Emergency', N'Family Emergency')
GO
GO
INSERT INTO SanjelData.[dbo].[WorkerScheduleType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'4', null, null, N'Vacation', N'Vacation')
GO
GO
SET IDENTITY_INSERT SanjelData.[dbo].[WorkerScheduleType] OFF
GO






