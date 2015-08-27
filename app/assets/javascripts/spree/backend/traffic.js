//= require spree/backend/chart
$(document).ready(function() {

	$.get("/admin/traffic/trend.json?date=" + $("#datepicker").val(), function(data) {
	  var ctx = document.getElementById("dailyStatsChart").getContext("2d");
	  var myLineChart = new Chart(ctx).Bar(data, {});
	});

	$("#datepicker").datepicker({
		dateFormat: "yy-mm-dd",
		onSelect: function(dateText) {
			location.href = "/traffic?date=" + dateText
		}
	});
	$(".page-link").click(function() {
	  $(".info").addClass("hide")
	  $("#" + $(this).data("target")).removeClass("hide")
	  return(false)
	})

})