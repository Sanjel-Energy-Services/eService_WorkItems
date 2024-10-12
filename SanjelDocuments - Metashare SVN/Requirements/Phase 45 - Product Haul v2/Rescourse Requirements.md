# Resourse

## Domian Model

> ```mermaid
> classDiagram
> class TruckUnit{
> +UnitMainType:UnitMainType
> +UnitSubType:UnitSubType
> +UnitNumber:String
> +EngineType:String
> +Fleet:String
> +HorsePower:String
> +PlungerSize:String
> +PressureRating:String
> }
> class Employee{
> +Cell
> +EmployeeNumber
> +PositionID
> +PreferedFirstName
> +WorkEmail
> +WorkPhone
> +BonusPosition
> +ServiceLine
> }
> class Crew{
> + Type
> + Notes
> }
> class CrewPosition{
> + Name(Supervisor、 Crew Member)
> }
> class SanjelCrew{
> + Rotation
> + IsPrimaryCrew
> }
> class SanjelCrewTruckUnitSection{
> + 
> }
> class SanjelCrewWorkerSection{
> + 
> }
> class ServiceLine{
> + Name
> }
> class ServicePoint{
> + Name
> }
> 
> SanjelCrew"1"<--"0..*" SanjelCrewTruckUnitSection
> SanjelCrew"1"<--"0..*" SanjelCrewWorkerSection
> SanjelCrew"1"<--"2 HomeServicePoint，WorkingServicePoint" ServicePoint
> TruckUnit"1"--"1 ServicePoint" ServicePoint
> Employee"1"--"1 ServicePoint" ServicePoint
> Employee"1"--"1 ServiceLine" ServiceLine
> Crew"1"<|--"1 ServiceLine" SanjelCrew
> SanjelCrewWorkerSection"1"--"1" CrewPosition
> SanjelCrewWorkerSection"1"--"1 Worker" Employee
> SanjelCrewTruckUnitSection"1"--"1" TruckUnit
> ```

## Workbench

![Online-Resource](https://user-images.githubusercontent.com/37645176/220544089-a77c0890-3013-4e72-b09a-7a25434e6b49.png)

## Crew

![Online- Resource-Crew](https://user-images.githubusercontent.com/37645176/220544656-22d4a341-fb82-4257-8530-58312a59f28d.png)

### Unit Column

#### Add Unit

#### Remove Unit

#### Add Crew

#### Remove Crew

### Worker Column

#### Add Worker

#### Remove Worker

#### Remove All Worker

#### Add Crew

#### Remove Crew

### RT Column

#### Update Rotation Order

### Notes Column

#### Update Notes

## Truck Unit

### Notes Column

#### Update Notes

## Worker

### Profile Column

#### Update Worker Profile

### Notes Column

#### Update Notes

## Company

### Company Column

#### Add Crew

#### Update Crew

#### Remove Crew

### Notes Column

#### Update Notes