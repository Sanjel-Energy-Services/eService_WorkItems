Declare @nowdate datetime;
set @nowdate = GETDATE();
Begin;
update sanjeldata.dbo.ClientConsultant set effective_end_datetime = @nowdate where 
id in (540,1834,1687,1797,533,131,1786,545,1391,1733,1349,1750,1914,154,159,1870,515,1923,177,629,1790,1509,1865,1907,1741,1794,1822,1838,1795,692,544,1922,1836,221,507,611,949,1792,1702,1798,1903,1706,1390,242,1673,1809,258,1699,649,1910,272,1692,989,1878,1871,1392,142,770,1909,535,1724,1740,307,1739,693,313,316,1684,320,1807,690,332,610,1855,1649,1843,1842,344,352,355,674,1874,750,1898,333,1469,1833,678,1845,554,1799,1759,1867,672,1886,564,1726,550,1679,1449,1737,394,1906,508,1921,1810,675,1793,1791,1788,1826,681,496,1913,1806,572,1770,1771,670,1718,1731,1823,1742,1727,438,679,1796,1109,446,673,1749,450,1840,1915,463,1832,101,467,1721,1230,1900,1827,676,555,677,669) 
and effective_end_datetime > @nowdate;

-- eService6 DB ClientConsultant table has been changed to view

/*
insert into sanjeldata.dbo.ClientConsultant
(id,
version,
modified_user_id,
modified_user_name,
modified_datetime,
operation_type,
effective_start_datetime,
effective_end_datetime,
entity_status,
owner_id,
name,
description,
ClientDescription, 
WorkShiftid, 
Clientid, 
WorkShiftName, 
ClientSystemId,
Email, 
cell,
Phone2, 
WorkShiftDescription, 
ClientName, 
WorkShiftSystemId
)
select 
id,
version+1,
modified_user_id,
modified_user_name,
@nowdate,
operation_type,
@nowdate,
@nowdate,
entity_status,
owner_id,
name,
description,
ClientDescription, 
WorkShiftid, 
Clientid, 
WorkShiftName, 
ClientSystemId,
Email, 
cell,
Phone2, 
WorkShiftDescription, 
ClientName, 
WorkShiftSystemId
 from ClientConsultant where 
 id in (540,1834,1687,1797,533,131,1786,545,1391,1733,1349,1750,1914,154,159,1870,515,1923,177,629,1790,1509,1865,1907,1741,1794,1822,1838,1795,692,544,1922,1836,221,507,611,949,1792,1702,1798,1903,1706,1390,242,1673,1809,258,1699,649,1910,272,1692,989,1878,1871,1392,142,770,1909,535,1724,1740,307,1739,693,313,316,1684,320,1807,690,332,610,1855,1649,1843,1842,344,352,355,674,1874,750,1898,333,1469,1833,678,1845,554,1799,1759,1867,672,1886,564,1726,550,1679,1449,1737,394,1906,508,1921,1810,675,1793,1791,1788,1826,681,496,1913,1806,572,1770,1771,670,1718,1731,1823,1742,1727,438,679,1796,1109,446,673,1749,450,1840,1915,463,1832,101,467,1721,1230,1900,1827,676,555,677,669)
 and effective_end_datetime = @nowdate and modified_datetime < @nowdate;
 end;
 Go

*/
