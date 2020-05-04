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
		.noHG { margin: 50px 0px 50px 0px; width: 750px; height: 500px;
				box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1); 
				background-color: white; padding-top: 225px;}
		.designer { width: 250px; height: 350px; }
		.designerbox { float: left; padding: 10px; 
						margin: 15px 35px 15px 35px;
						transition: all ease-in-out 0.3s;
						transform: scale(1);
						-webkit-transform: scale(1);
						-moz-transform: scale(1);
						-ms-transform: scale(1);
						-o-transform: scale(1); }
		.designerbox:hover { box-shadow: 10px 15px 30px rgba(0, 0, 0, 0.18);
							 transform: scale(1.1);
							-webkit-transform: scale(1.1);
							-moz-transform: scale(1.1);
							-ms-transform: scale(1.1);
							-o-transform: scale(1.1); }
		.designerbox p { padding-top: 15px; }
	</style>
	<script type="text/javascript">
	// 상품 이미지 클릭 시 상세 정보
	function clickHairGoods(num) {
		
		$("#hg_num").val(num);
		var hg_num = num;
		
		var url = "/client/hairGoodsDetail.do?hg_num="+hg_num;
		var name = "상품 상세 정보";
		var option = "width=500px, height=900px, toolbars=no, scrollbars=yes, resizable=no";
		
		window.open(url, name, option);
	}
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
			
			<!-- 상단 문구 -->
			<div style="margin: 0 auto; text-align: center; width: 100%;">
				<h1 style="margin-bottom: 35px;">HairGoods Gallery</h1>
				<p style="margin-bottom: 50px;"><span>*</span> 실제 매장에서 고객님들의 시술에 사용되는 제품입니다. <span>*</span></p>
			</div>
			
			<!-- 상품 문구 -->
			<!-- 데이터 출력 시작-->
			<form id="desForm" name="desForm">
				<input type="hidden" id="hg_num" name="hg_num" />
			</form>
			<div style="margin: 0 auto; text-align: center; max-width: 1020px">
				<div>
				<c:choose>
					<c:when test="${not empty hairGoodsList }">
						<c:forEach var="hgList" items="${hairGoodsList }">
							<div class="designerbox" onclick="clickHairGoods(${hgList.hg_num})">
								<c:if test="${hgList.hg_thumb != null }">
									<!-- 로컬 저장소 사용 시 주석 해제하면 썸네일 이미지 불러옴 -->
									<%-- <input type="hidden" class="designer" name="hg_thumb" id="hg_thumb" value="${hgList.hg_thumb}" /> --%>
									<img class="designer" src="/uploadStorage/HairGoods/<c:out value='${hgList.hg_thumb}'/>">
								</c:if>
								<p>${hgList.hg_title}</p>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div>
							<p class="noHG">등록된 게시물이 존재하지 않습니다.</p>
						</div>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
			<!-- 데이터 출력 끝-->
		</div>
	</div>
	</section><!-- End HairGoods Section -->
	
	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
</body>

</html>