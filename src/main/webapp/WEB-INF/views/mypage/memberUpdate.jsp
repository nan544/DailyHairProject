<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
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
	
	<script src="/resources/include/js/bootstrap-datepicker.js"></script>
	<script src="/resources/include/js/bootstrap-datepicker.ko.min.js"></script>
	
	<!-- Template Main JS File -->
	<script type="text/javascript" src="/resources/assets/js/main.js"></script>
<style type="text/css">

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
	
	$("#memberSubmit").click(function() {
		$("#submitForm").attr('method','post');
		$("#submitForm").attr("action","/mypage/mymemberUpdate.do");
		$("#submitForm").submit();
		alert("회원정보가 수정 되었습니다.");
	});
	
	$("#memberUpdate").click(function() {
		location.href = "/mypage/memberUpdate.do"
	});
	
	$("#deactivation").click(function() {
		location.href = "/mypage/deactivation.do"
	});
	
	$("#reserveState").click(function() {
		location.href = "/mypage/reserveState.do"
	});
	
});

</script>
</head>
<body>
	<!-- header 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/header.jsp"></jsp:include>

	<!-- ======= HairGoods Section ======= -->
	<section id="about" class="about">
	<div class="container-fluid" >
		<div class="row">
			<!-- 최상단 구분 -->
			<div style="width: 100%; height: 100px; margin-bottom: 50px;">
			</div>
			
			<!-- 메뉴로 대체할 것 -->
			<div>
				<input type="button" id="memberUpdate" name="memberUpdate" value="회원정보 수정">
				<input type="button" id="reserveState" name="reserveState" value="예약현황">
				<input type="button" id="deactivation" name="deactivation" value="계정 비활성화">
			</div>
			
			<div style="width: 100%; margin: 0 auto;">
				<hr style="border: 1 solid black; margin-bottom: 10px;" />
			</div>
			
			<!-- 개인정보 -->
			<div>
				<form id="submitForm" name="submitForm">
				 <input type="hidden" name="m_num" id="m_num" value="${login.m_num}"/>
					<div>
						<label for="m_id">아이디<span style="color: red;"> * </span></label><br>
						<input type="text" id="m_id" name="m_id" value="${login.m_id}" disabled="disabled"/><br>
					</div>
					<div>
						<label for="m_pwd">패스워드<span style="color: red;"> * </span></label><br>
						<input type="password" value="**********" disabled="disabled"/>
						<input type="button" id="pwdModify" name="pwdModify" value="패스워드 변경"/><br>
					</div>
					<div>
						<label for="m_name">이 름<span style="color: red;"> * </span></label><br>
						<input type="text" id="m_name" name="m_name" value="${login.m_name}" disabled="disabled"/><br>
					</div>
					<div>
						<label for="m_gender">성 별<span style="color: red;"> * </span></label><br>
						<input type="text" id="m_gender" name="m_gender" value="${login.m_gender}" disabled="disabled"/><br>
					</div>
					<div>
						<label for="m_phone">전화번호<span style="color: red;"> * </span></label><br>
						<input type="text" id="m_phone" name="m_phone" value="${login.m_phone}" maxlength="11"/><br>
					</div>
					<div>
						<label for="m_email">이메일<span style="color: red;"> * </span></label><br>
						<input type="email" id="m_email" name="m_email" value="${login.m_email}" disabled="disabled"/><br>
					</div>
					<div>
						<label for="m_memo">추가사항<span style="color: red;"> * </span></label><br>
						<input type="text" id="m_memo" name="m_memo" value="${login.m_memo}" style="width: 400px;height: 150px;" /><br><br>
					</div>
					<div>
						<input type="button" id="memberSubmit" name="memberSubmit" value="저장하기"/>
					</div>
				</form>
			</div>
			
			<!-- 구분선 -->
			<div style="margin: 20px; width: 100%;">
				<hr style="border: 1 solid black;" />				
			</div>
			
			<!-- 하단 여백 -->
			<div style="width: 100%; height: 100px; margin-bottom: 50px;">
			</div>
			
			<!-- 최하단 구분 -->
			<!-- <div style="width: 100%; height: 550px; margin-top: 50px;">
			</div> -->
			
		</div>
	</div>
	</section><!-- End HairGoods Section -->

	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>

</body>
</html>