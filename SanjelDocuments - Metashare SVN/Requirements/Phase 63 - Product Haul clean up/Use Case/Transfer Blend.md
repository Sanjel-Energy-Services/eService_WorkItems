# Transfer Blend

如果Bin中有Blend时，Transfer Blend菜单可用，否则禁用



### Transfer Blend -BulkPlant bin to another bin

**基本场景**

前置条件：

目的Bin为空

步骤

1. 在Bin所在行右点Transfer Blend 菜单,打开弹出页面
   1. BulkPlant,From Storage ,Remainamount，Blend to load直接显示并不允许修改
   2. To Storage默认显示None，下拉框中显示BulkPlant下的所有Bin
2. 选择To Storage
3. 输入Transfter Quantity 并保存

后置条件

From Bin的Quantity更新，Quantity=Quantity-Transfer Quantity

to Bin的Quantity更新，Quantity=Quantity+Transfer Quantity

**异常流程1**

前置条件：

目的Bin有不同类型的Blend

步骤

1. 在Bin所在行右点Transfer Blend 菜单,打开弹出页面
   1. BulkPlant,From Storage ,Remainamount，Blend to load直接显示并不允许修改
   2. To Storage默认显示None
2. 选择To Storage

后置条件

1. Blend in bin显示
2. 提示：There is different blend in the bin ,please empty the bin before you transfer blend.

### Transfer Blend- Rig bin to another bin

**基本场景**

前置条件：

目的Bin为空

步骤

1. 在Bin所在行右点Transfer Blend 菜单,打开弹出页面
   1. Rig,From Bin,Remainamount，Blend to load直接显示并不允许修改
   2. To Bin默认显示None，下拉框中显示Rig下的所有Bin
2. 选择To Bin
3. 输入Transfter Quantity 并保存

后置条件

From Bin的Quantity更新，Quantity=Quantity-Transfer Quantity

to Bin的Quantity更新，Quantity=Quantity+Transfer Quantity

**异常流程1**

前置条件：

目的Bin有不同类型的Blend

步骤

1. 在Bin所在行右点Transfer Blend 菜单,打开弹出页面
   1. Rig,From Bin,Remainamount，Blend to load直接显示并不允许修改
   2. To Bin默认显示None
2. 选择To Bin

后置条件

1. Blend in bin显示
2. 提示：There is different blend in the bin ,please empty the bin before you transfer blend.