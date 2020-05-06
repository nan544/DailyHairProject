<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
<style type="text/css">

.main{padding-left: 50px;}

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
	
	$("#mypageBtn").click(function() {
		$("#mypageForm").attr("method","post");
		$("#mypageForm").attr("action","/mypage/mypage.do");
		$("#mypageForm").submit();
	});
	
	var msg = "<c:out value='${msg}'/>";
	
	if (msg != ""){
		alert(msg);
	}
	
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

function enterkey() {
    if (window.event.keyCode == 13) {

         // 엔터키가 눌렸을 때 실행할 내용
    	$("#mypageForm").attr("method", "post");
		$("#mypageForm").attr("action", "/mypage/mypage.do");
		$("#mypageForm").submit();
		
    }
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
	<div class="container-fluid">
		<div class="row">
			<!-- 최상단 구분 -->
			<div style="width: 100%; height: 100px; margin-bottom: 50px;">
			</div>
			
			<c:if test="${mypage == '사용자' }">
			<div>
				<input type="button" id="memberUpdate" name="memberUpdate" value="회원정보 수정">
				<input type="button" id="reserveState" name="reserveState" value="예약현황">
				<input type="button" id="deactivation" name="deactivation" value="계정 비활성화">
			</div>
			
			<div style="width: 100%; margin: 0 auto;">
				<hr style="border: 1 solid black; margin-bottom: 10px;" />
			</div>
			
			
			<div class="main">
				<input type="hidden" name="m_num" id="m_num" value="${login.m_num}"/>
				<div>
					<label for="m_id">아이디<span style="color: red;"> * </span></label><br>
					<input type="text" id="m_id" name="m_id" value="${login.m_id}" disabled="disabled"/><br>
				</div>
				<div>
					<label for="m_pwd">패스워드<span style="color: red;"> * </span></label><br>
					<input type="password" id="m_pwd" name="m_pwd" value="**********" disabled="disabled"/>
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
					<input type="text" id="m_phone" name="m_phone" value="${login.m_phone}" readonly="readonly"/><br>
				</div>
				<div>
					<label for="m_email">이메일<span style="color: red;"> * </span></label><br>
					<input type="email" id="m_email" name="m_email" value="${login.m_email}" disabled="disabled"/><br>
				</div>
				<div>
					<label for="m_memo">추가사항<span style="color: red;"> * </span></label><br>
					<input type="text" id="m_memo" name="m_memo" value="${login.m_memo}" style="width: 400px;height: 150px;" readonly="readonly" /><br>
				</div>
			</div>
			</c:if>
			
			<!-- 구분선 -->
			<div style="margin: 20px; width: 100%;">
				<hr style="border: 1 solid black;" />				
			</div>
			
			<c:if test="${mypage == null}">
			<div class="main">
				<h1>본인확인</h1>
				
				<!-- 구분선 -->
				<div style="margin: 20px; width: 100%;">
					<br>				
				</div>
				
				<form role="form" id="mypageForm" name="mypageForm">
					<input type="hidden" id="m_id" name="m_id" value="${login.m_id}"/>
					<div>
						<label for="m_pwd">패스워드</label>
						<input type="password" id="m_pwd" name="m_pwd" placeholder="패스워드" onkeyup="enterkey();">
						<input type="button" id="mypageBtn" name="mypageBtn" value="확인">
					</div>
				</form>
			</div>
			</c:if>
			
			<!-- 하단 여백 -->
			<div style="width: 100%; height: 100px; margin-bottom: 50px;">
			</div>
		</div>
	</div>
	</section>
	<!-- End Reserve Section -->

	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
</body>
</html>