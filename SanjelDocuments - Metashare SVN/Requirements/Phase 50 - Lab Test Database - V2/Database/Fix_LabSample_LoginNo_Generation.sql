-- Fix for Lab Sample Login Number Generation Issue
-- When manually changing sample status from 'Pending' to 'Received', 
-- the LoginNo should be automatically generated

-- First, add Status field to LabSample table if it doesn't exist
-- (This field appears to be missing from the current schema but is shown in the UI)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('dbo.sld_LabSample') AND name = 'Status')
BEGIN
    ALTER TABLE [dbo].[sld_LabSample] 
    ADD [Status] [nvarchar](50) NULL;
    
    PRINT 'Added Status column to sld_LabSample table';
END

-- Create a function to generate the next LoginNo
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('dbo.fn_GetNextLabSampleLoginNo') AND type = 'FN')
    DROP FUNCTION [dbo].[fn_GetNextLabSampleLoginNo]
GO

CREATE FUNCTION [dbo].[fn_GetNextLabSampleLoginNo]()
RETURNS INT
AS
BEGIN
    DECLARE @NextLoginNo INT;
    
    -- Get the maximum existing LoginNo and add 1
    SELECT @NextLoginNo = ISNULL(MAX(LoginNo), 0) + 1
    FROM [dbo].[sld_LabSample]
    WHERE LoginNo IS NOT NULL AND LoginNo > 0;
    
    RETURN @NextLoginNo;
END
GO

-- Create trigger to auto-generate LoginNo when status changes to 'Received'
IF EXISTS (SELECT * FROM sys.triggers WHERE name = 'tr_LabSample_GenerateLoginNo')
    DROP TRIGGER [tr_LabSample_GenerateLoginNo]
GO

CREATE TRIGGER [tr_LabSample_GenerateLoginNo]
ON [dbo].[sld_LabSample]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Update LoginNo for samples that changed status to 'Received' and don't have a LoginNo yet
    UPDATE ls
    SET LoginNo = dbo.fn_GetNextLabSampleLoginNo()
    FROM [dbo].[sld_LabSample] ls
    INNER JOIN inserted i ON ls.id = i.id
    INNER JOIN deleted d ON ls.id = d.id
    WHERE 
        -- Status changed to 'Received'
        (i.Status = 'Received' AND ISNULL(d.Status, '') != 'Received')
        -- And LoginNo is not set or is 0
        AND (i.LoginNo IS NULL OR i.LoginNo = 0);
        
    -- Also handle case where Status field might use different values (in case of enum integers)
    -- Assuming: 0 = Pending, 1 = Received (common pattern)
    IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('dbo.sld_LabSample') AND name = 'Status' AND system_type_id = 56) -- int type
    BEGIN
        UPDATE ls
        SET LoginNo = dbo.fn_GetNextLabSampleLoginNo()
        FROM [dbo].[sld_LabSample] ls
        INNER JOIN inserted i ON ls.id = i.id
        INNER JOIN deleted d ON ls.id = d.id
        WHERE 
            -- Status changed to 1 (Received)
            (CAST(i.Status AS INT) = 1 AND ISNULL(CAST(d.Status AS INT), 0) != 1)
            -- And LoginNo is not set or is 0
            AND (i.LoginNo IS NULL OR i.LoginNo = 0);
    END
END
GO

-- Update existing records that have 'Received' status but no LoginNo
UPDATE [dbo].[sld_LabSample]
SET LoginNo = dbo.fn_GetNextLabSampleLoginNo()
WHERE Status = 'Received' AND (LoginNo IS NULL OR LoginNo = 0);

-- Also handle integer status values if applicable
UPDATE [dbo].[sld_LabSample]
SET LoginNo = dbo.fn_GetNextLabSampleLoginNo()
WHERE TRY_CAST(Status AS INT) = 1 AND (LoginNo IS NULL OR LoginNo = 0);

PRINT 'Lab Sample LoginNo generation fix applied successfully';
PRINT 'LoginNo will now be automatically generated when sample status changes to Received';