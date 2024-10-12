

-- alter RIGS by linsee 1/10/2018

ALTER TABLE RIGS ADD IS_Project_RIG NUMBER(1);
update rigs set IS_PROJECT_RIG = 0;

-- alter RIGJob by linsee 1/10/2018

ALTER TABLE RIG_Job ADD IS_Project_RIG NUMBER(1);
update RIG_Job set IS_PROJECT_RIG = 0;
ALTER TABLE RIG_Job ADD IS_SERVICE_RIG NUMBER(1);
update RIG_Job set IS_SERVICE_RIG = 0;

-- Increase CallSheetHeaders table status column width 

alter table callsheet_headers modify status number(2,0);


