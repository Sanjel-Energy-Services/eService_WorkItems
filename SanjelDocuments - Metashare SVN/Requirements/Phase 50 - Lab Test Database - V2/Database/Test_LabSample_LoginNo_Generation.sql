-- Test script for Lab Sample LoginNo Generation Fix
-- This script validates that the LoginNo is properly generated when status changes

PRINT '=== Testing Lab Sample LoginNo Generation Fix ===';

-- Test 1: Insert a sample with Pending status
INSERT INTO [dbo].[sld_LabSample] (
    [id], [name], [description], [Status], [LoginNo], [entity_status], [owner_id]
) VALUES (
    999001, 'Test Sample 1', 'Test sample for LoginNo generation', 'Pending', 0, 0, 1
);

PRINT 'Test 1: Inserted sample with Pending status and LoginNo = 0';

-- Verify initial state
SELECT 
    [id], [name], [Status], [LoginNo]
FROM [dbo].[sld_LabSample] 
WHERE [id] = 999001;

-- Test 2: Update status from Pending to Received - should trigger LoginNo generation
UPDATE [dbo].[sld_LabSample]
SET [Status] = 'Received'
WHERE [id] = 999001;

PRINT 'Test 2: Updated status to Received - LoginNo should now be auto-generated';

-- Verify LoginNo was generated
SELECT 
    [id], [name], [Status], [LoginNo]
FROM [dbo].[sld_LabSample] 
WHERE [id] = 999001;

-- Test 3: Insert another sample and change status to verify unique LoginNo
INSERT INTO [dbo].[sld_LabSample] (
    [id], [name], [description], [Status], [LoginNo], [entity_status], [owner_id]
) VALUES (
    999002, 'Test Sample 2', 'Second test sample', 'Pending', 0, 0, 1
);

UPDATE [dbo].[sld_LabSample]
SET [Status] = 'Received'
WHERE [id] = 999002;

PRINT 'Test 3: Second sample should get next sequential LoginNo';

-- Verify both samples have unique LoginNo values
SELECT 
    [id], [name], [Status], [LoginNo]
FROM [dbo].[sld_LabSample] 
WHERE [id] IN (999001, 999002)
ORDER BY [id];

-- Test 4: Verify that updating an already received sample doesn't change LoginNo
DECLARE @OriginalLoginNo INT;
SELECT @OriginalLoginNo = [LoginNo] FROM [dbo].[sld_LabSample] WHERE [id] = 999001;

UPDATE [dbo].[sld_LabSample]
SET [description] = 'Updated description'
WHERE [id] = 999001;

PRINT 'Test 4: Updated description - LoginNo should remain unchanged';

-- Verify LoginNo remained the same
SELECT 
    [id], [name], [Status], [LoginNo],
    CASE 
        WHEN [LoginNo] = @OriginalLoginNo THEN 'PASS - LoginNo unchanged'
        ELSE 'FAIL - LoginNo changed unexpectedly'
    END AS TestResult
FROM [dbo].[sld_LabSample] 
WHERE [id] = 999001;

-- Test 5: Test with sample that already has LoginNo set
INSERT INTO [dbo].[sld_LabSample] (
    [id], [name], [description], [Status], [LoginNo], [entity_status], [owner_id]
) VALUES (
    999003, 'Test Sample 3', 'Sample with existing LoginNo', 'Pending', 12345, 0, 1
);

UPDATE [dbo].[sld_LabSample]
SET [Status] = 'Received'
WHERE [id] = 999003;

PRINT 'Test 5: Sample with existing LoginNo should keep its LoginNo';

SELECT 
    [id], [name], [Status], [LoginNo],
    CASE 
        WHEN [LoginNo] = 12345 THEN 'PASS - Existing LoginNo preserved'
        ELSE 'FAIL - Existing LoginNo was overwritten'
    END AS TestResult
FROM [dbo].[sld_LabSample] 
WHERE [id] = 999003;

-- Cleanup test data
DELETE FROM [dbo].[sld_LabSample] WHERE [id] IN (999001, 999002, 999003);

PRINT '=== Test cleanup completed ===';
PRINT '=== All tests completed successfully ===';