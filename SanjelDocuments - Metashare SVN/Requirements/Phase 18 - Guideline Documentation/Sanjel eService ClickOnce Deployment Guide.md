# Sanjel eService ClickOnce Deployment Guide

## Context Usage

- Sustainment: Metashare Team Development and Testing
- Support: Sanjel Team Development and Testing
- Production: Sanjel Production Deployment

##  Deploy WCF services

- Get the latest version code from SanjeleService repository.
- Confirm or Update following settings in web.config file 
```xml
    <add key="applicationContext" value="support"/>
    <add key="defaultMailto" value="eServiceTestAlerts@Sanjel.com"/>
    <add key="cachePath" value="C:\EServiceR6Data"/>
```
-  Build SanjeleService solution.
-  Publish EServiceR6CFServices-Site/EServiceR6WCFServices to a local folder. e.g. C:\Publish\EServiceR6WCFServices
- Deploy it to sanjel08.snj.local as version 6.X.X.X
  -  Create a new folder 6.X.X.X under EServiceR6WCFServices website physical folder. e.g. C:\inetpub\wwwroot\EServiceR6WCFServices\6.X.X.X
  -  Open Internet Information Services (IIS) Manange, find 6.X.X.X folder, convert it to an application by using "EServiceR6WCFServices" Application Pool as default.
  -  Copy files from local folder to server website folder.
  -  Restart the "EServiceR6WCFServices" Application Pool
-  Verify the WCF service deployment is correct  via  http://sanjel08.snj.local/EServiceR6WCFServices/6.X.X.X/BinService.svc



## Client Deployment

- Confirm or update the app.config file for SanjeleServiceSupport project

```xml
    <add key="EServiceBaseAddress" value="http://Sanjel08/EServiceR6WCFServices/6.X.X.X/" />
    <add key="eServiceExpress" value="http://localhost:20817/" />
    <add key="eServiceExpressVersion" value="1.2.1.0" />
    <add key="applicationContext" value="support" />
    <add key="defaultMailto" value="eServiceTestAlerts@Sanjel.com" />
    <add key="smtpServer" value="sanjel-com.mail.protection.outlook.com" />
    <add key="cachePath" value="C:\EServiceR6Data" />

```




  - ​	Make sure SanjelServiceSupport project includes Configurations folder which includes Price Book printing related xml files and logo. 

  - Update SanjelServiceSupport Assembly Version and File Version to 6.X.X.X

  - Update  Publish parameters  as following:

    ![ClickOncePublish](https://user-images.githubusercontent.com/55812393/70266294-6d35ec00-1759-11ea-9863-d3f790262924.png)

  - Click “Application Files..” button and make sure files under the Configuration folder publish status’ are “Include”. See the screen shot in below: 
    
    ![](https://user-images.githubusercontent.com/55812393/70269362-7033db00-175f-11ea-8dbf-4a10b7a4235f.png)

- Click "Options" and update the version of ClickOnce application

  ![PublishOptions](https://user-images.githubusercontent.com/55812393/70280787-826d4380-1776-11ea-8027-1e4324b20201.png)

- Click "Publish Now" button or “Publish Wiard..” to deploy it to server. After the publish is done successfully, a web page of installation will pop up.

  ![PublishSuccess](https://user-images.githubusercontent.com/55812393/70280917-d24c0a80-1776-11ea-9385-87d4ec922917.png)

- Sign eService client using Manifest Generation and Editing Tool
  
  
  - Find deployment file and open with Manifest Generation and Editing Tool (Mage)
  
  ![FindMageTool](https://user-images.githubusercontent.com/55812393/70281319-0542ce00-1778-11ea-8123-e4a68d1de501.png)

  - Mage window will open, following images are for your reference.
  
  ![Mage_name](https://user-images.githubusercontent.com/55812393/70281869-57d0ba00-1779-11ea-9720-d9f9b1035dd7.png)
  
  ![Mage_Description](https://user-images.githubusercontent.com/55812393/70281874-5e5f3180-1779-11ea-83dd-79a970b7f96a.png)
  
  ![Mage_Deployment_Options](https://user-images.githubusercontent.com/55812393/70281896-68813000-1779-11ea-943f-de40ed29ec1f.png)
  
  ![Mage_UpdateOptions](https://user-images.githubusercontent.com/55812393/70281900-6d45e400-1779-11ea-86f3-44366288eaab.png)
  
  ![Mage_ApplicationReference](https://user-images.githubusercontent.com/55812393/70281905-720a9800-1779-11ea-9488-f379aceaa9ab.png)
  
  - Close it directly. (For testing purpose, we are not going to sign it, if there are settings not correct, please contact awang(at)sanjel(dot)com)

  ![mage](https://user-images.githubusercontent.com/55812393/70281326-08d65500-1778-11ea-88b8-7e65394b233e.png)


- Sign Options" window will pop up. Click on "Don't Sign".

![DontSign](https://user-images.githubusercontent.com/55812393/70282038-e04f5a80-1779-11ea-99dc-59a4d2c16d4e.png)



- Now your new version of eService client is deployed. You may be able to install it via:
  - Web link: http://http://sanjel08/EServiceR6Support/publish.htm
  - Run installed eService client.