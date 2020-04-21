<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>자주하는 질문</title>
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
		.faq_box { border: 2 dashed gray; 
					width: 80%; }
		.faq_question { margin-right: 30px; font-size: 50px; }
		.faq_answer { margin-right: 15px;
						margin-left: 45px; }
	</style>
</head>

<body>
	<!-- header 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/header.jsp"></jsp:include>
	
	<!-- ======= Faq Section ======= -->
	<section id="about" class="about">
	<div class="container-fluid" >
		<div class="row">
			<!-- 최상단 구분 -->
			<div style="width: 100%; height: 100px; margin-bottom: 50px;">
			</div>
			
			<!-- 상단  -->
			<div style="margin: 0 auto; text-align: center; width: 100%;">
				<h1 style="margin-bottom: 15px;"><strong>DailyHairShop</strong></h1>
				<p style="margin-bottom: 85px;">자주하는 질문</p>
			</div>
			
			<!-- 자주하는 질문 목록 -->
			<div style="margin: 0 auto; max-width: 1020px;">
				<div style="width: 100%;">
					<c:choose>
						<c:when test="${not empty faqList }">
							<c:forEach var="faq" items="${faqList }">
								
								<!-- 자주하는 질문 목록 -->
								<div class="faq_box">
									<!-- 질문 제목 -->
									<div>
										<h3><span class="faq_question">Q</span>${faq.faq_question}</h3>
									</div>
									<!-- 질문 답변 -->
									<div style="float: left;"><!-- Left -->
										<p><span class="faq_answer">A</span></p>
									</div>
									<div>
										<p>${faq.faq_answer}</p>
									</div>
								</div>
								
								<!-- 구분선 -->
								<div style="margin: 0 auto; width: 100%;">
									<hr style="margin: 30px 0 30px 0;" />				
								</div>
								
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="designerbox">
								<p>등록되어있는 자주하는 질문이 존재하지 않습니다.</p>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			
			<!-- 하단 여백 -->
			<div style="width: 100%; height: 100px; margin-bottom: 50px;">
			</div>
		</div>
	</div>
	</section><!-- End Faq Section -->
	
	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
</body>
</html>