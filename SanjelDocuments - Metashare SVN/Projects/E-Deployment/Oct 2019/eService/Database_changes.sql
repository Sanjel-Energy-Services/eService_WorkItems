
-- 2019/07/29 bright
UPDATE eservice6.dbo.TYPE_VALUES SET LAST_MODIFIED_DATE_TIME=GETDATE() , EFFECTIVE_END_DATE_TIME=GETDATE() , version = version+1 WHERE TYPE_ID=10 AND DESCRIPTION=N'FDAS Zip File';
UPDATE eservice6.dbo.TYPE_VALUES SET LAST_MODIFIED_DATE_TIME=GETDATE() ,EFFECTIVE_END_DATE_TIME=GETDATE() , version = version+1  WHERE TYPE_ID=10 AND DESCRIPTION=N'Fracturing Job Data';
UPDATE eservice6.dbo.TYPE_VALUES SET LAST_MODIFIED_DATE_TIME=GETDATE() ,EFFECTIVE_END_DATE_TIME=GETDATE() , version = version+1 WHERE TYPE_ID=10 AND DESCRIPTION=N'CBM Job Data';
UPDATE eservice6.dbo.TYPE_VALUES SET LAST_MODIFIED_DATE_TIME=GETDATE() ,EFFECTIVE_END_DATE_TIME=GETDATE()  , version = version+1 WHERE TYPE_ID=10 AND DESCRIPTION=N'Coiled Tubing Job Data';