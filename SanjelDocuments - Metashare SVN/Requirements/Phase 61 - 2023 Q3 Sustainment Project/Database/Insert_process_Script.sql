
USE [SanjelData]
GO
INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncident] ( entity_status, owner_id, name, description)
VALUES ( 0, 101, NULL, NULL);

INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncident] ( entity_status, owner_id, name, description)
VALUES ( 0, 102, 'Quality', 'Quality');

INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncident] (entity_status, owner_id, name, description)
VALUES (0, 103, 'Late', 'Late');

INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncident] ( entity_status, owner_id, name, description)
VALUES (0, 104, 'Quality–Well Integrity', 'Quality–Well Integrity');
GO

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  101			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='0 - < 30 Min NPT';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  102			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
 from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='0 - Unplanned Event with No NPT';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  103			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='1 - > 30 Min < 240 Min NPT';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  104			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='1 - Deviation from Design/Program (Rate)';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  105			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
 from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='1 - Cement in Pipe (< 10m) - Drilling Out';


  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  106			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='1 - < $10,000 Incident Cost';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  107			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='2 - > 240 Min < 720 Min NPT';


  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  108			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='2 - Deviation from Design/Program (Density)';


  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  109			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='2 - Cement in Pipe (> 10m < 100m) - Drilling Out';


  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  110			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='2 - > $10,000 < $50,000 Incident Cost';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  111			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='3 - > 720 Min < 1440 Min NPT';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  112			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='3 - Exceeded Equipment Limitations';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  113			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='3 - Pumped Incorrect Materials/Order/Volume';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  114			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='3 - Cement in Pipe (> 100m < 250m) - Drilling Out';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  115			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='3 - > $50,000 < $100,000 Incident Cost';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  116			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='4 - > 1440 Min NPT';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  117			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='4 - Job Not Performed/Released';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  118			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='4 - Cement in Pipe (> 250m) - Drilling Out';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  119			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='4 - Cement in Pipe - Not Drilling Out';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  120			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='4 - > $100,000 < $1,000,000 Incident Cost';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  121			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='5 - > $1,000,000 Incident Cost';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  122			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='5 - Loss of Well';

--Late
  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  201			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  2				 as [PrimaryIncidentid],
 'Late'			 as [PrimaryIncidentName],
 'Late'			 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='0 - Unplanned Event with No NPT';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  202			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  2				 as [PrimaryIncidentid],
 'Late'			 as [PrimaryIncidentName],
 'Late'			 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='0 - < 30 Min NPT';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  203			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  2				 as [PrimaryIncidentid],
 'Late'			 as [PrimaryIncidentName],
 'Late'			 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='1 - > 30 Min < 240 Min NPT';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  204			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  2				 as [PrimaryIncidentid],
 'Late'			 as [PrimaryIncidentName],
 'Late'			 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='2 - > 240 Min < 720 Min NPT';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  205			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  2				 as [PrimaryIncidentid],
 'Late'			 as [PrimaryIncidentName],
 'Late'			 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='3 - > 720 Min < 1440 Min NPT';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  206			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  2				 as [PrimaryIncidentid],
 'Late'			 as [PrimaryIncidentName],
 'Late'			 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='4 - > 1440 Min NPT';


--well intergrity

 INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  301			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='0 - Loss of Returns (Cement to Surface)';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  302			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
 from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='0 - No Cement to Surface (Expected)';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  303			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='0 - Unplanned Event with No NPT';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  304			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='1 - No Cement to Surface (Only Scavenger)';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  305			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
 from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='1 - Cement in Pipe (< 10m) - Drilling Out';


  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  306			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='1 - Fluid Fallback';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  307			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='1 - < $10,000 Incident Cost';


  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  308			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='1 - Completions System Affected < $10,000';


  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  309			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='2 - Cement in Pipe (> 10m < 100m) - Drilling Out';


  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  310			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='2 - No Cement to Surface - Cement Covers Required Zone';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  311			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='2 - Completions System Affected > $10,000';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  312			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='2 - > $10,000 < $50,000 Incident Cost';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  313			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='2 - Remedial Job Objective Not Achieved';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  314			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='3 - Cement in Pipe (> 100m < 250m) - Drilling Out';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  315			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='3 - > $50,000 < $100,000 Incident Cost';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  316			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='3 - Remediation Required';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  317			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='4 - Cement in Pipe (> 250m) - Drilling Out';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  318			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='4 - Cement in Pipe - Not Drilling Out';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  319			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='4 - > $100,000 < $1,000,000 Incident Cost';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  320			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='4 - Major Intervention Required';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  321			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='5 - > $1,000,000 Incident Cost';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentActualSeverity] 
(entity_status, owner_id, name, description, ActualSeverityid, ActualSeverityName, ActualSeverityDescription, ActualSeveritySystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)
select 
  0				 as [entity_status],
  322			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [ActualSeverityid],
  Name			 as [ActualSeverityName],
  Description    as [ActualSeverityDescription],
  system_id      as [ActualSeveritySystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
from [SanjelData].[dbo].hse_SeverityMatrixtype 
where  name='5 - Loss of Well';

--hse_PrimaryIncidentIncidentType

INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription) 
SELECT  
  0				 as [entity_status],
  101			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Bulk Delivery - Storage Silo';

  INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  101			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Bulk Delivery - Trailer';

    INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  102			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Cement/Product Not Placed as Planned';

      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  103			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Circulate Out of Hole';

      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  104			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Data Acquisition';

      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  105			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Did Not Bump Plug';

      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  106			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Dry Batch';

      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  107			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Equipment Breakdown';

      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  108			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Equipment Performance Issue';

      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  109			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Forgotten Equipment/Materials';

      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  110			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Lost Prime';

      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  111			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Mixing Issues';

      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  112			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Pipe Stuck in Hole';

      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  113			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Plug Bump Did Not Hold';

      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  114			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Post-Job Cement Performance';

      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  115			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Pressure Test Non-Conformance';

      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  116			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Product Contamination';

      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  117			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Pump Failure';

      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  118			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Pump Jacking';

      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  119			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Pumped Extra Displacement - Bump Plug';

      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  121			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Remedial Job Objective Not Achieved';

      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  122			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Third Party Tool/Equipment Issue';

      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  123			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Treating Line Leak';

      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  124			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Cement Left in Pipe';

      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  125			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Water Delivery - Displacement';

      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  126			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Water Delivery - Mixing';

      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  127			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  1				 as [PrimaryIncidentid],
 'Quality'		 as [PrimaryIncidentName],
 'Quality'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Frozen Iron';


      INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  201			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  2				 as [PrimaryIncidentid],
 'Late'		 as [PrimaryIncidentName],
 'Late'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Late - Delay Client Operation (Bulk)';

        INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  202			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  2				 as [PrimaryIncidentid],
 'Late'		 as [PrimaryIncidentName],
 'Late'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Late - No Delay to Client Operation (Bulk)';


        INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  203			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  2				 as [PrimaryIncidentid],
 'Late'		 as [PrimaryIncidentName],
 'Late'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Late - Delay Client Operation (Pump Crew)';

        INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  204			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  2				 as [PrimaryIncidentid],
 'Late'		 as [PrimaryIncidentName],
 'Late'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Late - No Delay to Client Operation (Pump Crew)';

        INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  205			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  2				 as [PrimaryIncidentid],
 'Late'		 as [PrimaryIncidentName],
 'Late'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Late - Client Caused';


 INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  301			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Cement to Surface - Intermittent Returns';

   INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  302			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Cement to Surface - Lost Circulation';

   INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  303			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Cement/Product Not Placed as Planned';

   INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  304			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Circulate Out of Hole';

   INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  305			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Fluid Fallback';

   INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  306			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Fluid Migration';

   INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  307			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Higher than Expected Pressure';

   INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  308			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='No Cement to Surface - Full Circulation';

   INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  309			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='No Cement to Surface - Intermittent Returns';

   INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  310			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='No Cement to Surface - Lost Circulation';

   INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  311			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Over Pressure Well (Below Surface)';

   INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  312			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Pipe Stuck in Hole';

   INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  313			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Post-Job Cement Performance';

   INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  314			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Remedial Job Objective Not Achieved';

   INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  315			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Third Party Tool/Equipment Issue';

   INSERT INTO [SanjelData].[dbo].[hse_PrimaryIncidentIncidentType] 
( entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PrimaryIncidentid, PrimaryIncidentName, PrimaryIncidentDescription)

SELECT  
  0				 as [entity_status],
  316			 as [owner_id],
  null			 as [name],
  null			 as [description], 
  id			 as [IncidentTypeid],
  Name			 as [IncidentTypeName],
  Description	 as [IncidentTypeDescription],
  system_id      as [IncidentTypeSystemId],
  3				 as [PrimaryIncidentid],
 'Quality–Well Integrity'		 as [PrimaryIncidentName],
 'Quality–Well Integrity'		 as [PrimaryIncidentDescription]
  FROM [SanjelData].[dbo].[hse_IncidentType]
  where  name='Cement Left in Pipe';

--hse_IncidentTypePerformanceMetric
  INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  101					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Bulk Delivery - Storage Silo'
  and tb2.name ='Blower' ;

  
  INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  102					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Bulk Delivery - Storage Silo'
  and tb2.name ='Equipment Cemented Off' ;

    INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  103					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Bulk Delivery - Storage Silo'
  and tb2.name ='Insufficient Tank Pressure - Silo' ;

    INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  104					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Bulk Delivery - Storage Silo'
  and tb2.name ='Insufficient Tank Pressure - Trailer' ;

    INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  105					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Bulk Delivery - Storage Silo'
  and tb2.name ='Low Pressure Line or Hose' ;

    INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  106					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Bulk Delivery - Storage Silo'
  and tb2.name ='Not Following Design/Procedure' ;

    INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  107					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Bulk Delivery - Storage Silo'
  and tb2.name ='Plugged Hose' ;

    INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  108					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Bulk Delivery - Storage Silo'
  and tb2.name ='Pressure Relief Valve' ;

    INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  201					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Bulk Delivery - Trailer'
  and tb2.name ='Blower' ;

      INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  202					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Bulk Delivery - Trailer'
  and tb2.name ='Equipment Cemented Off' ;


      INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  203					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Bulk Delivery - Trailer'
  and tb2.name ='Insufficient Tank Pressure - Silo' ;


      INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  204					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Bulk Delivery - Trailer'
  and tb2.name ='Insufficient Tank Pressure - Trailer' ;


      INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  205					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Bulk Delivery - Trailer'
  and tb2.name ='Low Pressure Line or Hose' ;


      INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  206					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Bulk Delivery - Trailer'
  and tb2.name ='Not Following Design/Procedure' ;


      INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  207					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Bulk Delivery - Trailer'
  and tb2.name ='Plugged Hose' ;


      INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  208					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Bulk Delivery - Trailer'
  and tb2.name ='Pressure Relief Valve' ;
---0916
 INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  301					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Cement/Product Not Placed as Planned'
  and tb2.name ='Failure to Coordinate' ;

    INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  302					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Cement/Product Not Placed as Planned'
  and tb2.name ='Misblend' ;
  
INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  303					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Cement/Product Not Placed as Planned'
  and tb2.name ='Mislabelled/Incorrect Silo' ;
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  304					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Cement/Product Not Placed as Planned'
  and tb2.name ='Not Following Design/Procedure' ;
  
  INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  305					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Cement/Product Not Placed as Planned'
  and tb2.name ='Third Party - Downhole Tool' ;
  
 INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  501					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Data Acquisition'
  and tb2.name ='eService Chart' ;
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  502					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Data Acquisition'
  and tb2.name ='WITS - Sanjel' ;
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  503					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Data Acquisition'
  and tb2.name ='WITS - Third Party' ;
  
 INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  601					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Did Not Bump Plug'
  and tb2.name ='4 Inch Coriolis' ;
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  602					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Did Not Bump Plug'
  and tb2.name ='Centrifugal Pump - Recirc/Pressurizer' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  603					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Did Not Bump Plug'
  and tb2.name ='Excessive Aeration' ;
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  604					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Did Not Bump Plug'
  and tb2.name ='Horsepower Limitation' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  605					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Did Not Bump Plug'
  and tb2.name ='Incorrect Valve Position' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  606					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Did Not Bump Plug'
  and tb2.name ='Not Following Design/Procedure' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  607					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Did Not Bump Plug'
  and tb2.name ='Plug Loading Head/Manifold' ;
 
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  608					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Did Not Bump Plug'
  and tb2.name ='Third Party - Downhole Tool' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  609					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Did Not Bump Plug'
  and tb2.name ='Third Party - Vacuum Truck' ;
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  610					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Did Not Bump Plug'
  and tb2.name ='Third Party - Water Hauler' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  611					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Did Not Bump Plug'
  and tb2.name ='Triplex Pump' ;
    
    INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  612					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Did Not Bump Plug'
  and tb2.name ='Wiper Plug - Sanjel' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  613					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Did Not Bump Plug'
  and tb2.name ='Wiper Plug - Third Party' ;
 
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  701					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Dry Batch'
  and tb2.name ='2 Inch Coriolis' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  702					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Dry Batch'
  and tb2.name ='4 Inch Coriolis' ;
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  703					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Dry Batch'
  and tb2.name ='Centrifugal Pump - Mix Mission' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  704					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Dry Batch'
  and tb2.name ='Centrifugal Pump - Recirc/Pressurizer' ;
  
    INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  705					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Dry Batch'
  and tb2.name ='Deck Engine' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  706					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Dry Batch'
  and tb2.name ='Equipment Cemented Off' ;
 
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  707					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Dry Batch'
  and tb2.name ='Electronics' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  708					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Dry Batch'
  and tb2.name ='Excessive Aeration' ;
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  709					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Dry Batch'
  and tb2.name ='Hydraulics' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  710					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Dry Batch'
  and tb2.name ='Incorrect Valve Position' ;
  
  
    INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  711					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Dry Batch'
  and tb2.name ='Not Following Design/Procedure' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  712					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Dry Batch'
  and tb2.name ='Slurry Viscosity' ;
 
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  801					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Equipment Breakdown'
  and tb2.name ='Air System - Tractor' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  802					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Equipment Breakdown'
  and tb2.name ='Air System - Trailer' ;
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  803					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Equipment Breakdown'
  and tb2.name ='Blower' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  804					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Equipment Breakdown'
  and tb2.name ='Centrifugal Pump - Mix Mission' ;
  
  
    INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  805					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Equipment Breakdown'
  and tb2.name ='Centrifugal Pump - Recirc/Pressurizer' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  806					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Equipment Breakdown'
  and tb2.name ='Deck Engine' ;
 
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  807					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Equipment Breakdown'
  and tb2.name ='Driveline/PTO' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  808					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Equipment Breakdown'
  and tb2.name ='Electrical/Wiring/Fuse' ;
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  809					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Equipment Breakdown'
  and tb2.name ='Electronics' ;
   
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  810					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Equipment Breakdown'
  and tb2.name ='Hydraulics' ;
  
    INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  811					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Equipment Breakdown'
  and tb2.name ='Road Engine' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  812					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Equipment Breakdown'
  and tb2.name ='Triplex Pump' ;
 
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  901					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Equipment Performance Issue'
  and tb2.name ='2 Inch Coriolis' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  902					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Equipment Performance Issue'
  and tb2.name ='4 Inch Coriolis' ;
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  903					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Equipment Performance Issue'
  and tb2.name ='Centrifugal Pump - Mix Mission' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  904					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Equipment Performance Issue'
  and tb2.name ='Centrifugal Pump - Recirc/Pressurizer' ;
  
  
    INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  905					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Equipment Performance Issue'
  and tb2.name ='Electronics' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  906					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Equipment Performance Issue'
  and tb2.name ='Equipment Cemented Off' ;
 
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  907					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Equipment Performance Issue'
  and tb2.name ='Hydraulics' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  908					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Equipment Performance Issue'
  and tb2.name ='Regen' ;
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  909					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Equipment Performance Issue'
  and tb2.name ='Failure to Coordinate' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1001					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Forgotten Equipment/Materials'
  and tb2.name ='Not Following Design/Procedure' ;
  
  
    INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1101					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Lost Prime'
  and tb2.name ='Incorrect Valve Position' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1102					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Lost Prime'
  and tb2.name ='Not Following Design/Procedure' ;
 
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1103					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Lost Prime'
  and tb2.name ='Third Party - Water Hauler' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1201					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Mixing Issues'
  and tb2.name ='Equipment Cemented Off' ;
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1202					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Mixing Issues'
  and tb2.name ='Excessive Aeration' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1203					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Mixing Issues'
  and tb2.name ='Incorrect Valve Position' ;
  
  
    INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1204					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Mixing Issues'
  and tb2.name ='Not Following Design/Procedure' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1205					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Mixing Issues'
  and tb2.name ='Slurry Viscosity' ;
 
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1301					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Plug Bump Did Not Hold'
  and tb2.name ='Third Party - Downhole Tool' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1302					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Plug Bump Did Not Hold'
  and tb2.name ='Wiper Plug - Sanjel' ;
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1303					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Plug Bump Did Not Hold'
  and tb2.name ='Wiper Plug - Third Party' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1401					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pressure Incident'
  and tb2.name ='Batch-O-Matic' ;
  
  
    INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1402					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pressure Incident'
  and tb2.name ='Incorrect Valve Position' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1403					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pressure Incident'
  and tb2.name ='Not Following Design/Procedure' ;
 
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1404					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pressure Incident'
  and tb2.name ='Pressure Relief Valve' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1405					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pressure Incident'
  and tb2.name ='Third Party - Rig' ;
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1501					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pressure Test Non-Conformance'
  and tb2.name ='Not Following Design/Procedure' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1502					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pressure Test Non-Conformance'
  and tb2.name ='Pressure Relief Valve' ;
  
  
    INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1503					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pressure Test Non-Conformance'
  and tb2.name ='Treating Iron Component' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1504					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pressure Test Non-Conformance'
  and tb2.name ='Triplex Pump' ;
 
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1601					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Product Contamination'
  and tb2.name ='Failure to Coordinate' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1602					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Product Contamination'
  and tb2.name ='Incorrect Valve Position' ;
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1603					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Product Contamination'
  and tb2.name ='Misblend' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1604					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Product Contamination'
  and tb2.name ='Mislabelled/Incorrect Silo' ;
  
  
    INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1605					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Product Contamination'
  and tb2.name ='Not Following Design/Procedure' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1701					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pump Failure'
  and tb2.name ='Centrifugal Pump - Mix Mission' ;
 
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1702					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pump Failure'
  and tb2.name ='Centrifugal Pump - Recirc/Pressurizer' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1703					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pump Failure'
  and tb2.name ='Triplex Pump' ;
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1801					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pump Jacking'
  and tb2.name ='Centrifugal Pump - Recirc/Pressurizer' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1802					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pump Jacking'
  and tb2.name ='Excessive Aeration' ;
  
  
    INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1901					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pumped Extra Displacement - Bump Plug'
  and tb2.name ='4 Inch Coriolis' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1902					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pumped Extra Displacement - Bump Plug'
  and tb2.name ='Centrifugal Pump - Recirc/Pressurizer' ;
 
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1903					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pumped Extra Displacement - Bump Plug'
  and tb2.name ='Excessive Aeration' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1904					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pumped Extra Displacement - Bump Plug'
  and tb2.name ='Horsepower Limitation' ;
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1905					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pumped Extra Displacement - Bump Plug'
  and tb2.name ='Incorrect Valve Position' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1906					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pumped Extra Displacement - Bump Plug'
  and tb2.name ='Not Following Design/Procedure' ;
  
  
    INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1907					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pumped Extra Displacement - Bump Plug'
  and tb2.name ='Plug Loading Head/Manifold' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1908					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pumped Extra Displacement - Bump Plug'
  and tb2.name ='Third Party - Downhole Tool' ;
 
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1909					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pumped Extra Displacement - Bump Plug'
  and tb2.name ='Third Party - Vacuum Truck' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1910					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pumped Extra Displacement - Bump Plug'
  and tb2.name ='Third Party - Water Hauler' ;
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1911					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pumped Extra Displacement - Bump Plug'
  and tb2.name ='Triplex Pump' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1912					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pumped Extra Displacement - Bump Plug'
  and tb2.name ='Wiper Plug - Sanjel' ;
  
  
    INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  1913					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Pumped Extra Displacement - Bump Plug'
  and tb2.name ='Wiper Plug - Third Party' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  2101					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Third Party Tool/Equipment Issue'
  and tb2.name ='Third Party - Downhole Tool' ;
 
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  2102					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Third Party Tool/Equipment Issue'
  and tb2.name ='Third Party - Vacuum Truck' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  2103					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Third Party Tool/Equipment Issue'
  and tb2.name ='Third Party - Rig' ;
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  2104					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Third Party Tool/Equipment Issue'
  and tb2.name ='Third Party - Water Hauler' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  2201					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Treating Line Leak'
  and tb2.name ='Plug Loading Head/Manifold' ;
  
  
    INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  2202					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Treating Line Leak'
  and tb2.name ='Treating Iron Component' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  2401					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Water Delivery - Displacement'
  and tb2.name ='Incorrect Valve Position' ;
 
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  2402					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Water Delivery - Displacement'
  and tb2.name ='Low Pressure Line or Hose' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  2403					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Water Delivery - Displacement'
  and tb2.name ='Not Following Design/Procedure' ;
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  2404					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Water Delivery - Displacement'
  and tb2.name ='Plugged Screen' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  2405					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Water Delivery - Displacement'
  and tb2.name ='Third Party - Water Hauler' ;
  
  
    INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  2501					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Water Delivery - Mixing'
  and tb2.name ='Incorrect Valve Position' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  2502					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Water Delivery - Mixing'
  and tb2.name ='Low Pressure Line or Hose' ;
 
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  2503					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Water Delivery - Mixing'
  and tb2.name ='Not Following Design/Procedure' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  2504					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Water Delivery - Mixing'
  and tb2.name ='Plugged Screen' ;
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  2505					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Water Delivery - Mixing'
  and tb2.name ='Third Party - Water Hauler' ;
  
  
   INSERT INTO [SanjelData].[dbo].[hse_IncidentTypePerformanceMetric] 
(entity_status, owner_id, name, description, IncidentTypeid, IncidentTypeName, IncidentTypeDescription, IncidentTypeSystemId, PerformanceMetricid, PerformanceMetricName, PerformanceMetricDescription, PerformanceMetricSystemId)
SELECT  
  0						as [entity_status],
  2601					as [owner_id],
  null					as [name],
  null					as [description], 
  tb1.id				as [IncidentTypeid],
  tb1.Name				as [IncidentTypeName],
  tb1.Description		as [IncidentTypeDescription],
  tb1.system_id			as [IncidentTypeSystemId],
  tb2.id				as [PerformanceMetricid],
  tb2.Name				as [PerformanceMetricName],
  tb2.Description		as [PerformanceMetricDescription],
  tb2.system_id 		as [PerformanceMetricSystemId]
  FROM 
  [SanjelData].[dbo].[hse_IncidentType] tb1
   Join  [SanjelData].dbo.hse_PerformanceMetric tb2 on  tb1.name='Frozen Iron'
  and tb2.name ='Not Following Design/Procedure' ;
  
  