<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>paymentCard</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">

	<!-- Favicons -->
	<link href="/resources/assets/img/favicon.png" rel="icon">
	<link href="/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
	
	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,600,600i,700,700i|Satisfy|Comic+Neue:300,300i,400,400i,700,700i" rel="stylesheet">
	
	<!-- Vendor CSS Files -->
	<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" >
	<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/icofont/icofont.min.css" >
	<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/boxicons/css/boxicons.min.css" >
	<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/animate.css/animate.min.css" >
	<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/venobox/venobox.css" >
	<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css" >
	
	<!-- Template Main CSS File -->
	<link rel="stylesheet" type="text/css" href="/resources/assets/css/style.css" >
	
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
	
	<style type="text/css">
		.reserveTable { display: inline; padding: 10px; font-size: 12px;}
		.reserveTablehead { display: inline; padding: 10px; font: 15pt bold; color: #670000;}
		.reserveBtn { width: 150px; height: 50px; background: #ffb03b; border: 0;	color: #fff;
				padding: 10px 24px; transition: 0.4s; border-radius: 50px; font-size: 15px;}
		.paymentMini { display: inline; }
	</style>
	
	<!-- 결제 라디오 버튼 클릭 이벤트 -->
	<script type="text/javascript">
	$(function(){
		
		
	});
	function paymentCard() {
		alert("카드결제를 진행하겠습니다.");
		
		alert($("#m_id").val()+"<<가져갈 아이디");
		alert($("#des_num").val()+"<< 가져갈 디자이너 번호");
		alert($("#rest_hairdate").val()+"<<선택한 시술날짜");
		alert($("#rest_time").val()+"<<선택한 시술시간");
		alert($("#rest_memo").val()+"<<작성한 메모");
		alert($("input[name='rest_payoption']:checked").val()+"<<선택한 결제유형");
		alert($("#rest_totalprice").val()+"<<<시술 총가격");
		
		$("#insertForm").attr({
			"method":"post",
			"action":"/reserve/reserveInsert.do"
		});
		
		$("#insertForm").submit();
	}
	
	function paymentAccount() {
		alert("계좌이체를 진행하겠습니다.");
		
		alert($("#des_num").val()+"<< 가져갈 디자이너 번호");
		alert($("#rest_hairdate").val()+"<<선택한 시술날짜");
		alert($("#rest_time").val()+"<<선택한 시술시간");
		alert($("#rest_memo").val()+"<<작성한 메모");
		alert($("input[name='rest_payoption']:checked").val()+"<<선택한 결제유형");
		
		//reserveInser.do
			
		//location.replace("/reserve/reservePaymentAccount.do");
	}
	</script>
	
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
	<div class="container-fluid" >
		<div class="row">
			<!-- 최상단 구분 -->
			<div style="width: 100%; height: 100px; margin-bottom: 50px;">
			</div>
			
			<!-- 상단 -->
			<div style="margin: 0 auto; text-align: center; width: 100%;">
				<h1 style="margin-bottom: 10px;">결제하기</h1>
				<p style="margin-bottom: 10px;">결제 수단을 선택해주세요.</p>
			</div>
			
			<div style="width: 100%; margin: 0 auto;">
				<hr style="border: 1 solid black; margin-bottom: 10px;" />
			</div>
			
			<!-- 예약 정보 -->
			<div style="margin: 0 auto;">
				<div class="reserveTablehead">예약 정보　　</div>
				<div class="reserveTable">${place}</div>
				<div class="reserveTable">${data.rest_hairdate}&nbsp;&nbsp;&nbsp;${data.rest_time}</div>
				<div class="reserveTable">${desname.des_name }(${desname.des_job })</div>
				<div class="reserveTable">시술명</div>
				<div></div>
				<div class="reserveTablehead" style="float: left;">결제 금액　　</div>
				<div class="reserveTable" style="float: right;">(금액)입력 대기 중</div>
			</div>
			
			<div style="width: 100%; margin: 0 auto;">
				<hr style="border: 1 solid black; margin-top: 10px;" />
			</div>
			
			<!-- 결제 수단 선택 -->
			<div style="margin: 0 auto;">
				<div class="paymentTable">
				<form id="insertForm" name="insertForm">
				<input type="hidden" id="rest_hairdate" name="rest_hairdate" value="${data.rest_hairdate}"/>
				<input type="hidden" id="rest_time" name="rest_time" value="${data.rest_time }"/>
				<input type="hidden" id="des_num" name="des_num" value="${data.des_num}"/>
				<input type="hidden" id="rest_memo" name="rest_memo" value="${data.rest_memo}"/>
				<input type="hidden" id="m_id" name="m_id" value="${login.m_id}"/>
				<input type="hidden" id="style_number" name="style_number" value="${number}"/>
				<input type="hidden" id="rest_totalprice" name="rest_totalprice" value="${data.rest_totalprice }"/>
					<div class="paymentMini">
						<label>카드 결제</label>　
						<input type="radio" name="rest_payoption" value="카드결제" onclick="paymentCard()">
					</div>
					<label>　　</label>
					<div class="paymentMini">
						<label>계좌이체</label>　
						<input type="radio" name="rest_payoption" value="계좌이체" onclick="paymentAccount()">
					</div>
					<input type="hidden" id="styling_num" name="styling_num" value="${data.styling_num}"/>
				</form>
				</div>
			</div>
			
			<div style="width: 100%; margin: 0 auto;">
				<hr style="border: 1 solid black; margin-top: 10px;" />
			</div>
			
			<!-- 최하단 구분 -->
			<div style="width: 100%; height: 550px; margin-top: 50px;">
			</div>
			
		</div>
	</div>
	</section><!-- End Reserve Section -->
	
	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
</body>

</html>