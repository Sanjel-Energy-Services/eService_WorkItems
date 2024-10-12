## Change Summary

###  Title

Create eService Local Data Manager (ESLDM)

### Requestor

Adam Wang

### Urgency

High

### Target System/Organization/Business Process

<\<eService Express>>

## Business Vision

Improve local data clean up.

## Change Details

In eService Express start-up, we implemented CleanUpDatabase function.  It will be run when eServiceExpress Windows service is started. It includes following steps:

1. Job Tag Data Integrity
2. Retrieve Processed Data Log from server and update local upload log "IS Recieved on Server" flag
3. Delete PLC data according to the upload log marked  "Is Recieved on Server" and update local upload log "Is Plc Data Deleted" flag
4. Delete upload log which is marked "Is Plc Data Deleted"
5.  Delete job take if older then 90 days

Windows Service will fail if the executable cannot be started in TimeOut period. 

In Step 2, eService Express will access server to retrieve the server log. However, the server is only accessible when the host computer is connected Sanjel intranet. In real life, the host computer running on a truck and it connects to Sanjel intranet through VPN. If VPN is not started or there is no Internet available,  the host computer is not able to build a connection to the server. 

Currently eService framework doesn't have a mechanism to detect if network is available. So if the host computer doesn't have server connection, eService Express will have to wait for WCF client time out. This timeout might be longer than the Windows Service timeout, this will cause Windows service startup fails.

### Current State

The upload log update process is commented out from eService Express code.

### Target State

Create a separate application "eService Local Data Manager" to run as a scheduled task to perform the upload log update function.  It can detect if the server is accessible and retrieve server data log then.

### Impacted Parties

- Retrieve server data log and update local data log feature will be removed from eService Express .

- New application "eService Local Data Manager" is created and can be installed as a scheduled task on host computer (Windows 10)
- Data Upload Log will be updated by eService Local Data Manager.
- Data clean up process will stay in eService Express Windows service startup.

  

### Success Criteria

- ELSDM can check if server is accessible
- Server data log retrieval process only can be started when server is accessible.
- ELSDM is running as a Windows scheduled task for certain interval (e.g. 30 minutes) .

### Wins/Benefits

- eService Express stability is improved.
- eService local database can be cleaned up effectively.



### Application Mockup

