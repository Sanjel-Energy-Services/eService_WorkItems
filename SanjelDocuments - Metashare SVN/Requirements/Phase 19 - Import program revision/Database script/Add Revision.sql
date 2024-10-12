ALTER TABLE  [eservice6].[dbo].[PROGRAMS] Add	[Revision] [int] NULL
ALTER TABLE  [eservice6].[dbo].[PROGRAMS] Add	[REVISION_DESCRIPTION] nvarchar(1000) NULL

ALTER TABLE eservice6.dbo.PROGRAMS DROP CONSTRAINT PROGRAMS_UK1
ALTER TABLE eservice6.[dbo].[PROGRAMS] ADD UNIQUE ([PROGRAM_ID] ASC, [Revision] ASC)

ALTER TABLE  [eservice6].[dbo].[CALLSHEET_HEADERS] Add	[PROGRAM_REVISION] [int] NULL
ALTER TABLE  [eservice6].[dbo].[CALLSHEET_HEADERS] Add	[MAX_PROGRAM_REVISION] [int] NULL

ALTER TABLE [SanjelData].[dbo].[RigJob] Add  [ProgramRevision] [int] NULL
ALTER TABLE [SanjelData].[dbo].[RigJob] Add  [MaxProgramRevision] [int] NULL


ALTER TABLE [SanjelData].[dbo].[ProductHaulLoad] Add  [Yield] [float] NULL
ALTER TABLE [SanjelData].[dbo].[ProductHaulLoad] Add  [SackWeight] [float] NULL
ALTER TABLE [SanjelData].[dbo].[BlendChemical] Add  [BulkDensity] [float] NULL

ALTER TABLE [SanjelData].[dbo].[ProductHaulLoad] Add  [BulkVolume] [float] NULL
ALTER TABLE [SanjelData].[dbo].[ProductHaulLoad] Add  [Density] [float] NULL

