Back Haul

##### Create back haul

Crew status will be changed from Offduty to loadrequested. --  The behavior is currently implemented.

Before schedule backhaul, the crew is in offduty status.

 Bulkercrewlog.crewstatus = 1(Offduty)

![image-20240311172449636](C:\Users\sunting\AppData\Roaming\Typora\typora-user-images\image-20240311172449636.png)

 After schedule back haul, the crew is changed to Loadrequested status. System has already done current implementation.

 Product haul is to be displayed beside crew on DRB system. 

 Bulkercrewlog.crewstatus = 6 (loadrequested)

​                        ![image-20240311173146115](C:\Users\sunting\AppData\Roaming\Typora\typora-user-images\image-20240311173146115.png)



Set the producthaul as Onlocation, system will display the order beside the targeted Bin. Remaining amount of the Bin will be deducted. This is currently working properly:

​                       Bininformation.Quantity = 34.6t (35.6-1)![image-20240311181754152](C:\Users\sunting\AppData\Roaming\Typora\typora-user-images\image-20240311181754152.png)             



Producthaul.producthaullifestatus = 4, (Onlocation)

Producthaulload.producthaulloadlifestatus = 2, (Onlocation)

Shippingloadsheet.shippingstatus = 3, (Onlocation)

​                     ![image-20240311180430912](C:\Users\sunting\AppData\Roaming\Typora\typora-user-images\image-20240311180430912.png)  

Req# =Bininformation.lastproducthaulloadid

Blend in the bin = Shippingloadsheet.name

QTY = Shippingloadsheet.loadamount



If total amount of the bin is scheduled back haul and is set as Onlocation, the Bin will be emptied. 

Bininformaiton.producthaulloadid = 0

Bininformation.quantity = 0

