-- Fix WhiteCap/Codeco data
update JB_COMPANY_INFO_SCTNS set COMPANY_TYPE_ID =2, COMPANY_TYPE_NAME = 'Consulting' where COMPANY_NAME like 'Codeco-Vanoco%' and ROOT_ID in (select id from jobs where CLIENT_COMPANY like 'Codeco-Vanoco%' and id > 1110560 )
update JB_COMPANY_INFO_SCTNS set COMPANY_TYPE_ID =1, COMPANY_TYPE_NAME = 'Energy' where COMPANY_NAME  not like 'Codeco-Vanoco%' and ROOT_ID in (select id from jobs where CLIENT_COMPANY like 'Codeco-Vanoco%' and id > 1110560 )

Update [JB_COMPANY_INFO_SCTNS] set IS_CLIENT = 1 where COMPANY_TYPE_ID = 1 and ROOT_ID in (select id from jobs where CLIENT_COMPANY like 'Codeco-Vanoco%' and id > 1110560);
Update [JB_COMPANY_INFO_SCTNS] set IS_CLIENT = 0 where COMPANY_TYPE_ID = 2 and ROOT_ID in (select id from jobs where CLIENT_COMPANY like 'Codeco-Vanoco%' and id > 1110560);

Update jobs set CLIENT_COMPANY = 'Whitecap Resources Inc.'  where CLIENT_COMPANY like 'Codeco-Vanoco%' and  id > 1110560;
 
