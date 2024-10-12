SanjelData中Bin菜单对应网页不能显示的问题解决方案



可以在发布生成的web.config文件中添加配置。

**web.config**文件中配置如下：

![img](file:///C:/Users/hunter.zhao/AppData/Roaming/Foxmail7/Temp-28196-20221229153952/Attach/image001(12-30-08-19-58).jpg)


   <security>

​    <requestFiltering>

​     <hiddenSegments>

​      <remove segment="bin" />

​     </hiddenSegments>

​    </requestFiltering>

   </security>