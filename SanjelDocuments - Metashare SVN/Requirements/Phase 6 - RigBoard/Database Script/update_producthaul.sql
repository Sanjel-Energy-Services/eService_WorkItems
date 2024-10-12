
-----20171127  Linsee

alter table PRODUCT_HAUL add(Is_On_Location NUMBER(1));
alter table PRODUCT_HAUL add(On_Location_Time DATE);


-----20171127  Bright

alter table PRODUCT_HAUL add(DRIVER_ID NUMBER(10));
alter table PRODUCT_HAUL add(BULK_UNIT_ID NUMBER(10));
alter table PRODUCT_HAUL add(BULK_UNIT_NUMBER VARCHAR2(50));
alter table PRODUCT_HAUL add(BIN_SECTION_ID NUMBER(10));
alter table PRODUCT_HAUL add(Expected_On_Location_Time DATE);

-----20171205  Bright add new fields

alter table PRODUCT_HAUL add(DRIVER_FNAME VARCHAR2(50));
alter table PRODUCT_HAUL add(DRIVER_MNAME VARCHAR2(50));
alter table PRODUCT_HAUL add(DRIVER_LNAME VARCHAR2(50));

