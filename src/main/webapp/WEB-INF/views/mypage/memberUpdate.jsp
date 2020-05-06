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
		alert("회원정보가 수정 되었습니다.\n로그아웃 상태로 메인페이지로 이동합니다.");
		
	});
	
	$("#memberUpdate").click(function() {
		location.href = "/mypage/memberUpdate.do"		//회원정보 수정
	});
	
	$("#deactivation").click(function() {
		location.href = "/mypage/deactivation.do"		//계정 비활성화
	});
	
	$("#reserveState").click(function() {
		location.href = "/mypage/reserveState.do"		//예약현황
	});
	
	$("#pwdModify").click(function() {					//패스워드 수정
		
		location.href = "/member/login/memberPwdModify.do";
	});
	
});

</script>
<style type="text/css">
.other_btn { width: 125px; height: 35px;
			text-align: center;
			cursor: pointer;
			display: inline-block;
			font-size: 12px;
			padding: 8px 16px 10px 16px;
			font-weight: 500;
			line-height: 1;
			color: #444444;
			margin: 0 10px 10px 10px;
			transition: all ease-in-out 0.3s;
			background: #fffaf3;
			border: 2px dashed #ffb03b;
			border-radius: 25px; }
.other_btn:hover { background: #FFE08C; }
.msgbox { width: 100px; padding: 10px; }
.join_input { text-align: inherit; }
.join_input > input { padding-left: 5px; width: 225px;
					background-color: #EAEAEA;
					border: 1px solid #BDBDBD; }
.join_input > #m_phone { background-color: white; }
.join_input > #m_pwd { background-color: white; }
.main > form > div > textarea { background-color: white;
								border: 1px solid #BDBDBD;
								resize: none; }
						
.join_input > input[type=button] {
	margin-left: 15px;
	width: 125px; height: 30px;
	font-size: 13px;
	border: 1px solid silver;
	border-radius: 15px;
	background-color: rgba(255, 250, 243, 1);
	transition: all ease-in-out 0.3s; }
.join_input > input[type=button]:hover {
	border: 1px solid #FFE08C;
	border-radius: 15px;
	background-color: #FFE08C; }
</style>
</head>

<body>
	<!-- header 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/header.jsp"></jsp:include>

	<!-- ======= MyPage Section ======= -->
	<section id="about" class="about">
	<div class="container-fluid" >
		<div class="row">
			<!-- 최상단 구분 -->
			<div style="width: 100%; height: 75px; margin-bottom: 50px;">
			</div>
			
			<div style="margin: 0 auto; padding: 10px; min-width: 500px;">
				<div style="margin-bottom: 30px; text-align: center;">
					<h1 style="margin-bottom: 10px; font-size: 50px;">My Page</h1>
					<p style="margin-bottom: 10px;">회색칸은 수정이 불가능합니다.</p>
				</div><br>
				<div>
					<center>
					<input type="button" class="other_btn" id="memberUpdate" name="memberUpdate" value="회원정보 수정">
					<input type="button" class="other_btn" id="reserveState" name="reserveState" value="예약현황">
					<input type="button" class="other_btn" id="deactivation" name="deactivation" value="계정 비활성화">
					</center>
				</div>
			
				<!-- 구분선 -->
				<div style="width: 100%; margin: 0 auto; margin-bottom: 50px;">
					<br>
				</div>
				
				<!-- 개인정보 -->
				<div class="main">
				<form id="submitForm" name="submitForm">
					<input type="hidden" name="m_num" id="m_num" value="${login.m_num}"/>
					<div class="join_input">
						<label class="msgbox"><span style="color: red;">* </span>ID</label>
						<input type="text" id="m_id" name="m_id" value="${login.m_id}" disabled="disabled"/><br>
					</div>
					<div class="join_input">
						<label class="msgbox"><span style="color: red;">* </span>PW</label>
						<input type="password" id="m_pwd" name="m_pwd" value="**********" disabled="disabled"/>
						<input type="button" class="checkbtn" id="pwdModify" name="pwdModify" value="패스워드 변경"/><br>
					</div>
					<div class="join_input">
						<label class="msgbox"><span style="color: red;">* </span>이 름</label>
						<input type="text" id="m_name" name="m_name" value="${login.m_name}" disabled="disabled"/><br>
					</div>
					<div class="join_input">
						<label class="msgbox"><span style="color: red;">* </span>성 별</label>
						<input type="text" id="m_gender" name="m_gender" value="${login.m_gender}성" disabled="disabled"/><br>
					</div>
					<div class="join_input">
						<label for="m_phone" class="msgbox"><span style="color: red;">* </span>Phone</label>
						<input type="text" id="m_phone" name="m_phone" value="${login.m_phone}" maxlength="11"/><br>
					</div>
					<div class="join_input">
						<label class="msgbox"><span style="color: red;">* </span>Email</label>
						<input type="email" id="m_email" name="m_email" value="${login.m_email}" disabled="disabled"/><br>
					</div>
					<div>
						<label for="m_memo" class="msgbox">추가사항</label><br>
						<textarea rows="6" cols="55" id="m_memo" name="m_memo">${login.m_memo}</textarea>
					</div>
					<div style="margin-top: 50px;">
						<center>
							<input type="button" class="other_btn" id="memberSubmit" name="memberSubmit" value="저장하기"/>
						</center>
					</div>
					</form>
				</div>
			</div>
			
			<!-- 하단 여백 -->
			<div style="width: 100%; height: 50px; margin-bottom: 50px;">
			</div>
		</div>
	</div>
	</section><!-- End MyPage Section -->

	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>

</body>
</html>