<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 정보</title>
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
				padding: 20px; width: 400px; }
	.stylingBox > div > p { text-align: center; }
	.notFound { text-align: center; margin: 0 auto; padding-top: 150px;
				width: 300px; height: 450px; }
	.closeBox { padding-top: 50px; }
	.closeBtn { margin: 0 auto; border: 0; padding: 15px 35px 5px 35px;
				background-color: #fffaf3; }
	</style>
	<script type="text/javascript">
	// 닫기 버튼
	$(function(){
		window.onload = currentSlide(1);
		
        $("#close").click(function(){
               window.close();
        });
	});
	</script>
	
<!--========== 이미지 슬라이드 필요 소스 ==========-->
<!-- jQuery 사용 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>
<style type="text/css">
* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 350px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: #BDBDBD;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
</style>
</head>

<body>
<div style="margin: 25px;">
	<div style="text-align: center; margin-top: 50px;">
		<h1>DailyHair / Style</h1>
	</div><br>
	
	<!-- 상품 상세 정보 -->
	<!-- ======= ShopIntro Section ======= -->
	<div class="container-fluid" >
		<div class="row">
			<div class="stylingBox" >
			<c:choose>
				<c:when test="${not empty hsDetail }">
					<div>
						<p>${hsDetail.hs_title }</p>
						
						<div class="slideshow-container">
							<!-- 썸네일 이미지 / 1번 함수  ------------>
							<div class="mySlides fade">
								<img class="designer" src="/uploadStorage/HairStyle/<c:out value='${hsDetail.hs_thumb}'/>" style="width: 350px; height: 450px;">
							</div>
							
							<!-- 이미지 1 / 2번 함수 ------------>
							<div class="mySlides fade">
								<c:if test="${not empty hsDetail.hs_img1 }">
									<img  style="width: 350px; height: 450px;" src="/uploadStorage/HairStyle/<c:out value='${hsDetail.hs_img1}'/>"> 
								</c:if>
								<c:if test="${empty hsDetail.hs_img1 }">
									<img src="/resources/assets/img/goodsDetailNoImg.png" style="width: 350px; height: 450px;">
								</c:if>
							</div>
							
						 <!-- 이미지 2 / 3번 함수 ------------>
							<div class="mySlides fade">
								<c:if test="${not empty hsDetail.hs_img2 }">
								<img  style="width: 350px; height: 450px;" src="/uploadStorage/HairStyle/<c:out value='${hsDetail.hs_img2}'/>"> 
								</c:if>
								<c:if test="${empty hsDetail.hs_img2 }">
									<img src="/resources/assets/img/goodsDetailNoImg.png" style="width: 350px; height: 450px;">
								</c:if>
							</div>
							 
							<!-- 이미지 3 / 4번 함수 ------------>
							<div class="mySlides fade">
								<c:if test="${not empty hsDetail.hs_img3 }">
										<img  style="width: 350px; height: 450px;" src="/uploadStorage/HairStyle/<c:out value='${hsDetail.hs_img3}'/>"> 
								</c:if>
								<c:if test="${empty hsDetail.hs_img3 }">
									<img src="/resources/assets/img/goodsDetailNoImg.png" style="width: 350px; height: 450px;">
								</c:if>
							</div>
							
							<!-- 이미지 4 / 5번 함수 ------------>
							<div class="mySlides fade">
								<c:if test="${not empty hsDetail.hs_img4 }">
										<img  style="width: 350px; height: 450px;" src="/uploadStorage/HairStyle/<c:out value='${hsDetail.hs_img4}'/>"> 
								</c:if>
								<c:if test="${empty hsDetail.hs_img4 }">
									<img src="/resources/assets/img/goodsDetailNoImg.png" style="width: 350px; height: 450px;">
								</c:if>
							</div> 
							
							<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
							<a class="next" onclick="plusSlides(1)">&#10095;</a>
						</div>
						<br>
						
						<div style="text-align:center">
							<span class="dot" onclick="currentSlide(1)"></span> 
							<span class="dot" onclick="currentSlide(2)"></span> 
							<span class="dot" onclick="currentSlide(3)"></span> 
							<span class="dot" onclick="currentSlide(4)"></span>
							<span class="dot" onclick="currentSlide(5)"></span>
						</div>
						
						<p style="margin-top: 30px;">${hsDetail.hs_content }</p>
					</div>
				</c:when>
				
				<c:otherwise>
					<div class="notFound">
						<p>현재 등록된 상품의</p>
						<p>상세 정보를</p>
						<p>불러올 수 없습니다.</p>
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