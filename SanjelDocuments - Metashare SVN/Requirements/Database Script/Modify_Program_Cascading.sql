USE [eService6]

ALTER TABLE [dbo].[PRG_CHRG_MTHD_DSCT_SCTNS] DROP  CONSTRAINT [PRG_CHRG_MTHD_DSCT_PRG_ID_FK]
GO

ALTER TABLE [dbo].[PRG_CHRG_MTHD_DSCT_SCTNS]  WITH CHECK ADD  CONSTRAINT [PRG_CHRG_MTHD_DSCT_PRG_ID_FK] FOREIGN KEY([ROOT_ID])
REFERENCES [dbo].[PROGRAMS] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[PRG_COMPANY_INFO_SCTNS]  DROP CONSTRAINT [PRG_COM_INFO_SCTNS_PRG_ID_FK] 
GO

ALTER TABLE [dbo].[PRG_COMPANY_INFO_SCTNS]  WITH CHECK ADD  CONSTRAINT [PRG_COM_INFO_SCTNS_PRG_ID_FK] 
FOREIGN KEY([ROOT_ID])
REFERENCES [dbo].[PROGRAMS] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].PRG_EMPLOYEE_SCTNS  DROP CONSTRAINT PRG_EMPLOYEE_SCTNS_PRG_ID_FK 
GO

ALTER TABLE [dbo].PRG_EMPLOYEE_SCTNS  WITH CHECK ADD  CONSTRAINT PRG_EMPLOYEE_SCTNS_PRG_ID_FK 
FOREIGN KEY([PARENT_ID])
REFERENCES [dbo].[PROGRAMS] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[PRG_GROUP_LINE_ITEM_SCTNS]  DROP CONSTRAINT [PRG_GROUP_LINE_ITEM_PRG_ID_FK] 
GO

ALTER TABLE [dbo].[PRG_GROUP_LINE_ITEM_SCTNS]  WITH CHECK ADD  CONSTRAINT [PRG_GROUP_LINE_ITEM_PRG_ID_FK] 
FOREIGN KEY([ROOT_ID])
REFERENCES [dbo].[PROGRAMS] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[PRG_LINE_ITEM_SCTNS]  DROP CONSTRAINT [PRG_LINE_ITEM_PRG_ID_FK] 
GO

ALTER TABLE [dbo].[PRG_LINE_ITEM_SCTNS]  WITH CHECK ADD  CONSTRAINT [PRG_LINE_ITEM_PRG_ID_FK] 
FOREIGN KEY([ROOT_ID])
REFERENCES [dbo].[PROGRAMS] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[PRG_PUMPING_JOB_SECTIONS]  DROP CONSTRAINT [PRG_PUMP_JS_PRG_ID_FK] 
GO

ALTER TABLE [dbo].[PRG_PUMPING_JOB_SECTIONS]  WITH CHECK ADD  CONSTRAINT [PRG_PUMP_JS_PRG_ID_FK] 
FOREIGN KEY([ROOT_ID])
REFERENCES [dbo].[PROGRAMS] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO


--ALTER TABLE [dbo].[PRG_DOWNHOLE_TOOL_SCTNS]  DROP CONSTRAINT [PRG_DNHL_TOOL_SCTNS_PRG_JS_ID_FK] 
--GO

ALTER TABLE [dbo].[PRG_DOWNHOLE_TOOL_SCTNS]  WITH CHECK ADD  CONSTRAINT [PRG_DNHL_TOOL_SCTNS_PRG_JS_ID_FK] 
FOREIGN KEY([PARENT_ID])
REFERENCES [dbo].[PRG_PUMPING_JOB_SECTIONS] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO


--ALTER TABLE [dbo].[PRG_PIPES_SCTNS] DROP CONSTRAINT [PRG_PIPES_SCTNS_PRG_JS_ID_FK] 
--GO

ALTER TABLE [dbo].[PRG_PIPES_SCTNS]  WITH CHECK ADD  CONSTRAINT [PRG_PIPES_SCTNS_PRG_JS_ID_FK] 
FOREIGN KEY([PARENT_ID])
REFERENCES [dbo].[PRG_PUMPING_JOB_SECTIONS] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO


--ALTER TABLE [dbo].[PRG_OPEN_HOLE_SCTNS]  DROP  CONSTRAINT [PRG_OPEN_HOLE_SCTNS_PRG_IS_ID_FK] 
--GO

ALTER TABLE [dbo].[PRG_OPEN_HOLE_SCTNS]  WITH CHECK ADD  CONSTRAINT [PRG_OPEN_HOLE_SCTNS_PRG_IS_ID_FK] 
FOREIGN KEY([PARENT_ID])
REFERENCES [dbo].[PRG_PUMPING_JOB_SECTIONS] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
