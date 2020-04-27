<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
  <html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['날짜', '매출(단위:원)'],
          ['${curDate[0]}',  100032],
          ['${curDate[1]}',  233333],
          ['${curDate[2]}',  627960],
          ['${curDate[3]}',  186630],
          ['${curDate[4]}',  144230],
          ['${curDate[5]}',  112450],
          ['${curDate[6]}',  524230],
          
        ]);

        var options = {
          title: '일일 매출 현황',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="curve_chart" style="width: 900px; height: 500px"></div>
  </body>
</html>