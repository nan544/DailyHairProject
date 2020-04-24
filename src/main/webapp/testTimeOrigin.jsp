<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Date</title>
<!-- jQuery 사용 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- timepicker 설정값 -->
<script type="text/javascript" src="/resources/dateAndTimePicker/dist/js/jquery.timepicker.min.js" ></script>
<link type="text/css" rel="stylesheet" href="/resources/dateAndTimePicker/dist/css/jquery.timepicker.css" media=""/>
 
<script type="text/javascript">
$(document).ready(function() {
	// INPUT 박스에 들어간 ID값을 적어준다.
	$("#timepicker").timepicker({
		'minTime': '10:00am',	// 조회하고자 할 시작 시간
		'maxTime': '17:00pm',	// 조회하고자 할 종료 시간
		'timeFormat': 'H:i',
		'step': 30				// 30분 단위로 지정. ( 10을 넣으면 10분 단위 )
	});
    
	$(window).scroll(function(){
		$(".ui-timepicker-wrapper").hide();
	});
});
</script>
</head>

<body>
<div align="center">
	<div align="center" style="width: 50%">
		<input type="text" class="timepicker" placeholder="시간 선택" id="timepicker"
			style="width: 150px; height: 35px; margin: 0px 15px 15px 52.5px; text-align: center;"/>
	</div>
</div>
</html>