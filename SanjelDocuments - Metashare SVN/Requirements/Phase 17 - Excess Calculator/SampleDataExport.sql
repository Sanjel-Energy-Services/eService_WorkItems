/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [id]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[Excess]
      ,[MeasuredDepthTo]
      ,[VerticalDepthTo]
      ,[VerticalDepthFrom]
      ,[Wellid]
      ,[MeasuredDepthFrom]
  FROM [WellDB].[dbo].[WellboreSegment]

  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [id]
      ,[entity_status]
      ,[owner_id]
      ,[name]
      ,[description]
      ,[Excess]
      ,[MeasuredDepthTo]
      ,[VerticalDepthTo]
      ,[VerticalDepthFrom]
      ,[Wellid]
      ,[MeasuredDepthFrom]
  FROM [WellDB].[dbo].[WellboreSegment]

    Select WE.description, we.SurfaceLocation, we.DownHoleLocation, ws.MeasuredDepthFrom, ws.MeasuredDepthTo, ws.Excess as RequiredExcess, ws.PumpedExcess, ws.Wellid, CH.JobNumber, CH.JobTypeName, CH.JobNumber from WellboreSegment  WS
  join  Well WE on WS.Wellid = WE.id
  join  CasingHistory CH on CH.Wellid = We.id
  join JobOpenHoleStaging JOS on JOS.JobUniqueId = CH.UniqueId
  where ws.MeasuredDepthFrom >= JOS.MeasuredDepthFrom and ws.MeasuredDepthTo <= JOS.MeasuredDepthTo  and Excess<>0 order by ws.Wellid, ch.JobNumber,ws.MeasuredDepthFrom;


  Select WE.description, we.SurfaceLocation, we.DownHoleLocation, ws.MeasuredDepthFrom, ws.MeasuredDepthTo, ws.Excess, Wellid from WellboreSegment  WS
  join  Well WE on WS.Wellid = WE.id;

  select * from CasingHistory where Wellid = 7;

  select * from JobOpenHoleStaging where JobUniqueId ='9ca2eeff-d009-46a0-bb19-3f23ed0a9592';

  select * from WellboreSegment where Wellid = 7;


    Select WE.description, we.SurfaceLocation, we.DownHoleLocation, ws.MeasuredDepthFrom, ws.MeasuredDepthTo, ws.Excess, ws.Wellid, CH.JobNumber, CH.JobTypeName, CH.JobNumber from WellboreSegment  WS
  join  Well WE on WS.Wellid = WE.id
  join  CasingHistory CH on CH.Wellid = We.id
--  join JobOpenHoleStaging JOS on JOS.JobUniqueId = CH.UniqueId
 -- where ws.MeasuredDepthFrom >= JOS.MeasuredDepthFrom and ws.MeasuredDepthTo <= JOS.MeasuredDepthTo
   order by ws.Wellid, ch.JobNumber,ws.MeasuredDepthFrom;
