<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 게시판</title>
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
	<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<script type="text/javascript">
	$(function(){
		
		//문의하기 버튼클릭시 팝업창 띄우기
		$("#writeBtn").click(function(){
			
			window.open("/client/qna/qnaWriteForm.do", "qnapop",
					"width=1020, height=750, left=75, top=75");			
		});
		
		//상세보기
		$(".qnaDetail").click(function(){
			let qna_num = $(this).attr("data-num");
			location.href="/client/qna/qnaDetail.do?qna_num="+qna_num;
		});
	});
</script>

<style type="text/css">
	.btnContainer { width: 90%; margin: 0 auto; }
	p > span { color: red; font: bold; }
	.qnaBtn { float: right; margin: 0px 5px 0px 5px;
			width: 100px; height: 35px;
			text-align: center;
			cursor: pointer;
			display: inline-block;
			font-size: 10px;
			padding: 8px 16px 10px 16px;
			font-weight: 500;
			line-height: 1;
			color: #444444;
			transition: all ease-in-out 0.3s;
			background: #fffaf3;
			border: 2px dashed #ffb03b;
			border-radius: 25px; }
	.qnaBtn:hover { background: #FFE08C; }
	.qnaHeadBox { width: 95%; margin: 0 auto; }
	.qnaHeadBox > h4 { padding-left: 20px; padding-top: 50px; }
	
	.tableBox1 { width: 95%; margin: 0 auto; }
	.tableBox1 > table { width: 100%; text-align: center; }
	.tableBox2 > table { width: 100%; text-align: center; }
	.qnaThead { box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);
				transition: all ease-in-out 0.3s;
				background-color: #FFFAFA; }
	.thBottom { padding: 15px 0px 15px 0px; }
	.thBottom2 { padding: 15px 0px 15px 0px; color: #BDBDBD; }
	.blickSpace { padding: 15px; }
	.tableBox1 > table > tbody { padding: 15px; }
	.tdBottom { padding: 50px 0px 50px 0px; }
	.tableBox2 { margin-bottom: 150px; padding: 15px;
				box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);
				transition: all ease-in-out 0.3s;
				background-color: #FFFAFA; }
	.blickSpaceIn { padding: 2.5px; }
	.qnaDetail:hover { transition: all ease-in-out 0.3s; 
						background-color: #D4F4FA; }
</style>
</head>
<body>
	<!-- header 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/header.jsp"></jsp:include>
	
	<!-- ======= 1:1 QnA Section ======= -->
	<section id="about" class="about">
	<div class="container-fluid" >
		<div class="row">
			<!-- 최상단 구분 -->
			<div style="width: 100%; height: 100px; margin-bottom: 50px;">
			</div>
			
			<!-- 상단 -->
			<div style="margin: 0 auto; text-align: center; width: 100%;">
				<h1 style="margin-bottom: 20px;">1：1 문의하기</h1>
				<p style="margin-bottom: 60px;"><span>*</span> 답변이 달린 경우에는 수정 및 삭제가 불가능합니다. <span>*</span></p>
			</div>
			
			<!-- 문의하기 버튼 -->
			<div class="btnContainer">
				<input class="qnaBtn" type="button" name="writeBtn" id="writeBtn" value="문의하기"/>
			</div>
			
			<!-- 문의 내역 -->
			<div class="qnaHeadBox">
				<h4>나의 문의 내역</h4>
				<hr style="width: 100%">
				
				<div class="tableBox1">
				<table>
					<colgroup>
						<col width="9%">
						<col width="2">
						<col width="18%">
						<col width="2">
						<col width="56%">
						<col width="2">
						<col width="11%">
					</colgroup>
					<thead class="qnaThead">
						<tr>
							<th class="thBottom" style="padding-left: 20px;">작성자</th>
							<th class="thBottom2">│</th>
							<th class="thBottom">문의일시</th>
							<th class="thBottom2">│</th>
							<th class="thBottom">제목</th>
							<th class="thBottom2">│</th>
							<th class="thBottom" style="padding-right: 20px;">답변상태</th>
						</tr>
					</thead>
					<tbody>
						<tr><!-- 여백 -->
							<td colspan="7" class="blickSpace"></td>
						</tr>
					</tbody>
				</table>
				
					<div class="tableBox2">
					<table cellpadding="10px">
						<colgroup>
							<col width="9%">
							<col width="2">
							<col width="20%">
							<col width="2">
							<col width="60%">
							<col width="2">
							<col width="11%">
						</colgroup>
						<tbody>
							<c:choose>
								<c:when test="${not empty qnaList }">
									<c:forEach var="qna" items="${qnaList}">
										<tr data-num = "${qna.qna_num}" class="qnaDetail">
											<td>${qna.m_id}</td>
											<td></td>
											<td>${qna.qna_regdate}</td>
											<td></td>
											<td>${qna.qna_title}</td>
											<td></td>
											<td><c:if test="${qna.qna_state == 0}">
													답변 미완료
												</c:if>
												<c:if test="${qna.qna_state == 1}">
													답변 완료
												</c:if></td>
										</tr>
									</c:forEach>
								</c:when>
								
								<c:otherwise>
									<tr class="qnaTbody">
										<td colspan="7" align="center"
											class="tdBottom">문의 내역이 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section><!-- End 1:1 QnA Section -->
	
	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
</body>
</html>