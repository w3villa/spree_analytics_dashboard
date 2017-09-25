//= require spree/backend/chart
$(document).ready(function() {



$.get("/admin/dashboard/data_dashboard.json?from="+$("#fromdatepicker").val()+"&to="+$("#todatepicker").val(), function(data) {
      var ctx = document.getElementById("dailyOrdersChart").getContext("2d");
      var myLineChart = new Chart(ctx).Bar(data, {});
      
    });


    $("#fromdatepicker").datepicker({
        dateFormat: "yy-mm-dd"
    });

    $("#todatepicker").datepicker({
        dateFormat: "yy-mm-dd"

    });

})