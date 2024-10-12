
UPDATE  LS
set LS.[description]=LSS.[LoginNo]
from  [dbo].[Sld_LabSample] LS
inner join [dbo].[Sld_LabSample] LSS
ON LS.id = LSS.id
WHERE LS.[description] is null

