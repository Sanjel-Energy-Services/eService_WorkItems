USE [eservice6]
GO

INSERT INTO [dbo].[ESERVICE_ALL_TYPES]
           ([ID]
           ,[NAME]
           ,[VERSION])
     VALUES
           (119
           ,'WellObjective'
           ,0)
GO

INSERT INTO [dbo].[TYPE_VALUES_ConvertedToView]
           ([ID]
           ,[TYPE_INDEX]
           ,[TYPE_ID]
           ,[DESCRIPTION]
           ,[STATUS]
           ,[VERSION]
           ,[LAST_MODIFIED_USER_ID]
           ,[LAST_MODIFIED_USER_NAME]
           ,[LAST_MODIFIED_DATE_TIME]
           ,[LAST_OPERATION_TYPE]
           ,[EFFECTIVE_START_DATE_TIME]
           ,[EFFECTIVE_END_DATE_TIME])
     VALUES
           (1000913,
           0
           ,119
           ,'Objective 1'
           ,'A'
           ,1
           ,29747
           ,'awang'
           ,GETDATE()
           ,1
           ,GETDATE()
           ,'9999-12-31 23:59:59.0000000')
GO


