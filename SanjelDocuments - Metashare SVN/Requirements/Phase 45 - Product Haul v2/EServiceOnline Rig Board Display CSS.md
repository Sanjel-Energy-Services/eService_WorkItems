# EServiceOnline

## Rig Borad

页面菜单，字体，北京颜色控制样式文件路径：项目目录下的wwwroot\css\rigBoard.css

### Blend

#### Blend列 右点击菜单Product Haul二级菜单颜色控制

```css
.menuStyle_Scheduled, .menuStyle_Scheduled:hover {
    color: #E6C600 !important;
}
.menuStyle_Blend, .menuStyle_Blend:hover {
    color: #9E6D61 !important;
}
.menuStyle_Loaded, .menuStyle_Loaded:hover {
    color: #00AAAA !important;

}
.menuStyle_Onlocation, .menuStyle_Onlocation:hover {
    color: #888888 !important;
}
```



#### Blend列 字体颜色

```css
/*bl1、bl2、bl3*/
.bl-needahaul {
    color: #FF0000 !important;
}

.bl-partialscheduled {
    color: #FFBF00 !important;
}

.bl-haulscheduled {
    color: yellow !important;
}
.bl-partialonlocation {
    color: Green !important;
}
.bl-onlocation {
    color: #00FF00 !important;
}
.bl-gowithcrew {
    color: white !important;
}
```

### Data 列字体颜色

```css
/*date*/
.date-alerted {
    color: #00FFFF !important;
}

.date-pending {
    color: #FF0000 !important;
}

.date-confirmed {
    color: #FFFF00 !important;
}

.date-scheduled {
    color: #00FF00 !important;
}

.date-dispatched {
    color: #00FF00 !important;
    background-color: #000000 !important;
}

.date-inprogress {
    color: #00FF00 !important;
    background-color: #000000 !important;
}

.date-completed {
    color: white !important;
}

```

### Bin列颜色

```css
/*bin*/

.bin-assignedandconfirmed {
    color: #00FF00 !important;
}

.bin-assignednotconfirmed {
    color: #FFBF00 !important;
}

.bin-assignednotconfirmed-down {
    color: #FFBF00 !important;
    background-color: #b44c6b !important;
}

.bin-assignedandconfirmed-down {
    color: #00FF00 !important;
    background-color: #b44c6b !important;
}

.bin-notassigned {
    color: red !important;
}

.bin-notassigned-down {
    color: red !important;
    background-color: #b44c6b !important;
}
```

### JobAlert

```css
/*JobAlert*/
.jobalert-job-date {
    color: #00FFFF !important;
}
```

### JobBackgroundByRiskMatrix

```css
.job-RiskMatrix-059 {
    background-color: green !important;
}

.job-RiskMatrix-6079 {
    background-color: yellow !important;
    color: black !important;
}

.job-RiskMatrix-80119 {
    background-color: red !important;
}

.job-RiskMatrix-120 {
    background-color: black !important;
}
```

