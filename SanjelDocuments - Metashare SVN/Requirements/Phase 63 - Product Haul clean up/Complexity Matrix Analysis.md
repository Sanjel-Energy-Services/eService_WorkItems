# Complexity Matrix Analysis

## 1. Additive Tolerance Notification

Triggered after Blend Request is set as BlendCompleted. Summarize blend cut details to check against original recipe. If any additives are over tolerance criteria, email notification will be sent to relative recipients.

Information needed:

- Tolerance checking formula
- Tolerance master data - In database already, per blend chemical
- Notification recipients list



## 2. Blend Description Standardization

The blend description is saved in database can be reverted to a blend recipe



- Initial discussion

> Hi Jason,
>
>  I am looking into a solution for making a naming convention for blend description. 
>
>  For example, ECOprime + 0.15% CFR-5 + 0.5% CFL-4 + 0.3% SCA-6 + 0.5% SCA-7 + 0.2% MCR-7 + 0.1% ASM-3 + 0.3% CDF-6P + 1.8% D270 Fulcrum*
>
>  As the additives are added in program template in different order from time to time. So even the same blend + additives may be presented in different combinations.
>
>  Does it matter if I change the order of additives?
>
>  Order additives by name     alphabetically.
>
> ECOprime  + 0.1% ASM-3 + 0.3% CDF-6P + 0.5% CFL-4 + 0.15% CFR-5 + 1.8% D270 Fulcrum* + 0.3% SCA-6 + 0.5% SCA-7 + 0.2% MCR-7
>
>  Order additives by     percentage, then name alphabetically.
>
> ECOprime  + 1.8% D270 Fulcrum* + 0.5% CFL-4 + 0.5% SCA-7 + 0.3% CDF-6P +  0.3% SCA-6 + 0.2% MCR-7 + 0.15% CFR-5 + 0.1% ASM-3
>
>  My goal is to figure out an unique identifier for each Blend + Additives combination. That will be easy for following possible scenarios implementation.
>
>  Bin content checking.
>
> 1. Blend recipe tracking,     e.g. someone changed additive in call sheet, alert will be made when     schedule blend.
> 2. Back match preblended     blend to call sheet. E.g. we talked about how we can allocate the     preblended blend in bin when we haul it to a job.
> 3. Blend test tracking to     assure the recipe information is passed consistently.
> 4. Mass blend database. It     will allow your future analysis of blend performance. 

- Jason's respons

> I talked to Jeremy and Chuck and everyone agrees.
>
> 1. Sort additives by function
> 2. When multiples of a function, do alphabetical
> 3. Have defoamer at the end.

- Jason provided function list and mapped to additive list

- Discussion regarding Add-On-the-Fly and prehydrated additive in blend description

When we get a blend description, we will need to convert it back to a recipe properly if we lose the connection with original blend request. I am thinking if we can set up a set of rules to determine the prehydrated , add-on-fly.

 One way is to add non-preblend method abbreviation to the blend description. 

 e.g.  ECOprime + 0.4% SCA-6 + 0.5% SCA-7 + 0.4% MCR-7 + 0.5% FWC-2 + 0.35% ASM-3 + 0.3% CDF-6P + 2% LCC-1 + 1kg/m3 LCF-7 (AOF)

 Or there are specific rules can guarantee the LCF-7 to be identified as an add-on-the-fly additive.

 The goal is to get exact components form a description string, so we can create a correct breakdown sheet for reblend.

 e.g. above blend needs to be reblend to another blend as 

ECOprime + 0.4% SCA-6 + 1% SCA-7 + 0.4% MCR-7 + 0.5% FWC-2 + 0.5% ASM-3 + 0.3% CDF-6P + 2% LCC-1 

 We will build a new recipe as 

 (ECOprime + 0.4% SCA-6 + 0.5% SCA-7 + 0.4% MCR-7 + 0.5% FWC-2 + 0.35% ASM-3 + 0.3% CDF-6P + 2% LCC-1 + 1kg/m3 LCF-7 (AOF)) + xx% SCA-7 + yy% ASM-3

 We need to make sure LCF-7 is not involved in the calculation for blending.

 

We even can go further to figure out reblend one to another blend which use the same base.

 

e.g. ECOgrout 1300 +  0.4% SCA-6 + 1% SCA-7 + 0.4% MCR-7 + 0.5% FWC-2 + 0.5% ASM-3 + 0.3% CDF-6P 



## 3. Haul Blend Fix

- Haul blend scheduling
- Load blend to bulker



## 4. Blend Sample Integration

- Post back from BPAVS
- Trigger Lab Sample generation
- Lab receive sample function
- Blend Sample is linked to blend request id



## 5. Test Request Integration

- Test requirement has been imported with program

- Blend Test flag is carried from program to call sheet.

- Test Request creation triggered by blend request creation with Blend Test flag.

- Blend Test flag in program is determined by the Complexity Matrix score.

  

## 6. Reblend Feature

- Blend Calculator enhancement for reblending

- BPAVS API to get relend recipe

- Reblend request based on approval. 

- Reblend request link to original request.





## 7. Approval workflow

- Approval information APIs
- Approval status retention in business entities
- Approval workflow 



## 8. Lab App Enhancement

- Entity upgrade for Domain Model alignment and integration

- Integration enhancement

- Pilot test vs Field Test

  

## 9. CM presentation

- Job perspective dashboard
- Blend perspective dashboard
- Approval status on RigBoard, DRB