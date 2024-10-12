# Eservice Express Installation file build Instruction

## 1. Clone following code base from GitHub under the same root folder

- https://github.com/Sanjel-Energy-Services/eServiceExpress.git

- https://github.com/Sanjel-Energy-Services/eServiceMDM.git

- https://github.com/Sanjel-Energy-Services/eServiceOnline.git

- https://github.com/Sanjel-Energy-Services/SanjelClientSolutionTool.git

- https://github.com/Sanjel-Energy-Services/SanjelCommonLibrary.git

- https://github.com/Sanjel-Energy-Services/SanjelEService.git

- https://github.com/Sanjel-Energy-Services/SanjelWellService.git

  

![](https://user-images.githubusercontent.com/31224786/70312651-0692fa00-184f-11ea-9564-b5984932f564.png)

## 2. Compile CommonLibrary and eService solutions

eService projects have dependencies between each other, they must be compiled in following order.

- eServiceMDM

- SanjelCommonLibrary

- SanjelWellService

- SanjelEService

- SanjelClientSolutionTool

- eServiceOnline

- eServiceExpress

## 3. Make following change according to release environment

### 	a. Update release number

![](https://user-images.githubusercontent.com/31224786/70313054-d6982680-184f-11ea-83a8-db7bb3c833eb.png)

### 	b. Update Application Context in app.config file

![](https://user-images.githubusercontent.com/31224786/70313394-82417680-1850-11ea-9f09-ad3da4897b11.png)

### 	c. Compile the whole eService Express solution

###  	d. Right-click eServiceExpress project and click Publish, then Click “Publish”

### 	e. Copy printing configuration to publish folder

![](https://user-images.githubusercontent.com/31224786/70313778-34793e00-1851-11ea-8b2c-069952e26d33.png)

### 	f. Update release build batch file

![](https://user-images.githubusercontent.com/31224786/70313987-976ad500-1851-11ea-899f-330b9be61740.png)



### 	g. Update version number and save

![](https://user-images.githubusercontent.com/31224786/70314218-02b4a700-1852-11ea-8528-7af1fc5c4cb3.png)



###		h. Open Inno Setup Script with Inno Setup and Compile. Inno Setup download link http://www.jrsoftware.org/isinfo.php

![](https://user-images.githubusercontent.com/31224786/70314442-6e970f80-1852-11ea-8c95-4960a261463e.png)



### 	i. You may find the installation file in Output folder

![](https://user-images.githubusercontent.com/31224786/70314611-c7ff3e80-1852-11ea-8b92-5c2775cfc1f3.png)