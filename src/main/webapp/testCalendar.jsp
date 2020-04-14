<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Calendar</title>
	<link href='/resources/calendar/core/main.css' rel='stylesheet' />
    <link href='/resources/calendar/daygrid/main.css' rel='stylesheet' />
    <link href='/resources/calendar/timegrid/main.css' rel='stylesheet' />

    <script src='/resources/calendar/core/main.js'></script>
    <script src='/resources/calendar/daygrid/main.js'></script>
    <script src='/resources/calendar/timegrid/main.js'></script>
    
	<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		
		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins: [ 'dayGrid', 'timeGrid' ]
		});
		
		calendar.render();
	});
    </script>
</head>

<body>
	<div id='calendar'></div>
</body>

</html>