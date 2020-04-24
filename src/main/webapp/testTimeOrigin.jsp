<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Date</title>
<!-- jQuery 사용 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- timepicker 설정 초기값 -->
<link href="/resources/dateAndTimePicker/dist/css/jquery.timepicker.css" rel="stylesheet" type="text/css">
<script src="/resources/dateAndTimePicker/dist/js/jquery.timepicker.js"></script>

<!-- timepicker 설정값 -->
<script type="text/javascript">
$('.timepicker').timepicker({
    timeFormat: 'h:mm p',
    interval: 60,
    minTime: '10',
    maxTime: '6:00pm',
    defaultTime: '11',
    startTime: '10:00',
    dynamic: false,
    dropdown: true,
    scrollbar: false
});
</script>
</head>

<body>
<div align="center">
	<div align="center" style="width: 50%">
		<input type="text" class="timepicker" placeholder="시간 선택" name="time"
			style="width: 150px; height: 35px; margin: 0px 15px 15px 52.5px; text-align: center;"/>
	</div>
</div>
</body>

</html>