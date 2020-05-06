<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약현황</title>
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

.main{padding-left: 50px;}
.th{text-align:center;}

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
	
	$("#memberUpdate").click(function() {
		location.href = "/mypage/memberUpdate.do"
	});
	
	$("#deactivation").click(function() {
		location.href = "/mypage/deactivation.do"
	});
	
	$("#reserveState").click(function() {
		location.href = "/mypage/reserveState.do"
	});
	
	//상세보기(시술내용, 시술가격)
	$(".detailreservation").click(function(){
		let rest_num = $(this).parents("tr").attr("data-num");
		
		
		window.open("reservDetail.do?rest_num="+rest_num, "mypagePop",
		"width=900, height=400, left=600, top=100");
		
	});
	
	//예약취소
	$("#cancleBtn").click(function() {
		let m_id = "${login.m_id}";
		
		if (confirm("예앾을 취소하시겠습니까?")) {
			$.ajax({
					
				url : "/mypage/cancleReservation.do",
				type : "post",
				data : { m_id : m_id },
				success : function(data) {
						if(data == 1){
							alert("예약이 취소되었습니다.");
							location.href = "/mypage/reserveState.do";
						}
						
				}
			});
		}
		
	});
	
});

</script>
</head>
<body>

	<!-- header 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/header.jsp"></jsp:include>

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

<div class="main">
<br>

	<h1>예약현황</h1>
	
	<p><span style="color: red;"> * </span>예약 관련 주의 사항<span style="color: red;"> * </span></p>
	<br>
	<p> 1. 시술 전 날까지는 100% 환불 및 예약 취소가 가능합니다 </p>
	<p> 2. 시술 당일에는 예약 취소는 가능하나 예약금 환불이 불가능합니다 </p>
	<p> 3. 현황 내용을 클릭해서 시술 상세정보를 볼 수 있습니다.</p>
	<table border="1">
	<thead>
		<tr>
			<th class="th"> 매장위치 </th>
			<th class="th"> 예약한 날짜 </th>
			<th class="th"> 시술 일자 </th>
			<th class="th"> 디자이너 </th>
			<th class="th"> 총 결제금액 </th>
			<th class="th"> 요구사항 </th>
			<th class="th"> 상태 </th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${not empty myList}">
				<c:forEach var="list" items="${myList}">
					<tr data-num = "${list.rest_num}">
						<td class="detailreservation">왕십리점</td>
						<td class="detailreservation">${list.rest_regdate}</td>
						<td class="detailreservation">${list.rest_hairdate} / ${list.rest_time}</td>
						<td class="detailreservation">${list.des_name}</td>
						<td class="detailreservation">${list.rest_totalprice}</td>
						<td class="detailreservation">${list.rest_memo}</td>
						<td>
						<c:if test="${list.rest_state == 1 }">
							예약중 <input type="button" name="cancleBtn" id="cancleBtn" value="예약취소"/>
						</c:if>
							<c:if test="${list.rest_state == 2 }">
							시술완료
						</c:if>
							<c:if test="${list.rest_state == 0}">
							예약취소
						</c:if>
						</td>
					</tr>
				</c:forEach>				
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan = "6" align="center">예약 내역이없습니다</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
	</table>
</div>

	<!-- 하단 여백 -->
	<div style="width: 100%; height: 100px; margin-bottom: 50px;">
	</div>

	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>

</body>
</html>