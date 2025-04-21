Job Tag:

- Create Job Tag

Refresh Local Jobs, populate Job Tags from Jobs





UpdateJobTag usage:





EServiceExpressGateway.Instance.UpdateJobTag(tag);

##### LocalJobsController

- GetPageData, line 69

  Sync Job change if any, send to server



##### eServiceWebContext

- SetCurrentJob, line 320

​	If job tag is already flagged and JobMornitorSetting needs to reset

- SetCurrentJob, line 328

  Set all other listed job not listed

- SetCurrentJob, line 341

  Set one as current job

- GetJobTag, line 420

  Reset monitor setting if null

- UpdateJobTag, line 439

​	Generic method



##### DatabaseUtility

CleanupDatabase, is not in use







### eServiceWebContext.UpdateJobTag

- CurrentJob.GetMonitorInfo, line 132

- CurrentJob.GetMonitorInfo.GetValueFromScmPlcData, line 424

  Only happen when Axis adjustment happens

  What if we don't save it?

- CurrentJob.UpdateJobTag

  EndJob button trigger

- CurrentJob.UpdateJobTagSupervisor
- CurrentJob.UpdateJobTagUnit
- CurrentJob.UpdateJobTagWits
- CurrentJob.IsSeriesVisible
- CurrentJob.IsChartVisible



#### PostJob

- PostJob.EditComments
- eServiceWebContext.UpdateJobTagHasDataFromCsv
- eServiceWebContext.GetUnitsInfo