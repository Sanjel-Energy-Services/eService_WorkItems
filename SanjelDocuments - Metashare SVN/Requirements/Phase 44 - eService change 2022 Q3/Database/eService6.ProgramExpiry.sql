BEGIN TRANSACTION
GO
ALTER TABLE dbo.PROGRAMS ADD PROGRAM_EXPIRY_DATE datetime2(7) NULL
GO 
COMMIT

-- set default expiry date (240 days) after generated date
UPDATE [dbo].[PROGRAMS] SET PROGRAM_EXPIRY_DATE = DATEADD(DAY, 240, PROGRAM_GENERATED_DATE)  


-- it will set status 17 (expired) to all programs which expiry date is less than today
-- UPDATE [dbo].[PROGRAMS] SET STATUS = 17 Where GETDATE() > PROGRAM_EXPIRY_DATE 