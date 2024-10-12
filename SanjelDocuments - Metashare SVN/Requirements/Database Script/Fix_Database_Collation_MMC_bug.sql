USE master;  
GO  
ALTER DATABASE SanjelData_1  
COLLATE SQL_Latin1_General_CP1_CI_AS ;  
GO  


SELECT name, collation_name  
FROM sys.databases  
WHERE name = N'SanjelData_1';  
GO  
