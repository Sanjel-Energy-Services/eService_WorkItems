/* update  PUMP_BLEND_SCTNS  by linsee 11/3/2017*/

alter table PUMP_BLEND_SCTNS add IS_NEEd_HUAL NUMBER(1);

/* The blend section is reused across all applications, same column should be added to their tables. by Adam 11/16/2017*/

alter table PRG_BLEND_SCTNS add IS_NEEd_HUAL NUMBER(1);
alter table PSPT_BLEND_SCTNS add IS_NEEd_HUAL NUMBER(1);
