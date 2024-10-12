--Fix SD_Users bad data which caused not updated employee object newly created in SESI

update SD_USERS set EMP_ID = 30888, EMP_NAME = 'Hunter, Clayton(30888)' where id = 1001297;
update SD_USERS set EMP_ID = 30888, EMP_NAME = 'Rondeau, Christopher(30946)' where id = 1000073;
update SD_USERS set EMP_ID = 31007, EMP_NAME = 'Hahner, David(31007)' where id = 1000274;
update SD_USERS set EMP_ID = 30991, EMP_NAME = 'Watson, Keith(30991)' where id = 1001509;
update SD_USERS set EMP_ID = 30950, EMP_NAME = 'Forrest, Scott(30950)' where id = 149694;
update SD_USERS set EMP_ID = 11638, EMP_NAME = 'Hanson, Jason(11638)' where id = 148719;

select count(*) from SD_USERS where SANJEL_COMPANY_ID = 2;

select * from SD_USERS SU
where SU.EMP_ID not in 
(select ID from EMPLOYEES EMP);

select * from EMPLOYEES;
-- where id = 24408;

  -- Clean up non eservice group permissions
  delete from SD_GROUP_PERMISSIONS where GROUP_ID in 
  (
  select id from SD_GROUPS where APPLICATION_ID <> 572
  );

  -- Clean up non eservice group users
  delete from SD_GROUP_USERS where GROUP_ID in 
  (
  select id from SD_GROUPS where APPLICATION_ID <> 572
  );

  delete from SD_GROUPS where  APPLICATION_ID <> 572;

  delete from SD_PERMISSIONS where  APPLICATION_ID <> 572;

  delete from SD_SECURED_APPLICATIONS where ID <> 572;

  -- Delete non SESI user group mapping

delete from SD_GROUP_USERS where USER_ID in (
select SU.ID from SD_USERS SU
where SU.EMP_ID not in 
(select ID from EMPLOYEES EMP)
);

-- delete no SESI users
delete from SD_USERS 
where EMP_ID not in 
(select ID from EMPLOYEES EMP);

delete from SD_USERS 
 where EMP_ID is null;

delete from SD_USERS
where EMP_ID  in 
(select id from EMPLOYEES where EFFECTIVE_END_DATE_TIME < GETDATE());

-- delete counties, it is only for usa
Delete  from COUNTIES;

-- Clean up frac, coil tubing price items
delete from PBK_PRICING_ITEMS where SERVICE_CATEGORY_ID in (1006, 1007);
delete from PBK_HEADERS where SERVICE_CATEGORY_ID in (1006, 1007);

-- Clean up terminated items before SESI started
delete from PBK_PRICING_ITEMS where EFFECTIVE_END_DATE_TIME < '2016-06-01';

-- Clean up OSR data
delete from sanjeldata.dbo.ClientConsultant where 
id in (540,1834,1687,1797,533,131,1786,545,1391,1733,1349,1750,1914,154,159,1870,515,1923,177,629,1790,1509,1865,1907,1741,1794,1822,1838,1795,692,544,1922,1836,221,507,611,949,1792,1702,1798,1903,1706,1390,242,1673,1809,258,1699,649,1910,272,1692,989,1878,1871,1392,142,770,1909,535,1724,1740,307,1739,693,313,316,1684,320,1807,690,332,610,1855,1649,1843,1842,344,352,355,674,1874,750,1898,333,1469,1833,678,1845,554,1799,1759,1867,672,1886,564,1726,550,1679,1449,1737,394,1906,508,1921,1810,675,1793,1791,1788,1826,681,496,1913,1806,572,1770,1771,670,1718,1731,1823,1742,1727,438,679,1796,1109,446,673,1749,450,1840,1915,463,1832,101,467,1721,1230,1900,1827,676,555,677,669) ;

