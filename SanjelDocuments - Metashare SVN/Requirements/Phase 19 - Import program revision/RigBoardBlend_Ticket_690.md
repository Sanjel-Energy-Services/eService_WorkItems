## Change Summary

### Title

Improve Blend Display on RigBoard

### Requestor

Jason Schneider/Chris Chubey

### Urgency

High

### Target System/Organization/Business Process

<\<Application>>eServiceOnline, <\<Role>>Dispatch

## Business Vision

Improve the product delivery accuracy to avoid job failure caused by product shortage.

## Change Details

### Current State

On RigBoard, for each rig job, there are 3 columns for displaying blend needed for this job. These blends are from call sheet/product section, category includes Lead 1-4 ,Tail and Plug. If there are more than 3 blends, BL3 column will show "More" to display rest of blends as context menu.

When mouse hovers on a cell filled with product quantity, tooltip will display product detail information.

### Target State

#### Product Display ####

Use 3 columns BL1, BL2, BL3 to display all products. 

- BL1 rename to PREFL, display products under category "Preflush" and "Scavenger"
- BL2 rename to BLEND, display products under category "Lead 1 -4", "Tail" and "Plug". 
- BL 3 rename to DISPL, display products under category "Displacement"

In each column, if there is more than one products, split the cell to multiple cells vertically. Please refer to the implementation of Bin column.

Because the amount of product items  in these 3 columns are different,  the biggest number will be used for cell split on all 3 columns.

#### Context Menu ####

For any product quantity is displayed in these 3 columns, the right-click menu mechanism keep same which will lead to product haul management.

#### Tooltip ####

Tooltip content need to be changed.

Base Blend needs to changed to display blend description in following format.

```
[Base Blend Name ] + [Amount of Additive1] % of [Additive1 Name] +  [Amount of Additive2] % of [Additive2 Name]  ....
```



For example:

```
Proteus Core + 0.25% CFR-2 + 2% Cacl2 + 2% FWC-2 + 0.15% CDF-6P
```





### Impacted Parties

- Dispatch will see all products on RigBoard.

  

### Success Criteria

- All products are displayed properly for each rig job.

- Right-click context menu display properly based on selected product cell.

- Tooltip shows proper information based on selected product cell.

  

### Wins/Benefits

- Avoid job failure caused by product missing on site



