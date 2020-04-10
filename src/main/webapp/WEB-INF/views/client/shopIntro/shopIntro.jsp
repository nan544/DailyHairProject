<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>shopIntro</title>
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
		.designer { width: 300px; height: 200px }
		.designerbox { width: 350px; }
		.howtocome > li { text-align: center; width: 350px;}
	</style>
</head>

<body>
	<!-- header 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/header.jsp"></jsp:include>
	
	<!-- ======= ShopIntro Section ======= -->
	<section id="about" class="about">
	<div class="container-fluid" >
		<div class="row">
			<!-- 최상단 구분 -->
			<div style="width: 100%; height: 100px; margin-bottom: 50px;">
			</div>
			
			<!-- 상단 매장 소개문 -->
			<div style="margin: 0 auto; text-align: center; width: 100%;">
				<h1 style="margin-bottom: 50px;"><strong>DailyHairShop</strong> 왕십리 본점</h1>
				<p style="margin: 0px;">서울특별시 성동구 무학로 2길 소혜빌딩 17층, 18층 (매장, 사무실)</p>
				<p style="margin-bottom: 50px;">문의전화  02 – 001 – 0001(0002) | 문의 메일 dailyhair2020@naver.com</p>
			</div>
			
			<!-- 상단 Shop 사진 2장 가운데 정렬 -->
			<div style="margin: 0 auto;">
				<img src="/resources/assets/img/slide/ShopImage_002.jpg" width="500px" height="350px" style="padding: 15px;">
				<img src="/resources/assets/img/slide/ShopImage_005.jpg" width="500px" height="350px" style="padding: 15px;">
			</div>
			
			<!-- 구분선 -->
			<div style="margin: 20px; width: 100%;">
				<hr style="border: 1 solid black;" />				
			</div>
			
			<!-- 디자이너 목록 -->
			<!-- 관리자 페이지에서 디자이너 등록, 수정, 삭제에 따른 변동 적용시킬 것 -->
			<!-- 임시로 table 설정해놨지만 이후 하나하나 div로 설정할 것 -->
			<table style="margin: 0 auto; display: block; text-align: center;">
				<tr>
					<td><div class="designerbox">
							<img class="designer" src="/resources/assets/img/shopIntro/Designer_KGY.png"">
							<p>입력 대기</p>
						</div></td>
					<td><div class="designerbox">
							<img class="designer" src="/resources/assets/img/shopIntro/Designer_KGY.png"">
							<p>입력 대기</p>
						</div></td>
					<td><div class="designerbox">
							<img class="designer" src="/resources/assets/img/shopIntro/Designer_KGY.png"">
							<p>입력 대기</p>
						</div></td>
				</tr>
				<tr>
					<td><div class="designerbox">
							<img class="designer" src="/resources/assets/img/shopIntro/Designer_KGY.png"">
							<p>입력 대기</p>
						</div></td>
					<td><div class="designerbox">
							<img class="designer" src="/resources/assets/img/shopIntro/Designer_KGY.png"">
							<p>입력 대기</p>
						</div></td>
					<td><div class="designerbox">
							<img class="designer" src="/resources/assets/img/shopIntro/Designer_KGY.png"">
							<p>입력 대기</p>
						</div></td>
				</tr>
			</table>
			
			<!-- 구분선 -->
			<div style="margin: 20px; width: 100%;">
				<hr style="border: 1 solid black;" />				
			</div>
			
			<!-- 찾아 오시는 길 -->
			<div style="margin: 0 auto;">
				<div style="width: 500px; height: 500px; float: left;">
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.78473688856!2d127.10054351551068!3d37.512994934949894!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca50a915f665b%3A0xabeb10cd5efdfce2!2z66Gv642w7JuU65Oc7YOA7JuM!5e0!3m2!1sko!2skr!4v1586479152966!5m2!1sko!2skr" width="500" height="500" frameborder="0" ></iframe>
				</div>
				<div class="content" style="width: 500px; float: right; padding-top: 50px;">
					<ul class="howtocome">
						<li><h3>찾아 오시는 길</h3></li>
						<li><h6>　</h6></li>
						<li><i class="bx bx-check-double"></i> 8105번 잠실역 1번 출구 하차 후 도보 15분</li>
						<li><i class="bx bx-check-double"></i> 8000번 잠실역 5번 출구 하차 후 도보 62분</li>
						<li><i class="bx bx-check-double"></i> 1309번 잠실역 6번 출구 하차 후 도보 48분</li>
						<li><i class="bx bx-check-double"></i> 1801번 잠실역 6번 출구 하차 후 도보 48분</li>
						<li><i class="bx bx-check-double"></i> 8142번 잠실역 6번 출구 하차 후 도보 48분</li>
						<li><i class="bx bx-check-double"></i> 8153번 잠실역 6번 출구 하차 후 도보 48분</li>
						<li><i class="bx bx-check-double"></i> 3007번 잠실역 7번 출구 하차 후 도보 90분</li>
						<li><i class="bx bx-check-double"></i> 3300번 잠실역 7번 출구 하차 후 도보 90분</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</section><!-- End ShopIntro Section -->
	
	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
</body>

</html>