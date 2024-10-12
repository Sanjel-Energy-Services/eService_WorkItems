# Apr 2024 Project Tasks



## Message Library Upgrade - Phase II



### PLC Data Transmission

- MQTT message queue infrastructure for PLC data
- PLC data sender sends PLC periodically.
  - PLC Data Collector writes to local database a full record periodically, currently every 10 minutes. We plan to increase the frequency to every minute, or even smaller.
  - Sender will send a full record and following changes before next full record as is to server.
  - Full record indicator is data index "D":"214" in the JSON data.
  - Data reading cursor can be created as timestamp. write a flag ese_flags to keep the latest record read
- PLC data receiver is separate, write full records to a database table as same as local database schema.
  - Once the data pack is received on server, sender will get notification of success.
- Stop eService PLC data packing in same release. remove it from job sending feature 
- Stop PLC data cleanup in Local DataManager.
- Build new local PLC data archive mechanism to move to (archive database) expired data out of runtime local database. Any data received on server and older than 15 days will be archived. 

### PLC Data Online Monitor

- JobTag improvement to be ready for online.
  
- Add JobTag to Post Data message queue
  
  - Write to server database
  
- Add new page "Job Monitor" in eServiceOnline
  - Don't need to add in main menu
  
  - Parameter is Job Number
  
  - It should be the same code as eServiceExpress, but different data source. Extract the common charting code to SanjeLibrary, maybe a Charting library. If it is not feasible, extract to SanjelCommonLibrary if possible.
  
    

##  eServiceOnline/DRB Bug Fixes

TBD



## Sanjel Library NuGet publish

- Publish first stable release for each library individually with GitHub Actions
  - Keep unstable libraries as Library Reference.
- Update application library corresponding to Sanjel Library NuGet source
- Document Sanjel Library Guidelines.



## Sanjel Common Library NuGet publish

- Move eService projects which are referenced by eProgram and eServiceOnline to SanjelCommonLibrary to decouple the dependencies.
  - DAO
  - Services
- Publish SanjelCommonLibrary to NuGet
- Update eService, eProgram, eServiceOnline and eSerivceExpress reference to use NuGet
- Build github workflow to build above applications upon PR merge.



## General Task

All requirements need to be documented in GitHub wiki.
