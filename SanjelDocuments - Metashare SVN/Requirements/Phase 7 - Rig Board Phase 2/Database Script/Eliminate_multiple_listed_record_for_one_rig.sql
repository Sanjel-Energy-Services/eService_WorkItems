select count(*) from RIG_JOB;

select count(*) from HISTORY_RIG_JOB;

select count(*) from RIGS;


select * from TYPE_VALUES where upper(DESCRIPTION) like 'SI-14%';

select * from TYPE_VALUES where type_id = 4 order by id desc;

select * from PRODUCTS order by id desc;


select  LAST_MODIFIED_DATE_TIME from jobs where JOB_NUMBER = 445640;

select * from rig_job where RIG_ID = 165;



update rig_job set JOB_LIFE_STATUS = 9, NOTES = 'Created by Colin by mistake, delete it from database recored by Adam', IS_LISTED = 0 where id = 9860;
update rig_job set IS_LISTED = 1 where id = 7360;

select * from rigs where RIG_NO = '141';
-- PD 145, rig id 354
-- PD 116, rig id 241

update RIG_JOB set IS_LISTED = 0 where RIG_ID = 241;
update RIG_JOB set IS_LISTED = 1 where RIG_ID = 385;



select * from CALLSHEET_HEADERS where CALL_SHEET_NUMBER = 1078293;

-- look into call sheet 1078187, where the job is

select * from jobs where CALL_SHEET_NUMBER = 1078293;

SELECT *
  FROM RIG_JOB a
 WHERE a.JOB_DATE_TIME = (SELECT MAX(b.JOB_DATE_TIME)
                               FROM RIG_JOB b
                              WHERE a.rig_id = b.rig_id) and a.RIG_ID = 125;


SELECT b.id, MAX(b.JOB_DATE_TIME)FROM RIG_JOB b GROUP BY b.rig_id;


-- find if more than one list rig job for a single rig                              
select rig_id, count(rig_id) from RIG_JOB where IS_LISTED = 1 group by rig_id having count(rig_id)>1;
                              

/*
141	4
273	3
210	4
181	2
262	2
102	2
285	13
283	2
268	24
232	2
212	2
276	2
214	2
323	3
158	2
127	2
111	2
126	2
*/

-- Disable all listed flag

update RIG_JOB set IS_LISTED = 0 where RIG_ID in (227, 225);

update RIG_JOB set IS_LISTED = 1 where id in(
SELECT id
  FROM RIG_JOB a
 WHERE a.JOB_DATE_TIME = (SELECT MAX(b.JOB_DATE_TIME)
                               FROM RIG_JOB b
                              WHERE a.rig_id = b.rig_id) and RIG_ID in (227, 225)); 


select * from rigs;
