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

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#mypageBtn").click(function() {
		//필수 입력 요소들을 입력하지 않고 가입 버튼을 눌렀을 때 못넘어가게 함
		if ($("#m_pwd").val() == "") {
			alert("필수 입력 항목입니다.");		//패스워드
			$("#m_pwd").focus();
			return false;
		}
		
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
					background-color: white;
					border: 1px solid #BDBDBD; }
.main > div > textarea { background-color: white;
						border: 1px solid #BDBDBD;
						resize: none; }
.msgboxCheck { width: 100px; padding: 10px; }
.check_btn { width: 125px; height: 35px;
			background: #ffb03b; color: #fff;
			border: 0; border-radius: 25px;
			transition: 0.4s;
			text-align: center; font-size: 15px; }
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
	<div class="container-fluid">
		<div class="row">
			
	<!--=============== 본인 확인 완료  ===============-->
			<c:if test="${mypage == '사용자' }">
			<!-- 최상단 구분 -->
			<div style="width: 100%; height: 75px; margin-bottom: 50px;">
			</div>
			
			<div style="margin: 0 auto; padding: 10px; min-width: 500px;">
				<div style="margin-bottom: 30px; text-align: center;">
					<h1 style="margin-bottom: 10px; font-size: 50px;">My Page</h1>
					<p style="margin-bottom: 10px;">현재 화면에서는 열람만 가능합니다.</p>
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
				
				<div class="main">
					<input type="hidden" name="m_num" id="m_num" value="${login.m_num}"/>
					<div class="join_input">
						<label for="m_id" class="msgbox"><span style="color: red;">* </span>ID</label>
						<input type="text" id="m_id" name="m_id" value="${login.m_id}" disabled="disabled"/><br>
					</div>
					<div class="join_input">
						<label for="m_pwd" class="msgbox"><span style="color: red;">* </span>PW</label>
						<input type="password" id="m_pwd" name="m_pwd" value="**********" disabled="disabled"/>
					</div>
					<div class="join_input">
						<label for="m_name" class="msgbox"><span style="color: red;">* </span>이 름</label>
						<input type="text" id="m_name" name="m_name" value="${login.m_name}" disabled="disabled"/><br>
					</div>
					<div class="join_input">
						<label class="msgbox"><span style="color: red;">* </span>성 별</label>
						<input type="text" id="m_gender" name="m_gender" value="${login.m_gender}성" disabled="disabled"/><br>
					</div>
					<div class="join_input">
						<label for="m_phone" class="msgbox"><span style="color: red;">* </span>Phone</label>
						<input type="text" id="m_phone" name="m_phone" value="${login.m_phone}" disabled="disabled"/><br>
					</div>
					<div class="join_input">
						<label for="m_email" class="msgbox"><span style="color: red;">* </span>Email</label>
						<input type="email" id="m_email" name="m_email" value="${login.m_email}" disabled="disabled"/><br>
					</div>
					<div>
						<label for="m_memo" class="msgbox">추가사항</label><br>
						<textarea rows="6" cols="55" id="m_memo" name="m_memo" disabled="disabled">${login.m_memo}</textarea>
					</div>
				</div>
				
				<!-- 하단 여백 -->
				<div style="width: 100%; height: 175px; margin-bottom: 50px;">
				</div>
			</div>
			</c:if>
			
	<!--=============== 본인 확인 미완료  ===============-->
			<c:if test="${mypage == null}">
			<!-- 최상단 구분 -->
			<div style="width: 100%; height: 150px; margin-bottom: 50px;">
			</div>
			
			<div style="margin: 0 auto;" align="center">
				<div style="margin-bottom: 30px; text-align: center;">
					<h1 style="font-size: 50px;">DailyHairShop</h1>
					<h4>Password를 입력하여 본인확인을 해주세요.</h4>
				</div><br>
				
				<form role="form" id="mypageForm" name="mypageForm">
					<input type="hidden" id="m_id" name="m_id" value="${login.m_id}"/>
					<div>
						<input type="text" style="display: none;"/>
						<label class="msgboxCheck" for="m_pwd">Password</label>
						<input type="password" id="m_pwd" name="m_pwd" placeholder=" Password" style="margin-right: 15px;" onkeyup="enterkey()">
						<input type="button" class="check_btn" id="mypageBtn" name="mypageBtn" value="확인">
					</div>
				</form>
			</div>
			
			<!-- 하단 여백 -->
			<div style="width: 100%; height: 225px; margin-bottom: 50px;">
			</div>
			</c:if>
			
		</div>
	</div>
	</section>
	<!-- End MyPage Section -->

	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
</body>
</html>