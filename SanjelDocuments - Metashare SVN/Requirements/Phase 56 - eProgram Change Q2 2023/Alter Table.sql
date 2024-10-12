Alter Table [eService6].[dbo].[PROGRAMS] Add WELL_TYPE_ID Integer;
Alter Table [eService6].[dbo].[PROGRAMS] Add WELL_TYPE_NAME nvarchar(255);
Alter Table [eService6].[dbo].[PROGRAMS] Add WELL_OBJECTIVE_ID Integer;
Alter Table [eService6].[dbo].[PROGRAMS] Add WELL_OBJECTIVE_NAME nvarchar(255);
Alter Table [eService6].[dbo].[PROGRAMS] Add REMEDIAL_OBJECTIVE_ID Integer;
Alter Table [eService6].[dbo].[PROGRAMS] Add REMEDIAL_OBJECTIVE_NAME nvarchar(255);


Alter Table [eService6].[dbo].[PRG_PUMPING_JOB_SECTIONS]  Add WELL_OBJECTIVE_ID Integer;
Alter Table [eService6].[dbo].[PRG_PUMPING_JOB_SECTIONS]  Add WELL_OBJECTIVE_NAME nvarchar(255);


Alter Table [eService6].[dbo].[PROGRAMS]  Add [SALES_FORECAST_NUMBER] [nvarchar](255) NULL
Alter Table [eService6].[dbo].[PROGRAMS]  Add [ITERATION] nvarchar(255) NULL

