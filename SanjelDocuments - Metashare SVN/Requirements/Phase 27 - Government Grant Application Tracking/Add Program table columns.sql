-- Add Government Program Fields to Program table
alter table PROGRAMS ADD GP_GOVERNMENT_PROGRAM_TYPE_ID int;
alter table PROGRAMS ADD GP_GOVERNMENT_PROGRAM_TYPE_NAME nvarchar(50);
alter table PROGRAMS ADD GP_GRANT_AGREEMENT_NUMBER nvarchar(50);
alter table PROGRAMS ADD GP_PREPAY_GRANT_AMOUNT float;
alter table PROGRAMS ADD GP_INTERM_GRANT_AMOUNT float;
alter table PROGRAMS ADD GP_APPLICATION_AMOUNT float;

-- Add Government Program Fields to Call Sheet table
alter table CALLSHEET_HEADERS ADD GP_GOVERNMENT_PROGRAM_TYPE_ID int;
alter table CALLSHEET_HEADERS ADD GP_GOVERNMENT_PROGRAM_TYPE_NAME nvarchar(50);
alter table CALLSHEET_HEADERS ADD GP_GRANT_AGREEMENT_NUMBER nvarchar(50);
alter table CALLSHEET_HEADERS ADD GP_PREPAY_GRANT_AMOUNT float;
alter table CALLSHEET_HEADERS ADD GP_INTERM_GRANT_AMOUNT float;
alter table CALLSHEET_HEADERS ADD GP_APPLICATION_AMOUNT float;

-- Add Government Program Fields to Call Sheet table
alter table SERVICE_TICKETS ADD GP_GOVERNMENT_PROGRAM_TYPE_ID int;
alter table SERVICE_TICKETS ADD GP_GOVERNMENT_PROGRAM_TYPE_NAME nvarchar(50);
alter table SERVICE_TICKETS ADD GP_GRANT_AGREEMENT_NUMBER nvarchar(50);
alter table SERVICE_TICKETS ADD GP_PREPAY_GRANT_AMOUNT float;
alter table SERVICE_TICKETS ADD GP_INTERM_GRANT_AMOUNT float;
alter table SERVICE_TICKETS ADD GP_APPLICATION_AMOUNT float;


-- Add Estimated start date and Filed Blend Testing fields in program
alter table PROGRAMS ADD ESTIMATE_START_DATE datetime2(7);
alter table PRG_BLEND_SCTNS ADD NEED_FIELD_TESTING bit;

-- Add Filed Blend Testing fields in program

alter table PUMP_BLEND_SCTNS ADD NEED_FIELD_TESTING bit;
alter table PSPT_BLEND_SCTNS ADD NEED_FIELD_TESTING bit;

-- Add Government Program Type master data

USE [eservice6]
GO
INSERT INTO [dbo].[ESERVICE_ALL_TYPES]
           ([ID]
           ,[NAME]
           ,[VERSION])
     VALUES
           (118
           ,'GovernmentProgramType'
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
           (1000855
           ,0
           ,118
           ,''
           ,NULL
           ,1
           ,29747
           ,'awang'
           ,'2020-08-19 12:53:59.7800000'
           ,1
           ,'2020-08-19 12:53:59.7800000'
           ,'9999-12-31 23:59:59.0000000')
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
           (1000856
		   ,1
           ,118
           ,'ASRP'
           ,NULL
           ,1
           ,29747
           ,'awang'
           ,'2020-08-19 12:53:59.7800000'
           ,1
           ,'2020-08-19 12:53:59.7800000'
           ,'9999-12-31 23:59:59.0000000')
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
           (1000857
           ,2
           ,118
           ,'BCDSP'
           ,NULL
           ,1
           ,29747
           ,'awang'
           ,'2020-08-19 12:53:59.7800000'
           ,1
           ,'2020-08-19 12:53:59.7800000'
           ,'9999-12-31 23:59:59.0000000')
GO
