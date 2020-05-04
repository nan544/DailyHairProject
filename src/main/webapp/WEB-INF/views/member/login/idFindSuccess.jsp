<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 성공</title>
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

.main{padding-left: 50px;}
.button{margin-left: 50px;}

</style>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->
<!--[if lt IE 9]>
<script src="/resources/include/js/html5shiv.js"></script>
<![endif]-->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

$(function() {
	
	$("#loginBtn").click(function() {
		location.href = "/member/login/login.do";
	});
	
	$("#pwFind").click(function() {
		location.href = "/member/login/pwFind.do";
	});
	
});

</script>
</head>
<body>
	<!-- header 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/header.jsp"></jsp:include>
	
	 <!-- 최상단 구분 -->
     <div style="width: 100%; height: 150px; margin-bottom: 50px;">
     </div><br>
   
	<h4 class="main">${mem.m_name}님의 아이디는 ${mem.m_id} 입니다.</h4>
	
	<input type="button" class="button" id="loginBtn" name="loginBtn" value="로그인">
	<input type="button" id="pwFind" name="pwFind" value="패스워드 찾기">
	
	<!-- 하단 여백 -->
    <div style="width: 100%; height: 175px; margin-bottom: 50px;">
    </div>

	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
	
</body>
</html>