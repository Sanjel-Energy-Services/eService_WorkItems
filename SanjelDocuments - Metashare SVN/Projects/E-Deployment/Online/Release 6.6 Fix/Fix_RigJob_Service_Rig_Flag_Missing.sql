USE [SanjelData]
GO
/****** Object:  Trigger [dbo].[Fix_RigJob_Service_Rig_Flag_Missing]    Script Date: 2019-06-18 11:40:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE TRIGGER [dbo].[Fix_RigJob_Service_Rig_Flag_Missing] ON [dbo].[RigJob]
After INSERT 
AS 
BEGIN

Update RigJob
SET IsServiceRig = 1
FROM RigJob X 
Join inserted I ON X.ID = I.ID
Join Rig R ON X.RigId = R.ID
Where X.system_id = I.system_id and R.IsServiceRig = 1;

END
