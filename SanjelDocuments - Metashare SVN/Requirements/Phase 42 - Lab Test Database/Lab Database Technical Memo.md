# Lab Database Technical Memo



1.  LabTesting is the database in Sanjel environment. 
2. There are some views feed master data from SanjelData database.

## BackEnd Running Debug(Operating environment)

### 1.Project Sld.JobManage

It is Scheduled task program of HangFire,If you want to run it in local,please import the database of hangfire××××.bak,then fix appsettings.json for "ConnectionStrings>>SQL_CONNECTION_STRING",the three string should set "database=labTesting".

### 2.Project SLDAPI 

It is the BackEndAPI,If you want to run it in local,import the database of LabTesting××××.bak,then fix  appsettings.json for "SQL_CONNECTION_STRING","ConnectionStrings>>MasterDataSettings>>ConnectionString","SearchSettings>>ConnectionString",the three string should set "database=labTesting".

### 3.Project FrontEnd

It is running with angular/cli,So we should first install node.js and @angular/cli.But if the node.js is too new,the program can't  run correctly.AS I Debug we should run it with node.js for v12.20.1. There are still some problems here,So we have prepare available package of "frontend.zip",Unzip  it.

open cmd line.

cd to unzip file.

run with command "ng serve",the url "http://localhost:4200" will can run.

### 4.Run Program And Login

Run FrontEnd And Run Api,Login with account "ad-admin",password any chars.the password is not important.

### 5.Visual Studio debug upload file

If debug upload file,debug auto close,we should set Visual studio: tool=>selector=>Projects and Solutions=>webproject=> cancel checked"When the browser window closes....."