eService Entity Re-purpose



Entity:  JobTitle in eService Common Library repurpose as JobRole in SanjelData



Entity: JobBonus repurpose as WorkActivity

Field Mapping:  

​	ReceiveStandbyBonus  - EligibleStandbyHours

​	PositionTitle - Job Title

​	OnLoncation (Start First Shift) - Start Time

​	OffLocation (End First Shift) - End Time

​	Two Way Travel Time (Hrs) - Travel Hours

​	Standby Time Off Locations (Hrs) -  Standby Hours 

​	

​	

​	

​	



New Field:

​	IsTwoWay

​	WorkType

​	Travel Distance

​	JobRole

​	WorkingHours

​	



UI Function Description

- HR Position populated from employee :: BonusPosition value, read-only. 
- Job Role, default value calculated by following rules, supervisor is able to change the value.
  - The employee is set as supervisor with the person set as supervisor in  job set up in eService Express.
  - The employee come with pumper or pickup will be default as operator.
  - The employee come with bulker will be default as support.
- Work Type, default value calculated by following rules.
  - Phase 1: Only options are Cementing Service and Remedial Service which depends on the job service line.
- Start Time/End Time - Default to on/off location time when unit section is updated.
- Eligible Standby Hours?  Checked manually, any automation in future will be upon user's request
- Working Hours: Auto calculated by Start Time/End Time, but editable.
- Standby Hours:  Enable if eligible standby hours is checked, manually enter value. Automation can be done upon user's request.
- Two Way/One Way: Default is One Way
- Travel Distance: Manually Enter. Automation can be done upon user's request.
- Travel Hours: Manually Enter. Automation can be done upon user's request.
- MTS Number: Keep this data field for bulker driver reference and future product haul if needed.
- Description: auto populate cement hauling description and may be manually modified. 