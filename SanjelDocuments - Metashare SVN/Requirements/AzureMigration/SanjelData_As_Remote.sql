-- ========================================================================================
-- Create User as DBO template for Azure SQL Database and Azure SQL Data Warehouse Database
-- ========================================================================================
-- For login <login_name, sysname, login_name>, create a user in the database
CREATE USER RemoteVisitor
	FOR LOGIN RemoteVisitor
	WITH DEFAULT_SCHEMA = SanjelData
GO

-- Add user to the database owner role
EXEC sp_addrolemember N'db_owner', N'<user_name, sysname, user_name>'
GO


GRANT SELECT ON Bin TO RemoteVisitor;
GRANT SELECT ON BINTYPE TO RemoteVisitor;
GRANT SELECT ON BlendChemical TO RemoteVisitor;
GRANT SELECT ON BlendRecipe TO RemoteVisitor;
GRANT SELECT ON BlendChemicalSection TO RemoteVisitor;
GRANT SELECT ON BonusPosition TO RemoteVisitor;
GRANT SELECT ON ClientConsultant TO RemoteVisitor;
GRANT SELECT ON ClientCompany TO RemoteVisitor;
GRANT SELECT ON ContractorCompany TO RemoteVisitor;
GRANT SELECT ON Country TO RemoteVisitor;
GRANT SELECT ON DrillingCompany TO RemoteVisitor;
GRANT SELECT ON Employee TO RemoteVisitor;
GRANT SELECT ON JobType TO RemoteVisitor;
GRANT SELECT ON Product TO RemoteVisitor;
GRANT SELECT ON ProvinceOrState TO RemoteVisitor;
GRANT SELECT ON Rig TO RemoteVisitor;
GRANT SELECT ON SanjelCompany TO RemoteVisitor;
GRANT SELECT ON ServicePoint TO RemoteVisitor;
GRANT SELECT ON TruckUnit TO RemoteVisitor;
GRANT SELECT ON UnitSubType TO RemoteVisitor;
GRANT SELECT ON UnitMainType TO RemoteVisitor;


