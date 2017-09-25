//= require spree/backend/chart
$(document).ready(function() {

	$.get("/admin/dashboard/data_dashboard_pie.json", function(data) {
	  var ctx1 = document.getElementById("dailyOrdersPie").getContext("2d");
	  var myPieChart = new Chart(ctx1).Bar(data);
	});

})

