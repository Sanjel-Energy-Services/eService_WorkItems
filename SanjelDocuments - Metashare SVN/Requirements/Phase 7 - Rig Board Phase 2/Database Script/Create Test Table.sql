-- Create table
create table TEST_RIG_JOB
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
  is_service_rig            NUMBER(1)
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

  
  -- Create table
create table TEST_ARCHIVE_RIG_JOB
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
  is_service_rig            NUMBER(1)
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

  
  