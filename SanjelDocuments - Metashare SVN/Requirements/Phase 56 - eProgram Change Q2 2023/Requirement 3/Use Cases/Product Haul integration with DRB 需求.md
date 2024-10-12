####                                                Product Haul integration with DRB

1.  When product haul is created on RigBoard/BulkPlant Board, it will affect Crew status on DRB Bulker Assignment page. Review current product haul implementation in eServiceOnline and make proper updates to Bulker Crew Log.

    

   Rig Board Actions

| Product Haul Action | Assignment Status(Current)           | Assignment Status (Target) | Bulker Crew Log Status (Current) | Bulker Crew Log Status (Target)    |
| ------------------- | ------------------------------------ | -------------------------- | -------------------------------- | ---------------------------------- |
| Schedule            | Scheduled                            | Scheduled                  | OffDuty                          | LoadRequested                      |
| OnLocation          | Scheduled, Loading, Loaded, Enroute, | OnLocation                 | Called, Loading, Loaded, EnRoute | OnLocation                         |
| Cancel              | Scheduled                            | Removed                    | LoadRequested, Called            | OffDuty                            |
| Cancel              | Scheduled                            | Removed                    | LoadRequested, Called            | LoadRequest if next haul available |

  General Rules for multiple Hauls

- Rig Board
  - Product Haul status change only affects LoadRequested, OnLocation, OffDuty status's of Bulker Crew Log under certain circumstances. Most of Bulker Crew status's will be skipped. The logic of status skipping won't be triggered to update Assignement status and product haul status.

![image-20230518113449895](C:\Users\sunting\AppData\Roaming\Typora\typora-user-images\image-20230518113449895.png)

​                                         ![image-20230518113544946](C:\Users\sunting\AppData\Roaming\Typora\typora-user-images\image-20230518113544946.png)

​                                     ![image-20230518113630947](C:\Users\sunting\AppData\Roaming\Typora\typora-user-images\image-20230518113630947.png)

​                                     **Crew Assignment  Life Style**                            

​                                    ![image-20230518114547428](C:\Users\sunting\AppData\Roaming\Typora\typora-user-images\image-20230518114547428.png)  

​                                                                                                                     ![image-20230518114901654](C:\Users\sunting\AppData\Roaming\Typora\typora-user-images\image-20230518114901654.png)

​          