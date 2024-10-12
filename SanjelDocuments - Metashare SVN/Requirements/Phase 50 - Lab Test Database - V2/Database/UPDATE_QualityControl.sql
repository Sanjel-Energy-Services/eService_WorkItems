UPDATE  Q
set Q.[LabSampleDescription]=LS.[LoginNo]
from  [dbo].[sld_QualityControl] Q
inner join [dbo].[Sld_LabSample] LS
ON LS.id = Q.[LabSampleid]

