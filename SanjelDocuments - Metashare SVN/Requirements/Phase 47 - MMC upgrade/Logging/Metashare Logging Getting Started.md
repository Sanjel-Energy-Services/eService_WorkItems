
# Getting Started: The Basics

## Reference/Installing 

MetaShare Logging is an abstract interface (ILogger ) and an abstract factory to create any logger implementation/factory, at current time of writing there is an factory to implement serilog logger which is a third-party logging library.



Main file is **MetaShare.Logging.dll** [MetaShare.Logging 2.0.2](http://nuget.metashare.com.cn/packages/metashare.logging/2.0.2) library which have an abstract factory class to create Loggers and the Interface `ILogger` that defines a standard logger class, it can be referenced in other libraries since it does not require 3rd party libraries other than common.


## Register a predefined Logger using serilog

The following is a quick introduction of logging with a pre-configured and built in Serilog logger.

Reference **MetaShare.Logging.Serilog.dll** and **MetaShare.Logging.Diagnostics.dll** (optional)

The first library contains some sinks, enriches, destructers and implements the interface *[MetaShare.Logging.ILogger]()*

The later creates and registers a Serilog logger

- Use the following method to register previously created ILogger:


```c#
	using MetaShare.Logging.Diagnostics;
	LoggingFactory.RegisterAll(ILogger logger)
```



- Using   **LoggingFactoryOptions** 

Pass Microsoft.Extensions.Configuration IConfiguration  if  you want to configure  the logger using appsettings.json file, use SectionName property  to read  a section in appseting.json file.

If configuration object is null, it will read the configuration from app.config or web.config file appSettings section, if neither of them have configuration it will build a predefined logger that has as log file as output.

```c#
using MetaShare.Logging.Diagnostics;

LoggingFactory.RegisterAll(new LoggingFactoryOptions
{
   Configuration = this.Configuration,
   SectionName = "CustomLogging"
});
```
To configure file log options using appsettings file, follow serilog-settings-configuration nuget package 
instucctions.

Example for configuring log file:

​    ![](https://user-images.githubusercontent.com/31224786/205023181-1b44b599-4f12-41f8-86bb-1de457514e95.png)



To configure file log options using app.config or web.config file with appseting section, follow serilog-settings-appsettings nuget package instructions 

Since eService uses a different approach for logs file names MetaShare.Logging.Diagnostics is not used because it was designed to be a shared library with common configuration. Instead, SanjelCommonLibrary  has it's own builder to create an customized serilog instance. you can find it in **Sanjel.Common.Core.Logging.SerilogInternalDiagnosticConfig**






## Using logger

- ### Using common core service Factory 

  Simply get the service using the interface ILogger and use some of the methods according to your needs.

  ```c#
   var logger = MetaShare.Common.Core.CommonService.ServiceFactory.Instance.GetService<MetaShare.Logging.ILogger>();
  
  logger?.Trace("logging message");
  ```
  
  All level methods have a the same common names:
  
	```c#
  _logger.LevelXFormat("My object:{0}", MyObject);` // this accept objects to add to the log.
  _logger.Level("My description");
  
  //example:
  logger.InfoFormat("Order {orderid} created for {user}", 42, "Kenny");
  ```
  
  where  "LevelX" is the name of the method (level) to log
  
  #### logging levels:

​		There are some differences among levels. some of them are:

- **Log level is enabled**: this depends on the configuration, in production environments, usually  only  Error and Fatal Levels are enabled all the time, while other levels are disabled and enabled only when needed. this reduces the log size saving space and reduces CPU and Memory usage.
- **Error and Fatal Levels**:  They append automatically the trace of the method where the log was called. so it is easier to find the method that failed or is being. Additional information is added like controller/action data if the trace have it.
- **Fatal** level is always enabled.

 ```c#

// use trace all the time in all methods to describe detailed operations 
_logger?.Trace("Description");

//Debugging (like the editor) the application behavior from internal events of interest.
_logger?.Debug("Description");

//Information that highlights progress or application lifetime events, like methods result
_logger?.Info("Description");

//Warnings about validation issues like user input or temporary failures that can be recovered like http 404 events.
_logger?.Warn("Description");

//Errors where functionality has failed or Exception have been caught. mostly used in catch sections (try-catch)
_logger?.Error("Description");

//Most critical level. like offline DB, not enough space in Disk or not network connection.
_logger?.Fatal("Description") 

 ```





- ### Using Microsoft logging Extensions.

  - Reference **MetaShare.Logging.MicrosoftExtensions.dll**  ([MetaShare.Logging.MicrosoftExtensions 1.0.1](http://nuget.metashare.com.cn/packages/metashare.logging.microsoftextensions/1.0.1)) library

  - Call the following method with a previous logger created as parameter:

    ```c#
    Microsoft.Extensions.Logging.ILoggerFactory.AddMetaShareLogger(ILogger logger);
    ```

    This method is going to register a new Microsoft logger provider, so you can get Microsoft libraries logs written directly throughout your logger configuration.
    
    
    
  - To configure  Microsoft logs use  **Logging** section in appsetings.json

  

  - Inject or get a Microsoft ILogger instance and use one of its methods to log

    you can inject a service using **IServiceCollection** interface 

    

```c#
      public TestController(Microsoft.Extensions.Logging.ILogger<TestController> logger)
      {
          this._logger = logger;
          this._memoryCache = memoryCache;         
          
          this._logger.LogTrace("Log Message");
        }
```

