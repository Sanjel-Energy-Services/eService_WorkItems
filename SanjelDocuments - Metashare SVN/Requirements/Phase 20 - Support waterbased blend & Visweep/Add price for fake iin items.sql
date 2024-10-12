USE [SanjelData]
GO

declare @maxId int
select @maxId = MAX(Id) from PurchasePrice;

INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+13,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM IS','Visweep DM IS','m3','FIINVDMIS',1,275,'D600');
INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+1,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM IS','Visweep DM IS','m3','FIINVDMIS',1,275,'D602');
INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+2,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM IS','Visweep DM IS','m3','FIINVDMIS',1,275,'D603');
INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+3,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM IS','Visweep DM IS','m3','FIINVDMIS',1,275,'D604');
INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+4,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM IS','Visweep DM IS','m3','FIINVDMIS',1,275,'D605');
INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+5,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM IS','Visweep DM IS','m3','FIINVDMIS',1,275,'D606');
INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+6,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM IS','Visweep DM IS','m3','FIINVDMIS',1,275,'D607');
INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+7,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM IS','Visweep DM IS','m3','FIINVDMIS',1,275,'D612');
INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+8,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM IS','Visweep DM IS','m3','FIINVDMIS',1,275,'D615');
INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+9,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM IS','Visweep DM IS','m3','FIINVDMIS',1,275,'D616');
INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+10,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM IS','Visweep DM IS','m3','FIINVDMIS',1,275,'D617');
INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+11,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM IS','Visweep DM IS','m3','FIINVDMIS',1,275,'D618');
INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+12,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM IS','Visweep DM IS','m3','FIINVDMIS',1,275,'D619');
	 GO

declare @maxId int
select @maxId = MAX(Id) from PurchasePrice;

INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+13,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM','Visweep DM','m3','FIINVDM',1,225,'D600');
INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+1,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM','Visweep DM','m3','FIINVDM',1,225,'D602');
INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+2,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM','Visweep DM','m3','FIINVDM',1,225,'D603');
INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+3,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM','Visweep DM','m3','FIINVDM',1,225,'D604');
INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+4,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM','Visweep DM','m3','FIINVDM',1,225,'D605');
INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+5,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM','Visweep DM','m3','FIINVDM',1,225,'D606');
INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+6,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM','Visweep DM','m3','FIINVDM',1,225,'D607');
INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+7,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM','Visweep DM','m3','FIINVDM',1,225,'D612');
INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+8,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM','Visweep DM','m3','FIINVDM',1,225,'D615');
INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+9,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM','Visweep DM','m3','FIINVDM',1,225,'D616');
INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+10,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM','Visweep DM','m3','FIINVDM',1,225,'D617');
INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+11,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM','Visweep DM','m3','FIINVDM',1,225,'D618');
INSERT INTO [dbo].[PurchasePrice] ([id] ,[version] ,[modified_user_id] ,[modified_user_name] ,[modified_datetime] ,[operation_type] ,[effective_start_datetime] ,[effective_end_datetime],[entity_status],[owner_id],[name],[description],[UnitId],[SbsReleasedProductId],[PriceUnit],[Price],[ServicePoint])
     VALUES (@maxId+12,1,0,'',GETDATE(),1,GETDATE(),'9999-12-31 23:59:59.0000000',0,0,'Visweep DM','Visweep DM','m3','FIINVDM',1,225,'D619');

--select distinct Id from PurchasePrice order by id desc;

--select * from PurchasePrice order by id desc;
--select distinct ServicePoint from PurchasePrice order by ServicePoint;

--select * from BlendChemical where id = 61920;

--delete from PurchasePrice where system_id > 232265;
