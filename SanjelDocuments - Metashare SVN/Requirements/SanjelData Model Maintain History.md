# MDD Model Maintain History

Purpose: MDD doesn't provide a version control for model. We have to maintain a history manually to assure the changes are under control.



|Date|Entity|Change|Comments|By|
|-------|---- |---------|----|----|
| July 13, 2020 |New Entity |Add BinLoadHistory Entity under SanjelData.BusinessEntities.WellSite. Properties: JobNumber, Username, InQuantity,OutQuantity, Remains, Notes. Associations: Bin, ProductHaul | | Adam |
| Nov 20, 2020 | ProductHaulLoadLifeStatus|Add Blending, BlendComplete and Loaded Status|| Adam |
| Nov 26, 2020 |Recipe |Add property Unit (Type: BlendAdditiveMeasureUnit), this property is to define to assist weight conversion in calculation|| Adam |
| Dec 03, 2020 | ProductLoad|Add property Unit (Type: BlendAdditiveMeasureUnit), this property is to define to assist weight conversion in calculation|| Adam |
|Dec 04, 2020|New Package|Add PostJobReport Package, derived from LocalData model PostJobReport. It will maintain similar  structure to allow receiving message||Adam|
|Mar 01, 2021|New Entity|Variable Pay Entities|||
|Mar 2, 2021|BlendChemical|Add ProductStatus and its enum|||
|June 10, 2021|PayPeriod|Add PayPeriodNumber|||
|June 10, 2021|New Entity|MonthlyJobCountIncentiveSchedule|||
|June 10, 2021|PayrollExportMapping|Refactor mapping from pay summary type and pay type|||
|Oct 26, 2021|ProductLoad| Add SiteName, StorageName, Driver Name (for easy access, copy from product haul) properties |  ||
|Oct 26, 2021|ProductLoad| Remove SiteName, StorageName(Bin is it) properties, add OperationSite association with Rig(present rig and bulk plant), DispatchBy the username who schedule the product haul on board, ClientRepresentative copy from call sheet, IsBlendTest |  |      |
| Oct 26, 2021  | ProductHaul               |Add IsBlendTest|||
|Nov 17,2021|BlendCut|Add BulkPlantOperator|||
| Nov 17, 2021  | JobType                   | Correct SbsPrimaryServiceLineId type from int to string, correct SbsPrimaryServiceLineName from long string to string |  ||
|Nov 18, 2021| Product                   | Add InventoryMeasureUnit                                     |                                      ||
|Nov 30, 2021| New Enum | Add BlendTestingStatus |  ||
|Nov 30, 2021| BinInformation                   | Add PodIndex, BlendTestingStatus          |           ||
|Nov 30, 2021| ProductHaulLoad | Add ProgramId |  ||
|Nov 30, 2021| New Entity | Add JobIntervalType |  ||
|Nov 30, 2021| JobType | Add relation JobIntervalType, Add JobIntervalCount |  ||
|Dec 16, 2021| New Entity | WellType |  ||
|Dec 16, 2021| New Entity | WellObjective |  ||
|Dec 21, 2021| ProductHaulLoad | Add PodIndex |  ||
|Jan 19, 2022| ProductHaulLoad | Add  CallSheetId |  ||
|Jan 21,2022| ProductHaul | Add Crew, there are crew references in database table, but it seems removed sometime in the past. |  ||
|Jan 25, 2022| ProductHaul | Add BulkPlant |  ||
|Jan 25, 2022| ProductHaul | Remove IsBlendTest.  In the conceptual model, if the blend schedule is a blend test, there is no product haul object associated. |  ||
|Jan 26, 2022| ProductHaulLoad | Add Estimated Load Time |  ||
|Jan 26, 2022| ProductHaulLoad | Add UseExistingHaul | To Be Removed |      |
|Feb 10,2022| ProductHaul | Add ExpectedOnLocationTime | From first Load ||
|Feb 10, 2022| New Entities | For Workforce Readiness, add Plan, AssignedPlan, PlanItem, AssignedPlanItem |  ||
|Feb 10,2022| SanjelCrewSchedule | Add composite to UnitSchedule, WorkerSchedule |  ||
|Feb 25, 2022| BlendLog | BulkPlantId, Bulk PlantName | ||
|Mar 4, 2022| New Entity | BlendTankLog | ||
|Apr 5, 2022| AssignedPlanItem | Add association to PlanItem and AssignedPlan | ||
|Apr 26, 2022| New Entities | AssignedPlanStatus, AssignedPlanItemStatus and assoications as per Richard requested on Apr 8. | ||
|Apr 26, 2022| ProductHaulLoadStatus | Add Preblended, Quarantined status | ||
|May 3, 2022| Product Haul Load | Add SourceStorage | ||
|May 24| New Entities | Lab package | ||
|May 24| New Entity | Add PlanItemNotes as per Richard requested on Apr 27 | ||
|June 7| PayEntry | Add CrewCount | ||
|June 7| WorkAssignement | Add CrewCount | ||
|July 18| New Entities | Add BlendUnloadSheet, ShippingLoadSheet, PodLoad, BlenshippingStatus | ||
|July 19, 2022| BinLoadHistory | Refactor association to ShippingLoadSheet and Bin, it should be associated to BinInformation. | ||
|July 21, 2022| ProductHaulLoad | Add property RemainsAmount | ||
||  |  | ||
|August 18, 2022| New Entity | Add Well, LocationLookup | ||
|Aug 18, 2022| RigJob | Add Property Latitude, Longitude | ||
|Aug 18, 2022| OperationSiteType | Add DistrictCamp type | ||
|Aug 18, 2022| Rig | Add Property Latitude, Longitude | ||
|Aug 25, 2022| New Entity | Add UnitLocation | ||
|Aug 26, 2022| ShippingLoadSheet | Add IsGoWithCrew | ||
|Aug 26, 2022| LocationLookup | Add LSD_LSD, LSD_Sec, NTS_QuaterUnit, NTS_Unit, NTS_Block | ||
|Aug 26, 2022| ProductHaulLoad | Add BlendShippingStatus | ||
|Aug 26, 2022| New Enum | Add ShippingStatus | ||
|Aug 26, 2022| ShippingLoadSheet | Change ShippingStatus type from BlendShippingStatus to ShppingStatus | ||
|Sep 6, 2022| New Entities | Add JobDesign, JobDesignPumpingJobSection, Unit Count | ||
|Sep 6, 2022| New base entity | JobBase, update RigJob inherites from JobBase, add new properties PumperCount, JobDuration, PreJobTesting | ||
|Sep 6, 2022| New Enitity | EstimateJob inherites from JobBase | ||





May 2, 2023

- ~~Add Service Point to Call Sheet~~

- ~~Add Service Point to BlendShippingFacade~~

- ~~Add Execution Order to Job Design Pumping Job Sectoin~~

- ~~Add Enum AdditiveFunction~~

  

- ~~Add RigStatus to SalesProject~~

- ~~Add OnDuty/OffDuty to WorkerScheduleType~~

- ~~Add OnDuty/OffDuty to UnitScheduleType~~

- ~~Add OnDuty/OffDuty to CrewScheduleType~~



- ~~Add IsBidProgram in Job Design~~
- ~~change isBidProgram to IsBid in DrillOrder~~
- Remove bidprogramnumber/bidprogramrevision from sales project
- ~~Add ExpiryDate in Job Design~~



May 8, 2023

- ~~Add ServiceLine to SanjelCrew~~
- ~~Add "Cancelled" status to SalesProjectStatus~~
- ~~Add SalesProjectUid to JobBase, will affect EstimateJob, JobDesign, RigJob~~
- Remove ProgramNumber, ProgramRevision from SalesProject
- ~~Add IsDeleted flag in SanjelCrew for soft delete purpose.~~
- ~~Add WellLocation to SalesProject, copy from representative program downhole location whenever a program is set.~~
- ~~Add RigWorkReport entity, provide the lookup data from BI, It can be queried by Rig and Service Point. If queried by rig but no service point value, that means these data applies to all service point. If query by service point without rig, that means these data applies to all rigs in these service point.~~





May 16, 2023

- Add Loading, Loaded, EnRoute, OnLocation, OnWayIn, Returned status in RigJobCrewSectionStatus
- Added Loading, Loaded in ProductHaulStatus
