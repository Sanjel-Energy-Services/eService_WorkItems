/* Add product haul reference to all across the process. by Adam 12/4/2017*/

alter table CSH_UNIT_SCTNS add PRODUCT_HAUL_ID NUMBER(10);
alter table RPT_UNIT_SCTNS add PRODUCT_HAUL_ID NUMBER(10);
