# Sanjel Security Model

```mermaid
classDiagram
class SanjelUser{
+string HashedPassword
+string EmailAddress
}
SanjelUser "0..*"-->"1" ServicePoint
SanjelUser "1"-->Employee
class UserPermission
class UserGroup
UserGroup "0..*" <--> "0..*" SanjelUser
UserGroup "0..*" <--> "0..*" UserPermission
```

## Default value for old database

### User

BusinessUnit =0

LanguageType=0

SanjelCompanyId=1

SanjeCompanyName="Sanjel Energy Services Inc."





## Goal for new model

- Migrate old security data to new model equally.
- Be sufficient to provide permission query, HasPermission(string userName, string permission)
- All entities should be versioned for tracking purpose.