## Goal

- Align the processes to make sure all cements, additives and blends data accurate and consistent. In these processes, we have AX, Lab Database, eService applications,  Bulk Plant application share same set of master data. 

## Background

- We have built a Blend Master Database to manage all blend chemicals and recipe, built up the links with Inventory with SBS and price code with Price Book.

- Lab Database syncs the chemical list from Blend Master Database

- Blend Calculator is built upon Blend Master Database, it is used in Product Haul function and cost analysis.

- Bulk plant verification software loads product materials for blending according to the load sheet generated from Blend Calculator.

- More BI initiatives relies on Blend Master Database.

  

## Challenges

- Inconsistent naming. One product is named differently in applications and occasions.
- Experimental products are not entered in Blend Master Database
- Links broken between Experimental product and Production product, they might be treated as two different blends.
- New introduced product is not entered to Blend Master Database on time. 
- Data integrity issue across systems. E.g. CFR-15 exists in SBS and Price Book, but not entered in Blend Master Database.
- Data reference is broken. Currently product/blend information is entered to Blend Master Database when a price code is requested. Normally it has been used in program template already as a free text names.



# Sanjel Blend Development & Publish process

### 1. Blend development initiation

​	Lab will name the experimental blend with own naming convention. And send a Blend request to IT.

​	IT will add the experimental blend name in Lab Database, and same blend name in Blend Master Database with an experiment flag.

### 2. Blend Development 

​	Lab will use experimental blend name in Lab Database. The experimental blend name is not visible to any applications other than Lab Database.

### 3. Blend Publish

 	3.1 The experimental blend is approved for production use. Lab will send the blend recipe to Client Solution for blend publish process.

​	3.2 Client Solutions will send a request with blend formal name, finalized recipe and price information to IT.

​	3.3 IT will rename the blend experimental name to formal name in both of Lab Database and Blend Master Database. 

​	3.4 IT will enter the blend properties and blend recipe in Blend Master Database, change experiment flag to production flag.

​	3.5 IT will assign price code and enter pricing information in Price Book.





# Product Introduction Process

1. When there is an interest in a specific cement/additive/chemical product, Supply Chain/Lab/Chuck will request a sample from vendor be sent to the lab for further testing.
2.  Lab will create a new chemical product in Master Database with its chemical properties and use method, the Product Status is Experimental. So it will show up in lab database for lab testing.
3.  Lab will deliver test report to the requestor.
4. The requestor will evaluate the value of the blend to the product line.  
5. If the value exists, Supply Chain team will do credit check the Vendor and  fill out and send "Materials New/Replace Item Request form" to Sue and Lens for approval.
6.  Once the  product is approved, it will be entered in to SBS, an IIN number will be assigned.  
7. The product in Blend Master Database will be updated to Production status. It will be visible to Program Template, eServiceOnline and eService.
8. If the product will be sold to customer directly, Client Solutions send a price code request with product name, Sanjel product name and pricing information to IT.
9. IT will update Blend Master Database to link to product and price book properly. 

