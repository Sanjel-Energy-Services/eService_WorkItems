Create table #TestIterationData(TestRequestid int,LabTestListJson varchar(max),Test varchar(max));
GO
insert #TestIterationData(TestRequestid,LabTestListJson ,Test)
select TestRequestid,cast([LabTestListJson] as varchar(MAX)) LabTestListJson ,null  from [dbo].[sld_TestIteration] ;
GO
delete from #TestIterationData  where LabTestListJson ='[]'
GO
UPDATE #TestIterationData SET Test = 'TT' WHERE [LabTestListJson] like '%ThickeningTime%' 
GO
UPDATE #TestIterationData SET Test = Test+',FL' WHERE [LabTestListJson] like '%FluidLoss%' and Test is not null
GO
UPDATE #TestIterationData SET Test = 'FL' WHERE [LabTestListJson] like '%FluidLoss%' and Test is  null
GO
UPDATE #TestIterationData SET Test = Test+',FW' WHERE [LabTestListJson] like '%FreeWater%' and Test is not null
GO
UPDATE #TestIterationData SET Test = 'FW' WHERE [LabTestListJson] like '%FreeWater%' and Test is  null
GO
UPDATE #TestIterationData SET Test = Test+',Rho' WHERE [LabTestListJson] like '%Rheology%' and Test is not null
GO
UPDATE #TestIterationData SET Test = 'Rho' WHERE [LabTestListJson] like '%Rheology%' and Test is  null
GO
UPDATE #TestIterationData SET Test = Test+',CS' WHERE [LabTestListJson] like '%CompressiveStrength%' and Test is not null
GO
UPDATE #TestIterationData SET Test = 'CS' WHERE [LabTestListJson] like '%CompressiveStrength%' and Test is  null
GO
UPDATE #TestIterationData SET Test = Test+',SGSA' WHERE [LabTestListJson] like '%StaticGelStrengthAnalyzers%' and Test is not null
GO
UPDATE #TestIterationData SET Test = 'SGSA' WHERE [LabTestListJson] like '%StaticGelStrengthAnalyzers%' and Test is  null
GO
UPDATE #TestIterationData SET Test = Test+',CI' WHERE [LabTestListJson] like '%CriticalInterval%' and Test is not null
GO
UPDATE #TestIterationData SET Test = 'CI' WHERE [LabTestListJson] like '%CriticalInterval%' and Test is  null
GO
UPDATE #TestIterationData SET Test = Test+',WA' WHERE [LabTestListJson] like '%WaterAnalysis%' and Test is not null
GO
UPDATE #TestIterationData SET Test = 'WA' WHERE [LabTestListJson] like '%WaterAnalysis%' and Test is  null
GO
UPDATE #TestIterationData SET Test = Test+',SG' WHERE [LabTestListJson] like '%SpecificGravity%' and Test is not null
GO
UPDATE #TestIterationData SET Test = 'SG' WHERE [LabTestListJson] like '%SpecificGravity%' and Test is  null
GO
Create table #Test(TestRequestid int,Test varchar(max));
GO
insert #Test(TestRequestid,Test)
select DISTINCT TestRequestid,null Test  from   #TestIterationData order by TestRequestid 
GO
UPDATE  T
set T.Test='TT'
from #Test T
inner join  #TestIterationData TD
ON  TD.TestRequestid = T.TestRequestid
WHERE  TD.Test like '%TT%' 
GO

UPDATE  T
set T.Test=T.Test+',FL'
from #Test T
inner join  #TestIterationData TD
ON  TD.TestRequestid = T.TestRequestid
WHERE  TD.Test like '%FL%' and T.Test is NOT  null
 GO

UPDATE  T
set T.Test='FL'
from #Test T
inner join  #TestIterationData TD
ON  TD.TestRequestid = T.TestRequestid
WHERE  TD.Test like '%FL%' and T.Test is   null
GO

UPDATE  T
set T.Test=T.Test+',FW'
from #Test T
inner join  #TestIterationData TD
ON  TD.TestRequestid = T.TestRequestid
WHERE  TD.Test like '%FW%' and T.Test is NOT  null
GO 

UPDATE  T
set T.Test='FW'
from #Test T
inner join  #TestIterationData TD
ON  TD.TestRequestid = T.TestRequestid
WHERE  TD.Test like '%FW%' and T.Test is   null
GO

UPDATE  T
set T.Test=T.Test+',Rho'
from #Test T
inner join  #TestIterationData TD
ON  TD.TestRequestid = T.TestRequestid
WHERE  TD.Test like '%Rho%' and T.Test is NOT  null
 GO

 UPDATE  T
set T.Test='Rho'
from #Test T
inner join  #TestIterationData TD
ON  TD.TestRequestid = T.TestRequestid
WHERE  TD.Test like '%Rho%' and T.Test is   null
GO

UPDATE  T
set T.Test=T.Test+',CS'
from #Test T
inner join  #TestIterationData TD
ON  TD.TestRequestid = T.TestRequestid
WHERE  TD.Test like '%CS%' and T.Test is NOT  null
 GO

UPDATE  T
set T.Test='CS'
from #Test T
inner join  #TestIterationData TD
ON  TD.TestRequestid = T.TestRequestid
WHERE  TD.Test like '%CS%' and T.Test is   null
GO


UPDATE  T
set T.Test=T.Test+',SGSA'
from #Test T
inner join  #TestIterationData TD
ON  TD.TestRequestid = T.TestRequestid
WHERE  TD.Test like '%SGSA%' and T.Test is NOT  null
 GO

UPDATE  T
set T.Test='SGSA'
from #Test T
inner join  #TestIterationData TD
ON  TD.TestRequestid = T.TestRequestid
WHERE  TD.Test like '%SGSA%' and T.Test is   null
GO

UPDATE  T
set T.Test=T.Test+',CI'
from #Test T
inner join  #TestIterationData TD
ON  TD.TestRequestid = T.TestRequestid
WHERE  TD.Test like '%CI%' and T.Test is NOT  null
 GO

UPDATE  T
set T.Test='CI'
from #Test T
inner join  #TestIterationData TD
ON  TD.TestRequestid = T.TestRequestid
WHERE  TD.Test like '%CI%' and T.Test is   null
GO

UPDATE  T
set T.Test=T.Test+',WA'
from #Test T
inner join  #TestIterationData TD
ON  TD.TestRequestid = T.TestRequestid
WHERE  TD.Test like '%WA%' and T.Test is NOT  null
 GO

UPDATE  T
set T.Test='WA'
from #Test T
inner join  #TestIterationData TD
ON  TD.TestRequestid = T.TestRequestid
WHERE  TD.Test like '%WA%' and T.Test is   null
GO

UPDATE  T
set T.Test=T.Test+',SG'
from #Test T
inner join  #TestIterationData TD
ON  TD.TestRequestid = T.TestRequestid
WHERE  TD.Test like '%SG%' and T.Test is NOT  null
 GO

UPDATE  T
set T.Test='SG'
from #Test T
inner join  #TestIterationData TD
ON  TD.TestRequestid = T.TestRequestid
WHERE  TD.Test like '%SG%' and T.Test is   null
GO

UPDATE  TR
set TR.[description]=T.Test
from #Test T
inner join  [dbo].[sld_TestRequest] TR
ON  TR.id = T.TestRequestid
WHERE TR.[description] IS NULL
GO

UPDATE [dbo].[sld_TestRequest] SET name  = 'B1-'+right('000000'+cast(id as varchar),6)
GO