
--导入BinType数据
insert into SanjelData_13.dbo.BinType(
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


--导入bin数据
insert into SanjelData_13.dbo.Bin(
id,
version,
description,
name,
BinNumber,
BinTypeid,
Districtid,
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
BIN_NUMBER as  BinNumber,
BIN_TYPE_ID as BinTypeid,
DISTRICT_ID as Districtid,
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
from Eservice6.dbo.BINS b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;

UPDATE SanjelData_13.dbo.Bin SET DistrictSystemId = r.system_id,DistrictName = r.name,DistrictDescription = r.description FROM Bin e,(SELECT * FROM ServicePoint) r WHERE e.Districtid=r.id;
UPDATE SanjelData_13.dbo.Bin SET BinTypeSystemId = r.system_id,BinTypeName = r.name,BinTypeDescription = r.description FROM Bin e,(SELECT * FROM BinType) r WHERE e.BinTypeid=r.id;


--导入rigsizeType数据
insert into SanjelData_13.dbo.RigSizeType(
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


--导入ThreadType数据
insert into SanjelData_13.dbo.ThreadType(
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


--导入ValueUnitType数据
SET IDENTITY_INSERT SanjelData_13.[dbo].[ValueUnitType] ON
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'1', N'1', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, null, null)
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'2', N'2', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'60.33', N'60.33', null, N'60.33')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'3', N'3', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'73.0', N'73.0', null, N'73.0')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'4', N'4', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'88.90', N'88.90', null, N'88.90')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'5', N'5', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'114.30', N'114.30', null, N'114.30')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'6', N'6', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'139.70', N'139.70', null, N'139.70')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'7', N'7', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'177.80', N'177.80', null, N'177.80')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'8', N'8', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'219.00', N'219.00', null, N'219.00')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'9', N'9', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'244.50', N'244.50', null, N'244.50')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'10', N'10', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'273.00', N'273.00', null, N'273.00')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'11', N'11', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'298.50', N'298.50', null, N'298.50')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'12', N'12', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'339.70', N'339.70', null, N'339.70')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'13', N'13', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'406.40', N'406.40', null, N'406.40')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'14', N'14', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'50.80', N'50.80', null, N'50.80')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'15', N'15', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'76.20', N'76.20', null, N'76.20')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'16', N'16', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'101.60', N'101.60', null, N'101.60')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'17', N'17', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'193.70', N'193.70', null, N'193.70')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'18', N'18', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'127.00', N'127.00', null, N'127.00')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ValueUnitType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unit], [Value]) VALUES (N'19', N'19', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'168.28', N'168.28', null, N'168.28')
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[ValueUnitType] OFF
GO



--导入ShiftType数据
insert into SanjelData_13.dbo.ShiftType(
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

--导入JobLifeStatus数据
SET IDENTITY_INSERT SanjelData_13.[dbo].[JobLifeStatus] ON
GO
INSERT INTO SanjelData_13.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'0', N'1', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'None', N'None')
GO
GO
INSERT INTO SanjelData_13.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'2', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Alerted', N'Alerted')
GO
GO
INSERT INTO SanjelData_13.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'3', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Pending', N'Pending')
GO
GO
INSERT INTO SanjelData_13.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'3', N'4', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Confirmed', N'Confirmed')
GO
GO
INSERT INTO SanjelData_13.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'4', N'5', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Scheduled', N'Scheduled')
GO
GO
INSERT INTO SanjelData_13.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'5', N'6', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Dispatched', N'Dispatched')
GO
GO
INSERT INTO SanjelData_13.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'6', N'7', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Canceled', N'Canceled')
GO
GO
INSERT INTO SanjelData_13.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'7', N'8', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'InProgress', N'InProgress')
GO
GO
INSERT INTO SanjelData_13.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'8', N'9', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Completed', N'Completed')
GO
GO
INSERT INTO SanjelData_13.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'9', N'10', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Deleted', N'Deleted')
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[JobLifeStatus] OFF
GO

--导入RigStatus数据
SET IDENTITY_INSERT SanjelData_13.[dbo].[RigStatus] ON
GO
INSERT INTO SanjelData_13.[dbo].[RigStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'0', N'1', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'None', N'None')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'2', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Active', N'Active')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'3', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'DownForMaintenance', N'DownForMaintenance')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'3', N'4', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'DownForHoldingEquipment', N'DownForHoldingEquipment')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'4', N'5', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'DownForWeather', N'DownForWeather')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'5', N'6', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'DownForNewLeaseOrLicenses', N'DownForNewLeaseOrLicenses')
GO
GO
INSERT INTO SanjelData_13.[dbo].[RigStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'6', N'7', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Deactivated', N'Deactivated')
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[RigStatus] OFF
GO


--导入jobType数据
insert into SanjelData_13.dbo.jobType(
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



--导入ClientConsultant数据
insert into SanjelData_13.dbo.ClientConsultant(
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

UPDATE SanjelData_13.dbo.ClientConsultant SET WorkShiftSystemId = r.system_id,WorkShiftName = r.name,WorkShiftDescription = r.description FROM ClientConsultant e,(SELECT * FROM ShiftType) r WHERE e.WorkShiftid=r.id;


--导入WellLocationType数据
SET IDENTITY_INSERT SanjelData_13.[dbo].[WellLocationType] ON
GO
INSERT INTO SanjelData_13.[dbo].[WellLocationType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'1', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'General', N'General')
GO
GO
INSERT INTO SanjelData_13.[dbo].[WellLocationType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'2', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'Geo', N'Geo')
GO
GO
INSERT INTO SanjelData_13.[dbo].[WellLocationType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'3', N'3', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'Torrent', N'Torrent')
GO
GO
INSERT INTO SanjelData_13.[dbo].[WellLocationType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'4', N'4', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'Usa', N'Usa')
GO
GO
INSERT INTO SanjelData_13.[dbo].[WellLocationType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'5', N'5', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'NTS', N'NTS')
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[WellLocationType] OFF
GO


--导入ClientCompany数据
insert into SanjelData_13.dbo.ClientCompany(
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


--导入DrillingCompany数据
insert into SanjelData_13.dbo.DrillingCompany(
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



--导入Rig数据
insert into SanjelData_13.dbo.Rig(
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
Statusid,
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
STATUS as Statusid,
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

UPDATE SanjelData_13.dbo.Rig SET StatusSystemId = r.system_id,StatusName = r.name,StatusDescription = r.description FROM Rig e,(SELECT * FROM RigStatus) r WHERE e.Statusid=r.id;
UPDATE SanjelData_13.dbo.Rig SET DrillingCompanySystemId = r.system_id,DrillingCompanyName = r.name,DrillingCompanyDescription = r.description FROM Rig e,(SELECT * FROM DrillingCompany) r WHERE e.DrillingCompanyid=r.id;


--导入rigJob数据

alter table SanjelData_13.dbo.RigJob alter column Notes nvarchar(500);
alter table SanjelData_13.dbo.RigJob alter column Directions nvarchar(1000);
insert into SanjelData_13.dbo.RigJob(
id,
version,
JobLifeStatusid,
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
RigStatusid,
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
JOB_LIFE_STATUS as JobLifeStatusid,
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
RIG_STATUS as RigStatusid,
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
from Eservice6.dbo.RIG_JOB b where b.EFFECTIVE_END_DATE_TIME > GETDATE() ;

UPDATE SanjelData_13.dbo.RigJob SET JobTypeSystemId = r.system_id,JobTypeName = r.name,JobTypeDescription = r.description FROM RigJob e,(SELECT * FROM JobType) r WHERE e.JobTypeid=r.id;
UPDATE SanjelData_13.dbo.RigJob SET ClientConsultant1SystemId = r.system_id,ClientConsultant1Name = r.name,ClientConsultant1Description = r.description FROM RigJob e,(SELECT * FROM ClientConsultant) r WHERE e.ClientConsultant1id=r.id;
UPDATE SanjelData_13.dbo.RigJob SET ClientConsultant2SystemId = r.system_id,ClientConsultant2Name = r.name,ClientConsultant2Description = r.description FROM RigJob e,(SELECT * FROM ClientConsultant) r WHERE e.ClientConsultant2id=r.id;
UPDATE SanjelData_13.dbo.RigJob SET WellLocationTypeSystemId = r.system_id,WellLocationTypeName = r.name,WellLocationTypeDescription = r.description FROM RigJob e,(SELECT * FROM WellLocationType) r WHERE e.WellLocationTypeid=r.id;
UPDATE SanjelData_13.dbo.RigJob SET ClientCompanySystemId = r.system_id,ClientCompanyName = r.name,ClientCompanyDescription = r.description FROM RigJob e,(SELECT * FROM ClientCompany) r WHERE e.ClientCompanyid=r.id;
UPDATE SanjelData_13.dbo.RigJob SET RigSystemId = r.system_id,RigName = r.name,RigDescription = r.description FROM RigJob e,(SELECT * FROM Rig) r WHERE e.Rigid=r.id;
UPDATE SanjelData_13.dbo.RigJob SET ServicePointSystemId = r.system_id,ServicePointName = r.name,ServicePointDescription = r.description FROM RigJob e,(SELECT * FROM ServicePoint) r WHERE e.ServicePointid=r.id;
UPDATE SanjelData_13.dbo.RigJob SET JobLifeStatusSystemId = r.system_id,JobLifeStatusName = r.name,JobLifeStatusDescription = r.description FROM RigJob e,(SELECT * FROM JobLifeStatus) r WHERE e.JobLifeStatusid=r.id;
UPDATE SanjelData_13.dbo.RigJob SET RigStatusSystemId = r.system_id,RigStatusName = r.name,RigStatusDescription = r.description FROM RigJob e,(SELECT * FROM RigStatus) r WHERE e.RigStatusid=r.id;


--导入ServiceLine数据
insert into SanjelData_13.dbo.ServiceLine(
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



--导入BlendCategory数据
insert into SanjelData_13.dbo.BlendCategory(
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


--导入Country数据
insert into SanjelData_13.dbo.Country(
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

--导入HaulBonusType数据
insert into SanjelData_13.dbo.HaulBonusType(
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
from Eservice6.dbo.TYPE_VALUES where type_id = 110 and DESCRIPTION is not null and EFFECTIVE_END_DATE_TIME > GETDATE();



--导入ProductHaulLoadStatus数据
SET IDENTITY_INSERT SanjelData_13.[dbo].[ProductHaulLoadStatus] ON
GO
INSERT INTO SanjelData_13.[dbo].[ProductHaulLoadStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'0', N'1', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Empty', N'Empty')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ProductHaulLoadStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'2', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Scheduled', N'Scheduled')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ProductHaulLoadStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'3', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'OnLocation', N'OnLocation')
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[ProductHaulLoadStatus] OFF
GO



--导入ProductHaulStatus数据
SET IDENTITY_INSERT SanjelData_13.[dbo].[ProductHaulStatus] ON
GO
INSERT INTO SanjelData_13.[dbo].[ProductHaulStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'0', N'1', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Empty', N'Empty')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ProductHaulStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'2', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Pending', N'Pending')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ProductHaulStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'3', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Scheduled', N'Scheduled')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ProductHaulStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'3', N'4', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'InProgress', N'InProgress')
GO
GO
INSERT INTO SanjelData_13.[dbo].[ProductHaulStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'4', N'5', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'OnLocation', N'OnLocation')
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[ProductHaulStatus] OFF
GO


--导入productHaul数据
insert into SanjelData_13.dbo.productHaul(
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
ProductHaulLifeStatusid,
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
PRODUCT_HAUL_LIFE_STATUS as ProductHaulLifeStatusid,
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

UPDATE SanjelData_13.dbo.productHaul SET ProductHaulLifeStatusSystemId = r.system_id,ProductHaulLifeStatusName = r.name,ProductHaulLifeStatusDescription = r.description FROM productHaul e,(SELECT * FROM ProductHaulStatus) r WHERE e.ProductHaulLifeStatusid=r.id;



--导入ProductHaulLoad数据

insert into SanjelData_13.dbo.ProductHaulLoad(
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
ProductHaulLoadLifeStatusid,
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
PRODUCT_HAUL_LOAD_LIFE_STATUS as ProductHaulLoadLifeStatusid,
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

UPDATE SanjelData_13.dbo.ProductHaulLoad SET ProductHaulLoadLifeStatusid = 0 WHERE ProductHaulLoadLifeStatusid IS NULL;
UPDATE SanjelData_13.dbo.ProductHaulLoad SET ProductHaulLoadLifeStatusSystemId = r.system_id,ProductHaulLoadLifeStatusName = r.name,ProductHaulLoadLifeStatusDescription = r.description FROM ProductHaulLoad e,(SELECT * FROM ProductHaulLoadStatus) r WHERE e.ProductHaulLoadLifeStatusid=r.id;
UPDATE SanjelData_13.dbo.ProductHaulLoad SET ServicePointSystemId = r.system_id,ServicePointName = r.name,ServicePointDescription = r.description FROM ProductHaulLoad e,(SELECT * FROM ServicePoint) r WHERE e.ServicePointid=r.id;
UPDATE SanjelData_13.dbo.ProductHaulLoad SET BlendChemicalSystemId = r.system_id,BlendChemicalName = r.name,BlendChemicalDescription = r.description FROM ProductHaulLoad e,(SELECT * FROM BlendChemical) r WHERE e.BlendChemicalid=r.id;
UPDATE SanjelData_13.dbo.ProductHaulLoad SET ProductHaulSystemId = r.system_id,ProductHaulName = r.name,ProductHaulDescription = r.description FROM ProductHaulLoad e,(SELECT * FROM ProductHaul) r WHERE e.ProductHaulid=r.id;
UPDATE SanjelData_13.dbo.ProductHaulLoad SET BlendCategorySystemId = r.system_id,BlendCategoryName = r.name,BlendCategoryDescription = r.description FROM ProductHaulLoad e,(SELECT * FROM BlendCategory) r WHERE e.BlendCategoryid=r.id;
UPDATE SanjelData_13.dbo.ProductHaulLoad SET CustomerSystemId = r.system_id,CustomerName = r.name,CustomerDescription = r.description FROM ProductHaulLoad e,(SELECT * FROM ClientCompany) r WHERE e.Customerid=r.id;
UPDATE SanjelData_13.dbo.ProductHaulLoad SET JobTypeSystemId = r.system_id,JobTypeName = r.name,JobTypeDescription = r.description FROM ProductHaulLoad e,(SELECT * FROM JobType) r WHERE e.JobTypeid=r.id;
UPDATE SanjelData_13.dbo.ProductHaulLoad SET BinSystemId = r.system_id,BinName = r.name,BinDescription = r.description FROM ProductHaulLoad e,(SELECT * FROM Bin) r WHERE e.Binid=r.id;




SET IDENTITY_INSERT SanjelData_13.[dbo].[BlendAdditiveMeasureUnit] ON
GO
INSERT INTO SanjelData_13.[dbo].[BlendAdditiveMeasureUnit] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [MeaureUnitTypeName], [Abbreviation], [MeaureUnitTypeDescription], [MeaureUnitTypeSystemId], [MeasureUnitSystemDescription], [MeasureUnitSystemId], [MeasureUnitSystemSystemId], [MeaureUnitTypeId], [MeasureUnitSystemName]) VALUES (N'5', N'13', N'1', N'0', N'', N'2008-03-20 15:21:11.0000000', null, N'2016-06-01 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Kilograms', N'', N'Weight', N'kg', N'', N'28', N'', N'1', N'5', N'2', N'Metric')
GO
GO
SET IDENTITY_INSERT SanjelData_13.[dbo].[BlendAdditiveMeasureUnit] OFF
GO


--导入ProductLoadSection数据
SET IDENTITY_INSERT SanjelData_13.[dbo].[ProductLoadSection] ON
insert into SanjelData_13.dbo.ProductLoadSection(
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
SET IDENTITY_INSERT SanjelData_13.[dbo].[ProductLoadSection] OFF

UPDATE SanjelData_13.dbo.ProductLoadSection SET BlendAdditiveMeasureUnitSystemId = r.system_id,BlendAdditiveMeasureUnitName = r.name,BlendAdditiveMeasureUnitDescription = r.description FROM ProductLoadSection e,(SELECT * FROM BlendAdditiveMeasureUnit) r WHERE e.BlendAdditiveMeasureUnitid=r.id;
UPDATE SanjelData_13.dbo.ProductLoadSection SET BlendChemicalSystemId = r.system_id,BlendChemicalName = r.name,BlendChemicalDescription = r.description FROM ProductLoadSection e,(SELECT * FROM BlendChemical) r WHERE e.BlendChemicalid=r.id;
UPDATE SanjelData_13.dbo.ProductLoadSection SET AdditiveBlendMethodSystemId = r.system_id,AdditiveBlendMethodName = r.name,AdditiveBlendMethodDescription = r.description FROM ProductLoadSection e,(SELECT * FROM AdditiveBlendMethod) r WHERE e.AdditiveBlendMethodid=r.id;
UPDATE SanjelData_13.dbo.ProductLoadSection SET ProductHaulLoadSystemId = r.system_id,ProductHaulLoadName = r.name,ProductHaulLoadDescription = r.description FROM ProductLoadSection e,(SELECT * FROM ProductHaulLoad) r WHERE e.ProductHaulLoadid=r.id;


--导入ProvinceOrState数据
insert into SanjelData_13.dbo.ProvinceOrState(
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


--SanjelCompany
insert into SanjelData_13.dbo.SanjelCompany(
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



--导入BIN_ASSIGNMENT、CSH_BIN_SCTNS到RigBinSection中
SET IDENTITY_INSERT SanjelData_13.[dbo].[RigBinSection] ON
insert into SanjelData_13.dbo.RigBinSection(
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
SET IDENTITY_INSERT SanjelData_13.[dbo].[RigBinSection] OFF


SET IDENTITY_INSERT SanjelData_13.[dbo].[RigBinSection] ON
UPDATE  SanjelData_13.dbo.RigBinSection  SET
OnLocation=b.ON_LOCATION,
OffLocation=b.OFF_LOCATION,
HaulingTime=b.HAULING_TIME,
VolumePumped=b.VOLUME_PUMPED,
CallSheetid=b.ROOT_ID,
InitialVolume=b.INITIAL_VOLUME FROM SanjelData_13.dbo.RigBinSection a,
(SELECT *FROM Eservice6.dbo.CSH_BIN_SCTNS )b
WHERE b.BIN_ID=a.Binid;
SET IDENTITY_INSERT SanjelData_13.[dbo].[RigBinSection] OFF


--导入UnitSection数据
SET IDENTITY_INSERT SanjelData_13.[dbo].[UnitSection] ON
insert into SanjelData_13.dbo.UnitSection(
id,
Operator2id,
TractorMainTypeid,
SanjelDistrictid,
IsProductHaul,
TractorSubtypeid,
OffLocationSecond,
OffLocation,
ActualTimeDriven,
MtsNumber,
PercentOffRoad,
Crewid,
IsJobBonusAndMba,
TruckUnitid,
UnitSubtypeid,
CallSheetid,
Operator1id,
TractorUnitid,
ActualDistanceDriven,
Passenger1id,
OnLocationSecond,
OnLocation,
HaulBonusTypeid,
TwowayTravelTime,
NumberOfPassenger,
Passenger2id,
ProductHaulid,
StandbyTimeOffLocation,
UnitMainTypeid,
entity_status,
owner_id
)
select 
ID as id, 
OPERATOR2_ID as Operator2id, 
TRACTOR_MAIN_TYPE_ID as TractorMainTypeid, 
DISTRICT_ID as SanjelDistrictid, 
IS_PRODUCT_HAUL as IsProductHaul, 
TRACTOR_SUB_TYPE_ID as TractorSubtypeid, 
OFF_LOCATION_SECOND as OffLocationSecond, 
OFF_LOCATION as OffLocationSecond, 
ACTUAL_TIME_DRIVEN as ActualTimeDriven, 
MTS_NUMBER as MtsNumber, 
PERCENT_OFF_ROAD as PercentOffRoad, 
CREW_ID as Crewid, 
IS_JOB_BONUS_AND_MBA as IsJobBonusAndMba, 
TRUCK_UNIT_ID as TruckUnitid, 
VEHICLE_SUB_TYPE_ID as UnitSubtypeid, 
ROOT_ID as CallSheetid, 
OPERATOR1_ID as Operator1id, 
TRACTOR_UNIT_ID as TractorUnitid, 
ACTUAL_DISTANCE_DRIVEN as ActualDistanceDriven, 
PASSENGER1_ID as Passenger1id, 
ON_LOCATION_SECOND as OnLocationSecond, 
ON_LOCATION as OnLocation, 
HAUL_BONUS_TYPE_ID as HaulBonusTypeid, 
TWOWAY_TRAVEL_TIME as TwowayTravelTime, 
NUMBER_OF_PASSENGER as NumberOfPassenger, 
PASSENGER2_ID as Passenger2id, 
PRODUCT_HAUL_ID as ProductHaulid, 
STANDBY_TIME_OFFLOCATION as StandbyTimeOffLocation, 
UNIT_MAIN_TYPE_ID as UnitMainTypeid, 

0 as ENTITY_STATUS,
0 as owner_id
from Eservice6.dbo.CSH_UNIT_SCTNS;
SET IDENTITY_INSERT SanjelData_13.[dbo].[UnitSection] OFF

UPDATE SanjelData_13.dbo.UnitSection SET Operator2SystemId = r.system_id,Operator2Name = r.name,Operator2Description = r.description FROM UnitSection e,(SELECT * FROM Employee) r WHERE e.Operator2id=r.id;
UPDATE SanjelData_13.dbo.UnitSection SET TractorMainTypeSystemId = r.system_id,TractorMainTypeName = r.name,TractorMainTypeDescription = r.description FROM UnitSection e,(SELECT * FROM UnitMainType) r WHERE e.TractorMainTypeid=r.id;
UPDATE SanjelData_13.dbo.UnitSection SET SanjelDistrictSystemId = r.system_id,SanjelDistrictName = r.name,SanjelDistrictDescription = r.description FROM UnitSection e,(SELECT * FROM ServicePoint) r WHERE e.SanjelDistrictid=r.id;
UPDATE SanjelData_13.dbo.UnitSection SET TractorSubtypeSystemId = r.system_id,TractorSubtypeName = r.name,TractorSubtypeDescription = r.description FROM UnitSection e,(SELECT * FROM UnitSubType) r WHERE e.TractorSubtypeid=r.id;
UPDATE SanjelData_13.dbo.UnitSection SET TruckUnitSystemId = r.system_id,TruckUnitName = r.name,TruckUnitDescription = r.description FROM UnitSection e,(SELECT * FROM TruckUnit) r WHERE e.TruckUnitid=r.id;
UPDATE SanjelData_13.dbo.UnitSection SET UnitSubtypeSystemId = r.system_id,UnitSubtypeName = r.name,UnitSubtypeDescription = r.description FROM UnitSection e,(SELECT * FROM UnitSubType) r WHERE e.UnitSubtypeid=r.id;
UPDATE SanjelData_13.dbo.UnitSection SET Operator1SystemId = r.system_id,Operator1Name = r.name,Operator1Description = r.description FROM UnitSection e,(SELECT * FROM Employee) r WHERE e.Operator1id=r.id;
UPDATE SanjelData_13.dbo.UnitSection SET TractorUnitSystemId = r.system_id,TractorUnitName = r.name,TractorUnitDescription = r.description FROM UnitSection e,(SELECT * FROM TruckUnit) r WHERE e.TractorUnitid=r.id;
UPDATE SanjelData_13.dbo.UnitSection SET Passenger1SystemId = r.system_id,Passenger1Name = r.name,Passenger1Description = r.description FROM UnitSection e,(SELECT * FROM Employee) r WHERE e.Passenger1id=r.id;
UPDATE SanjelData_13.dbo.UnitSection SET HaulBonusTypeSystemId = r.system_id,HaulBonusTypeName = r.name,HaulBonusTypeDescription = r.description FROM UnitSection e,(SELECT * FROM HaulBonusType) r WHERE e.HaulBonusTypeid=r.id;
UPDATE SanjelData_13.dbo.UnitSection SET Passenger2SystemId = r.system_id,Passenger2Name = r.name,Passenger2Description = r.description FROM UnitSection e,(SELECT * FROM Employee) r WHERE e.Passenger2id=r.id;
UPDATE SanjelData_13.dbo.UnitSection SET ProductHaulSystemId = r.system_id,ProductHaulName = r.name,ProductHaulDescription = r.description FROM UnitSection e,(SELECT * FROM ProductHaul) r WHERE e.ProductHaulid=r.id;
UPDATE SanjelData_13.dbo.UnitSection SET UnitMainTypeSystemId = r.system_id,UnitMainTypeName = r.name,UnitMainTypeDescription = r.description FROM UnitSection e,(SELECT * FROM UnitMainType) r WHERE e.UnitMainTypeid=r.id;

--导入ThirdPartyUnitSection数据
SET IDENTITY_INSERT SanjelData_13.[dbo].[ThirdPartyUnitSection] ON
insert into SanjelData_13.dbo.ThirdPartyUnitSection(
id,
ThirdPartyUnitNumber,
Crewid,
SupplierContactName,
BillofLadingMTSNumber,
CallSheetid,
UnitOnLocationDateTime,
ProductHaulid,
SupplierCompanyName,
UnitOffLocationDateTime,
SupplierContactNumber,
entity_status,
owner_id
)
select 
ID as id,
THIRD_PARTY_UNIT_NUMBER as ThirdPartyUnitNumber,
CREW_ID as Crewid,
SUPPLIER_CONTACT_NAME as SupplierContactName,
BILL_OF_LADING_MTS_NUMBER as BillofLadingMTSNumber,
ROOT_ID as CallSheetid,
UNIT_ON_LOC_DTIME as UnitOnLocationDateTime,
PRODUCT_HAUL_ID as ProductHaulid,
SUPPLIER_COMPANY_NAME as SupplierCompanyName,
UNIT_OFF_LOC_DTIME as UnitOffLocationDateTime,
SUPPLIER_CONTACT_NUMBER as SupplierContactNumber,
0 as ENTITY_STATUS,
0 as owner_id
from Eservice6.dbo.CSH_3RD_PARTY_UNIT_SCTNS;
SET IDENTITY_INSERT SanjelData_13.[dbo].[ThirdPartyUnitSection] OFF

UPDATE SanjelData_13.dbo.ThirdPartyUnitSection SET ProductHaulSystemId = r.system_id,ProductHaulName = r.name,ProductHaulDescription = r.description FROM ThirdPartyUnitSection e,(SELECT * FROM ProductHaul) r WHERE e.ProductHaulid=r.id;




