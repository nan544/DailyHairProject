<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<head>
<meta charset="UTF-8">
<title>header</title>
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
	<script type="text/javascript" src="/resources/assets/js/main.js"></script>
</head>

<body>
	<!-- ======= Top Bar ======= -->
	<!-- <section id="topbar" class="d-none d-lg-flex align-items-center fixed-top">
	<div class="container text-right">
		<i class="icofont-phone"></i> 문의 전화 02 001 0001 ~ 2
		<i class="icofont-clock-time icofont-rotate-180"></i> 영업시간 10:00 AM - 19:00 PM
	</div>
	</section> -->
	
	
	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top d-flex align-items-center">
		<!-- ======= MenuBar ======= -->
		<div class="container d-flex align-items-center">
			<div class="logo mr-auto" style="padding-right: 40px">
				<h1 class="text-light"><a href="/client/main.do"><span>DailyHairShop</span></a></h1>
				<!-- Uncomment below if you prefer to use an image logo -->
				<!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
			</div>
			
			<nav class="nav-menu d-none d-lg-block" name="pageChange">
				<ul>
					<li class="active"><a href="/client/main.do">Main</a></li>
					<li><a href="/client/shopIntro.do">Shop소개</a></li>
					<li><a href="/client/reservePage.do">예약하기</a></li>
					<li class="drop-down"><a href="#">고객센터</a>
						<ul>
							<li><a href="#">문의하기</a></li>
							<li><a href="#">자주하는 질문</a></li>
						</ul>
					</li>
					<li class="drop-down"><a href="/client/hairStyle.do">Gallery</a>
						<ul>
							<li><a href="/client/hairStyle.do">HairStyle</a></li>
							<li><a href="/client/hairGoods.do">HairGoods</a></li>
						</ul>
					</li>
					<!-- 마우스 올리면 노란색이 아닌, 처음부터 노란색이 되는 클래스 지정 -->
					<!-- <li class="active"><a href="#">로그인</a></li>
					<li class="active"><a href="#">회원가입</a></li> -->
					<!-- 둥근 노란색 테두리 메뉴 바 생성 클래스 지정 -->
					<li class="book-a-table text-center">
						<c:if test="${login == '사용자'}"><a href="/member/login/logout.do">로그아웃</a></c:if>
						<c:if test="${login == null}"><a href="/member/login/login.do">로그인</a></c:if>
					</li>
					<li class="book-a-table text-center">
						<c:if test="${login == '사용자'}"><a href="#">마이페이지</a></c:if>
						<c:if test="${login == null}"><a href="/member/clause.do">회원가입</a></c:if>
					</li>
				</ul>
			</nav>
		</div><!-- End MenuBar -->
	</header><!-- End Header -->
</body>

</html>