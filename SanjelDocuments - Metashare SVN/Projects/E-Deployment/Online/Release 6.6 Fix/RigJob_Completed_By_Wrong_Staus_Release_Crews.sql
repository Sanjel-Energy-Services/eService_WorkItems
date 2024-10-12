USE [SanjelData]
GO
/****** Object:  Trigger [dbo].[RigJob_Completed_By_Mistake]    Script Date: 2019-06-18 11:40:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE TRIGGER [dbo].[RigJob_Completed_By_Wrong_Staus_Release_Crews] ON [dbo].[RigJob]
After INSERT 
AS 
BEGIN


Insert into RigJobSanjelCrewSection ([id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime], [entity_status], [owner_id], [name], [description], [RigJobid], [ProductHaulDescription], [SanjelCrewDescription], [SanjelCrewSystemId], [RigJobName], [RigJobDescription], [ProductHaulName], [RigJobCrewSectionStatus], [ProductHaulid], [ProductHaulSystemId], [SanjelCrewName], [RigJobSystemId], [SanjelCrewid]) 
SELECT Y.[id], Y.[version]+1, Y.[modified_user_id], Y.[modified_user_name], GETDATE(), 1, GETDATE(), CAST(N'9999-12-31T23:59:59.0000000' AS DateTime2), 1, Y.[owner_id], Y.[name], Y.[description], Y.[RigJobid], Y.[ProductHaulDescription], Y.[SanjelCrewDescription], Y.[SanjelCrewSystemId], Y.[RigJobName], Y.[RigJobDescription], Y.[ProductHaulName], Y.[RigJobCrewSectionStatus], Y.[ProductHaulid], Y.[ProductHaulSystemId], Y.[SanjelCrewName], Y.[RigJobSystemId], Y.[SanjelCrewid]
From RigJobSanjelCrewSection Y
Join inserted I ON Y.RigJobId = I.ID
Where Y.Effective_End_DateTime > GETDATE() and I.JobLifeStatus = 9 and I.JobUniqueId is not null;

Update RigJobSanjelCrewSection 
Set effective_end_datetime = GETDATE()
From RigJobSanjelCrewSection Z
Join inserted I ON Z.RigJobId = I.ID
Where  Z.Effective_End_DateTime > GETDATE() and Z.entity_status = 0 and I.JobLifeStatus = 9 and I.JobUniqueId is not null;

Update RigJob
SET JobLifeStatus = 8
FROM RigJob X 
Join inserted I ON X.ID = I.ID
Where I.JobLifeStatus = 9 and I.JobUniqueId is not null and X.system_id = I.system_id;

END
