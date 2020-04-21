<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-
	scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>이용약관</title>
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
	
	<!-- 모바일 웹 페이지 설정 -->
	<link rel="shortcut icon" href="/resources/image/icon.png" />
	<link rel="apple-touch-icon" href="/resources/image/icon.png" />
	<!-- 모바일 웹 페이지 설정 끝 -->
	<!--[if lt IE 9]>
	<script src="/resources/include/js/html5shiv.js"></script>
	<![endif]-->
	<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
	<script type="text/javascript">
	// 약관 체크 확인 후 다음 단계 이동 이벤트
	$(function() {
		$("#nextBtn").click(function() {
			if(!$("input[name='clause1']").is(":checked")){
				alert("모든 약관에 동의해주시길 바랍니다.");
				return false;
			}if(!$("input[name='clause2']").is(":checked")){
				alert("모든 약관에 동의해주시길 바랍니다.");
				return false;
			}
			alert("모든 약관에 동의하셨습니다.\n다음 단계로 이동합니다.");
			location.replace("/member/join.do");
		});
	});
	
	// 회원가입 다음 단계 버튼 이벤트
	function clauseCancle(){
		alert("회원가입을 취소합니다.");
		location.replace("/client/main.do"); }
	</script>
	
	<style type="text/css">
		.clause_box { min-width: 500px; max-width: 1100px; margin: 0 auto;
					height: 325px;}
		.clause_L { float: left; padding: 10px; text-align: center;}
		.clause_R { float: right; padding: 10px; text-align: center;}
		.textbox { margin-top: 15px; background-color: white; }
		
		.clause_btnbox { margin: 0 auto; margin-top: 50px;
					width: 500px; height: 50px; }
		.other_btn { width: 100px; height: 35px;
					text-align: center;
					cursor: pointer;
					display: inline-block;
					font-size: 10px;
					padding: 8px 16px 10px 16px;
					font-weight: 500;
					line-height: 1;
					color: #444444;
					margin: 0 3px 10px 3px;
					transition: all ease-in-out 0.3s;
					background: white;
					border: 2px dashed #ffb03b;
					border-radius: 25px; }
	</style>
</head>

<body>
	<!-- header 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/header.jsp"></jsp:include>
	
	<!-- ======= Join Section ======= -->
	<section id="about" class="about">
	<div class="container-fluid" >
		<div class="row">
			<!-- 최상단 구분 -->
			<div style="width: 100%; height: 100px; margin-bottom: 50px;">
			</div><br>
			
			<div style="margin: 0 auto;">
				<div style="margin-bottom: 30px; text-align: center;">
					<h1 style="font-size: 50px;">DailyHairShop</h1>
					<h3>Sign up as member</h3>
				</div><br>
				
				<div class="clause_box">
					<div class="clause_L">
						<input type="checkbox" id="clause1" name="clause1"
							value="이용약관 동의">　이용약관 동의<br>
						<textarea rows="10" cols="55" disabled="disabled" class="textbox">
							<jsp:include page="/WEB-INF/views/member/join/clause_top.jsp"></jsp:include>
						</textarea>
					</div>
					<div class="clause_R">
						<input type="checkbox" id="clause2" name="clause2"
							value="개인정보 수집 및 이용동의">　개인정보 수집 및 이용동의<br>
						<textarea rows="10" cols="55" disabled="disabled" class="textbox">
							<jsp:include page="/WEB-INF/views/member/join/clause_bottom.jsp"></jsp:include>
						</textarea>
					</div>
				</div>
			</div><br>
			
			<div style="width: 100%">
				<div class="clause_btnbox">
					<center><input type="button" class="other_btn" id="nextBtn" name="nextBtn" value="다음 단계"/>
					<input type="button" class="other_btn" value="취소" onclick="clauseCancle()"/></center>
				</div>
			</div>
				
			<!-- 하단 여백 -->
			<div style="width: 100%; height: 50px; margin-bottom: 50px;">
			</div>
		</div>
	</div>
	</section><!-- End Join Section -->
	
	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
</body>
</html>