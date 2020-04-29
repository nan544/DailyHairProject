<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디자이너 시술 목록</title>
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
	body { background-color: #fffaf3; }
	.stylingBox { box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);
				margin: 0 auto; background-color: #FFFFFF;
				padding: 20px; }
	.styleCell:hover { background-color: #D4F4FA; transition: 0.4s; }
	.closeBox { padding-top: 75px; }
	.closeBtn { margin: 0 auto; border: 0; padding: 15px 35px 5px 35px;
				background-color: #fffaf3; }
	</style>
	<script type="text/javascript">
	// 닫기 버튼
	$(function(){
        $("#close").click(function(){
               window.close();
        });
	});
	</script>
</head>

<body>
<div style="margin: 25px;">
	<div style="text-align: center; margin-top: 50px;">
		<h1>Designer Styling List</h1>
	</div><br>
	
	<!-- 디자이너 시술 가능 목록 -->
	<!-- ======= ShopIntro Section ======= -->
	<div class="container-fluid" >
		<div class="row">
			<div class="stylingBox" >
			<c:choose>
				<c:when test="${not empty styleList }">
					<c:forEach var="style" items="${styleList}">
						<table style="width: 300px;" cellpadding="10px">
							<colgroup>
								<col width="60%">
								<col width="40%">
							</colgroup>
							<tr class="styleCell"><td style="text-align: left;">${style.styling_name}</td>
								<td style="text-align: right;">${style.styling_price}원</td></tr>
						</table>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<div style="text-align: center; margin: 0 auto; width: 300px; padding: 30px;">
						<p>현재 디자이너에게</p>
						<p>등록된 시술이</p>
						<p>존재하지 않습니다.</p>
					</div>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>
	
	<div class="closeBox" align="center">
		<input type="button" id="close" class="closeBtn" onClick="close()" value="닫기">
	</div>
</div>
</body>

</html>