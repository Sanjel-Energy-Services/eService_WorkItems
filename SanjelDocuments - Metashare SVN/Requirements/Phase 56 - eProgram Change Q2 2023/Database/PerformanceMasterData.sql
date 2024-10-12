USE [SanjelDataUAT]
GO

-- PrimaryIncident
-- New Entries
SET IDENTITY_INSERT [dbo].[hse_PrimaryIncident] ON 
GO
INSERT [dbo].[hse_PrimaryIncident] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (1, 0, 0, NULL, NULL, 1, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2));
GO
INSERT [dbo].[hse_PrimaryIncident] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (2, 0, 0, N'Quality', N'Quality', 2, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2));
GO
INSERT [dbo].[hse_PrimaryIncident] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (3, 0, 0, N'Quality – Well Integrity', N'Quality – Well Integrity', 3, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2));
GO
INSERT [dbo].[hse_PrimaryIncident] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (4, 0, 0, N'Late', N'Late', 4, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2));
GO
SET IDENTITY_INSERT [dbo].[hse_PrimaryIncident] OFF
GO

SET IDENTITY_INSERT [dbo].[hse_IncidentType] ON 
GO
--Incident Type
--New Entries
INSERT [dbo].[hse_IncidentType] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (72, 0, 0, N'Frozen Iron', N'Frozen Iron', 43, 1, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[hse_IncidentType] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (73, 0, 0, N'Forgotten Equipment/Materials', N'Forgotten Equipment/Materials', 44, 1, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[hse_IncidentType] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (74, 0, 0, N'Late - Delay Client Operation (Bulk)', N'Late - Delay Client Operation (Bulk)', 45, 1, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[hse_IncidentType] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (75, 0, 0, N'Late - No Delay to Client Operation (Bulk)', N'Late - No Delay to Client Operation (Bulk)', 46, 1, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[hse_IncidentType] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (76, 0, 0, N'Late - Delay Client Operation (Pump Crew)', N'Late - Delay Client Operation (Pump Crew)', 47, 1, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[hse_IncidentType] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (77, 0, 0, N'Late - No Delay to Client Operation (Pump Crew)', N'Late - No Delay to Client Operation (Pump Crew)', 48, 1, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[hse_IncidentType] OFF
GO

-- Rename
USE [SanjelDataUAT]
GO
SET IDENTITY_INSERT [dbo].[hse_IncidentType] ON 
Update [dbo].[hse_IncidentType] set effective_end_datetime=GETDATE() where system_id = 21;
GO
INSERT [dbo].[hse_IncidentType] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (46, 0, 0, N'Pressure Incident', N'Over Pressure Line', 53, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2));
GO
SET IDENTITY_INSERT [dbo].[hse_IncidentType] OFF
GO

-- Delete Entries
USE [SanjelDataUAT]
GO
SET IDENTITY_INSERT [dbo].[hse_IncidentType] ON 
GO
Update [dbo].[hse_IncidentType] set effective_end_datetime=GETDATE() where system_id = 2;
GO
INSERT [dbo].[hse_IncidentType] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (19, 1, 0, N'Late - Delay Client Operation', N'Late - Delay Client Operation', 49, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), GETDATE());
GO
Update [dbo].[hse_IncidentType] set effective_end_datetime=GETDATE() where system_id = 3;
GO
INSERT [dbo].[hse_IncidentType] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (20, 1, 0, N'Late - No Delay to Client Operation', N'Late - No Delay to Client Operation', 50, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), GETDATE());
GO
Update [dbo].[hse_IncidentType] set effective_end_datetime=GETDATE() where system_id = 5;
GO
INSERT [dbo].[hse_IncidentType] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (29, 1, 0, N'Bulk Product Blending', N'Bulk Product Blending', 51, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), GETDATE());
GO
Update [dbo].[hse_IncidentType] set effective_end_datetime=GETDATE() where system_id = 16;
GO
INSERT [dbo].[hse_IncidentType] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (41, 1, 0, N'Inadequate Preparation', N'Inadequate Preparation', 52, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), GETDATE());
GO
Update [dbo].[hse_IncidentType] set effective_end_datetime=GETDATE() where system_id = 29;
GO
INSERT [dbo].[hse_IncidentType] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (57, 1, 0, N'Treating Line Failure', N'Treating Line Failure', 54, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), GETDATE());
GO
Update [dbo].[hse_IncidentType] set effective_end_datetime=GETDATE() where system_id = 40;
GO
INSERT [dbo].[hse_IncidentType] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (69, 1, 0, N'Third Party Material Issue', N'Third Party Material Issue', 55, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), GETDATE());
GO
SET IDENTITY_INSERT [dbo].[hse_IncidentType] OFF
GO



-- Actual Severity

USE [SanjelDataUAT]
GO
SET IDENTITY_INSERT [dbo].[hse_SeverityMatrixtype] ON 
GO
INSERT [dbo].[hse_SeverityMatrixtype] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (43, 0, 0, N'0 - No Cement to Surface (Expected)', N'0 - No Cement to Surface (Expected)', 22, 1, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[hse_SeverityMatrixtype] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (44, 0, 0, N'1 - No Cement to Surface (Only Scavenger)', N'1 - No Cement to Surface (Only Scavenger)', 23, 1, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[hse_SeverityMatrixtype] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (45, 0, 0, N'1 - < $10,000 Incident Cost', N'1 - < $10,000 Incident Cost', 24, 1, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[hse_SeverityMatrixtype] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (46, 0, 0, N'1 - Completions System Affected < $10,000', N'1 - Completions System Affected < $10,000', 25, 1, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[hse_SeverityMatrixtype] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (47, 0, 0, N'2 - No Cement to Surface - Cement Covers Required Zone', N'2 - No Cement to Surface - Cement Covers Required Zone', 26, 1, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[hse_SeverityMatrixtype] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (48, 0, 0, N'2 - Completions System Affected > $10,000', N'2 - Completions System Affected > $10,000', 27, 1, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[hse_SeverityMatrixtype] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (49, 0, 0, N'2 - > $10,000 < $50,000 Incident Cost', N'2 - > $10,000 < $50,000 Incident Cost', 28, 1, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[hse_SeverityMatrixtype] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (50, 0, 0, N'2 - Remedial Job Objective Not Achieved', N'2 - Remedial Job Objective Not Achieved', 29, 1, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[hse_SeverityMatrixtype] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (51, 0, 0, N'3 - > $50,000 < $100,000 Incident Cost', N'3 - > $50,000 < $100,000 Incident Cost', 30, 1, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[hse_SeverityMatrixtype] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (52, 0, 0, N'3 - Remediation Required', N'3 - Remediation Required', 31, 1, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[hse_SeverityMatrixtype] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (53, 0, 0, N'4 - > $100,000 < $1,000,000 Incident Cost', N'4 - > $100,000 < $1,000,000 Incident Cost', 32, 1, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[hse_SeverityMatrixtype] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (54, 0, 0, N'4 - Major Intervention Required', N'4 - Major Intervention Required', 33, 1, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[hse_SeverityMatrixtype] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (55, 0, 0, N'5 - > $1,000,000 Incident Cost', N'5 - > $1,000,000 Incident Cost', 34, 1, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[hse_SeverityMatrixtype] OFF
GO


-- Delete Entries
USE [SanjelDataUAT]
GO
SET IDENTITY_INSERT [dbo].[hse_SeverityMatrixtype] ON 
GO
Update [dbo].[hse_SeverityMatrixtype] set effective_end_datetime=GETDATE() where system_id = 14;
GO
INSERT [dbo].[hse_SeverityMatrixtype] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (31, 1, 0, N'Late - Delay Client Operation', N'Late - Delay Client Operation', 35, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), GETDATE());
GO
SET IDENTITY_INSERT [dbo].[hse_SeverityMatrixtype] OFF
GO


-- PerformanceMetric
--New Entries
USE [SanjelDataUAT]
GO
SET IDENTITY_INSERT [dbo].[hse_PerformanceMetric] ON 
GO
INSERT [dbo].[hse_PerformanceMetric] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (108, 0, 0, N'Equipment Cemented Off', N'Equipment Cemented Off', 49, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2));
GO
INSERT [dbo].[hse_PerformanceMetric] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (109, 0, 0, N'Bulk Plant Equipment Issue', N'Bulk Plant Equipment Issue', 50, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2));
GO
INSERT [dbo].[hse_PerformanceMetric] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (110, 0, 0, N'Capacity Limit - Bulk', N'Capacity Limit - Bulk', 51, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2));
GO
INSERT [dbo].[hse_PerformanceMetric] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (111, 0, 0, N'Electrical/Wiring/Fuse', N'Electrical/Wiring/Fuse', 52, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2));
GO
INSERT [dbo].[hse_PerformanceMetric] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (112, 0, 0, N'Misblend', N'Misblend', 53, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2));
GO
INSERT [dbo].[hse_PerformanceMetric] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (113, 0, 0, N'Mislabelled/Incorrect Silo', N'Mislabelled/Incorrect Silo', 54, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2));
GO
INSERT [dbo].[hse_PerformanceMetric] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (114, 0, 0, N'Third Party - Downhole Tool', N'Third Party - Downhole Tool', 55, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2));
GO
INSERT [dbo].[hse_PerformanceMetric] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (115, 0, 0, N'Third Party - Water Hauler', N'Third Party - Water Hauler', 56, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2));
GO
INSERT [dbo].[hse_PerformanceMetric] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (116, 0, 0, N'Not Following Callsheet Directions', N'Not Following Callsheet Directions', 57, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2));
GO
INSERT [dbo].[hse_PerformanceMetric] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (117, 0, 0, N'Inadequate Preparation', N'Inadequate Preparation', 58, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2));
GO
INSERT [dbo].[hse_PerformanceMetric] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (118, 0, 0, N'Third Party - Rig', N'Third Party - Rig', 59, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2));
GO
SET IDENTITY_INSERT [dbo].[hse_PerformanceMetric] OFF
GO

-- Rename
USE [SanjelDataUAT]
GO
SET IDENTITY_INSERT [dbo].[hse_PerformanceMetric] ON 
GO
Update [dbo].[hse_PerformanceMetric] set effective_end_datetime=GETDATE() where system_id = 41;
GO
INSERT [dbo].[hse_PerformanceMetric] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (100, 0, 0, N'Wiper Plug - Sanjel', N'Wiper Plug - Sanjel', 60, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2));
GO
Update [dbo].[hse_PerformanceMetric] set effective_end_datetime=GETDATE() where system_id = 42;
GO
INSERT [dbo].[hse_PerformanceMetric] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (101, 0, 0, N'Wiper Plug - Third Party', N'Wiper Plug - Third Party', 61, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), CAST(N'9999-12-31T00:00:00.0000000' AS DateTime2));
GO
SET IDENTITY_INSERT [dbo].[hse_PerformanceMetric] OFF
GO


-- Delete Entries

USE [SanjelDataUAT]
GO
SET IDENTITY_INSERT [dbo].[hse_PerformanceMetric] ON 
GO
Update [dbo].[hse_PerformanceMetric] set effective_end_datetime=GETDATE() where system_id = 14;
GO
INSERT [dbo].[hse_PerformanceMetric] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (64, 1, 0, N'Forgotten Equipment/Materials', N'Forgotten Equipment/Materials', 62, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), GETDATE());
GO
Update [dbo].[hse_PerformanceMetric] set effective_end_datetime=GETDATE() where system_id = 36;
GO
INSERT [dbo].[hse_PerformanceMetric] ([id], [entity_status], [owner_id], [name], [description], [system_id], [version], [modified_user_id], [modified_user_name], [modified_datetime], [operation_type], [effective_start_datetime], [effective_end_datetime]) VALUES (95, 1, 0, N'Frozen Iron', N'Frozen Iron', 63, 3, 15112, N'Awang', GETDATE(), 3, GETDATE(), GETDATE());
GO
SET IDENTITY_INSERT [dbo].[hse_PerformanceMetric] OFF
GO

