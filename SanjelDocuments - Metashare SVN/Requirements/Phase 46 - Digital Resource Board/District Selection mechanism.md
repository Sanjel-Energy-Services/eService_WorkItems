# District Selection mechanism

## In the controller methods, the way we get the query string

```C#
 if (this.HttpContext.Session.GetString("ServicePoint") == null)
 {
     string retrievalstr = JsonConvert.SerializeObject(new RetrievalCondition());
     this.HttpContext.Session.SetString("ServicePoint", retrievalstr);
 }
RetrievalCondition retrieval = JsonConvert.DeserializeObject<RetrievalCondition>(this.HttpContext.Session.GetString("ServicePoint"));
```

## RetrievalCondition Definition

```c#
    public class RetrievalCondition
    {
        public int BR { get; set; }
        public int RD { get; set; }
        public int Edm { get; set; }
        public int Eds { get; set; }
        public int GP { get; set; }
        public int FSJ { get; set; }
        public int EST { get; set; }
        public int SC { get; set; }
        public int KD { get; set; }
        public int LLD { get; set; }
        public int LLB { get; set; }
        public int NW { get; set; }
        public int DrillingRig { get; set; }
        public int ServiceRig { get; set; }
        public int IsProjectRig { get; set; }

        public int Alerted { get; set; }
        public int Pending { get; set; }
        public int Confirmed { get; set; }
        public int Dispatched { get; set; }
        public int Scheduled { get; set; }
        public int InProgress { get; set; }
        public int Completed { get; set; }
        public int IsShowFutureJobs { get; set; }
        public bool IsChange { get; set; }
        public int PageNumber { get; set; }
        public List<Collection<int>> ResuhSet(RetrievalCondition retrieval)
        {
            Collection<int> servicePoints = new Collection<int>(){ retrieval.BR,retrieval.RD,retrieval.Edm,retrieval.Eds,retrieval.GP,retrieval.FSJ, retrieval.NW, retrieval.EST,retrieval.SC,retrieval.KD,retrieval.LLD, retrieval.LLB};
            Collection<int> rigTypes = new Collection<int>(){ retrieval.IsProjectRig,retrieval.ServiceRig,retrieval.DrillingRig};
            Collection<int> jobStatuses = new Collection<int>(){retrieval.Alerted,retrieval.Pending,retrieval.Completed,retrieval.Scheduled, retrieval.Confirmed,retrieval.InProgress,retrieval.Dispatched};
            Collection<int> isShowFutureJobs = new Collection<int>(){retrieval.IsShowFutureJobs };

            return new List<Collection<int>>()
            {
                servicePoints,
                rigTypes,
                jobStatuses,
                isShowFutureJobs
            };
        }
    }
```

## Html View File

```html
@using eServiceOnline.Models.Commons
@using Microsoft.AspNetCore.Http
@model eServiceOnline.Models.Commons.RetrievalCondition

<div style="padding: 0 60px 0 20px;color: #BFBFBF; text-align: center; float: left;">
    <input name="ServicePoint" type="checkbox" class="checkboxstyle" value="69" onclick="selectionCriteria(this,'BR')" />BR
    <input name="ServicePoint" type="checkbox" class="checkboxstyle" value="85" onclick="selectionCriteria(this,'RD')" />RD
    <input name="ServicePoint" type="checkbox" class="checkboxstyle" value="67" onclick="selectionCriteria(this,'Edm')" />Edm
    <input name="ServicePoint" type="checkbox" class="checkboxstyle" value="81" onclick="selectionCriteria(this,'Eds')" />Eds
    <input name="ServicePoint" type="checkbox" class="checkboxstyle" value="71" onclick="selectionCriteria(this,'GP')" />GP
    <input name="ServicePoint" type="checkbox" class="checkboxstyle" value="66" onclick="selectionCriteria(this,'FSJ')" />FSJ
    <input name="ServicePoint" type="checkbox" class="checkboxstyle" value="89" onclick="selectionCriteria(this,'NW')" />NW
    <span style="color:#FFFF00">&nbsp;|&nbsp;</span>
    <input name="ServicePoint" type="checkbox" class="checkboxstyle" value="72" onclick="selectionCriteria(this,'EST')" />EST
    <input name="ServicePoint" type="checkbox" class="checkboxstyle" value="70" onclick="selectionCriteria(this,'SC')" />SC
    <input name="ServicePoint" type="checkbox" class="checkboxstyle" value="88" onclick="selectionCriteria(this,'KD')" />KD
    <input name="ServicePoint" type="checkbox" class="checkboxstyle" value="61" onclick="selectionCriteria(this,'LLD')" />LLD
    <input name="ServicePoint" type="checkbox" class="checkboxstyle" value="65" onclick="selectionCriteria(this,'LLB')" />LLB
</div>
<div style="padding: 0 20px;font-family: Segoe UI; color: #FFFF00; text-align: center;float: left;">
    <input name="IsProjectRig" type="checkbox" class="checkboxstyle" value="1" onclick="selectionCriteria(this,'IsProjectRig')" />Project Rig
</div>
<div style="padding: 0 20px;font-family: Segoe UI; color: #BFBFBF; text-align: center;float: left;">
    <input name="DrillingRig" type="checkbox" class="checkboxstyle" value="1" onclick="selectionCriteria(this,'DrillingRig')" />Drilling Rig
    <input name="ServiceRig" type="checkbox" class="checkboxstyle" value="1" onclick="selectionCriteria(this,'ServiceRig')" />Service Rig
</div>
<div style="padding: 0  0 0 60px;font-family: Segoe UI; text-align: center;float: left;">
    <span class="date-alerted"><input name="JobStatus" type="checkbox" class="checkboxstyle" value="1" onclick="selectionCriteria(this,'Alerted')" />Alerted</span>
    <span class="date-pending"><input name="JobStatus" type="checkbox" class="checkboxstyle" value="2" onclick="selectionCriteria(this,'Pending')" />Pending</span>
    <span class="date-confirmed"><input name="JobStatus" type="checkbox" class="checkboxstyle" value="3" onclick="selectionCriteria(this,'Confirmed')" />Confirmed</span>
    <span class="date-scheduled"><input name="JobStatus" type="checkbox" class="checkboxstyle" value="4" onclick="selectionCriteria(this,'Scheduled')" />Scheduled</span>
    <span class="date-dispatched"><input name="JobStatus" type="checkbox" class="checkboxstyle" value="5" onclick="selectionCriteria(this,'Dispatched')" />Dispatched</span>
    <span class="date-inprogress"><input name="JobStatus" type="checkbox" class="checkboxstyle" value="7" onclick="selectionCriteria(this,'InProgress')" />In Progress</span>
    <span class="date-completed"><input name="JobStatus" type="checkbox" class="checkboxstyle" value="8" onclick="selectionCriteria(this,'Completed')" />Completed</span>
    <input id="RetrievalConditions" name="RetrievalConditions" type="hidden" value='@this.Context.Session.GetString("ServicePoint")' />
</div>
<div style="padding: 0 15px 0 40px;font-family: Segoe UI; color: #BFBFBF; text-align: center;float: left;">
    <input name="IsShowFutureJobs" type="checkbox" class="checkboxstyle" value="1" onclick="selectionCriteria(this,'IsShowFutureJobs')" />Future Job
</div>

<div id="sj_retrieval_conditions">
    @Html.HiddenFor(model => model.BR)
    @Html.HiddenFor(model => model.RD)
    @Html.HiddenFor(model => model.Edm)
    @Html.HiddenFor(model => model.Eds)
    @Html.HiddenFor(model => model.GP)
    @Html.HiddenFor(model => model.FSJ)
    @Html.HiddenFor(model => model.NW)
    @Html.HiddenFor(model => model.EST)
    @Html.HiddenFor(model => model.SC)
    @Html.HiddenFor(model => model.KD)
    @Html.HiddenFor(model => model.LLD)
    @Html.HiddenFor(model => model.LLB)
    @Html.HiddenFor(model => model.IsProjectRig)
    @Html.HiddenFor(model => model.DrillingRig)
    @Html.HiddenFor(model => model.ServiceRig)
    @Html.HiddenFor(model => model.Alerted)
    @Html.HiddenFor(model => model.Pending)
    @Html.HiddenFor(model => model.Confirmed)
    @Html.HiddenFor(model => model.Scheduled)
    @Html.HiddenFor(model => model.Dispatched)
    @Html.HiddenFor(model => model.InProgress)
    @Html.HiddenFor(model => model.Completed)
    @Html.HiddenFor(model => model.IsShowFutureJobs)
    @Html.HiddenFor(model => model.IsChange)
</div>
<script>
    var retrieval = {};
    window.onload = function () {
        retrieval = JSON.parse($("#RetrievalConditions").val());
        var currentPage = $("#FlatGrid .e-pager").find(".e-active").text();
        $("#FlatGrid .e-pager").find(".e-active").attr("onclick", "subPageLink(" + currentPage + ");");
        $("#FlatGrid .e-pager").find(".e-active").siblings().each(function (i, ele) {
            var number = $(ele).text();
            $(ele).attr("onclick", "subPageLink(" + number + ");");
            if ($(ele).text() == retrieval.PageNumber) {
                console.log(retrieval.PageNumber);
                $(ele).trigger("click");
            }
        });
        retrieval = JSON.parse($("#RetrievalConditions").val());
        console.log(retrieval);
        $("#sj_retrieval_conditions input").each(function (i, ele) {
            var key = $(ele).attr("id");
            if (retrieval[key] !== 0) {
                $("#retrieval_conditions").find("input[type='checkbox']").eq(i).prop("checked", true);
            }
        });

        var median;
        median = currentPage - 1;
        $("#FlatGrid .e-prevpage").click(function () { subPageLink(median); });
        $("#FlatGrid .e-nextpage").click(function () { subPageLink(-1); });
        $("#FlatGrid .e-firstpage").click(function () { subPageLink(0); });
        $("#FlatGrid .e-lastpage ").click(function () { subPageLink(-1); });
        $("#FlatGrid1 .e-gridheader").hide();
    }



    var retrieurl =  '@Url.Action("UpdateSessionValue", "RigBoard")';
    function selectionCriteria(item, data) {
        if ($(item).is(":checked")) {
            $("#" + data).val($(item).val());
            $(item).prop("checked", true);
        } else {
            $("#" + data).val("");
            $(item).prop("checked", false);
        }
        retrieval[data] = $("#" + data).val();
        retrieval["IsChange"] = true;
        retrieval["PageNumber"] = 1;
        $.ajax({
            url: retrieurl,
            method: "Post",
            async: false,
            data: retrieval,
            success: function () {
                window.location.reload();
            }
        });
    }

    function subPageLink(item) {

        var str = $("#FlatGrid .e-pagermsg").html();
        var currentPage = $("#FlatGrid .e-pager").find(".e-active").text();
        var pager = str.substring(str.indexOf("f") + 1, str.indexOf("p") - 1);
        if (item == -1) {
            if (str > currentPage) {
                retrieval["PageNumber"] = parseInt(currentPage) + 1;
            } else {
                retrieval["PageNumber"] = pager;
            }
        } else {
            retrieval["PageNumber"] = item;
        }
        retrieval["IsChange"] = false;
        $.ajax({
            url: retrieurl,
            method: "Post",
            async : false,
            data: retrieval,
            success: function () {
            }
        });
    }
</script>
```

### Integrate with DRB

As DRB will not be on the same host with eServiceOnline, the Http session may not work. Passing query string my be the way to work. We can use the query string defined. Cross session query can be passed in as a query parameter.  In session query can be the similar way as above.







Please let me know your thoughts and any better ideas.



