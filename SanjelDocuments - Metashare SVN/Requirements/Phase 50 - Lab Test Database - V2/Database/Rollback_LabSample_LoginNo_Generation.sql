-- Rollback script for Lab Sample LoginNo Generation Fix
-- Use this script to remove the changes if needed

PRINT '=== Rolling back Lab Sample LoginNo Generation Fix ===';

-- Drop the trigger
IF EXISTS (SELECT * FROM sys.triggers WHERE name = 'tr_LabSample_GenerateLoginNo')
BEGIN
    DROP TRIGGER [tr_LabSample_GenerateLoginNo];
    PRINT 'Removed trigger: tr_LabSample_GenerateLoginNo';
END

-- Drop the function
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('dbo.fn_GetNextLabSampleLoginNo') AND type = 'FN')
BEGIN
    DROP FUNCTION [dbo].[fn_GetNextLabSampleLoginNo];
    PRINT 'Removed function: fn_GetNextLabSampleLoginNo';
END

-- Optionally remove the Status column if it was added by the fix
-- Uncomment the lines below if you want to remove the Status column
-- WARNING: This will delete all status data!

/*
IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('dbo.sld_LabSample') AND name = 'Status')
BEGIN
    ALTER TABLE [dbo].[sld_LabSample] DROP COLUMN [Status];
    PRINT 'Removed Status column from sld_LabSample table';
END
*/

PRINT '=== Rollback completed ===';
PRINT 'Note: Status column was not removed. Uncomment the code in this script if you need to remove it.';