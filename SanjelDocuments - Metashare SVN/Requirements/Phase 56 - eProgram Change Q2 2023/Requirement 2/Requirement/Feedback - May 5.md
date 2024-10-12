# Feedback - May 5
After talked to Jason, the UI should looks like this.

![Image](https://user-images.githubusercontent.com/55812393/236584404-8d96aaef-47d3-4c9a-8948-6a1ae04c68cd.png)

There are some other changes related to this.

- Hide Country dropdown list, not delete
- Hide County/Parish dropdown list, not delete
- Add Well Type dropdown list
- Add Well Objective dropdown list
- Add Remedial Objective dropdown list



## Well Objective

Well Objective choices would be:

- Oil
- Gas
- Water
- SAGD
- Carbon Dioxide
- CCUS
- CCS
- Acid
- Waste
- Helium
- Potash
- Geothermal
- Hydrogen
- Lithium

Well Objective import has been implemented already.

This time,  we  will nee to add it to eProgram UI and enter the master data. 



Due to the concept change, there is a Well Type dropdown list in "Hole Conditions" sections per job type, it has the same list as the new concept Well Objective. To replace the old Well Type with Well Objective will cause schema compatibility issue. The solution is to add a new Well Objective dropdownlist, and hide the old Well Type dropdown list.

Current UI:

![Image](https://user-images.githubusercontent.com/55812393/236587714-f046ca7b-a231-4a00-850a-02e890c38068.png)

UI after change.

![Image](https://user-images.githubusercontent.com/55812393/236587876-fae63e98-e6ba-4264-b726-187650773e54.png)



# Well Type

Well Type choices would be

- Producer
- Injector
- Disposal
- Observation
- Core Hole



## Master Data

Well Type, Well Objective, Remedial Objective master data are defined in SanjelData library and saved in SanjelData database.

For eService and eProgram, they are defined as CommonType. This data is in Type_Values view in eService6 database to get data from SanjelData database.



## Downstream UI

These three dropdown lists are editable in eProgram. Same UI control will be resued in CallSheet and Job. All of these values should be carried over, but the dropdownlists should be disabled, so the value can be viewed but not change.
