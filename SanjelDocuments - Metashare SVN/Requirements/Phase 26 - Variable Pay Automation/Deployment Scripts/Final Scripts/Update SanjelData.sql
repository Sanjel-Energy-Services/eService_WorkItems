USE [SanjelData]

alter table Employee add [WorkEmail] nvarchar(255) null;
alter table Employee add [Cell] nvarchar(255) null;
alter table Employee add [WorkPhone] nvarchar(255) null;
alter table Employee add [PositionId] nvarchar(255) null;
Go
alter table [BlendChemical] add [ProductStatus] int null;
GO
Update BlendChemical set ProductStatus = 8;
Go
alter table [JobType] add [SbsPrimaryServiceLineId] int null;
alter table [JobType] add [SbsPrimaryServiceLineName] nvarchar(255) null;
alter table [JobType] add [SbsSecondaryServiceLineId] nvarchar(255) null;
alter table [JobType] add [SbsSecondaryServiceLineName] nvarchar(255) null;
Go