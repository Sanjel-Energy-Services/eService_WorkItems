-----20171211  Bright 

alter table PRODUCT_HAUL drop column BIN_SECTION_ID;
alter table PRODUCT_HAUL add(BIN_ID NUMBER(8));
alter table PRODUCT_HAUL add(BIN_NUMBER VARCHAR2(10));

-----20180117  Bright 

alter table PRODUCT_HAUL add(TRACTOR_UNIT_ID NUMBER(10));
alter table PRODUCT_HAUL add(TRACTOR_UNIT_NUMBER VARCHAR2(50));

-----20180123  Bright 
alter table PRODUCT_HAUL add(IS_THIRD_PARTY NUMBER(1));
alter table PRODUCT_HAUL add(THIRD_PARTY_UNIT_ID NUMBER(10));