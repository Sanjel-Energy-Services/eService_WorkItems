
insert into SanjeData.[dbo].BonusPosition(
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


SET IDENTITY_INSERT SanjeData.[dbo].[CrewPosition] ON
GO
INSERT INTO SanjeData.[dbo].[CrewPosition] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'0', N'0', N'Supervisor', N'Supervisor')
GO
GO
INSERT INTO SanjeData.[dbo].[CrewPosition] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'0', N'0', N'Crew Member', N'Crew Member')
GO
GO
SET IDENTITY_INSERT SanjeData.[dbo].[CrewPosition] OFF
GO

-- Import CrewType data
SET IDENTITY_INSERT SanjeData.[dbo].[CrewType] ON
GO
INSERT INTO SanjeData.[dbo].[CrewType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'0', N'0', N'Pumper Crew', N'Pumper Crew')
GO
GO
INSERT INTO SanjeData.[dbo].[CrewType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'0', N'0', N'Bulker Crew', N'Bulker Crew')
GO
GO
INSERT INTO SanjeData.[dbo].[CrewType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'3', N'0', N'0', N'Third Party Bulker Crew', N'Third Party Bulker Crew')
GO
GO
INSERT INTO SanjeData.[dbo].[CrewType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'4', N'0', N'0', N'Spare Crew', N'Spare Crew')
GO
GO
SET IDENTITY_INSERT SanjeData.[dbo].[CrewType] OFF
GO

-- Import Employee data
insert into SanjeData.[dbo].Employee(
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

-- Records of RigJobCrewSectionStatus
SET IDENTITY_INSERT SanjeData.[dbo].[RigJobCrewSectionStatus] ON
GO
INSERT INTO SanjeData.[dbo].[RigJobCrewSectionStatus] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'0', N'0', N'Assigned', N'Assigned')
GO
GO
INSERT INTO SanjeData.[dbo].[RigJobCrewSectionStatus] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'0', N'0', N'Scheduled', N'Scheduled')
GO
GO
INSERT INTO SanjeData.[dbo].[RigJobCrewSectionStatus] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'3', N'0', N'0', N'Removed', N'Removed')
GO
GO
INSERT INTO SanjeData.[dbo].[RigJobCrewSectionStatus] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'4', N'0', N'0', N'Called', N'Called')
GO
GO
INSERT INTO SanjeData.[dbo].[RigJobCrewSectionStatus] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'5', N'0', N'0', N'LogOnDuty', N'LogOnDuty')
GO
GO
INSERT INTO SanjeData.[dbo].[RigJobCrewSectionStatus] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'6', N'0', N'0', N'LogOffDuty', N'LogOffDuty')
GO
GO
SET IDENTITY_INSERT SanjeData.[dbo].[RigJobCrewSectionStatus] OFF
GO

--导入ServiceLine数据
insert into SanjeData.[dbo].ServiceLine(
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
insert into SanjeData.[dbo].ServicePoint(
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

-- Import TruckUnit data 
insert into SanjeData.[dbo].TruckUnit(
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

-- Import UnitMainType data 
insert into SanjeData.[dbo].UnitMainType(
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
insert into SanjeData.[dbo].UnitSubType(
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

-- Records of UnitScheduleType
SET IDENTITY_INSERT SanjeData.[dbo].[UnitScheduleType] ON
GO
INSERT INTO SanjeData.[dbo].[UnitScheduleType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'1', null, null, N'Maintenance', N'Maintenance')
GO
GO
INSERT INTO SanjeData.[dbo].[UnitScheduleType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'2', null, null, N'Breakdown', N'Breakdown')
GO
GO
INSERT INTO SanjeData.[dbo].[UnitScheduleType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'3', null, null, N'Repair', N'Repair')
GO
GO
INSERT INTO SanjeData.[dbo].[UnitScheduleType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'4', null, null, N'Parked', N'Parked')
GO
GO
SET IDENTITY_INSERT SanjeData.[dbo].[UnitScheduleType] OFF
GO

-- Records of WorkerScheduleType
SET IDENTITY_INSERT SanjeData.[dbo].[WorkerScheduleType] ON
GO
INSERT INTO SanjeData.[dbo].[WorkerScheduleType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'1', null, null, N'Sickness', N'Sickness')
GO
GO
INSERT INTO SanjeData.[dbo].[WorkerScheduleType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'2', null, null, N'Personal Leave', N'Personal Leave')
GO
GO
INSERT INTO SanjeData.[dbo].[WorkerScheduleType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'3', null, null, N'Family Emergency', N'Family Emergency')
GO
GO
INSERT INTO SanjeData.[dbo].[WorkerScheduleType] ([id], [entity_status], [owner_id], [name], [description]) VALUES (N'4', null, null, N'Vacation', N'Vacation')
GO
GO
SET IDENTITY_INSERT SanjeData.[dbo].[WorkerScheduleType] OFF
GO

-- Import SanjelCrew test data
SET IDENTITY_INSERT SanjeData.[dbo].[SanjelCrew] ON
GO
INSERT INTO SanjeData.[dbo].[SanjelCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Notes], [WorkingServicePointid], [HomeServicePointDescription], [WorkingServicePointDescription], [HomeServicePointid], [WorkingServicePointSystemId], [HomeServicePointName], [WorkingServicePointName], [HomeServicePointSystemId], [Typeid]) VALUES (N'1', N'1', N'1', null, null, N'2019-04-16 15:41:15.1170000', N'1', N'2019-04-16 15:41:15.1130000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, N'test data', N'61', null, null, N'61', N'1', N'Lloydminster', N'Lloydminster', N'1', N'1');
INSERT INTO SanjeData.[dbo].[SanjelCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Notes], [WorkingServicePointid], [HomeServicePointDescription], [WorkingServicePointDescription], [HomeServicePointid], [WorkingServicePointSystemId], [HomeServicePointName], [WorkingServicePointName], [HomeServicePointSystemId], [Typeid]) VALUES (N'2', N'2', N'1', null, null, N'2019-04-16 15:41:15.1170000', N'1', N'2019-04-16 15:41:15.1130000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, N'test data', N'65', null, null, N'65', N'3', N'Lac La Biche', N'Lac La Biche', N'3', N'1');
INSERT INTO SanjeData.[dbo].[SanjelCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Notes], [WorkingServicePointid], [HomeServicePointDescription], [WorkingServicePointDescription], [HomeServicePointid], [WorkingServicePointSystemId], [HomeServicePointName], [WorkingServicePointName], [HomeServicePointSystemId], [Typeid]) VALUES (N'3', N'3', N'1', null, null, N'2019-04-16 15:41:15.1170000', N'1', N'2019-04-16 15:41:15.1130000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, N'test data', N'66', null, null, N'66', N'4', N'Fort St. John', N'Fort St. John', N'4', N'1');
INSERT INTO SanjeData.[dbo].[SanjelCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Notes], [WorkingServicePointid], [HomeServicePointDescription], [WorkingServicePointDescription], [HomeServicePointid], [WorkingServicePointSystemId], [HomeServicePointName], [WorkingServicePointName], [HomeServicePointSystemId], [Typeid]) VALUES (N'4', N'4', N'1', null, null, N'2019-04-16 15:41:15.1170000', N'1', N'2019-04-16 15:41:15.1130000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, N'test data', N'67', null, null, N'67', N'5', N'Edmonton', N'Edmonton', N'5', N'1');
INSERT INTO SanjeData.[dbo].[SanjelCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Notes], [WorkingServicePointid], [HomeServicePointDescription], [WorkingServicePointDescription], [HomeServicePointid], [WorkingServicePointSystemId], [HomeServicePointName], [WorkingServicePointName], [HomeServicePointSystemId], [Typeid]) VALUES (N'5', N'5', N'1', null, null, N'2019-04-16 15:41:15.1170000', N'1', N'2019-04-16 15:41:15.1130000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, N'test data', N'69', null, null, N'69', N'6', N'Brooks', N'Brooks', N'6', N'1');
INSERT INTO SanjeData.[dbo].[SanjelCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Notes], [WorkingServicePointid], [HomeServicePointDescription], [WorkingServicePointDescription], [HomeServicePointid], [WorkingServicePointSystemId], [HomeServicePointName], [WorkingServicePointName], [HomeServicePointSystemId], [Typeid]) VALUES (N'6', N'6', N'1', null, null, N'2019-04-16 15:41:15.1170000', N'1', N'2019-04-16 15:41:15.1130000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, N'test data', N'70', null, null, N'70', N'7', N'Swift Current', N'Swift Current', N'7', N'1');
INSERT INTO SanjeData.[dbo].[SanjelCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Notes], [WorkingServicePointid], [HomeServicePointDescription], [WorkingServicePointDescription], [HomeServicePointid], [WorkingServicePointSystemId], [HomeServicePointName], [WorkingServicePointName], [HomeServicePointSystemId], [Typeid]) VALUES (N'7', N'7', N'1', null, null, N'2019-04-16 15:41:15.1170000', N'1', N'2019-04-16 15:41:15.1130000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, N'test data', N'71', null, null, N'71', N'8', N'Grande Prairie', N'Grande Prairie', N'8', N'1');
INSERT INTO SanjeData.[dbo].[SanjelCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Notes], [WorkingServicePointid], [HomeServicePointDescription], [WorkingServicePointDescription], [HomeServicePointid], [WorkingServicePointSystemId], [HomeServicePointName], [WorkingServicePointName], [HomeServicePointSystemId], [Typeid]) VALUES (N'8', N'8', N'1', null, null, N'2019-04-16 15:41:15.1170000', N'1', N'2019-04-16 15:41:15.1130000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, N'test data', N'72', null, null, N'72', N'9', N'Estevan', N'Estevan', N'9', N'1');
INSERT INTO SanjeData.[dbo].[SanjelCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Notes], [WorkingServicePointid], [HomeServicePointDescription], [WorkingServicePointDescription], [HomeServicePointid], [WorkingServicePointSystemId], [HomeServicePointName], [WorkingServicePointName], [HomeServicePointSystemId], [Typeid]) VALUES (N'9', N'9', N'1', null, null, N'2019-04-16 15:41:15.1170000', N'1', N'2019-04-16 15:41:15.1130000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, N'test data', N'81', null, null, N'81', N'10', N'Edson', N'Edson', N'10', N'1');
INSERT INTO SanjeData.[dbo].[SanjelCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Notes], [WorkingServicePointid], [HomeServicePointDescription], [WorkingServicePointDescription], [HomeServicePointid], [WorkingServicePointSystemId], [HomeServicePointName], [WorkingServicePointName], [HomeServicePointSystemId], [Typeid]) VALUES (N'10', N'10', N'1', null, null, N'2019-04-16 15:41:15.1170000', N'1', N'2019-04-16 15:41:15.1130000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, N'test data', N'85', null, null, N'85', N'11', N'Red Deer', N'Red Deer', N'11', N'1');
INSERT INTO SanjeData.[dbo].[SanjelCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Notes], [WorkingServicePointid], [HomeServicePointDescription], [WorkingServicePointDescription], [HomeServicePointid], [WorkingServicePointSystemId], [HomeServicePointName], [WorkingServicePointName], [HomeServicePointSystemId], [Typeid]) VALUES (N'11', N'11', N'1', null, null, N'2019-04-16 15:41:15.1170000', N'1', N'2019-04-16 15:41:15.1130000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, N'test data', N'88', null, null, N'88', N'12', N'Kindersley', N'Kindersley', N'12', N'1');
GO
SET IDENTITY_INSERT SanjeData.[dbo].[SanjelCrew] OFF
GO

-- Import ThirdPartyBulkerCrew test data
SET IDENTITY_INSERT SanjeData.[dbo].[ThirdPartyBulkerCrew] ON
GO
INSERT INTO SanjeData.[dbo].[ThirdPartyBulkerCrew] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [ContractorCompanyName], [ContractorCompanySystemId], [ContractorCompanyid], [ContractorCompanyDescription], [SupplierContactName], [SupplierContactNumber], [Typeid], [Notes], [ThirdPartyUnitNumber]) VALUES (N'1', N'1', N'1', null, null, N'2019-04-16 15:47:43.5070000', N'1', N'2019-04-16 15:47:43.5070000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'Fox Bros Trucking | ', null, N'Fox Bros Trucking', N'10', N'10', N'Fox Bros Trucking', null, null, N'3', N'test data', null)
GO
GO
SET IDENTITY_INSERT SanjeData.[dbo].[ThirdPartyBulkerCrew] OFF
GO

UPDATE SanjeData.[dbo].Employee SET BonusPositionid = 0 WHERE BonusPositionid is NULL;
UPDATE SanjeData.[dbo].Employee SET BonusPositionSystemId = r.system_id,BonusPositionName = r.name,BonusPositionDescription = r.description FROM SanjeData.[dbo].Employee e,(SELECT * FROM SanjeData.[dbo].BonusPosition) r WHERE e.BonusPositionid=r.ID;
UPDATE SanjeData.[dbo].Employee SET ServicePointSystemId = r.system_id,ServicePointName = r.name,ServicePointDescription = r.description FROM SanjeData.[dbo].Employee e,(SELECT * FROM SanjeData.[dbo].ServicePoint) r WHERE e.ServicePointid=r.ID;


UPDATE SanjeData.[dbo].TruckUnit SET UnitMainTypeSystemId = r.system_id,UnitMainTypeName = r.name,UnitMainTypeDescription = r.description FROM SanjeData.[dbo].TruckUnit t,(SELECT * FROM SanjeData.[dbo].UnitMainType) r WHERE t.UnitMainTypeid=r.id;
UPDATE SanjeData.[dbo].TruckUnit SET UnitSubTypeSystemId = r.system_id,UnitSubTypeName = r.name,UnitSubTypeDescription = r.description FROM SanjeData.[dbo].TruckUnit t,(SELECT * FROM SanjeData.[dbo].UnitSubType) r WHERE t.UnitSubTypeid=r.id;
UPDATE SanjeData.[dbo].TruckUnit SET ServicePointSystemId = r.system_id,ServicePointName = r.name,ServicePointDescription = r.description FROM SanjeData.[dbo].TruckUnit t,(SELECT * FROM SanjeData.[dbo].ServicePoint) r WHERE t.ServicePointid=r.id;

UPDATE SanjeData.[dbo].UnitSubType SET UnitMainTypeSystemId = r.system_id,UnitMainTypeName = r.name,UnitMainTypeDescription = r.description FROM SanjeData.[dbo].UnitSubType u,(SELECT * FROM SanjeData.[dbo].UnitMainType) r WHERE u.UnitMainTypeid=r.id;



--导入bin数据
insert into SanjeData.[dbo].Bin(
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

--导入BinType数据
insert into SanjeData.[dbo].BinType(
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
insert into SanjeData.[dbo].BlendCategory(
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

--导入ClientCompany数据
insert into SanjeData.[dbo].ClientCompany(
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

--导入ClientConsultant数据
insert into SanjeData.[dbo].ClientConsultant(
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

insert into SanjeData.[dbo].ContractorCompany(
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

--导入Country数据
insert into SanjeData.[dbo].Country(
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

--导入DrillingCompany数据
insert into SanjeData.[dbo].DrillingCompany(
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

--导入JobLifeStatus数据
SET IDENTITY_INSERT SanjeData.[dbo].[JobLifeStatus] ON
GO
INSERT INTO SanjeData.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'0', N'1', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'None', N'None')
GO
GO
INSERT INTO SanjeData.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'2', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Alerted', N'Alerted')
GO
GO
INSERT INTO SanjeData.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'3', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Pending', N'Pending')
GO
GO
INSERT INTO SanjeData.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'3', N'4', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Confirmed', N'Confirmed')
GO
GO
INSERT INTO SanjeData.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'4', N'5', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Scheduled', N'Scheduled')
GO
GO
INSERT INTO SanjeData.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'5', N'6', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Dispatched', N'Dispatched')
GO
GO
INSERT INTO SanjeData.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'6', N'7', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Canceled', N'Canceled')
GO
GO
INSERT INTO SanjeData.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'7', N'8', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'InProgress', N'InProgress')
GO
GO
INSERT INTO SanjeData.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'8', N'9', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Completed', N'Completed')
GO
GO
INSERT INTO SanjeData.[dbo].[JobLifeStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'9', N'10', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Deleted', N'Deleted')
GO
GO
SET IDENTITY_INSERT SanjeData.[dbo].[JobLifeStatus] OFF
GO

--导入jobType数据
insert into SanjeData.[dbo].jobType(
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

--导入productHaul数据
insert into SanjeData.[dbo].productHaul(
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

--导入ProductHaulLoad数据
insert into SanjeData.[dbo].ProductHaulLoad(
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

--导入ProductHaulLoadStatus数据
SET IDENTITY_INSERT SanjeData.[dbo].[ProductHaulLoadStatus] ON
GO
INSERT INTO SanjeData.[dbo].[ProductHaulLoadStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'0', N'1', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Empty', N'Empty')
GO
GO
INSERT INTO SanjeData.[dbo].[ProductHaulLoadStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'2', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Scheduled', N'Scheduled')
GO
GO
INSERT INTO SanjeData.[dbo].[ProductHaulLoadStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'3', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'OnLocation', N'OnLocation')
GO
GO
SET IDENTITY_INSERT SanjeData.[dbo].[ProductHaulLoadStatus] OFF
GO

--导入ProductHaulStatus数据
SET IDENTITY_INSERT SanjeData.[dbo].[ProductHaulStatus] ON
GO
INSERT INTO SanjeData.[dbo].[ProductHaulStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'0', N'1', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Empty', N'Empty')
GO
GO
INSERT INTO SanjeData.[dbo].[ProductHaulStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'2', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Pending', N'Pending')
GO
GO
INSERT INTO SanjeData.[dbo].[ProductHaulStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'3', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Scheduled', N'Scheduled')
GO
GO
INSERT INTO SanjeData.[dbo].[ProductHaulStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'3', N'4', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'InProgress', N'InProgress')
GO
GO
INSERT INTO SanjeData.[dbo].[ProductHaulStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'4', N'5', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'OnLocation', N'OnLocation')
GO
GO
SET IDENTITY_INSERT SanjeData.[dbo].[ProductHaulStatus] OFF
GO

--导入ProductLoadSection数据
insert into SanjeData.[dbo].ProductLoadSection(
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

--导入ProvinceOrState数据
insert into SanjeData.[dbo].ProvinceOrState(
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

--导入Rig数据
insert into SanjeData.[dbo].Rig(
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


SET IDENTITY_INSERT SanjeData.[dbo].[RigBinSection] ON
insert into SanjeData.[dbo].RigBinSection(
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
SET IDENTITY_INSERT SanjeData.[dbo].[RigBinSection] OFF

--导入rigJob数据
insert into SanjeData.[dbo].RigJob(
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

--导入RigSize数据
SET IDENTITY_INSERT SanjeData.[dbo].[RigSize] ON
GO
INSERT INTO SanjeData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'1', N'1', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', null, null, null, null)
GO
GO
INSERT INTO SanjeData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'2', N'2', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'60.33', N'60.33', null, N'60.33')
GO
GO
INSERT INTO SanjeData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'3', N'3', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'73.0', N'73.0', null, N'73.0')
GO
GO
INSERT INTO SanjeData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'4', N'4', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'88.90', N'88.90', null, N'88.90')
GO
GO
INSERT INTO SanjeData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'5', N'5', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'114.30', N'114.30', null, N'114.30')
GO
GO
INSERT INTO SanjeData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'6', N'6', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'139.70', N'139.70', null, N'139.70')
GO
GO
INSERT INTO SanjeData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'7', N'7', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'177.80', N'177.80', null, N'177.80')
GO
GO
INSERT INTO SanjeData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'8', N'8', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'219.00', N'219.00', null, N'219.00')
GO
GO
INSERT INTO SanjeData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'9', N'9', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'244.50', N'244.50', null, N'244.50')
GO
GO
INSERT INTO SanjeData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'10', N'10', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'273.00', N'273.00', null, N'273.00')
GO
GO
INSERT INTO SanjeData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'11', N'11', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'298.50', N'298.50', null, N'298.50')
GO
GO
INSERT INTO SanjeData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'12', N'12', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'339.70', N'339.70', null, N'339.70')
GO
GO
INSERT INTO SanjeData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'13', N'13', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'406.40', N'406.40', null, N'406.40')
GO
GO
INSERT INTO SanjeData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'14', N'14', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'50.80', N'50.80', null, N'50.80')
GO
GO
INSERT INTO SanjeData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'15', N'15', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'76.20', N'76.20', null, N'76.20')
GO
GO
INSERT INTO SanjeData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'16', N'16', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'101.60', N'101.60', null, N'101.60')
GO
GO
INSERT INTO SanjeData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'17', N'17', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'193.70', N'193.70', null, N'193.70')
GO
GO
INSERT INTO SanjeData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'18', N'18', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'127.00', N'127.00', null, N'127.00')
GO
GO
INSERT INTO SanjeData.[dbo].[RigSize] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [Unitid], [Value]) VALUES (N'19', N'19', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'168.28', N'168.28', null, N'168.28')
GO
GO
SET IDENTITY_INSERT SanjeData.[dbo].[RigSize] OFF
GO

--导入rigsizeType数据
insert into SanjeData.[dbo].RigSizeType(
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

--导入RigStatus数据
SET IDENTITY_INSERT SanjeData.[dbo].[RigStatus] ON
GO
INSERT INTO SanjeData.[dbo].[RigStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'0', N'1', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'None', N'None')
GO
GO
INSERT INTO SanjeData.[dbo].[RigStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'2', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Active', N'Active')
GO
GO
INSERT INTO SanjeData.[dbo].[RigStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'3', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'DownForMaintenance', N'DownForMaintenance')
GO
GO
INSERT INTO SanjeData.[dbo].[RigStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'3', N'4', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'DownForHoldingEquipment', N'DownForHoldingEquipment')
GO
GO
INSERT INTO SanjeData.[dbo].[RigStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'4', N'5', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'DownForWeather', N'DownForWeather')
GO
GO
INSERT INTO SanjeData.[dbo].[RigStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'5', N'6', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'DownForNewLeaseOrLicenses', N'DownForNewLeaseOrLicenses')
GO
GO
INSERT INTO SanjeData.[dbo].[RigStatus] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'6', N'7', N'1', N'0', null, N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Deactivated', N'Deactivated')
GO
GO
SET IDENTITY_INSERT SanjeData.[dbo].[RigStatus] OFF
GO

--SanjelCompany
insert into SanjeData.[dbo].SanjelCompany(
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

--导入ShiftType数据
insert into SanjeData.[dbo].ShiftType(
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
insert into SanjeData.[dbo].ThreadType(
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

--导入UnitOfMeasure数据
insert into SanjeData.[dbo].UnitOfMeasure(
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

--导入UnitOfMeasureSystemOfUnits数据
SET IDENTITY_INSERT SanjeData.[dbo].[UnitOfMeasureSystemOfUnits] ON
GO
INSERT INTO SanjeData.[dbo].[UnitOfMeasureSystemOfUnits] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'0', N'1', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'None', N'None')
GO
GO
INSERT INTO SanjeData.[dbo].[UnitOfMeasureSystemOfUnits] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'2', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Metric', N'Metric units')
GO
GO
INSERT INTO SanjeData.[dbo].[UnitOfMeasureSystemOfUnits] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'3', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'US', N'United States customary units')
GO
GO
SET IDENTITY_INSERT SanjeData.[dbo].[UnitOfMeasureSystemOfUnits] OFF
GO

--导入UnitOfMeasureType数据
SET IDENTITY_INSERT SanjeData.[dbo].[UnitOfMeasureType] ON
GO
INSERT INTO SanjeData.[dbo].[UnitOfMeasureType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'2', N'1', N'0', N'', N'2019-03-27 00:00:00.0000000', N'0', N'2019-03-27 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Length', N'Length')
GO
GO
SET IDENTITY_INSERT SanjeData.[dbo].[UnitOfMeasureType] OFF
GO

--导入WellLocationType数据
SET IDENTITY_INSERT SanjeData.[dbo].[WellLocationType] ON
GO
INSERT INTO SanjeData.[dbo].[WellLocationType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'1', N'1', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'General', N'General')
GO
GO
INSERT INTO SanjeData.[dbo].[WellLocationType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'2', N'2', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'Geo', N'Geo')
GO
GO
INSERT INTO SanjeData.[dbo].[WellLocationType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'3', N'3', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'Torrent', N'Torrent')
GO
GO
INSERT INTO SanjeData.[dbo].[WellLocationType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'4', N'4', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'Usa', N'Usa')
GO
GO
INSERT INTO SanjeData.[dbo].[WellLocationType] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description]) VALUES (N'5', N'5', N'0', N'0', null, N'2019-03-25 00:00:00.0000000', N'1', N'2019-03-25 00:00:00.0000000', N'9999-12-31 23:59:59.0000000', N'0', N'0', N'NTS', N'NTS')
GO
GO
SET IDENTITY_INSERT SanjeData.[dbo].[WellLocationType] OFF
GO

SET IDENTITY_INSERT SanjeData.[dbo].[BlendAdditiveMeasureUnit] ON
GO
INSERT INTO SanjeData.[dbo].[BlendAdditiveMeasureUnit] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [MeaureUnitTypeName], [Abbreviation], [MeaureUnitTypeDescription], [MeaureUnitTypeSystemId], [MeasureUnitSystemDescription], [MeasureUnitSystemId], [MeasureUnitSystemSystemId], [MeaureUnitTypeId], [MeasureUnitSystemName]) VALUES (N'5', N'13', N'1', N'0', N'', N'2008-03-20 15:21:11.0000000', null, N'2016-06-01 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Kilograms', N'', N'Weight', N'kg', N'', N'28', N'', N'1', N'5', N'2', N'Metric')
GO
GO
INSERT INTO SanjeData.[dbo].[BlendAdditiveMeasureUnit] ([id], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [MeaureUnitTypeName], [Abbreviation], [MeaureUnitTypeDescription], [MeaureUnitTypeSystemId], [MeasureUnitSystemDescription], [MeasureUnitSystemId], [MeasureUnitSystemSystemId], [MeaureUnitTypeId], [MeasureUnitSystemName]) VALUES (N'6', N'14', N'1', N'0', N'', N'2008-03-20 15:21:11.0000000', null, N'2016-06-01 00:00:00.0000000', N'9999-12-31 00:00:00.0000000', N'0', N'0', N'Liters', N'', N'Volume', N'l', N'', N'29', N'', N'1', N'5', N'3', N'Metric')
GO
GO
SET IDENTITY_INSERT SanjeData.[dbo].[BlendAdditiveMeasureUnit] OFF
GO

UPDATE SanjeData.[dbo].Bin SET HomeServicePointSystemId = r.system_id,HomeServicePointName = r.name,HomeServicePointDescription = r.description FROM SanjeData.[dbo].Bin e,(SELECT * FROM SanjeData.[dbo].ServicePoint) r WHERE e.HomeServicePointid=r.id;
UPDATE SanjeData.[dbo].Bin SET WorkingServicePointSystemId = r.system_id,WorkingServicePointName = r.name,WorkingServicePointDescription = r.description FROM SanjeData.[dbo].Bin e,(SELECT * FROM SanjeData.[dbo].ServicePoint) r WHERE e.WorkingServicePointid=r.id;
UPDATE SanjeData.[dbo].Bin SET BinTypeSystemId = r.system_id,BinTypeName = r.name,BinTypeDescription = r.description FROM SanjeData.[dbo].Bin e,(SELECT * FROM SanjeData.[dbo].BinType) r WHERE e.BinTypeid=r.id;

UPDATE SanjeData.[dbo].ClientConsultant SET WorkShiftSystemId = r.system_id,WorkShiftName = r.name,WorkShiftDescription = r.description FROM SanjeData.[dbo].ClientConsultant e,(SELECT * FROM SanjeData.[dbo].ShiftType) r WHERE e.WorkShiftid=r.id;

UPDATE SanjeData.[dbo].productHaul SET ProductHaulLifeStatusSystemId = r.system_id,ProductHaulLifeStatusName = r.name,ProductHaulLifeStatusDescription = r.description FROM SanjeData.[dbo].productHaul e,(SELECT * FROM SanjeData.[dbo].ProductHaulStatus) r WHERE e.ProductHaulLifeStatusid=r.id;


UPDATE SanjeData.[dbo].ProductHaulLoad SET ProductHaulLoadLifeStatusid = 0 WHERE ProductHaulLoadLifeStatusid IS NULL;
UPDATE SanjeData.[dbo].ProductHaulLoad SET ProductHaulLoadLifeStatusSystemId = r.system_id,ProductHaulLoadLifeStatusName = r.name,ProductHaulLoadLifeStatusDescription = r.description FROM SanjeData.[dbo].ProductHaulLoad e,(SELECT * FROM SanjeData.[dbo].ProductHaulLoadStatus) r WHERE e.ProductHaulLoadLifeStatusid=r.id;
UPDATE SanjeData.[dbo].ProductHaulLoad SET ServicePointSystemId = r.system_id,ServicePointName = r.name,ServicePointDescription = r.description FROM SanjeData.[dbo].ProductHaulLoad e,(SELECT * FROM SanjeData.[dbo].ServicePoint) r WHERE e.ServicePointid=r.id;
UPDATE SanjeData.[dbo].ProductHaulLoad SET BlendChemicalSystemId = r.system_id,BlendChemicalName = r.name,BlendChemicalDescription = r.description FROM SanjeData.[dbo].ProductHaulLoad e,(SELECT * FROM SanjeData.[dbo].BlendChemical) r WHERE e.BlendChemicalid=r.id;
UPDATE SanjeData.[dbo].ProductHaulLoad SET ProductHaulSystemId = r.system_id,ProductHaulName = r.name,ProductHaulDescription = r.description FROM SanjeData.[dbo].ProductHaulLoad e,(SELECT * FROM SanjeData.[dbo].ProductHaul) r WHERE e.ProductHaulid=r.id;
UPDATE SanjeData.[dbo].ProductHaulLoad SET BlendCategorySystemId = r.system_id,BlendCategoryName = r.name,BlendCategoryDescription = r.description FROM SanjeData.[dbo].ProductHaulLoad e,(SELECT * FROM SanjeData.[dbo].BlendCategory) r WHERE e.BlendCategoryid=r.id;
UPDATE SanjeData.[dbo].ProductHaulLoad SET CustomerSystemId = r.system_id,CustomerName = r.name,CustomerDescription = r.description FROM SanjeData.[dbo].ProductHaulLoad e,(SELECT * FROM SanjeData.[dbo].ClientCompany) r WHERE e.Customerid=r.id;
UPDATE SanjeData.[dbo].ProductHaulLoad SET JobTypeSystemId = r.system_id,JobTypeName = r.name,JobTypeDescription = r.description FROM SanjeData.[dbo].ProductHaulLoad e,(SELECT * FROM SanjeData.[dbo].JobType) r WHERE e.JobTypeid=r.id;
UPDATE SanjeData.[dbo].ProductHaulLoad SET BinSystemId = r.system_id,BinName = r.name,BinDescription = r.description FROM SanjeData.[dbo].ProductHaulLoad e,(SELECT * FROM SanjeData.[dbo].Bin) r WHERE e.Binid=r.id;

UPDATE SanjeData.[dbo].ProductLoadSection SET BlendAdditiveMeasureUnitSystemId = r.system_id,BlendAdditiveMeasureUnitName = r.name,BlendAdditiveMeasureUnitDescription = r.description FROM SanjeData.[dbo].ProductLoadSection e,(SELECT * FROM SanjeData.[dbo].BlendAdditiveMeasureUnit) r WHERE e.BlendAdditiveMeasureUnitid=r.id;
UPDATE SanjeData.[dbo].ProductLoadSection SET BlendChemicalSystemId = r.system_id,BlendChemicalName = r.name,BlendChemicalDescription = r.description FROM SanjeData.[dbo].ProductLoadSection e,(SELECT * FROM SanjeData.[dbo].BlendChemical) r WHERE e.BlendChemicalid=r.id;
UPDATE SanjeData.[dbo].ProductLoadSection SET AdditiveBlendMethodSystemId = r.system_id,AdditiveBlendMethodName = r.name,AdditiveBlendMethodDescription = r.description FROM SanjeData.[dbo].ProductLoadSection e,(SELECT * FROM SanjeData.[dbo].AdditiveBlendMethod) r WHERE e.AdditiveBlendMethodid=r.id;
UPDATE SanjeData.[dbo].ProductLoadSection SET ProductHaulLoadSystemId = r.system_id,ProductHaulLoadName = r.name,ProductHaulLoadDescription = r.description FROM SanjeData.[dbo].ProductLoadSection e,(SELECT * FROM SanjeData.[dbo].ProductHaulLoad) r WHERE e.ProductHaulLoadid=r.id;
UPDATE SanjeData.[dbo].ProductLoadSection SET version=1,modified_user_id=0,operation_type=1;
UPDATE SanjeData.[dbo].ProductLoadSection SET modified_datetime = r.modified_datetime,effective_start_datetime = r.effective_start_datetime,effective_end_datetime = r.effective_end_datetime FROM SanjeData.[dbo].ProductLoadSection e,(SELECT * FROM SanjeData.[dbo].ProductHaulLoad) r WHERE e.ProductHaulLoadid=r.id;

UPDATE SanjeData.[dbo].Rig SET StatusSystemId = r.system_id,StatusName = r.name,StatusDescription = r.description FROM SanjeData.[dbo].Rig e,(SELECT * FROM SanjeData.[dbo].RigStatus) r WHERE e.Statusid=r.id;
UPDATE SanjeData.[dbo].Rig SET DrillingCompanySystemId = r.system_id,DrillingCompanyName = r.name,DrillingCompanyDescription = r.description FROM SanjeData.[dbo].Rig e,(SELECT * FROM SanjeData.[dbo].DrillingCompany) r WHERE e.DrillingCompanyid=r.id;
UPDATE SanjeData.[dbo].Rig SET ThreadTypeSystemId = r.system_id,ThreadTypeName = r.name,ThreadTypeDescription = r.description FROM SanjeData.[dbo].Rig e,(SELECT * FROM SanjeData.[dbo].ThreadType) r WHERE e.ThreadTypeid=r.id;
UPDATE SanjeData.[dbo].Rig SET RigSizeSystemId = r.system_id,RigSizeName = r.name,RigSizeDescription = r.description FROM SanjeData.[dbo].Rig e,(SELECT * FROM SanjeData.[dbo].RigSizeType) r WHERE e.RigSizeid=r.id;
UPDATE SanjeData.[dbo].Rig SET SizeName = r.SIZE_TYPE_VALUE FROM SanjeData.[dbo].Rig e,(SELECT * FROM Eservice6.dbo.RIGS) r WHERE e.id=r.ID;
UPDATE SanjeData.[dbo].Rig SET SizeSystemId = r.system_id,Sizeid = r.id,SizeDescription = r.description FROM SanjeData.[dbo].Rig e,(SELECT * FROM SanjeData.[dbo].RigSize) r WHERE e.SizeName=r.value;

UPDATE SanjeData.[dbo].RigBinSection SET BinSystemId = r.system_id,BinName = r.name,BinDescription = r.description FROM SanjeData.[dbo].RigBinSection e,(SELECT * FROM SanjeData.[dbo].Bin) r WHERE e.Binid=r.id;
UPDATE SanjeData.[dbo].RigBinSection SET RigSystemId = r.system_id,RigName = r.name,RigDescription = r.description FROM SanjeData.[dbo].RigBinSection e,(SELECT * FROM SanjeData.[dbo].Rig) r WHERE e.Rigid=r.id;

UPDATE SanjeData.[dbo].RigJob SET JobTypeSystemId = r.system_id,JobTypeName = r.name,JobTypeDescription = r.description FROM SanjeData.[dbo].RigJob e,(SELECT * FROM SanjeData.[dbo].JobType) r WHERE e.JobTypeid=r.id;
UPDATE SanjeData.[dbo].RigJob SET ClientConsultant1SystemId = r.system_id,ClientConsultant1Name = r.name,ClientConsultant1Description = r.description FROM SanjeData.[dbo].RigJob e,(SELECT * FROM SanjeData.[dbo].ClientConsultant) r WHERE e.ClientConsultant1id=r.id;
UPDATE SanjeData.[dbo].RigJob SET ClientConsultant2SystemId = r.system_id,ClientConsultant2Name = r.name,ClientConsultant2Description = r.description FROM SanjeData.[dbo].RigJob e,(SELECT * FROM SanjeData.[dbo].ClientConsultant) r WHERE e.ClientConsultant2id=r.id;
UPDATE SanjeData.[dbo].RigJob SET WellLocationTypeSystemId = r.system_id,WellLocationTypeName = r.name,WellLocationTypeDescription = r.description FROM SanjeData.[dbo].RigJob e,(SELECT * FROM SanjeData.[dbo].WellLocationType) r WHERE e.WellLocationTypeid=r.id;
UPDATE SanjeData.[dbo].RigJob SET ClientCompanySystemId = r.system_id,ClientCompanyName = r.name,ClientCompanyDescription = r.description FROM SanjeData.[dbo].RigJob e,(SELECT * FROM SanjeData.[dbo].ClientCompany) r WHERE e.ClientCompanyid=r.id;
UPDATE SanjeData.[dbo].RigJob SET RigSystemId = r.system_id,RigName = r.name,RigDescription = r.description FROM SanjeData.[dbo].RigJob e,(SELECT * FROM SanjeData.[dbo].Rig) r WHERE e.Rigid=r.id;
UPDATE SanjeData.[dbo].RigJob SET ServicePointSystemId = r.system_id,ServicePointName = r.name,ServicePointDescription = r.description FROM SanjeData.[dbo].RigJob e,(SELECT * FROM SanjeData.[dbo].ServicePoint) r WHERE e.ServicePointid=r.id;
UPDATE SanjeData.[dbo].RigJob SET JobLifeStatusSystemId = r.system_id,JobLifeStatusName = r.name,JobLifeStatusDescription = r.description FROM SanjeData.[dbo].RigJob e,(SELECT * FROM SanjeData.[dbo].JobLifeStatus) r WHERE e.JobLifeStatusid=r.id;
UPDATE SanjeData.[dbo].RigJob SET RigStatusid=0 WHERE RigStatusid IS NULL AND JobLifeStatusid != 1;
UPDATE SanjeData.[dbo].RigJob SET RigStatusSystemId = r.system_id,RigStatusName = r.name,RigStatusDescription = r.description FROM SanjeData.[dbo].RigJob e,(SELECT * FROM SanjeData.[dbo].RigStatus) r WHERE e.RigStatusid=r.id;

UPDATE SanjeData.[dbo].UnitOfMeasure SET UnitOfMeasureSystemOfUnitsSystemId = r.system_id,UnitOfMeasureSystemOfUnitsName = r.name,UnitOfMeasureSystemOfUnitsDescription = r.description FROM SanjeData.[dbo].UnitOfMeasure e,(SELECT * FROM SanjeData.[dbo].UnitOfMeasureSystemOfUnits) r WHERE e.UnitOfMeasureSystemOfUnitsid=r.id;
UPDATE SanjeData.[dbo].UnitOfMeasure SET SecondaryUnitOfMeasureSystemId = r.system_id,SecondaryUnitOfMeasureName = r.name,SecondaryUnitOfMeasureDescription = r.description FROM SanjeData.[dbo].UnitOfMeasure e,(SELECT * FROM SanjeData.[dbo].UnitOfMeasure) r WHERE e.SecondaryUnitOfMeasureid=r.id;
UPDATE SanjeData.[dbo].UnitOfMeasure SET PrimaryUnitOfMeasureSystemId = r.system_id,PrimaryUnitOfMeasureName = r.name,PrimaryUnitOfMeasureDescription = r.description FROM SanjeData.[dbo].UnitOfMeasure e,(SELECT * FROM SanjeData.[dbo].UnitOfMeasure) r WHERE e.PrimaryUnitOfMeasureid=r.id;



