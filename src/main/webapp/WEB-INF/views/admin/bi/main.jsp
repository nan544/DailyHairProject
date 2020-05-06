<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#contents{
width: 1000px;
}

.chart{
float: left;
}
</style>
<script type="text/javascript">
	
</script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ '날짜', '매출(단위:원)' ],

				[ "${result[0].rest_hairdate}", parseInt('${result[0].rest_totalprice}') ], [ "${result[1].rest_hairdate}", parseInt('${result[1].rest_totalprice}')],
				[ "${result[2].rest_hairdate}", parseInt('${result[2].rest_totalprice}')], ["${result[3].rest_hairdate}", parseInt('${result[3].rest_totalprice}')],
				[ "${result[4].rest_hairdate}", parseInt('${result[4].rest_totalprice}') ], ["${result[5].rest_hairdate}", parseInt('${result[5].rest_totalprice}') ],
				[ "${result[6].rest_hairdate}", parseInt('${result[6].rest_totalprice}')],

		]);

		var options = {
			title : '최근 일주일 매출 현황',
			legend : {
				position : 'bottom'
			}
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('curve_chart2'));

		chart.draw(data, options);
	}
</script>
<!-- <script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ '날짜', '예약 수' ],

				[ "${result[0].rest_hairdate}", parseInt('${result[0].rest_totalprice}') ], [ "${result[1].rest_hairdate}", parseInt('${result[1].rest_totalprice}')],
				[ "${result[2].rest_hairdate}", parseInt('${result[2].rest_totalprice}')], ["${result[3].rest_hairdate}", parseInt('${result[3].rest_totalprice}')],
				[ "${result[4].rest_hairdate}", parseInt('${result[4].rest_totalprice}') ], ["${result[5].rest_hairdate}", parseInt('${result[5].rest_totalprice}') ],
				[ "${result[6].rest_hairdate}", parseInt('${result[6].rest_totalprice}')],

		]);

		var options = {
			title : '최근 일주일 예약 현황',
			legend : {
				position : 'bottom'
			}
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('curve_chart'));

		chart.draw(data, options);
	}
</script> -->
</head>
<body>
<c:set var="totalPrice" value="0"/>
<div>
	<div id="curve_chart2" class="chart" style="width: 500px; height: 400px"></div>
	<!-- <div id="curve_chart2" class="chart" style="width: 500px; height: 400px"></div> -->
</div>
<div id="contents">
	<table class="table table-striped">
	
	<thead class="active">
			<tr>
				<th>날짜</th>
				<th>매출액</th>
			</tr>
	</thead>
	
				<tbody>
					<c:forEach var="salesList" items="${result}" varStatus="status">
						<tr>
							<td>${salesList.rest_hairdate }</td>
							<td >${salesList.rest_totalprice }</td>
						</tr>
						<c:set var="totalPrice" value="${totalPrice + salesList.rest_totalprice }"></c:set>
					</c:forEach>
					<tr class="success">
						<td> <b>총액</b></td>
						<td>${totalPrice}</td> 
					</tr>
				</tbody>
	</table></div>
</body>
</html>