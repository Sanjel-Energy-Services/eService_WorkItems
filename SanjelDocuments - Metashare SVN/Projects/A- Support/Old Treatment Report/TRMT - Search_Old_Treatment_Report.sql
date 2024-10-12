-- Database: SANJEL23\Treatment, password: report


--Request Sample as following:

--I hope that all is well with you.  I am working on some prep work for a Unity Sask. Abandonment program and just wondered if you can provide some information on both the surface and production cement jobs for both 111/11-29-042-23W3 (License #: 003J394) which looks to have been spudded on Nov. 24, 2003 and Rig Released on Nov. 28, 2003 and 131/03-20-042-22W3 (License #: 003J320) which looks to have been spudded on Nov. 19, 2003 and Rig Released on Nov. 22, 2003.  Original licensee for these wells was Husky but BlackPearl Resources acquired these wells quite a while back.  Specifically, I am looking for cement volume pumped and cement returns volume for both surface and production cement jobs.  It looks like Sanjel pumped these jobs using 0:1:0 “G” for surface blend type and EXP LWL for production blend.  Any help you can provide on this would be appreciated.

-- Dig in database to find if the job exists

-- 1. select company number form accouting database

select * from ACCOUNTING.dbo.CUSTOMERS where upper(name) like '%HUSKY%';

--id: 2206, 4008

-- 2. Search well by location [LE]/[LSD]-[SEC]-[TWP]-[RGE]W[MER]M/[ES]

select * from LOCATIONS where  lsd like '%3' and section = '20' and TOWNSHIP like '%42' and RANGE = '22' and MERIDIAN = '3';

-- found two tickets 181794, 183110

-- If no tickets can be found, most time the client gives well location is not exactly was captured exactly same. Normally we can use part of above query to filter the result for larger range to smaller.

-- Other approach to find the tickets

-- select * from vu_masters where cust_no = 3511 order by Job_date;
-- select * from VU_MASTERS where  well_code like '%11-29-%42-23-3M%'  order by JOB_DATE;
 select TICKET_NO, JOB_DATE, JOB_TYPE, WELL_CODE, Name from VU_MASTERS where  job_date > '11/20/2003' and job_date < '11/30/2003' and  well_code like '%42-23-3M%' order by JOB_DATE;


--3. select headers with ticket numbers to confirm they are the right tickets we are looking for

select * from vu_masters where TICKET_NO in (181794, 183110);

--4. Make query for one ticket to make sure the result is what client is looking for


use TREATMENT;
GO

Declare @ticket_number INT;
SET @ticket_number = 183110;

Select 'MASTER LIST RESULT SECTION';
select * from VU_MASTERS where TICKET_NO = @ticket_number;

Select 'TREATMENT_EVENTS RESULT SECTION';

select TICKET_NO, PAGE_NUM, EVENT_NO, Format(event_time, 'HH:mm') as event_time, PRESSURE_TUBULAR, PRESSURE_ANNULAR, PRESSURE_COIL, PRESSURE_WELLHEAD,
RATE,RATE_N2,STAGE_VOL,TOTAL_VOL,INJECTED_IN_FORMATION_VOL,TUBING_WEIGHT,TUBING_DEPTH,COIL_CYCLE,REMARKS,
format(event_date, 'dd/MM/yyyy') as event_date from TRTMT_EVENTS 
where TICKET_NO =@ticket_number order by event_no;

Select 'Blend RESULT SECTION';

select * from BLENDS where TICKET_NO = @ticket_number;

Select 'BLEND_ADDITIVES RESULT SECTION';

select * from BLEND_ADDITIVES where TICKET_NO = @ticket_number;

Select 'TUBULARS RESULT SECTION';

select * from TUBULARS where TICKET_NO = @ticket_number;

Select 'Tools RESULT SECTION';

select * from Tools where TICKET_NO = @ticket_number;

Select 'GENERAL_INFO RESULT SECTION';

select * from GENERAL_INFO where TICKET_NO = @ticket_number;

Select 'SERVICE_COMMENTS RESULT SECTION';

select * from SERVICE_COMMENTS where TICKET_NO = @ticket_number;

Select 'PERFORATIONS RESULT SECTION';

select * from PERFORATIONS where TICKET_NO = @ticket_number;

Select 'LOCATIONS RESULT SECTION';

select * from LOCATIONS where TICKET_NO = @ticket_number;

Select 'CEMENTING_PLUGS RESULT SECTION';

select * from CEMENTING_PLUGS where TICKET_NO = @ticket_number;

GO


-- 5. Once the result is verified, change SQL SERVER MAMAGEMENT STUDIO setting as following to save result to csv file. 
-- 5.1 Got Tools->Options to open Options window
-- 5.2 Select Query Results->SQL Server->General, change the value to "Result to file" in the "Default destination for results" dropdown list.
-- 5.3 Select Query Results->SQL Server->Results to Text, change the value to "Comma delimited" in the "Output format" dropdown list.
-- 5.4 Click "OK" to save.
-- 5.5 Restart SSMS to apply the change.
-- 5.6 Run the query in section 4 once for each ticket no, the results will be saved in csv file. The default file type is .rpt. You may change file type fo all, and enter the file name with .csv extension.
--TODO: Jason has a template to import csv data to create a beautiful client facing treament report document, but it was for Oracle version with separate csv file. He may update the template for this whole result file.
