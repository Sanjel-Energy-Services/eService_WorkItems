
USE [eservice6]
GO
ALTER TABLE [SERVICE_TICKETS] ADD [APPROVAL_CLIENT_STAMP_CAPTURED] [bit] NULL;
ALTER TABLE [SERVICE_TICKETS] ADD [LOCAL_CLIENT_STAMP_REASON] [nvarchar](1000) NULL;
ALTER TABLE [SERVICE_TICKETS] ADD [APPROVAL_CLIENT_STAMP_REASON] [nvarchar](1000) NULL;