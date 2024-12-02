```mermaid
classDiagram
class UI
class Logic
class Data
UI -->Logic
Logic-->Data
class Model
class View
class ViewModel
View-->ViewModel
View-->Model
ViewModel-->Model
class Service
class Dao
class Entity
Service-->Dao
Dao-->Entity
Model..>Entity
class Repository
Repository-->Service
Repository..>Mapper
Mapper<--Entity
Mapper-->Model
Data-->Repository
Data..>Model
Logic..>ViewModel
UI..>View
```

