UPDATE  W
set W.[LabSampleDescription]=LS.[LoginNo]
from  [dbo].[sld_WaterAnalysis] W
inner join [dbo].[Sld_LabSample] LS
ON LS.id = W.[LabSampleid]

