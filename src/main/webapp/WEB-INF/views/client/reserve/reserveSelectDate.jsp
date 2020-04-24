<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>ReserveSelectDate</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="/resources/assets/img/DHS-icon.png" rel="icon">
<link href="/resources/assets/img/DHS-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,600,600i,700,700i|Satisfy|Comic+Neue:300,300i,400,400i,700,700i" rel="stylesheet">

<!-- Vendor CSS Files -->
<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/icofont/icofont.min.css">
<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/boxicons/css/boxicons.min.css">
<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/animate.css/animate.min.css">
<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/venobox/venobox.css">
<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css">

<!-- Template Main CSS File -->
<link rel="stylesheet" type="text/css" href="/resources/assets/css/style.css">

<!-- jQuery 사용 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- datepicker 설정 -->
<link href="/resources/dateAndTimePicker/dist/css/jquery-ui.css" rel="stylesheet" type="text/css">
<script src="/resources/dateAndTimePicker/dist/js/jquery-ui.js"></script>

<!-- timepicker 설정 -->
<script type="text/javascript" src="/resources/dateAndTimePicker/dist/js/jquery.timepicker.min.js" ></script>
<link type="text/css" rel="stylesheet" href="/resources/dateAndTimePicker/dist/css/jquery.timepicker.css" media=""/>

<!-- =======================================================
	* Template Name: Delicious - v2.0.0
	* Template URL: https://bootstrapmade.com/delicious-free-restaurant-bootstrap-theme/
	* Author: BootstrapMade.com
	* License: https://bootstrapmade.com/license/
	======================================================== -->

<!-- Vendor JS Files -->
<script src="/resources/assets/vendor/jquery/jquery.min.js"></script>
<script src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
<script src="/resources/assets/vendor/php-email-form/validate.js"></script>
<script src="/resources/assets/vendor/jquery-sticky/jquery.sticky.js"></script>
<script src="/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="/resources/assets/vendor/venobox/venobox.min.js"></script>
<script src="/resources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>

<!-- Template Main JS File -->
<script type="text/javascript" src="/resources/assets/js/main_main.js"></script>

<script type="text/javascript">
	// DatePicker
	$(function() {
		$("#datePicker").datepicker({
			dateFormat: 'yy-mm-dd',
			prevText: '이전 달',		// 마우스 오버시 이전달 텍스트
			nextText: '다음 달',		// 마우스 오버시 다음달 텍스트
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더중 월 표시를 위한 부분
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더 중 월 표시를 위한 부분
			dayNames: ['일', '월', '화', '수', '목', '금', '토'],	//한글 캘린더 요일 표시 부분
			dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],	//한글 요일 표시 부분
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],	// 한글 요일 표시 부분
			showMonthAfterYear: true,	// true : 년 월 / false : 월 년 순으로 보여줌
			yearSuffix: '년',		// 년도 표시
			showButtonPanel: false,	// 오늘로 가는 버튼과 달력 닫기 버튼 보기 옵션
			
		}).on(
				"changeDate",
				function(e) {
					var date = $("#datePicker").val();
		});
	});
	
	// TimePicker
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
	
	// 이전 단계로 버튼 이벤트
	function backToSelectPlace() {
		location.replace("/reserve/backToSelectPlace.do");
	}

	// 디자이너 선택 버튼 이벤트
	function selectDesigner() {
		
		if($("#datePicker").val() == ''){
			alert("날짜를 선택하세요");
			return;
		}else if($("#timepicker").val()==''){
			alert("시간을 선택하세요");
			return;
		}else{
		
		$("#timeForm").attr("method","get");
		$("#timeForm").attr("action","/reserve/reserveSelectDesigner.do");
		$("#timeForm").submit();
		
		}
		//location.replace("/reserve/reserveSelectDesigner.do");
	}
</script>

<style type="text/css">
.reserveTable {
	display: inline;
	padding: 10px;
	font-size: 12px;
}

.reserveTablehead {
	display: inline;
	padding: 10px;
	font: 15pt bold;
	color: #670000;
}

.reserveBtn {
	width: 150px;
	height: 50px;
	background: #ffb03b;
	border: 0;
	color: #fff;
	padding: 10px 24px;
	transition: 0.4s;
	border-radius: 50px;
	font-size: 15px;
	margin: 5px;
}
.date_left{
	width: 250px;
	float: left;
}
.date_right{
	width: 250px;
	float: right;
	margin-left: 50px;
}
.datebox{
	min-width: 500px;
	max-width: 1020px;
	margin: 0 auto;
	padding: 60px 30px 30px 30px;
	text-align: center;
}
.datebox > form > div > h9{
	color: red;
	font-size: 10px;
	text-align: left;
}
.datebox > form > div > label{
	margin-top: 20px;
}
.timeSelectBox{
	width: 150px; 
	height: 35px; 
	text-align: center;
}
.timeSelectBox > option{
	width: 150px;
	height: 150px;
	text-align: center;
}
</style>
</head>

<body>
	<c:if test="${empty login }">
		<script type="text/javascript">
			alert("로그인해주세요");
			location.href="/";
		</script>
	</c:if>
	<!-- header 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/header.jsp"></jsp:include>
	
	<!-- ======= Reserve Section ======= -->
	<section id="about" class="about">
		<div class="container-fluid">
			<div class="row">
				<!-- 최상단 구분 -->
				<div style="width: 100%; height: 100px; margin-bottom: 50px;">
				</div>
				
				<!-- 상단 -->
				<div style="margin: 0 auto; text-align: center; width: 100%;">
					<h1 style="margin-bottom: 10px;">예약하기</h1>
					<p style="margin-bottom: 10px;">시술을 받기 원하시는 날짜와 시간을 선택해주세요.</p>
				</div>
				
				<div style="width: 100%; margin: 0 auto;">
					<hr style="border: 1 solid black; margin-bottom: 10px;" />
				</div>
				
				<!-- 예약 정보 -->
				<div style="margin: 0 auto;">
					<div class="reserveTablehead">예약 정보</div>
					<div class="reserveTable">${place}</div>
					<div class="reserveTable">(시술 일시)입력 대기 중</div>
					<div class="reserveTable">(디자이너)입력 대기 중</div>
					<div class="reserveTable">(시술)입력 대기 중</div>
					<div></div>
					<div class="reserveTablehead" style="float: left;">결제 금액</div>
					<div class="reserveTable" style="float: right;">(금액)입력 대기 중</div>
				</div>
				
				<div style="width: 100%; margin: 0 auto;">
					<hr style="border: 1 solid black; margin-top: 10px;" />
				</div>
				
				<!-- 달력 노출 및 일자 선택 -->
				<div class="datebox">
					<form id="timeForm" name="timeForm">
						<div class="date_left">
							<h9>&lt;　당일은 예약이 불가능 합니다　&gt;</h9><br>
							<h9>&lt;　최대 6개월까지 선택이 가능합니다　&gt;</h9><br>
							<label for="datePicker">1. 날짜를 선택해주세요.</label><br>
							<input type="text" class="datepicker" id="datePicker" name="rest_hairdate"
								placeholder="날짜 선택" data-language="ko" readonly="readonly"
								style="width: 150px; height: 35px; text-align: center;">
						</div>
						<div class="date_right">
							<h9>&lt;　예약 가능 시간 : 10 AM ~ 17 PM　&gt;</h9><br>
							<h9>&lt;　이후 시간은 매장으로 직접 문의주세요　&gt;</h9><br>
							<label for="timepicker">2. 시간을 선택해주세요.</label><br>
							<input type="text" class="timepicker" id="timepicker" name="rest_time"
								placeholder="시간 선택" style="width: 150px; height: 35px; text-align: center;"/>
						</div>
					</form>
				</div>
				
				<div style="width: 100%; margin: 0 auto;">
					<hr style="border: 0; margin-top: 10px;" />
				</div>
				
				<!-- 버튼 -->
				<div style="margin: 0 auto; margin-top: 150px;">
					<button class="reserveBtn" onclick="backToSelectPlace()">이전 단계</button>
					<button class="reserveBtn" onclick="selectDesigner()">디자이너 선택</button>
				</div>
				
			</div>
		</div>
	</section>
	<!-- End Reserve Section -->
	
	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
</body>

</html>