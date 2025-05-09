select * from PBK_PRICING_ITEMS where EFFECTIVE_END_DATE_TIME < getdate();
select * from PBK_PRICING_ITEMS where EFFECTIVE_END_DATE_TIME < '2016-06-01';

select * from PBK_SERVICE_CATEGORIES;

select * from PBK_PRICING_ITEMS where SERVICE_CATEGORY_ID in (1006, 1007);



-- Clean up frac, coil tubing price items
delete from PBK_PRICING_ITEMS where SERVICE_CATEGORY_ID in (1006, 1007);
delete from PBK_HEADERS where SERVICE_CATEGORY_ID in (1006, 1007);



select * from PBK_HEADERS  where EFFECTIVE_END_DATE_TIME < getdate();

select * from PBK_PRICING_ITEMS where HEADER_ID not in
(select id from PBK_HEADERS);

select * from PBK_HEADERS where id =9020233;

select * from PBK_BOOKS;

-- Clean up terminated items before SESI started
delete from PBK_PRICING_ITEMS where EFFECTIVE_END_DATE_TIME < '2016-06-01';


select * from PIP_PIPES;

select * from CLIENT_CONSULTANTS;

select * from SERVICE_LINES;

update SERVICE_LINES set version = version + 1, EFFECTIVE_END_DATE_TIME = GETDATE(), LAST_MODIFIED_DATE_TIME = GETDATE()
where  SERVICELINE_TYPE in (1,3,4);

delete from SERVICE_LINES where SERVICELINE_TYPE in (1,3,4);

select * from EMPLOYEES;
--(select ID from BONUS_POSITIONS_ConvertedToView where SERVICE_LINE_ID in (select id from SERVICE_LINES where SERVICELINE_TYPE in (1,3,4));


select * from BONUS_POSITIONS_ConvertedToView where SERVICE_LINE_ID in (select id from SERVICE_LINES where SERVICELINE_TYPE in (1,3,4));

delete from BONUS_POSITIONS_ConvertedToView where SERVICE_LINE_ID in (select id from SERVICE_LINES where SERVICELINE_TYPE in (1,3,4));

select * from SD_USERS where id = 148719;


select * from SD_USERS
where EMP_ID  in 
(select id from EMPLOYEES where EFFECTIVE_END_DATE_TIME < GETDATE());



select * from SD_USERS where EMP_ID is null ;
 
select * from SD_USERS where EMP_ID is null and SANJEL_COMPANY_ID = 2;


select * from SD_USERS;

select * from EMPLOYEES where id = 14292;

select * from EMPLOYEES where LAST_NAME = 'Loewen';

select SU.ID from sd_users SU
join EMPLOYEES EMP on SU.EMP_ID = emp.ID
where emp.EMPLOYEE_NUMBER is null;



