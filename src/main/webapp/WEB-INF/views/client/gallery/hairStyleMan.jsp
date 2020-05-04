<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>HairStyle</title>
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
		.hairBtn { margin: 0 auto; border: 0; padding: 15px 35px 15px 35px;
					background-color: #fffaf3; width: 150px; }
		
		
		
		.noBox { width: 750px; height: 500px; background-color: white;
				box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);
				margin-top: 50px; }
		.noHS { padding-top: 200px; }
		
		.designer { width: 280px; height: 400px; }
		.designerbox { float: left; padding: 10px; 
						margin: 10px 20px 10px 20px;
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
	function womanClick() {
		location.href="/client/hairStyleList.do";
	}
	
	function manClick() {
		location.href="/client/manStyleList.do";
	}
	
	function colorClick() {
		location.href="/client/colorSyleList.do";
	}
	
	</script>
	<script type="text/javascript">
	// 스타일 이미지 클릭 시 상세 정보
	function clickHairStyle(num) {
		
		$("#hs_num").val(num);
		var hs_num = num;
		
		var url = "/client/hairStyleDetail.do?hs_num="+hs_num;
		var name = "헤어 스타일 상세 정보";
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
				<h1 style="margin-bottom: 35px;">HairStyle Gallery</h1>
				<button class="hairBtn" onclick="womanClick()">Woman</button>
				<button class="hairBtn" onclick="manClick()">Man</button>
				<button class="hairBtn" onclick="colorClick()">Color</button>
			</div>
			
			<!-- 상품 문구 -->
			<!-- 데이터 출력 시작-->
			<form id="desForm" name="desForm">
				<input type="hidden" id="hg_num" name="hg_num" />
			</form>
				 <c:choose>
					<c:when test="${not empty manStyleList }">
						<c:forEach var="hsList" items="${manStyleList }">
							<div class="designerbox" onclick="clickHairStyle(${hsList.hs_num})">
								<c:if test="${not empty hsList.hs_thumb }">
									<!-- 로컬 저장소 사용 시 주석 해제하면 썸네일 이미지 불러옴 -->
									<%-- <input type="hidden" class="designer" name="hg_thumb" id="hg_thumb" value="${hsList.hs_thumb}" /> --%>
									<img src="/uploadStorage/HairStyle/<c:out value='${hsList.hs_thumb}'/>" style="width: 250px; height: 350px;">
								<!-- 	<img class="designer" src="/resources/assets/img/goodsNoImg.png"> -->
								</c:if>
								<p>${hsList.hs_title}</p>
							</div>
						</c:forEach>
					</c:when>
					
					<c:otherwise>
						<div>
							<p class="noHS">등록된 게시물이 존재하지 않습니다.</p>
						</div>
					</c:otherwise>
				</c:choose> 
					
				</div>
			</div>
			<!-- 데이터 출력 끝-->
	</section><!-- End HairGoods Section -->
	
	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
</body>

</html>