```mermaid
classDiagram
    class ProgramRequest {
    	+string Name
        +string AFENumber
        +Well Well
        +List~Contact~ OSRContacts
        +List~Contact~ ClientContacts
        +List~Contact~ ServiceProviderContacts
        +string StickDiagramLink

    }
	class Well {
		+string SurfaceLocation
        +List~Formation~ Formations
        +List~DepthInfo~ DepthInfo
        +List~OpenHole~ OpenHole
	}
    class WellLog {
    	+string LogType
    	+string LoggingCompany
    	+Comments
    }
    class BottomHoleAssembly {
    	+string Component
    	+string Bit
    	+string Motor
    	+string Telemetry
    	+string Subs
    	+string NMDC
    	+string Collars
    	+string DrillingJars
    	+string HWDP
    	+string DPtoSurface
    }
	class RigSetting {
		+decimal GroundLevel
		+decimal KBElevation
		+decimal GLtoKB
		+Rig Rig
	}
	class Rig 
	class Contact {
		+string Title
		+string Name
		+string PhoneNumber
		+string Email
		+string Comments
	}
	class Formation {
		+FormationType FormationType
		+decimal MeasuredDepth
		+decimal TrueVertialDepth
		+decimal MaxiMumPressure
		+decimal MaximumPressureGradient
		+decimal MaximumEstimatedMudDensity
		+decimal ExpectedMudDensity
		+decimal H2SConcentration
		+bool IsLossCirculationZone
		+bool IsOverPressureZone
	}
	class FormationType 
	class DepthInfo {
		+string Label
		+decimal MeasuredDepth
		+decimal TrueVertialDepth
	}
	ProgramRequest-->Well
	ProgramRequest-->WellLog
	ProgramRequest-->RigSetting
	ProgramRequest*-->Contact:ClientContacts
	ProgramRequest*-->Contact:OSRContacts
	ProgramRequest*-->Contact:ServiceProviderContacts
	RigSetting-->Rig
	Well *--> Formation
	Well *--> DepthInfo
	Formation --> FormationType
	
    

```


Questions:

1. Section 6, what does SS Depth stand for?
1. Section 7, need explanation line by line for BHA? What is important to us. The mapping template has current data structure. I set up a new structure called BottomHoleAssembly. Please review the mapping document. If any field needs to be split further, please provide the definition and parsing rules