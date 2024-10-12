# eService Online Deployment Guide

 

## 数据库

​	数据库已使用Sqlserver，使用MDD架构实现。

## Reference Data

## 用户权限

1. Add following permission to eService Security Service

·     LoadController

·     OperationController

·     ProductHaulController

·     RigBoardController

2. Add following groups to eService Security Service

   Dispatcher-Online

3. Assign permission to following groups

4. Add user to following groups




## 安装IIS（系统windows server 2012 r2 （x64））

如图安装相关组件                               

   ![1](https://user-images.githubusercontent.com/31224786/70517534-add7a000-1b73-11ea-8ab1-e3e7951dab9a.png)

![2](https://user-images.githubusercontent.com/31224786/70517535-ae703680-1b73-11ea-9ea1-11dc43741d87.png)

 安装完成

![3](https://user-images.githubusercontent.com/31224786/70517539-af08cd00-1b73-11ea-874d-00ddd45ed201.png)

后配置IIS中的.net v4.0，点击开始—>运行—>cmd，执行两条命令：

cd c:\windows\Microsoft.NET\Framework64\v4.0.30319

​       aspnet_regiis.exe

 

## 安装DotNetCore.1.0.5_1.1.2-WindowsHosting

安装程序下载地址：https://www.microsoft.com/net/download/all

Windows Hosting 官方core已更新到3.1。 Online 使用 core 1.1.2，如果找不到1.0.5_1.1.2-WindowsHosting请下载DotNetCore.1.0.11_1.1.8-WindowsHosting



## Microsoft Visual Studio 发布项目

 

在Solution Explorer中右键点击项目名称选择Publish

 ![6](https://user-images.githubusercontent.com/31224786/70517551-b16b2700-1b73-11ea-92f4-c36ecbda27aa.png)

选择发布Target Location

![7](https://user-images.githubusercontent.com/31224786/70517555-b203bd80-1b73-11ea-9895-76ef9e0e07e6.png)

![8](https://user-images.githubusercontent.com/31224786/70517557-b29c5400-1b73-11ea-867b-aa2d27d00e95.png)

点击Save

 

​       

## IIS发布项目

打开IIS Manager

 

右键点击Sites选择Add Website

![9](https://user-images.githubusercontent.com/31224786/70517559-b334ea80-1b73-11ea-83df-bb30b91b8b88.png)

填写Site name，选择Microsoft Visual Studio 发布好的项目文件夹，配置IP address和port，点击OK

![10](https://user-images.githubusercontent.com/31224786/70517561-b4661780-1b73-11ea-86a6-8501bb9aeaea.png)

选中新增Site，点击Edit Permissions编辑权限

 ![11](https://user-images.githubusercontent.com/31224786/70517563-b4feae00-1b73-11ea-84b2-34a11ddc9023.png)



添加Everyone，权限选择完全控制，再点击Advanced

 ![12](https://user-images.githubusercontent.com/31224786/70517569-b62fdb00-1b73-11ea-9cea-b8a109572c39.png)

选中Everyone，勾选单选框，点击Apply，再点击OK，发布完成

IIS 身份认证

双击打开身份认证，

![13](https://user-images.githubusercontent.com/31224786/70517570-b62fdb00-1b73-11ea-8ecf-e237193268a7.png)

启用 windows身份认证 ，禁用其它认证

 ![14](https://user-images.githubusercontent.com/31224786/70517576-b7f99e80-1b73-11ea-8294-3a49536001ab.png)

 

FAQ：

1 部署后站点提示500.19 500.21 错误，

问题原因：online 工程是net core 项目 需要安装core 组件

解决办法：windows官网下载Windows Hosting 安装。Online 使用版本1.1.2 ,需要下载 DotNetCore.1.0.11_1.1.8-WindowsHosting.exe 安装。

检查办法：windows Hosting 安装后双击打开 IIS模块, 检查安装的模块 AspNetCoreModule 。

 

![15](https://user-images.githubusercontent.com/31224786/70517580-b8923500-1b73-11ea-9a3b-cce0a0ce1f86.png)

 ![16](https://user-images.githubusercontent.com/31224786/70517583-b92acb80-1b73-11ea-864b-5bbb6b27c712.png)

2 core项目部署后如何查看站点日志?

 问题原因： 站点报错后如何查看异常日志

解决办法：

<1>. 打开站点物理路径修改web.config 中stdoutLogEnabled 为true。开启core 项目日志

<aspNetCore processPath=".\xxx.exe" arguments="" stdoutLogEnabled="true" stdoutLogFile=".\logs\stdout" />

<2>.在物理路径下 创建logs 文件夹。若不创建则不会生成名为stdoutxxxx.log的日志文件。

 