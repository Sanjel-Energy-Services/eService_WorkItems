Alter table DC_FLAGS rename to DC_FLAGS1

CREATE TABLE DC_FLAGS([id] [INTEGER] PRIMARY KEY AUTOINCREMENT NOT NULL,[entity_status] [INTEGER] NULL,owner_id INTEGER NULL,name [NVARCHAR] NULL,description [NVARCHAR] NULL,TimeStamp ,VERSION ,Value )

INSERT INTO DC_FLAGS (ID, Name, TimeStamp,Value,VERSION)
SELECT ID, Name, TimeStamp, cast(value as integer),VERSION FROM DC_FLAGS1


Alter table ESE_FLAGS rename to ESE_FLAGS1

CREATE TABLE ESE_FLAGS([id] [INTEGER] PRIMARY KEY AUTOINCREMENT NOT NULL,[entity_status] [INTEGER] NULL,owner_id INTEGER NULL,name [NVARCHAR] NULL,description [NVARCHAR] NULL,VALUE ,VERSION ,TIMESTAMP )

INSERT INTO ESE_FLAGS (ID, Name, TimeStamp,Value,VERSION)
SELECT ID, Name, TimeStamp,cast(value as integer),VERSION FROM ESE_FLAGS1


Alter table WITS_SETTING rename to WITS_SETTING1
CREATE TABLE WITS_SETTING([id] [INTEGER] PRIMARY KEY AUTOINCREMENT NOT NULL,[entity_status] [INTEGER] NULL,owner_id INTEGER NULL,name [NVARCHAR] NULL,description [NVARCHAR] NULL,JSON ,VERSION ,TimeStamp )

INSERT INTO WITS_SETTING (VERSION,TimeStamp,JSON)
SELECT VERSION,TimeStamp,JSON from WITS_SETTING1