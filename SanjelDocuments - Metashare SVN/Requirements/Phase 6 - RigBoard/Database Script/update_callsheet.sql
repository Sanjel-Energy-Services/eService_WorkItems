/* update  CALLSHEET_HEADERS  by Oliver 11/6/2017*/
alter table callsheet_headers add(IS_COD_CLEARED NUMBER(1));
alter table callsheet_headers add(WLI_RIG_ID NUMBER(10));
alter table callsheet_headers add(WLI_RIG_NAME VARCHAR2(100));



/* update  CALLSHEET_HEADERS  by linsee 11/7/2017*/

alter table CALLSHEET_HEADERS add Is_Need_Bin NUMBER(1);
alter table CALLSHEET_HEADERS add Number_Of_Bin NUMBER(10);

alter table CALLSHEET_HEADERS add CIF_CALLOUT_CONSULTANT_ID NUMBER(10);
alter table CALLSHEET_HEADERS add FC_ALERT_BY_CONSULTANT1_ID NUMBER(10);
alter table CALLSHEET_HEADERS add FC_ALERT_BY_CONSULTANT2_ID NUMBER(10);


/* update  CALLSHEET_HEADERS  by Oliver 11/15/2017*/

--alter table CALLSHEET_HEADERS drop column  FC_CLIENT_CONSULTANT1_ID;
--alter table CALLSHEET_HEADERS drop column  FC_CLIENT_CONSULTANT2_ID;
--alter table CALLSHEET_HEADERS drop column  CIF_CLIENT_CONSULTANT_ID;

/* update  CALLSHEET_HEADERS  by Oliver 11/16/2017*/

alter table CALLSHEET_HEADERS add CIF_CALL_CREW_DATE_TIME DATE;
alter table CALLSHEET_HEADERS add CIF_IS_THIS_CALL_MADE NUMBER(1);

alter table CALLSHEET_HEADERS add wli_rig_isTopDrive NUMBER(1);