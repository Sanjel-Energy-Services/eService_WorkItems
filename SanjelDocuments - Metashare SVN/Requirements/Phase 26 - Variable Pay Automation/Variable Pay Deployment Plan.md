# Variable Pay Deployment Plan

## 1. Production Backup

- eService6 database
- SanjelData database
- eServiceOnline IIS folder
- eServiceR6WCFServices IIS folder

## 2. Publish Following Code to Sanjel04 IIS

- eServiceOnline
- eServiceR6WCFServices/6.8.1.x
- Build new website eServiceOnline.WebApi and deploy code

## 3. Production Server .Net Core upgrade

- Install dotnet-hosting-3.1.13-win package, server needs to be rebooted.
- Test if eServiceOnline.WebApi  is working. 
- If not, install aspnetcore-runtime-3.1.13-win-x64.

## 4. Upgrade Database and import master Data

- UpdateSanjelData.sql
- SanjelDataDatabaseCreation.sql
- UpdateEService6.sql
- LoadReferenceData.sql

## 5. Test eServiceOnline and eServiceOnline.WebApi

Existing eService data can be synced in to work assignment even though the quality is not ready for variable pay calcuation.

## 6. Deploy eService client

- We are going to update eService production client back to ClickOnce deployment for following reason
  - It is easy for installation on WVD
  - Field toughbook connection is getting much improved, especially with the always on VPN. 

## 7. Test eService client and full process.



