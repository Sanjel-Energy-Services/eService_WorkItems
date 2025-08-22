# Lab Sample LoginNo Generation Fix

## Issue Description
When manually logging in a sample into the lab database and changing the status from "pending" to "received", the login number (LoginNo) was not being generated automatically. This resulted in a LoginNo value of 0, which prevented the sample from being added to test requests.

## Root Cause
The database schema for `sld_LabSample` table was missing:
1. A `Status` field to track sample status ("Pending", "Received", etc.)
2. A trigger mechanism to auto-generate LoginNo when status changes to "Received"

## Solution
The fix includes three SQL scripts:

### 1. Fix_LabSample_LoginNo_Generation.sql
This is the main fix that:
- Adds a `Status` field to the `sld_LabSample` table (if not exists)
- Creates a function `fn_GetNextLabSampleLoginNo()` to generate sequential login numbers
- Creates a trigger `tr_LabSample_GenerateLoginNo` that automatically generates LoginNo when:
  - Sample status changes to "Received" 
  - LoginNo is currently NULL or 0
- Updates existing records that have "Received" status but no LoginNo

### 2. Test_LabSample_LoginNo_Generation.sql
Comprehensive test script that validates:
- LoginNo generation when status changes from Pending to Received
- Sequential LoginNo assignment for multiple samples
- Preservation of existing LoginNo values
- No unintended LoginNo changes on other updates

### 3. Rollback_LabSample_LoginNo_Generation.sql
Rollback script to remove the changes if needed:
- Drops the trigger
- Drops the function
- Optionally removes the Status column (commented out for safety)

## Technical Details

### Database Changes
- **Table**: `sld_LabSample`
- **New Field**: `Status` (nvarchar(50), nullable)
- **New Function**: `fn_GetNextLabSampleLoginNo()` - returns next sequential LoginNo
- **New Trigger**: `tr_LabSample_GenerateLoginNo` - fires on UPDATE

### Trigger Logic
The trigger activates when:
1. A record in `sld_LabSample` is updated
2. The `Status` field changes to "Received" (or integer value 1)
3. The current `LoginNo` is NULL or 0

### LoginNo Generation Strategy
- Uses `MAX(LoginNo) + 1` approach for simplicity
- Handles concurrent updates by executing within the trigger transaction
- Preserves existing LoginNo values (doesn't overwrite non-zero values)

## Deployment Instructions

1. **Deploy the fix**:
   ```sql
   -- Run this script on the target database
   -- Path: Phase 50 - Lab Test Database - V2/Database/Fix_LabSample_LoginNo_Generation.sql
   ```

2. **Test the deployment** (optional but recommended):
   ```sql
   -- Run the test script to validate functionality
   -- Path: Phase 50 - Lab Test Database - V2/Database/Test_LabSample_LoginNo_Generation.sql
   ```

3. **Rollback if needed**:
   ```sql
   -- Only if you need to undo the changes
   -- Path: Phase 50 - Lab Test Database - V2/Database/Rollback_LabSample_LoginNo_Generation.sql
   ```

## Usage
After deployment, the system will automatically:
1. Generate unique LoginNo values when sample status changes to "Received"
2. Allow samples with valid LoginNo to be added to test requests
3. Maintain sequential LoginNo numbering

## Compatibility
- Works with both string ("Received") and integer (1) status values
- Backward compatible with existing data
- Safe to run multiple times (includes existence checks)

## Testing
The solution has been tested for:
- ✅ New sample status change from Pending to Received
- ✅ Sequential LoginNo generation for multiple samples  
- ✅ Preservation of existing LoginNo values
- ✅ No impact on unrelated record updates
- ✅ Handling of samples with pre-existing LoginNo values

## Support
For issues or questions, refer to the test script results or contact the development team.