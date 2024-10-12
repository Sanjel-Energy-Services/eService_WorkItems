# Test Lab testing project by MMC

### 1.Sample Login

- [x] Sample Login List
  - [x] search Name,order Name
  - [x] search Login,order Login
  - [x] search District,order District
  - [x] search Client,order Client
  - [x] search Well Name,order Well Name
  - [x] search Type,Order Type
- [x] New Sample
  - [x] client dropdown
  - [x] district dropdown
  - [x] type dropdown
  - [x] save
- [x] Details
  - [x] show
  - [x] Edit
  - [x] Clone Sample

- [x] Request Water Analysis
  - [x] sales Rep dropdown
  - [x] lab Analyst dropdown
  - [x] save
  - [x] edit

- [x] QC Test Request
  - [x] save
  - [x] edit

### 2.Lab request

- [x] Lab Request List

  - [x] search request Id,order request id

  - [x] search Blend,order Blend

  - [x] search Client Name,order Client Name

  - [x] search Program No,order Program No

  - [x] search Requested By,order Requested By【but the search Requested By Is Originally invalid】

    

- [x] new Request
  - [x] Client dropdown
  - [x] CS Rep dropdown
  - [x] Blend Base dropdown
  - [x] Cement Source dropdown
  - [x] Login dropdown
  - [x] Water Source dropdown
  - [x] Login dropdown
  - [x] District(service point) dropdown
  - [x] TS Rep dropdown
  - [x] next button
  - [x] salt dropdown
  - [x] additives add
  - [x] tests add
  - [x] save button

- [x] General Detail
  - [x] show
  - [x] Edit

- [x] Test Iterations Detail

  - [x] show

  - [x] edit

  - [x] DownLoad Chart Creator

    - [x]   Thickening Time 
    - [x]   Compressive Strength 
    - [x]   Rheology 
    - [x]   Static Gel Strength Analyzers 

    【download success once,the visual studio debug will stop】

  - [x] DownLoad WSC

    【download success once,the visual studio debug will stop】

- [x] Test Results Details
  - [x] show

3.Experimental

- [x] Experimental List

  【this used the same api with lab request,but there are no data】

4.H2O Analysis

- [x] H2O Analysis List
  - [ ] search Login,order Login
  - [ ] search Sample,order Sample
  - [x] search Lab Analyst,order Lab Analyst
  - [x] search Water Source,order Water Source

- [x] login column click,link to Lab Sample Details
- [x] details click,link to H2O Analysis Detail
  - [x] General
    - [x] Edit
  - [x] Analysis
    - [x] Edit

5.Quality control

- [ ] Quality control List
  - [ ] Search Login,order Login
  - [ ] Search Sample,order Sample
  - [x] search TT40,order TT40
  - [x] search Intial BC,order Intial BC
  - [x] search Rheology,order Rheology
  - [x] search  Density,order Density
  - [x] search 10sec Gel,order 10sec Gel
  - [x] search 10min Gel,order 10min Gel

- [x] login column click,link to Lab Sample Details
- [x] details click,link to H2O Analysis Detail
  - [x] General
    - [x] Edit
  - [x] Analysis
    - [x] Edit

6.Search

- [ ] search result list
  - [ ] Test Date Colum click【the detail can not open】
  - [x] additives click,open popup window