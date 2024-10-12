-- Add new entity BinLoadHistory

CREATE TABLE [dbo].[BinLoadHistory] (
    [id]                     INT            IDENTITY (1, 1) NOT NULL,
    [entity_status]          INT            NULL,
    [owner_id]               INT            NULL,
    [name]                   NVARCHAR (100) NULL,
    [description]            NVARCHAR (500) NULL,
    [Notes]                  NVARCHAR (255) NULL,
    [BlendName]              NVARCHAR (255) NULL,
    [InQuantity]             FLOAT (53)     NULL,
    [ProductHaulName]        NVARCHAR (255) NULL,
    [ProductHaulSystemId]    INT            NULL,
    [ProductHaulid]          INT            NULL,
    [ProductHaulDescription] NVARCHAR (255) NULL,
    [JobNumber]              INT            NULL,
    [BinDescription]         NVARCHAR (255) NULL,
    [BinSystemId]            INT            NULL,
    [Remains]                FLOAT (53)     NULL,
    [BlendDescription]       NVARCHAR (255) NULL,
    [OutQuantity]            FLOAT (53)     NULL,
    [Binid]                  INT            NULL,
    [BinName]                NVARCHAR (255) NULL,
    [Username]               NVARCHAR (255) NULL
);
GO


-- Add new entity FreightCost
CREATE TABLE [dbo].[FreightCost] (
    [id]                   INT            IDENTITY (1, 1) NOT NULL,
    [entity_status]        INT            NULL,
    [owner_id]             INT            NULL,
    [name]                 NVARCHAR (100) NULL,
    [description]          NVARCHAR (500) NULL,
    [SbsReleasedProductId] NVARCHAR (255) NULL,
    [UnitId]               NVARCHAR (255) NULL,
    [PriceUnit]            FLOAT (53)     NULL,
    [Price]                FLOAT (53)     NULL,
    [ServicePoint]         NVARCHAR (255) NULL
);
GO

-- Add new entity RigNote
CREATE TABLE [dbo].[RigNote] (
    [id]                       INT            NOT NULL,
    [system_id]                INT            IDENTITY (1, 1) NOT NULL,
    [version]                  INT            NULL,
    [modified_user_id]         INT            NULL,
    [modified_user_name]       NVARCHAR (50)  NULL,
    [modified_datetime]        DATETIME2 (7)  NULL,
    [operation_type]           INT            NULL,
    [effective_start_datetime] DATETIME2 (7)  NULL,
    [effective_end_datetime]   DATETIME2 (7)  NULL,
    [entity_status]            INT            NULL,
    [owner_id]                 INT            NULL,
    [name]                     NVARCHAR (100) NULL,
    [description]              NVARCHAR (500) NULL,
    [Rigid]                    INT            NULL,
    [RigSystemId]              INT            NULL,
    [RigDescription]           NVARCHAR (255) NULL,
    [RigName]                  NVARCHAR (255) NULL
);
GO

ALTER TABLE  [dbo].[BinInformation] Add	[Volume] [float] NULL
GO

Update BinInformation set BlendChemicalid = null, BlendChemicalSystemId = NULL, BlendChemicalName = null, BlendChemicalDescription = null, Quantity = 0  where effective_end_datetime > GETDATE();
