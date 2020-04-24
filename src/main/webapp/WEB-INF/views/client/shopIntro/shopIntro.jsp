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
	<link href="/resources/assets/img/DHS-icon.png" rel="icon">
	<link href="/resources/assets/img/DHS-icon.png" rel="apple-touch-icon">
	
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
		.designer { width: 300px; height: 200px; }
		.designerbox { float: left; margin: 10px 20px 10px 20px;
						transition: all ease-in-out 0.3s;
						transform: scale(1);
						-webkit-transform: scale(1);
						-moz-transform: scale(1);
						-ms-transform: scale(1);
						-o-transform: scale(1); }
		.designerbox:hover { box-shadow: 10px 15px 30px rgba(0, 0, 0, 0.18);
							 transform: scale(1.1);
							-webkit-transform: scale(1.1);
							-moz-transform: scale(1.1);
							-ms-transform: scale(1.1);
							-o-transform: scale(1.1); }
		.designerbox p { padding-top: 15px; }
		.howtocome > li { text-align: center; width: 350px;}
		.shopImg { width: 500px; height:350px;
					padding: 15px; margin: 15px;
					box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);
					background-color: #FFFAFA;
					transition: all ease-in-out 0.3s;
					transform: scale(1);
					-webkit-transform: scale(1);
					-moz-transform: scale(1);
					-ms-transform: scale(1);
					-o-transform: scale(1); }
		.shopImg:hover { box-shadow: 10px 15px 30px rgba(0, 0, 0, 0.18); 
						 transform: scale(1.1);
						-webkit-transform: scale(1.1);
						-moz-transform: scale(1.1);
						-ms-transform: scale(1.1);
						-o-transform: scale(1.1); }
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
			<div class="shopImgBox" style="margin: 0 auto;">
				<img class="shopImg" src="/resources/assets/img/slide/ShopImage_002.jpg">
				<img class="shopImg" src="/resources/assets/img/slide/ShopImage_005.jpg">
			</div>
			
			<!-- 구분선 -->
			<div style="margin: 20px; width: 100%;">
				<hr style="border: 1 solid black;" />				
			</div>
			
			<!-- 디자이너 목록 -->
			<div style="margin: 0 auto; text-align: center; max-width: 1500px">
				<div>
					<div class="designerbox">
						<img class="designer" src="/resources/assets/img/shopIntro/Designer_KGY.png">
						<p>김국영 원장</p>
					</div>
					<div class="designerbox">
						<img class="designer" src="/resources/assets/img/shopIntro/Designer_JJY.png">
						<p>전준영 실장</p>
					</div>
					<div class="designerbox">
						<img class="designer" src="/resources/assets/img/shopIntro/Designer_SJY.png">
						<p>신진영 디자이너</p>
					</div>
				</div>
				<div>
					<div class="designerbox">
						<img class="designer" src="/resources/assets/img/shopIntro/Designer_SMH.png">
						<p>심명현 디자이너</p>
					</div>
					<div class="designerbox">
						<img class="designer" src="/resources/assets/img/shopIntro/Designer_PJS.png">
						<p>박정서 디자이너</p>
					</div>
				</div>
			</div>
			
			<!-- 구분선 -->
			<div style="margin: 20px; width: 100%;">
				<hr style="border: 1 solid black;" />				
			</div>
			
			<!-- 찾아 오시는 길 -->
			<div style="margin: 0 auto; margin-top: 20px;">
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