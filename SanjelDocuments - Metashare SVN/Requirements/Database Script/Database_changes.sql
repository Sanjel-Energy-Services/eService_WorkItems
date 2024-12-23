-- Create access_record table
  CREATE TABLE "ESERVICE3"."ACCESS_RECORD" 
   (	
    "ID" NUMBER(10,0), 
	"USER_ID" NUMBER(10,0), 
	"USER_NAME" VARCHAR2(100 BYTE),
	"LOGIN_TIME" DATE, 
	"LOGOUT_TIME" DATE,
	"IS_LOGIN" NUMBER(1),
	"VERSION" NUMBER(6,0) DEFAULT 0, 
	"LAST_MODIFIED_USER_ID" NUMBER(10,0) DEFAULT 0, 
	"LAST_MODIFIED_USER_NAME" VARCHAR2(150 BYTE) DEFAULT '', 
	"LAST_MODIFIED_DATE_TIME" TIMESTAMP (9) DEFAULT SYSTIMESTAMP, 
	"LAST_OPERATION_TYPE" NUMBER(5,0) DEFAULT 0, 
	"EFFECTIVE_START_DATE_TIME" DATE DEFAULT TO_DATE('01-JAN-0001', 'DD-MON-YYYY'), 
	"EFFECTIVE_END_DATE_TIME" DATE DEFAULT TO_DATE('31-DEC-9999', 'DD-MON-YYYY')	
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS_ESERVICE3" ;
  
  CREATE SEQUENCE ESERVICE3.SEQ_ACCESS_RECORD
 START WITH 1
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;
  
 -- create bin assignment table
  CREATE TABLE "ESERVICE3"."BIN_ASSIGNMENT" 
   (	
    "ID" NUMBER(10,0), 
	"BIN_ID" NUMBER(10,0), 
	"BIN_NUMBER" VARCHAR2(100 BYTE),
	"RIG_ID" NUMBER(10,0), 
	"RIG_NAME" VARCHAR2(100 BYTE),
	"VERSION" NUMBER(6,0) DEFAULT 0, 
	"LAST_MODIFIED_USER_ID" NUMBER(10,0) DEFAULT 0, 
	"LAST_MODIFIED_USER_NAME" VARCHAR2(150 BYTE) DEFAULT '', 
	"LAST_MODIFIED_DATE_TIME" TIMESTAMP (9) DEFAULT SYSTIMESTAMP, 
	"LAST_OPERATION_TYPE" NUMBER(5,0) DEFAULT 0, 
	"EFFECTIVE_START_DATE_TIME" DATE DEFAULT TO_DATE('01-JAN-0001', 'DD-MON-YYYY'), 
	"EFFECTIVE_END_DATE_TIME" DATE DEFAULT TO_DATE('31-DEC-9999', 'DD-MON-YYYY')	
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS_ESERVICE3" ;

 CREATE SEQUENCE ESERVICE3.SEQ_BIN_ASSIGNMENT
 START WITH 500
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;
  
-- Update Product_haul table

-----20171211  Bright, refactor bin to associate with rig

alter table PRODUCT_HAUL drop column BIN_SECTION_ID;
alter table PRODUCT_HAUL add(BIN_ID NUMBER(8));
alter table PRODUCT_HAUL add(BIN_NUMBER VARCHAR2(10));

-----20180117  Bright add p

alter table PRODUCT_HAUL add(TRACTOR_UNIT_ID NUMBER(10));
alter table PRODUCT_HAUL add(TRACTOR_UNIT_NUMBER VARCHAR2(50));

-----20180123  Bright 
alter table PRODUCT_HAUL add(IS_THIRD_PARTY NUMBER(1));
alter table PRODUCT_HAUL add(THIRD_PARTY_UNIT_ID NUMBER(10));

-- alter RIGS by linsee 1/10/2018
-- Add rig table column for project rig flag 

ALTER TABLE RIGS ADD IS_Project_RIG NUMBER(1);
update rigs set IS_PROJECT_RIG = 0;

-- alter RIGJob by linsee 1/10/2018
-- Add rig job table columns for service rig and project rig 

ALTER TABLE RIG_Job ADD IS_Project_RIG NUMBER(1);
update RIG_Job set IS_PROJECT_RIG = 0;
ALTER TABLE RIG_Job ADD IS_SERVICE_RIG NUMBER(1);
update RIG_Job set IS_SERVICE_RIG = 0;

-- Increase CallSheetHeaders table status column width 

alter table callsheet_headers modify status number(2,0);

-- alter PRODUCT_HAUL by Bright 1/23/2018

alter table PRODUCT_HAUL add(IS_THIRD_PARTY NUMBER(1));
alter table PRODUCT_HAUL add(THIRD_PARTY_UNIT_ID NUMBER(10));

-- alter PRODUCT_HAUL by Bright 1/24/2018

alter table PRODUCT_HAUL add(SUPPLIER_COMPANY_NAME VARCHAR2(200));
alter table PRODUCT_HAUL add(THIRD_PARTY_UNIT_NUMBER VARCHAR2(100));
alter table PRODUCT_HAUL add(SUPPLIER_CONTACT_NAME VARCHAR2(200));
alter table PRODUCT_HAUL add(SUPPLIER_CONTACT_NUMBER VARCHAR2(20));

-- create CONTRACTOR_COMPANIES table by Bright 1/30/2018

CREATE TABLE "ESERVICE3"."CONTRACTOR_COMPANIES" 
   (	
    "ID" NUMBER(10,0), 
	"NAME" VARCHAR2(200 BYTE),
	"VERSION" NUMBER(6,0) DEFAULT 0, 
	"LAST_MODIFIED_USER_ID" NUMBER(10,0) DEFAULT 0, 
	"LAST_MODIFIED_USER_NAME" VARCHAR2(150 BYTE) DEFAULT '', 
	"LAST_MODIFIED_DATE_TIME" TIMESTAMP (9) DEFAULT SYSTIMESTAMP, 
	"LAST_OPERATION_TYPE" NUMBER(5,0) DEFAULT 0, 
	"EFFECTIVE_START_DATE_TIME" DATE DEFAULT TO_DATE('01-JAN-0001', 'DD-MON-YYYY'), 
	"EFFECTIVE_END_DATE_TIME" DATE DEFAULT TO_DATE('31-DEC-9999', 'DD-MON-YYYY')	
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS_ESERVICE3" ;

 CREATE SEQUENCE ESERVICE3.SEQ_CONTRACTOR_COMPANIES
 START WITH 10100
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;
  
  -- alter Product Haul by Adam 1/30/2018

alter table PRODUCT_HAUL add(SUPPLIER_COMPANY_ID NUMBER(10,0));

  -- alter Rig_job by Linsee 2/2/2018

alter table Rig_job add(Surface_Location VARCHAR2(200));

-- Add rig status to rig_job by Adam 2/5/2018

alter table Rig_job add(RIG_STATUS NUMBER(6,0));

-- Rename to correct spelling
alter table BIN_AS_SIGNMENT rename to BIN_ASSIGNMENT;
rename SEQ_BIN_AS_SIGNMENT to SEQ_BIN_ASSIGNMENT;

  -- Create table ARCHIVE_RIG_JOB By linsee 2/6/2018
create table ARCHIVE_RIG_JOB
(
  id                        NUMBER(10),
  job_alert_id              NUMBER(10),
  call_sheet_number         NUMBER(10),
  job_unique_id             VARCHAR2(100),
  notes                     VARCHAR2(500),
  program_id                VARCHAR2(20),
  job_life_status           NUMBER(6),
  version                   NUMBER(6) default 0,
  last_modified_user_id     NUMBER(10) default 0,
  last_modified_user_name   VARCHAR2(150) default '',
  last_modified_date_time   TIMESTAMP(9) default SYSTIMESTAMP not null,
  last_operation_type       NUMBER(5) default 0,
  effective_start_date_time DATE default TO_DATE('01-JAN-0001', 'DD-MON-YYYY'),
  effective_end_date_time   DATE default TO_DATE('31-DEC-9999', 'DD-MON-YYYY') not null,
  rig_id                    NUMBER(10),
  drillingcompnay_id        NUMBER(10),
  rig_name                  VARCHAR2(50),
  job_date_time             DATE,
  well_location             VARCHAR2(100),
  well_location_type_id     NUMBER(10),
  well_location_type_name   VARCHAR2(50),
  is_downhole_location      NUMBER(1),
  client_company_id         NUMBER(10),
  client_company_shortname  VARCHAR2(200),
  job_type_id               NUMBER(10),
  job_type_name             VARCHAR2(200),
  service_point_id          NUMBER(10),
  service_point_name        VARCHAR2(200),
  is_listed                 NUMBER(1),
  is_high_profile_job       NUMBER(1),
  call_sheet_id             NUMBER(10),
  is_cod_cleared            NUMBER(1),
  is_need_bin               NUMBER(1),
  direction                 VARCHAR2(1000),
  client_consultant1_id     NUMBER(10),
  client_consultant1_name   VARCHAR2(100),
  client_consultant1_cell   VARCHAR2(20),
  client_consultant2_id     NUMBER(10),
  client_consultant2_name   VARCHAR2(100),
  client_consultant2_cell   VARCHAR2(20),
  rig_is_top_drive          NUMBER(1),
  cc_is_cod_customer        NUMBER(1) default 0,
  is_project_rig            NUMBER(1),
  is_service_rig            NUMBER(1),
  SURFACE_LOCATION   		VARCHAR2(200),
  RIG_STATUS				NUMBER(6)
)
tablespace USERS_ESERVICE3
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
  
-- Add PRODUCT_HAUL_ID to CSH_3RD_PARTY_UNIT_SCTNS by Bright 2/6/2018
  
alter table CSH_3RD_PARTY_UNIT_SCTNS add(PRODUCT_HAUL_ID NUMBER(10,0));
  
  -- Delete THIRD_PARTY_UNIT_ID field by Bright 
  
alter table PRODUCT_HAUL drop column THIRD_PARTY_UNIT_ID;

-- Add PRODUCT_HAUL_ID to CSH_UNIT_SCTNS
alter table CSH_UNIT_SCTNS add(PRODUCT_HAUL_ID NUMBER(10,0));

-- Feb 9, 2018: Adam - Add rig fields in job
alter table jobs add(IS_COD_CLEARED NUMBER(1));
alter table jobs add(WLI_RIG_ID NUMBER(10));
alter table jobs add(WLI_RIG_NAME VARCHAR2(100));
alter table jobs add wli_rig_isTopDrive NUMBER(1);

-- Feb 13, 2018 : Adam 
alter table RPT_3RD_PARTY_UNIT_SCTNS add(PRODUCT_HAUL_ID NUMBER(10,0));

alter table RPT_3RD_PARTY_UNIT_SCTNS modify PRODUCT_HAUL_ID default 0;



-- alter table PRODUCT_HAUL by linsee 2/24/2018

alter table PRODUCT_HAUL add(Copilot_Id NUMBER(10,0));
alter table PRODUCT_HAUL add(Copilot_FName VARCHAR2(50 BYTE));
alter table PRODUCT_HAUL add(Copilot_MName VARCHAR2(50 BYTE));
alter table PRODUCT_HAUL add(Copilot_LName VARCHAR2(50 BYTE));

-- alter table Product_haul by linsee 2/27/2018

alter table PRODUCT_HAUL rename column Copilot_Id to Driver2_Id;
alter table PRODUCT_HAUL rename column Copilot_FName to Driver2_FName;
alter table PRODUCT_HAUL rename column Copilot_MName to Driver2_MName;
alter table PRODUCT_HAUL rename column Copilot_LName to Driver2_LName;

-- alter consultants cell field to save two phone numbers.

alter table callsheet_headers modify fc_alert_by_consultant1_cell VARCHAR2(30);

alter table callsheet_headers modify fc_alert_by_consultant2_cell VARCHAR2(30);
alter table callsheet_headers modify cif_callout_consultant_cell VARCHAR2(30);

alter table rig_job modify client_consultant1_cell VARCHAR2(30);
alter table rig_job modify client_consultant2_cell VARCHAR2(30);


--PHASE TWO

-- Adam 6/1/2018 -- bright 5/28/2018

alter table PRODUCT_HAUL add (PRODUCT_HAUL_LIFE_STATUS number(6,0));
--alter table PRODUCT_HAUL rename column GO_WITH_CREW to IS_GO_WITH_CREW;

 
-- alter table PRODUCT_HAUL by Bright 4/20/2018
-- Updated on 6/1/2018

alter table PRODUCT_HAUL add(IS_GO_WITH_CREW NUMBER(1));


-- Product_Haul_LIFE_STATUS need to assign value to be compatible with new version of application
-- Old data only have two status, schedule and on location

Update product_haul set PRODUCT_HAUL_LIFE_STATUS = 1 where IS_ON_LOCATION = 0;
Update product_haul set PRODUCT_HAUL_LIFE_STATUS = 2 where IS_ON_LOCATION = 1;

-- If IS_ON_LOCATION is null, the data needs to be cleaned up. Set status as empty.
Update product_haul set PRODUCT_HAUL_LIFE_STATUS = 0 where IS_ON_LOCATION is null;
update product_haul set IS_GO_WITH_CREW = 0;


--Adam 6/1/2018 UPdated: Create table PRODUCT_HAUL_LOAD by Bright 4/23/2018

CREATE TABLE ESERVICE3.PH_PRODUCT_HAUL_LOAD_SCTNS
(
  ID                          NUMBER(10),
  ROOT_ID             		  NUMBER(10),
  PARENT_ID             	  NUMBER(10),
  CALL_SHEET_NUMBER           NUMBER(10),
  JOB_TYPE_ID                 NUMBER(10),
  JOB_TYPE_NAME               VARCHAR2(50 BYTE),
  JOB_DATE                    DATE,
  LOAD_SHEET_SERIAL_NUMBER    VARCHAR2(100 BYTE),
  MIX_WATER                   NUMBER(10,3),
  BASE_BLEND_WEIGHT           NUMBER(10,3),
  TOTAL_BLEND_WEIGHT          NUMBER(10,3),
  BLEND_CATEGORY_ID           NUMBER(10),
  BLEND_CATEGORY_NAME         VARCHAR2(50 BYTE),
  BLEND_CHEMICAL_DESCRIPTION  VARCHAR2(500 BYTE),
  BASE_BLEND_CHEMICAL_ID      NUMBER(10),
  BASE_BLEND_CHEMICAL_NAME    VARCHAR2(50 BYTE),
  BLEND_SECTION_ID            NUMBER(10),
  COMMENTS                    VARCHAR2(500 BYTE),
  SERVICE_POINT_ID            NUMBER(10),
  SERVICE_POINT_NAME          VARCHAR2(100 BYTE),
  IS_TOTAL_BLEND_TONNAGE      NUMBER(1),
  IS_ON_LOCATION              NUMBER(1),
  BIN_ID                      NUMBER(8),
  BIN_NUMBER                  VARCHAR2(10 BYTE),
  WELL_LOCATION               VARCHAR2(100 BYTE),
  CUSTOMER_COMPANY_ID         NUMBER(10),
  CUSTOMER_COMPANY_NAME       VARCHAR2(100 BYTE),
  EXPECTED_ON_LOCATION_TIME   DATE,
  ON_LOCATION_TIME            DATE,
  IS_GO_WITH_CREW                NUMBER(1),
  PRODUCT_HAUL_LOAD_LIFE_STATUS number(6,0),
  VERSION                     NUMBER(6)         DEFAULT 0,
  LAST_MODIFIED_USER_ID       NUMBER(10)        DEFAULT 0,
  LAST_MODIFIED_USER_NAME     VARCHAR2(150 BYTE) DEFAULT '',
  LAST_MODIFIED_DATE_TIME     TIMESTAMP(9)      DEFAULT SYSTIMESTAMP          NOT NULL,
  LAST_OPERATION_TYPE         NUMBER(5)         DEFAULT 0,
  EFFECTIVE_START_DATE_TIME   DATE              DEFAULT TO_DATE('01-JAN-0001', 'DD-MON-YYYY'),
  EFFECTIVE_END_DATE_TIME     DATE              DEFAULT TO_DATE('31-DEC-9999', 'DD-MON-YYYY') NOT NULL
);

alter table PH_PRODUCT_HAUL_LOAD_SCTNS add constraint PRODUCT_HAUL_LOAD_ID_PK primary key (ID) ;

alter table PH_PRODUCT_HAUL_LOAD_SCTNS add constraint PRODUCT_HAUL_LOAD_PH_ID_FK foreign key (ROOT_ID) references PRODUCT_HAUL(ID) ;

CREATE SEQUENCE ESERVICE3.SEQ_PRODUCT_HAUL_LOAD
 START WITH 2000
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;

-- Adam 6/1/2018 Updated. Convert data from ProductHaul to ProductHaulLoad by Bright 4/23/2018
  
insert into PH_PRODUCT_HAUL_LOAD_SCTNS (ID,ROOT_ID,PARENT_ID,CALL_SHEET_NUMBER,JOB_TYPE_ID,JOB_TYPE_NAME,JOB_DATE,LOAD_SHEET_SERIAL_NUMBER,MIX_WATER,
BASE_BLEND_WEIGHT,TOTAL_BLEND_WEIGHT,BLEND_CATEGORY_ID,BLEND_CATEGORY_NAME,BLEND_CHEMICAL_DESCRIPTION,BASE_BLEND_CHEMICAL_ID,
BASE_BLEND_CHEMICAL_NAME,BLEND_SECTION_ID,COMMENTS,SERVICE_POINT_ID,
SERVICE_POINT_NAME,IS_TOTAL_BLEND_TONNAGE,IS_ON_LOCATION,BIN_ID,BIN_NUMBER,WELL_LOCATION,CUSTOMER_COMPANY_ID,CUSTOMER_COMPANY_NAME,EXPECTED_ON_LOCATION_TIME,ON_LOCATION_TIME,
IS_GO_WITH_CREW, PRODUCT_HAUL_LOAD_LIFE_STATUS, VERSION,LAST_MODIFIED_USER_ID,LAST_MODIFIED_USER_NAME,LAST_MODIFIED_DATE_TIME,LAST_OPERATION_TYPE,EFFECTIVE_START_DATE_TIME,EFFECTIVE_END_DATE_TIME) 
(select Id,Id,Id,CALL_SHEET_NUMBER,JOB_TYPE_ID,JOB_TYPE_NAME,JOB_DATE,LOAD_SHEET_SERIAL_NUMBER,MIX_WATER,
BASE_BLEND_WEIGHT,TOTAL_BLEND_WEIGHT,BLEND_CATEGORY_ID,BLEND_CATEGORY_NAME,BLEND_CHEMICAL_DESCRIPTION,BASE_BLEND_CHEMICAL_ID,
BASE_BLEND_CHEMICAL_NAME,BLEND_SECTION_ID,COMMENTS,SERVICE_POINT_ID,SERVICE_POINT_NAME,IS_TOTAL_BLEND_TONNAGE,IS_ON_LOCATION,BIN_ID,BIN_NUMBER,
WELL_LOCATION,CUSTOMER_COMPANY_ID,CUSTOMER_COMPANY_NAME,EXPECTED_ON_LOCATION_TIME,ON_LOCATION_TIME,IS_GO_WITH_CREW,PRODUCT_HAUL_LIFE_STATUS,VERSION,LAST_MODIFIED_USER_ID,LAST_MODIFIED_USER_NAME,
LAST_MODIFIED_DATE_TIME,LAST_OPERATION_TYPE,EFFECTIVE_START_DATE_TIME,EFFECTIVE_END_DATE_TIME from  PRODUCT_HAUL);

-- Modify constraint by bright 4/24/2018

alter table PH_PRODUCT_LOAD_SCTNS drop constraint PH_PRODUCT_LOAD_SCTNS_PH_ID_FK;
 
alter table PH_PRODUCT_LOAD_SCTNS add constraint PH_PRODUCT_LOAD_SCTNS_PL_ID_FK foreign key (PARENT_ID) references PH_PRODUCT_HAUL_LOAD_SCTNS(ID) ;

alter table PH_PRODUCT_LOAD_SCTNS add constraint PH_PRODUCT_LOAD_SCTNS_PH_ID_FK foreign key (ROOT_ID) references PRODUCT_HAUL(ID) ;

-- Adam 6/1/2018 -- bright 5/28/2018
--alter table PH_PRODUCT_HAUL_LOAD_SCTNS add (PRODUCT_HAUL_LOAD_LIFE_STATUS number(6,0));
-- alter table PH_PRODUCT_HAUL_LOAD_SCTNS rename column GO_WITH_CREW to IS_GO_WITH_CREW;
-- Added to create table Script


--Adam 06/13/2018 -- Deploy to production.


-- bright 7/5/2018

CREATE TABLE "JOB_TAG" (
"ID"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"JOB_UNIQUE_ID"  TEXT,
"VERSION"  INTEGER,
"JOB_START_TIME"  datetime,
"JOB_END_TIME"  datetime,
"IS_CURRENT_JOB"  INTEGER,
"JOB_MONITOR_SETTING" TEXT
);

-- bright 12/6/2018
ALTER TABLE PUMPING_SERVICE_LINE_SECTIONS ADD RE_IS_WITS_BOX BIT;



-- colin 02/27/2018
CREW_ID

ALTER TABLE PRODUCT_HAUL ADD CREW_ID INTEGER;
ALTER TABLE CSH_UNIT_SCTNS ADD CREW_ID INTEGER;

ALTER TABLE CSH_3RD_PARTY_UNIT_SCTNS ADD CREW_ID INTEGER;