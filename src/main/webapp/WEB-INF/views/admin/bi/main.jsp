<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#contents {
	width: 1000px;
}

.chart {
	float: left;
}

.selectSearch {
	display: inline-block;
	width: 100px;
	height: 20px;
}

label {
	margin-left: 3px;
}

.searchBar {
	float: right;
}

h5 {
	text-align: right;
}
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
	

	$(function() {

		$("#datepicker2").attr("disabled",true);
		
		
		$("#datepicker1").datepicker({
			format : 'yyyy-mm-dd',
		}).on("changeDate",function(){
			$("#datepicker2").attr("disabled",false);
		});

		$("#datepicker2").datepicker({
			format : 'yyyy-mm-dd'
			/* ,endDate : new Date() */
		}).on("changeDate", function() {
			
			var fromDate = $("#datepicker1").val();
			var toDate = $("#datepicker2").val();

			let strDate1 = fromDate;
			let strDate2 = toDate;
			
			let arr1 = strDate1.split('-');
			let arr2 = strDate2.split('-');

			let dat1 = new Date(arr1[0], arr1[1], arr1[2]);
			let dat2 = new Date(arr2[0], arr2[1], arr2[2]);

			let diff = dat2 - dat1;

			let currDay = 24 * 60 * 60 * 1000;

			let minDate = parseInt(diff/currDay);

			$("#minDate").val(minDate+1);
			

		});
		
		$("#searchBtn").click(function() {
			
			if($("#datepicker1").val()==''){
				alert("날짜를 선택해주세요");
				$(this).focus();
				return;
			}else if ($("#datepicker2").val()==''){
				alert("날짜를 선택해주세요");
				$(this).focus();
				return;
			}
			
			
			$("#searchForm").attr({
				'method' : 'post',
				'action' : 'search.do'
			});

			$("#searchForm").submit();

		});

	});
</script>


<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data2 = new Array();
		data2.push("[ '날짜', '매출(단위:원)' ]");
		console.log(data2);
		
		var data = google.visualization.arrayToDataTable([
				[ '날짜', '매출(단위:원)' ],
			
				[ "${result[0].rest_hairdate}",
						parseInt('${result[0].rest_totalprice}') ],
				[ "${result[1].rest_hairdate}",
						parseInt('${result[1].rest_totalprice}') ],
				[ "${result[2].rest_hairdate}",
						parseInt('${result[2].rest_totalprice}') ],
				[ "${result[3].rest_hairdate}",
						parseInt('${result[3].rest_totalprice}') ],
				[ "${result[4].rest_hairdate}",
						parseInt('${result[4].rest_totalprice}') ],
				[ "${result[5].rest_hairdate}",
						parseInt('${result[5].rest_totalprice}') ],
				[ "${result[6].rest_hairdate}",
						parseInt('${result[6].rest_totalprice}') ]

		]);

		var options = {
			title : '매출 현황',
			legend : {
				position : 'bottom'
			}
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('curve_chart2'));

		chart.draw(data, options);
	}
</script>

</head>
<body>
	<c:if test="${empty login }">
		<script type="text/javascript">
			alert("로그인이 필요합니다.");
			location.href="/admin/adminLoginForm.do";
		</script>
	</c:if>
	<div id="contents">
		<c:set var="totalPrice" value="0" />

		<form id="searchForm">
			<h5>
				<b>날짜로 조회하기</b>
			</h5>
			<p class="searchBar">
				<input type="text" id="datepicker1" name="fromDate"
					class="selectSearch form-control" autocomplete=off><label>~</label> <input
					type="text" id="datepicker2" name="toDate"
					class="selectSearch form-control" autocomplete=off> <input type="button"
					id="searchBtn" value="조회"> 
					<input type="hidden" id="minDate" name="minDate" value="">
			</p>
		</form>
		<div>
			<div id="curve_chart2" class="chart"
				style="width: 1000px; height: 400px"></div>
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
							<td>${salesList.rest_totalprice }원</td>
						</tr>
						<c:set var="totalPrice"
							value="${totalPrice + salesList.rest_totalprice }"></c:set>
					</c:forEach>
					<tr class="success">
						<td><b>총액</b></td>
						<td>${totalPrice}원</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>