<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['날짜', 'Sales', '방문자'],
          ['2020/4/24',  1000,      37],
          ['2020/4/24',  1170,      12],
          ['2020/4/24',  660,       80],
          ['2020/4/24',  1030,      60],
        ]);

        var options = {
          title: '월별 매출 통계',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.ComboChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
<title>Insert title here</title>
</head>
<body>
    <div id="curve_chart" style="width: 1200px; height: 400px"></div>
</body>
</html>