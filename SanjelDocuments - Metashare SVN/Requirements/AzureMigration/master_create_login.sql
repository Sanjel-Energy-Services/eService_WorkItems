-- ========================================================================================
-- Create User as DBO template for Azure SQL Database and Azure SQL Data Warehouse Database
-- ========================================================================================
-- For login <login_name, sysname, login_name>, create a user in the database
CREATE USER accross-database with
	FOR LOGIN <login_name, sysname, login_name>
	WITH DEFAULT_SCHEMA = <default_schema, sysname, dbo>
GO

-- Add user to the database owner role
EXEC sp_addrolemember N'db_owner', N'<user_name, sysname, user_name>'
GO


create login RemoteVisitor WITH PASSWORD = 'S@nj3l160601';