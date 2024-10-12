# Lab Database 到最新版本

由于重构的源码不是最新版本，需要把缺失的补全。

### 需要补全的实体

sldtestresult 添加

public bool Deleted { get; set; }

public bool Approved { get; set; }

sldtestiteration 添加

public bool PerformanceRequirement { get; set; }

sldtestrequest 添加

public string Comment { get; set; }





### 添加字段sql，在LabTesting库中，发现这个库里的这些字段都是有的。

ALTER TABLE sldtestresult ADD  Deleted bit;

ALTER TABLE sldtestresult ADD  Approved bit;

ALTER TABLE sldtestiteration ADD  PerformanceRequirement  bit;

ALTER TABLE sldtestrequest ADD  Comment ntext;





### 添加字段sql，在SanjelData库中

ALTER TABLE testresult ADD  Deleted bit;

ALTER TABLE testresult ADD  Approved bit;

ALTER TABLE testiteration ADD  PerformanceRequirement  bit;

ALTER TABLE testrequest ADD  Comment ntext;