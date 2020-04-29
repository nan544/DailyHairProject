<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 비활성화</title>
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

	//계정 비활성화 버튼 클릭시 실행
	$("#deleteBtn").click(function() {
		let m_id = "${login.m_id}";
		
		if (confirm("비활성화 하시겠습니까?")) {
			$.ajax({
					
				url : "/mypage/memberDelete.do",
				type : "post",
				data : { m_id : m_id },
				success : function(data) {
						if(data == 1){
							alert("수정이 완료되었습니다.");
							location.href = "/client/main.do";
						}else{
							alert("예약이 있어서 비활성화 못해여");
						}
						
				}
			});
		}
		
		/*if(confirm("비활성화 하시겠습니까?")){
			$("#deactivation").attr("method", "post");
			$("#deactivation").attr("action", "/memberDelete.do");
			$("#deactivation").submit();
		}*/
		
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

	<div>

		<!-- 최상단 구분 -->
		<div style="width: 100%; height: 100px; margin-bottom: 50px;">
		</div>
		
		<div>
			<input type="button" id="memberUpdate" name="memberUpdate" value="회원정보 수정">
			<input type="button" id="reserveState" name="reserveState" value="예약현황">
			<input type="button" id="deactivation" name="deactivation" value="계정 비활성화">
		</div>
	
		<div style="width: 100%; margin: 0 auto;">
		<hr style="border: 1 solid black; margin-bottom: 10px;" />
		</div>

	<form id="deactivation" name="deactivation">
		<div class="main">
			<h1>계정 비활성화</h1>
	
			<p><span style="color: red;"> * </span>비활성화 관련 주의 사항<span style="color: red;"> * </span></p>
	
			<p> 1. 계정이 비활성화 될 경우 로그인이 불가능합니다. </p>
			<p> 2. 로그인을 통해 사용 가능한 모든 기능을 사용하실 수 없습니다. </p>
			<p> 3. 예약현황이 존재할 경우 비활성화를 하실 수 없습니다. </p>
			<p> 4. 비활성화를 해제하시려면 관리자에게 문의하셔야 합니다. </p><br><br>
	
			<p> 관리자 문의 전화 ☎ 02-001-0002 </p>
	
			<input type="hidden" name="m_num" id="m_num" value="${login.m_num}"/>
			<input type="hidden" name="m_id" id="m_id" value="${login.m_id}"/>
			<input type="hidden" name="m_state" id="m_state" value="${login.m_state}"/>
			
			<input type="button" name="deleteBtn" id="deleteBtn" value="비활성화" class="btn"/>
		</div>
	</form>
	
		<!-- 하단 여백 -->
		<div style="width: 100%; height: 100px; margin-bottom: 50px;">
		</div>
			
	</div>

	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>

</body>
</html>