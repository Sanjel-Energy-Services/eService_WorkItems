USE [SanjelData]
GO

/****** Object:  View [dbo].[LabDatabaseView]    Script Date: 2022/6/20 15:18:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[LabDatabaseView]
AS
SELECT   dbo.TestRequest.TemplateJobType AS JobType, dbo.TestRequest.ProgramNumber, 
                TestIteration_1.IterationIndex AS VersionId, dbo.TestRequest.TemplateBlendName AS BlendName, 
                dbo.TestRequest.TemplateBlendBase AS BlendBase, dbo.TestRequest.BHCT, dbo.TestRequest.BHST, 
                dbo.TestRequest.ClientName, TestIteration_1.AdditiveListJson AS Additives, TestIteration_1.Density, 
                dbo.TestRequest.id, dbo.TestRequest.Type, dbo.TestResult.TestDateTime AS Date, TestIteration_1.OldId AS IterationId,
                    (SELECT   Value
                     FROM      dbo.TestOutput
                     WHERE   (TestResultid = dbo.TestResult.id) AND (Label = 'TT40')) AS TT40,
                    (SELECT   Value
                     FROM      dbo.TestOutput AS TestOutput_4
                     WHERE   (TestResultid = dbo.TestResult.id) AND (Label = 'TT100')) AS TT100,
                    (SELECT   Value
                     FROM      dbo.TestOutput AS TestOutput_3
                     WHERE   (TestResultid = dbo.TestResult.id) AND (Label = 'Fluid Loss')) AS FluidLoss,
                    (SELECT   Value
                     FROM      dbo.TestOutput AS TestOutput_2
                     WHERE   (TestResultid = dbo.TestResult.id) AND (Label = 'Free Water Angle')) AS FreeWaterAngle,
                    (SELECT   Value
                     FROM      dbo.TestOutput AS TestOutput_1
                     WHERE   (TestResultid = dbo.TestResult.id) AND (Label = 'Free Water')) AS FreeWater, 0 AS entity_status, 
                1 AS owner_id, '' AS name, '' AS description
FROM      dbo.TestRequest INNER JOIN
                dbo.TestIteration AS TestIteration_1 ON dbo.TestRequest.id = TestIteration_1.TestRequestid INNER JOIN
                dbo.TestResult ON TestIteration_1.id = dbo.TestResult.TestIterationid
WHERE   (dbo.TestRequest.Status = 2) AND (dbo.TestRequest.Type <> 2)
GO