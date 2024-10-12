Well Location refactoring tasks.



### RigJobSanjelCrewSectionList View

- Database: Add column rigJob.WellLocationType



### RigJob

- Database

  - Add column WellLocationType
  - Data Migration: Populate WellLocationType from old WellLocationTypeId
  - Data  Integrity Check:
    - Check if DRB use WellLocationType
    - Check DRB compitable with null data in old WellLocationType four columns

  

- Code:  eServiceOnline will be updated first and also the integration with eService. Old WellLocationType won't be available anymore. 

  

