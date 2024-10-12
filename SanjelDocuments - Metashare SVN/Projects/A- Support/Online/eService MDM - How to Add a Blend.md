# How to Add a Blend



## Where to add a blend

We manage blend data through Sanjel Master Data Management system.

Production Environment: http://sanjel04/eServiceMDM

Testing Environment: http://sanjel08/eServiceMDMTest



Blend related master data items are under Common/BusinessEntitites/Products 



## How to build a blend recipe



There are four types of recipe.



### 1 Tonne Recipe (Total Tonnage)

Example:  PRODUCTIONmix EC , total weight 1000 kg

| Blend Chemical | Amount | Unit |Addition Method|Additive Blend Method|
| :------------- | ------ | ---- |--|--|
| Class G | 620    | kg   |BOWB|Preblend|
| Flyash     | 380  | kg   |BOWB|Preblend|




### 1 Tonne Recipe (Base Tonnage)

Example: 1:1:6 'G', total weight 1060 kg

| Blend Chemical | Amount | Unit |Addition Method|Additive Blend Method|
| :------------- | ------ | ---- |--|--|
| 1:1:0 'G'      | 1000   | kg   |BOWC|Preblend|
| GSS-1          | 60     | kg   |BOWC|Preblend|



**<u>In eServiceMDM, we use above to types of recipe for predefined blend, we also create Blend + Additives recipe template to assist convert eService Blend Section to a recipe.</u>**

### 

### 1 Tonne  Recipe with  additives by percentage

Example:  iPrime + Additives 

| Blend Chemical | Amount | Unit    | Addition Method | Additive Blend Method |
| :------------- | ------ | ------- | --------------- | --------------------- |
| iPrime         | 100    | Percent | BWOC            | Preblend              |

After we load the recipe up with additives defined in eService Blend Section, it looks like following.


| Blend Chemical | Amount | Unit    | Addition Method | Additive Blend Method |
| :------------- | ------ | ------- | --------------- | --------------------- |
| iPrime         | 100    | Percent | BWOC            | Preblend              |
| CFR-2          | 0.2    | Percent | BWOC            | Preblend              |
| CFL-3          | 0.15   | Percent | BWOC            | Preblend              |
| SCA-6          | 0.25   | Percent | BWOC            | Preblend              |
| SCA-7          | 0.25   | Percent | BWOC            | Preblend              |
| MCR-7          | 0.1    | Percent | BWOC            | Preblend              |
| ASM-3          | 0.2    | Percent | BWOC            | Preblend              |
| CDF-6P         | 0.15   | Percent | BWOC            | Preblend              |



### 1 Tonne Recipe with additives by weight of water



Example:  0:1:0 'G'+ Additives

| Blend Chemical | Amount | Unit    | Addition Method | Additive Blend Method |
| :------------- | ------ | ------- | --------------- | --------------------- |
| 0:1:0 'G'      | 100    | Percent | BWOC            | Preblend              |

After we load the recipe up with additives defined in eService Blend Section, it looks like following.


| Blend Chemical | Amount | Unit    | Addition Method | Additive Blend Method |
| :------------- | ------ | ------- | --------------- | --------------------- |
| 0:1:0 'G'      | 100    | Percent | BWOC            | Preblend              |
| CFR            | 1      | Percent | BWOC            | Preblend              |
| CFL-4          | 2      | Percent | BWOC            | Preblend              |
| SCA-6          | 1      | Percent | BWOC            | Preblend              |
| SCA-7          | 5      | Percent | BWOC            | Preblend              |
| FWC-2          | 1      | Percent | BWOC            | Preblend              |
| CDF-6P         | 0.2    | Percent | BWOC            | Preblend              |
| NaCl           | 37     | Percent | BYOC            | Preblend              |



### 1 Tonne Recipe with additives by yield of blend



Example:  SURFACEmix PRO + Additives

| Blend Chemical | Amount | Unit    | Addition Method | Additive Blend Method |
| :------------- | ------ | ------- | --------------- | --------------------- |
| iPrime         | 100    | Percent | BWOC            | Preblend              |

After we load the recipe up with additives defined in eService Blend Section, it looks like following.


| Blend Chemical | Amount | Unit    | Addition Method | Additive Blend Method |
| :------------- | ------ | ------- | --------------- | --------------------- |
| iPrime         | 100    | Percent | BWOC            | Preblend              |
| CaCl2          | 1      | Percent | BWOC            | Preblend              |
| LCC-1          | 2      | Percent | BWOC            | Preblend              |
| LCF-7          | 1      | kg/m3   | BYOC            | Preblend              |

### 1 Cubic Meter Recipe (Total Volume)

Example:  Visweep DM IS + Additives

| Blend Chemical | Amount | Unit |Addition Method|Additive Blend Method|
| :------------- | ------ | ---- |--|--|
| Visweep DM IS | 1      | m3 |BVOB|WaterBase|

After we load the recipe up with additives defined in eService Blend Section, it looks like following.


| Blend Chemical | Amount | Unit |Addition Method|Additive Blend Method|
| :------------- | ------ | ---- |--|--|
| Visweep DM IS | 1      | m3 |BVOB|WaterBase|
| Bulk Ground Silica | 832.4  | kg/m3 |BVOB|Preblend|
| DF-6P | 6  | kg/m3 |BVOB|Preblend|
| WG-6P | 2  | kg/m3 |BVOB|Preblend|
| SA-2P | 5  | kg/m3 |BVOB|Preblend|
| WWS-7P | 30  | kg/m3 |BVOB|Preblend|
| MT-1 | 20  | kg/m3 |BVOB|Preblend|
| MT-2 | 5  | kg/m3 |BVOB|Preblend|
