# How to change legacy RDL report w/o old version Visual Studio

## Goal

We are going to change data source and also add new data field.

## Step 1 - Make a copy of original rdlc file.

## Step 2 - Add new data fields in report data file

![image](https://user-images.githubusercontent.com/55812393/129103182-7e5e1f75-3929-4cad-87cd-0b9bc2791d2e.png)

## Step 3 - Change the report in VS 2019

#### Before starting change anything in the report, make a copy of original rdlc file. We are going to make changes in designer, and copy some changed code to original file. Finally we will use updated original  rdlc file to overwrite the one modified from designer. This will work around the schema change caused by VS 2019. 

### 2.1 What we are going to do?

![image](https://user-images.githubusercontent.com/55812393/129100866-124872da-0554-4ee8-9bea-43aa8608986d.png)



### 2.2 Add new dataset

![image](https://user-images.githubusercontent.com/55812393/129103977-9fe184ff-a3a4-48af-b4d4-53d279fce048.png)

![image](https://user-images.githubusercontent.com/55812393/129104231-aac348c8-2944-4e1a-8f7b-d04ed432cd3e.png)



![image](https://user-images.githubusercontent.com/55812393/129104500-12323d3e-d351-4601-bbd0-ca3bdcb6b975.png)

### 2.3 Delete Old  Dataset.

### 2.4 Replace the DataSets section in orginal rdlc file with the updated rdlc file.

![image](https://user-images.githubusercontent.com/55812393/129117715-fdc8f0f8-2b1e-44a5-a67b-412377043d43.png)

### 2.5 Replace DataSet name in all subreport references.

![image-20210811162315889](C:\Users\awang\AppData\Roaming\Typora\typora-user-images\image-20210811162315889.png

![image-20210811174603575](C:\Users\awang\AppData\Roaming\Typora\typora-user-images\image-20210811174603575.png)

### 2.6 Add label in Designer

### 2.7 Copy the layout code from updated rdlc file to orginal rdlc file in the corresponding section



### 2.8 Close solution, copy updated original rdlc file to overwrite the one updated by designer.

### 2.9 Reopen the solution.



