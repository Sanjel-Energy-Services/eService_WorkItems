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