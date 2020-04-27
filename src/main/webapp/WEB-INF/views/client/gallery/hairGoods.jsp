<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>HairGoods</title>
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
	p > span { color: red; font: bold; }
</style>

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
			
			<!-- 상단 문구 -->
			<div style="margin: 0 auto; text-align: center; width: 100%;">
				<h1 style="margin-bottom: 35px;">HairGoods Gallery</h1>
				<p style="margin-bottom: 50px;"><span>*</span> 실제 매장에서 고객님들의 시술에 사용되는 제품입니다. <span>*</span></p>
			</div>
			
			<!-- 상품 문구 -->
			<div style="margin: 0 auto; max-width: 1020px;">
				<div style="width: 100%;">
					
				</div>
			</div>
			
			
			
			<!-- Test -->
			<table class="table table-condensed table-hover">
				<colgroup>
					<col width="10%" />
					<col width="30%" />
					<col width="10%" />
					<col width="22.5%" />
					<col width="22.5%" />
				</colgroup>
				<tr class="active">
					<th>글번호</th>
					<th>스타일명</th>
					<th>등록일</th>
					<th>썸네일 이미지명</th>
					<th>상세이미지</th>
				</tr>
				<!-- 데이터 출력 시작-->
				<c:choose>
					<c:when test="${not empty hgList }">
						<c:forEach var="hgList" items="${hgList}" varStatus="status">
						<c:set var="hg_thumb_" value="${fn:substringAfter(hgList.hg_thumb,'_') }" />
						<c:set var="hg_thumb__" value="${fn:substringAfter(hg_thumb_,'_') }"/>
						<c:set var="hg_img1_" value="${fn:substringAfter(hgList.hg_img1,'_') }"/>
						<c:set var="hg_img1__" value="${fn:substringAfter(hg_img1_,'_') }"/>
							<tr data-num="${hgList.hg_num}" >
								<td class="goDetail">${hgList.hg_num }</td>
								<td class="goDetail">${hgList.hg_title}</td>
								<td>${hgList.hg_regdate}</td>
								<td>${hg_thumb__}</td>
								<td>${hg_img1__}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="8" class="tac">등록된 게시물이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				<!-- 데이터 출력 끝-->
			</table>
			
			
			
		</div>
	</div>
	</section><!-- End HairGoods Section -->
	
	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
</body>

</html>