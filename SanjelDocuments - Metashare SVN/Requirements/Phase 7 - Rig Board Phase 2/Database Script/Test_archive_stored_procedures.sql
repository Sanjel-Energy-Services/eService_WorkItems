-- Step 1,execute the create database table script(Create Test Table. SQL).
-- Execute the script to create stored procedures and methods.
-- Step 2,add test data to the TEST_RIG_JOB and Rigs table.

delete from rigs where id in (686,687,688);
--Inactive rig
insert into RIGS (ID, NAME, RIG_NO, DRILLINGCOMPANY_ID, DRILLINGCOMPANY_NAME, STATUS, IS_SERVICE_RIG, IS_DELETED, IS_TOP_DRIVE, SIZE_TYPE_VALUE, SIZE_TYPE_UNIT, RIG_SIZE_TYPE_ID, RIG_SIZE_TYPE_NAME, THREAD_TYPE_ID, THREAD_TYPE_NAME, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME, IS_PROJECT_RIG)
values (686, '20171205', '197', 30012, 'Concord Well Servicing', 6, 0, 0, 0, 0.000, null, null, null, null, null, 1, 0, null, '16-JAN-18 03.17.38.000000000 PM', 1, to_date('01-01-0001', 'dd-mm-yyyy'), to_date('31-12-9999 23:59:59', 'dd-mm-yyyy hh24:mi:ss'), 0);

--Not inactive rig.
insert into RIGS (ID, NAME, RIG_NO, DRILLINGCOMPANY_ID, DRILLINGCOMPANY_NAME, STATUS, IS_SERVICE_RIG, IS_DELETED, IS_TOP_DRIVE, SIZE_TYPE_VALUE, SIZE_TYPE_UNIT, RIG_SIZE_TYPE_ID, RIG_SIZE_TYPE_NAME, THREAD_TYPE_ID, THREAD_TYPE_NAME, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME, IS_PROJECT_RIG)
values (687, '20171206', '198', 30012, 'Concord Well Servicing', 0, 0, 0, 0, 0.000, null, null, null, null, null, 1, 0, null, '16-JAN-18 03.17.38.000000000 PM', 1, to_date('01-01-0001', 'dd-mm-yyyy'), to_date('31-12-9999 23:59:59', 'dd-mm-yyyy hh24:mi:ss'), 0);

insert into RIGS (ID, NAME, RIG_NO, DRILLINGCOMPANY_ID, DRILLINGCOMPANY_NAME, STATUS, IS_SERVICE_RIG, IS_DELETED, IS_TOP_DRIVE, SIZE_TYPE_VALUE, SIZE_TYPE_UNIT, RIG_SIZE_TYPE_ID, RIG_SIZE_TYPE_NAME, THREAD_TYPE_ID, THREAD_TYPE_NAME, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME, IS_PROJECT_RIG)
values (688, '20171207', '199', 30012, 'Concord Well Servicing', 0, 0, 0, 0, 0.000, null, null, null, null, null, 1, 0, null, '16-JAN-18 03.17.38.000000000 PM', 1, to_date('01-01-0001', 'dd-mm-yyyy'), to_date('31-12-9999 23:59:59', 'dd-mm-yyyy hh24:mi:ss'), 0);



--Rigjob for inactive rig. 
insert into TEST_RIG_JOB (ID, JOB_ALERT_ID, CALL_SHEET_NUMBER, JOB_UNIQUE_ID, NOTES, PROGRAM_ID, JOB_LIFE_STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME, RIG_ID, DRILLINGCOMPNAY_ID, RIG_NAME, JOB_DATE_TIME, WELL_LOCATION, WELL_LOCATION_TYPE_ID, WELL_LOCATION_TYPE_NAME, IS_DOWNHOLE_LOCATION, CLIENT_COMPANY_ID, CLIENT_COMPANY_SHORTNAME, JOB_TYPE_ID, JOB_TYPE_NAME, SERVICE_POINT_ID, SERVICE_POINT_NAME, IS_LISTED, IS_HIGH_PROFILE_JOB, CALL_SHEET_ID, IS_COD_CLEARED, IS_NEED_BIN, DIRECTION, CLIENT_CONSULTANT1_ID, CLIENT_CONSULTANT1_NAME, CLIENT_CONSULTANT1_CELL, CLIENT_CONSULTANT2_ID, CLIENT_CONSULTANT2_NAME, CLIENT_CONSULTANT2_CELL, RIG_IS_TOP_DRIVE, CC_IS_COD_CUSTOMER, IS_PROJECT_RIG, IS_SERVICE_RIG)
values (1, 0, 1061481, null, null, 'PRG1116001', 7, 0, 0, null, '04-DEC-17 11.37.10.815000000 AM', 0, to_date('01-01-0001', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 686, null, '20171205', to_date('01-12-2017 15:51:00', 'dd-mm-yyyy hh24:mi:ss'), '32431441111', 1, 'General', 0, 4208, 'Shell', 4283, 'Aband Squeeze', 45, 'Buffalo', 1, 0, 1067181, 0, 0, '222332121', 104, '89757', '13000000000', 261, '20171205', null, 0, 0, null, null);

--Rig status is not inactive and rigjob is not Pending.

insert into TEST_RIG_JOB (ID, JOB_ALERT_ID, CALL_SHEET_NUMBER, JOB_UNIQUE_ID, NOTES, PROGRAM_ID, JOB_LIFE_STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME, RIG_ID, DRILLINGCOMPNAY_ID, RIG_NAME, JOB_DATE_TIME, WELL_LOCATION, WELL_LOCATION_TYPE_ID, WELL_LOCATION_TYPE_NAME, IS_DOWNHOLE_LOCATION, CLIENT_COMPANY_ID, CLIENT_COMPANY_SHORTNAME, JOB_TYPE_ID, JOB_TYPE_NAME, SERVICE_POINT_ID, SERVICE_POINT_NAME, IS_LISTED, IS_HIGH_PROFILE_JOB, CALL_SHEET_ID, IS_COD_CLEARED, IS_NEED_BIN, DIRECTION, CLIENT_CONSULTANT1_ID, CLIENT_CONSULTANT1_NAME, CLIENT_CONSULTANT1_CELL, CLIENT_CONSULTANT2_ID, CLIENT_CONSULTANT2_NAME, CLIENT_CONSULTANT2_CELL, RIG_IS_TOP_DRIVE, CC_IS_COD_CUSTOMER, IS_PROJECT_RIG, IS_SERVICE_RIG)
values (2, 0, 1061481, null, null, 'PRG1116001', 8, 0, 0, null, '04-DEC-17 11.37.10.815000000 AM', 0, to_date('01-01-0001', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 687, null, '20171206', to_date('01-12-2017 15:51:00', 'dd-mm-yyyy hh24:mi:ss'), '32431441111', 1, 'General', 0, 4208, 'Shell', 4283, 'Aband Squeeze', 45, 'Buffalo', 1, 0, 1067181, 0, 0, '222332121', 104, '89757', '13000000000', 261, '20171205', null, 0, 0, null, null);

insert into TEST_RIG_JOB (ID, JOB_ALERT_ID, CALL_SHEET_NUMBER, JOB_UNIQUE_ID, NOTES, PROGRAM_ID, JOB_LIFE_STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME, RIG_ID, DRILLINGCOMPNAY_ID, RIG_NAME, JOB_DATE_TIME, WELL_LOCATION, WELL_LOCATION_TYPE_ID, WELL_LOCATION_TYPE_NAME, IS_DOWNHOLE_LOCATION, CLIENT_COMPANY_ID, CLIENT_COMPANY_SHORTNAME, JOB_TYPE_ID, JOB_TYPE_NAME, SERVICE_POINT_ID, SERVICE_POINT_NAME, IS_LISTED, IS_HIGH_PROFILE_JOB, CALL_SHEET_ID, IS_COD_CLEARED, IS_NEED_BIN, DIRECTION, CLIENT_CONSULTANT1_ID, CLIENT_CONSULTANT1_NAME, CLIENT_CONSULTANT1_CELL, CLIENT_CONSULTANT2_ID, CLIENT_CONSULTANT2_NAME, CLIENT_CONSULTANT2_CELL, RIG_IS_TOP_DRIVE, CC_IS_COD_CUSTOMER, IS_PROJECT_RIG, IS_SERVICE_RIG)
values (3, 0, 1061481, null, null, 'PRG1116001', 8, 0, 0, null, '04-DEC-17 11.37.10.815000000 AM', 0, to_date('01-01-0001', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 687, null, '20171206', to_date('01-12-2017 15:51:00', 'dd-mm-yyyy hh24:mi:ss'), '32431441111', 1, 'General', 0, 4208, 'Shell', 4283, 'Aband Squeeze', 45, 'Buffalo', 0, 0, 1067181, 0, 0, '222332121', 104, '89757', '13000000000', 261, '20171205', null, 0, 0, null, null);
insert into TEST_RIG_JOB (ID, JOB_ALERT_ID, CALL_SHEET_NUMBER, JOB_UNIQUE_ID, NOTES, PROGRAM_ID, JOB_LIFE_STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME, RIG_ID, DRILLINGCOMPNAY_ID, RIG_NAME, JOB_DATE_TIME, WELL_LOCATION, WELL_LOCATION_TYPE_ID, WELL_LOCATION_TYPE_NAME, IS_DOWNHOLE_LOCATION, CLIENT_COMPANY_ID, CLIENT_COMPANY_SHORTNAME, JOB_TYPE_ID, JOB_TYPE_NAME, SERVICE_POINT_ID, SERVICE_POINT_NAME, IS_LISTED, IS_HIGH_PROFILE_JOB, CALL_SHEET_ID, IS_COD_CLEARED, IS_NEED_BIN, DIRECTION, CLIENT_CONSULTANT1_ID, CLIENT_CONSULTANT1_NAME, CLIENT_CONSULTANT1_CELL, CLIENT_CONSULTANT2_ID, CLIENT_CONSULTANT2_NAME, CLIENT_CONSULTANT2_CELL, RIG_IS_TOP_DRIVE, CC_IS_COD_CUSTOMER, IS_PROJECT_RIG, IS_SERVICE_RIG)
values (4, 0, 1061481, null, null, 'PRG1116001', 8, 0, 0, null, '04-DEC-17 11.37.10.815000000 AM', 0, to_date('01-01-0001', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 687, null, '20171206', to_date('01-12-2017 15:51:00', 'dd-mm-yyyy hh24:mi:ss'), '32431441111', 1, 'General', 0, 4208, 'Shell', 4283, 'Aband Squeeze', 45, 'Buffalo', 0, 0, 1067181, 0, 0, '222332121', 104, '89757', '13000000000', 261, '20171205', null, 0, 0, null, null);



--Rig status is not inactive and rigjob is Pending.

insert into TEST_RIG_JOB (ID, JOB_ALERT_ID, CALL_SHEET_NUMBER, JOB_UNIQUE_ID, NOTES, PROGRAM_ID, JOB_LIFE_STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME, RIG_ID, DRILLINGCOMPNAY_ID, RIG_NAME, JOB_DATE_TIME, WELL_LOCATION, WELL_LOCATION_TYPE_ID, WELL_LOCATION_TYPE_NAME, IS_DOWNHOLE_LOCATION, CLIENT_COMPANY_ID, CLIENT_COMPANY_SHORTNAME, JOB_TYPE_ID, JOB_TYPE_NAME, SERVICE_POINT_ID, SERVICE_POINT_NAME, IS_LISTED, IS_HIGH_PROFILE_JOB, CALL_SHEET_ID, IS_COD_CLEARED, IS_NEED_BIN, DIRECTION, CLIENT_CONSULTANT1_ID, CLIENT_CONSULTANT1_NAME, CLIENT_CONSULTANT1_CELL, CLIENT_CONSULTANT2_ID, CLIENT_CONSULTANT2_NAME, CLIENT_CONSULTANT2_CELL, RIG_IS_TOP_DRIVE, CC_IS_COD_CUSTOMER, IS_PROJECT_RIG, IS_SERVICE_RIG)
values (5, 0, 1061481, null, null, 'PRG1116001', 2, 0, 0, null, '04-DEC-17 11.37.10.815000000 AM', 0, to_date('01-01-0001', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 688, null, '20171207', to_date('01-12-2017 15:51:00', 'dd-mm-yyyy hh24:mi:ss'), '32431441111', 1, 'General', 0, 4208, 'Shell', 4283, 'Aband Squeeze', 45, 'Buffalo', 1, 0, 1067181, 0, 0, '222332121', 104, '89757', '13000000000', 261, '20171205', null, 0, 0, null, null);
insert into TEST_RIG_JOB (ID, JOB_ALERT_ID, CALL_SHEET_NUMBER, JOB_UNIQUE_ID, NOTES, PROGRAM_ID, JOB_LIFE_STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME, RIG_ID, DRILLINGCOMPNAY_ID, RIG_NAME, JOB_DATE_TIME, WELL_LOCATION, WELL_LOCATION_TYPE_ID, WELL_LOCATION_TYPE_NAME, IS_DOWNHOLE_LOCATION, CLIENT_COMPANY_ID, CLIENT_COMPANY_SHORTNAME, JOB_TYPE_ID, JOB_TYPE_NAME, SERVICE_POINT_ID, SERVICE_POINT_NAME, IS_LISTED, IS_HIGH_PROFILE_JOB, CALL_SHEET_ID, IS_COD_CLEARED, IS_NEED_BIN, DIRECTION, CLIENT_CONSULTANT1_ID, CLIENT_CONSULTANT1_NAME, CLIENT_CONSULTANT1_CELL, CLIENT_CONSULTANT2_ID, CLIENT_CONSULTANT2_NAME, CLIENT_CONSULTANT2_CELL, RIG_IS_TOP_DRIVE, CC_IS_COD_CUSTOMER, IS_PROJECT_RIG, IS_SERVICE_RIG)
values (6, 0, 1061481, null, null, 'PRG1116001', 8, 0, 0, null, '04-DEC-17 11.37.10.815000000 AM', 0, to_date('01-01-0001', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 688, null, '20171207', to_date('01-12-2017 15:51:00', 'dd-mm-yyyy hh24:mi:ss'), '32431441111', 1, 'General', 0, 4208, 'Shell', 4283, 'Aband Squeeze', 45, 'Buffalo', 0, 0, 1067181, 0, 0, '222332121', 104, '89757', '13000000000', 261, '20171205', null, 0, 0, null, null);
insert into TEST_RIG_JOB (ID, JOB_ALERT_ID, CALL_SHEET_NUMBER, JOB_UNIQUE_ID, NOTES, PROGRAM_ID, JOB_LIFE_STATUS, VERSION, LAST_MODIFIED_USER_ID, LAST_MODIFIED_USER_NAME, LAST_MODIFIED_DATE_TIME, LAST_OPERATION_TYPE, EFFECTIVE_START_DATE_TIME, EFFECTIVE_END_DATE_TIME, RIG_ID, DRILLINGCOMPNAY_ID, RIG_NAME, JOB_DATE_TIME, WELL_LOCATION, WELL_LOCATION_TYPE_ID, WELL_LOCATION_TYPE_NAME, IS_DOWNHOLE_LOCATION, CLIENT_COMPANY_ID, CLIENT_COMPANY_SHORTNAME, JOB_TYPE_ID, JOB_TYPE_NAME, SERVICE_POINT_ID, SERVICE_POINT_NAME, IS_LISTED, IS_HIGH_PROFILE_JOB, CALL_SHEET_ID, IS_COD_CLEARED, IS_NEED_BIN, DIRECTION, CLIENT_CONSULTANT1_ID, CLIENT_CONSULTANT1_NAME, CLIENT_CONSULTANT1_CELL, CLIENT_CONSULTANT2_ID, CLIENT_CONSULTANT2_NAME, CLIENT_CONSULTANT2_CELL, RIG_IS_TOP_DRIVE, CC_IS_COD_CUSTOMER, IS_PROJECT_RIG, IS_SERVICE_RIG)
values (7, 0, 1061481, null, null, 'PRG1116001', 8, 0, 0, null, '04-DEC-17 11.37.10.815000000 AM', 0, to_date('01-01-0001', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 688, null, '20171207', to_date('01-12-2017 15:51:00', 'dd-mm-yyyy hh24:mi:ss'), '32431441111', 1, 'General', 0, 4208, 'Shell', 4283, 'Aband Squeeze', 45, 'Buffalo', 0, 0, 1067181, 0, 0, '222332121', 104, '89757', '13000000000', 261, '20171205', null, 0, 0, null, null);


--Step 3,Running stored procedure.
call proc_archiverigjob();