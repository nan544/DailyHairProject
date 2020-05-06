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

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->
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
							alert("계정이 비활성화 되었습니다.");
							location.href = "/client/main.do";
						}else{
							alert("예약이 있는 회원은 비활성화가 안됩니다.");
						}
						
				}
			});
		}
		
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


.main { min-width: 1020px; max-width: 1600px; margin: 0 auto; }
.resBox { text-align: left; margin-bottom: 75px; }
.p_ori { margin-bottom: 20px; text-align: center; }
.p_last { margin-top: 20px; text-align: center; }
.qnaHeadBox { width: 95%; max-width: 1600px; margin: 0 auto; }
.resBox_L { display: inline-block; width: 15px; }
.resBox_L > p { display: inline; }
.resBox_R { display: inline-block; width: 500px; }
.resBox_R > p { display: inline; }


.deactiveBtn { width: 175px; height: 50px;
			text-align: center;
			cursor: pointer;
			display: inline-block;
			font-size: 13px;
			padding: 8px 16px 10px 16px;
			font-weight: 500;
			line-height: 1;
			color: #444444;
			margin: 50px 10px 10px 10px;
			transition: all ease-in-out 0.3s;
			background: #fffaf3;
			border: 2px dashed #F15F5F;
			border-radius: 20px; }
.deactiveBtn:hover { background: #FFD8D8; }
</style>
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

	<!-- ======= MyPage Section ======= -->
	<section id="about" class="about">
	<div class="container-fluid" >
		<div class="row">
			<!-- 최상단 구분 -->
			<div style="width: 100%; height: 75px; margin-bottom: 50px;">
			</div>
			
			<div style="margin: 0 auto; padding: 10px; min-width: 1020px; width: 95%">
				<!-- 상단 -->
				<div style="margin-bottom: 30px; text-align: center;">
					<h1 style="margin-bottom: 10px; font-size: 50px;">My Page</h1>
					<p style="margin-bottom: 10px;">계정을 비활성화 시킬 수 있습니다.</p>
				</div><br>
				
				<!-- 버튼 -->
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
				
				<!-- 예약 현황 -->
				<div class="qnaHeadBox">
				<form id="deactivation" name="deactivation">
					<div class="main">
						<div class="resBox">
							<p class="p_ori"><span style="color: red;"> * </span>비활성화 관련 주의 사항<span style="color: red;"> * </span></p>
							<div style="width: 520px; margin: 0 auto;">
								<div>
									<div class="resBox_L"><p>1.</p></div>
									<div class="resBox_R"><p>계정이 비활성화 될 경우 로그인이 불가능합니다.</p></div>
								</div>
								<div>
									<div class="resBox_L"><p>2.</p></div>
									<div class="resBox_R"><p>로그인을 통해 사용 가능한 모든 기능을 사용하실 수 없습니다.</p></div>
								</div>
								<div>
									<div class="resBox_L"><p>3.</p></div>
									<div class="resBox_R"><p>예약현황이 존재할 경우 비활성화를 하실 수 없습니다.</p></div>
								</div>
								<div>
									<div class="resBox_L"><p>4.</p></div>
									<div class="resBox_R"><p>비활성화를 해제하시려면 관리자에게 문의하셔야 합니다.</p></div>
								</div>
							</div>
							<p class="p_last"> 관리자 문의 전화 ☎ 02-001-0002 </p>
						</div>
						
						<!-- value 덩어리 -->
						<input type="hidden" name="m_num" id="m_num" value="${login.m_num}"/>
						<input type="hidden" name="m_id" id="m_id" value="${login.m_id}"/>
						<input type="hidden" name="m_state" id="m_state" value="${login.m_state}"/>
						
						<!-- 비활성화 버튼 -->
						<div align="center">
							<input type="button" class="deactiveBtn" name="deleteBtn" id="deleteBtn" value="계정 비활성화 시키기"/>
						</div>
					</div>
				</form>
				</div>
				
				<!-- 하단 여백 -->
				<div style="width: 100%; height: 100px; margin-bottom: 50px;">
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- End MyPage Section -->
	
	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
</body>
</html>