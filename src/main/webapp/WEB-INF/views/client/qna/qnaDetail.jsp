<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 상세보기</title>
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
	<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {

		//답변이 달린글은 수정/삭제버튼이 비활성화되어있어야한다.
		if ("${detail.qna_state}" == 1) {
			$("#updateBtn").attr("disabled", true);
			$("#deleteBtn").attr("disabled", true);
		}
		//목록으로 버튼 클릭시 실행
		$("#listBtn").click(function() {
			location.href = "/client/qna/qnaList.do";
		});

		//수정버튼 클릭시 실행
		$("#updateBtn").click(function() {

			let qna_num = "${detail.qna_num}";

			location.href = "/client/qna/qnaUpdateForm.do?qna_num=" + qna_num;
		});
		
		 //첨부파일 이미지 보여주기
		let image = "<c:out value='${detail.qna_file}'/>";
		if(image!=""){
			$("#img").attr({
				src: "/uploadStorage/qna/${detail.qna_file}",
				width:"200px",
				height:"250px"
			});
		} 
	});
</script>
<style type="text/css">
.btnContainer { width: 90%; margin: 0 auto; }
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


.tableBox2 { margin-bottom: 150px; padding: 15px 15px 5px 15px;
			box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);
			transition: all ease-in-out 0.3s;
			background-color: #FFFAFA; }
.tableBox2 > label { margin-top: 50px; }
.tableBox2 > label > span { color: red; }
.miniDetail { font-size: 12px; display: inline; }

</style>
</head>
<body>
	<!-- header 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/header.jsp"></jsp:include>
	
	<!-- header 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/header.jsp"></jsp:include>
	
	<!-- ======= 1:1 QnA Detail Section ======= -->
	<section id="about" class="about">
	<div class="container-fluid" >
		<div class="row">
			<!-- 최상단 구분 -->
			<div style="width: 100%; height: 100px; margin-bottom: 50px;">
			</div>
			
			<!-- 상단 -->
			<div style="margin: 0 auto; text-align: center; width: 100%;">
				<h1 style="margin-bottom: 50px;">1 : 1 문의 상세보기</h1>
			</div>
			
			<!-- 버튼 -->
			<div class="btnContainer">
				<input class="qnaBtn" type="button" name="listBtn" id="listBtn" value="목록으로"/>
				<input class="qnaBtn" type="button" name="deleteBtn" id="deleteBtn" value="삭제"/>
				<input class="qnaBtn" type="button" name="updateBtn" id="updateBtn" value="수정"/>
			</div>
			
			<!-- 문의 답변 -->
			<form name="downForm" id="downForm">
				<input type="hidden" name="qna_num" id="qna_num1">
			</form>
			
			
			<div class="qnaHeadBox">
				<h4>“ ${detail.qna_title} ”</h4>
				<hr style="width: 100%">
				
				<div class="tableBox2">
					<p>${detail.qna_content}</p>
				
					<label><span>*</span> 첨부파일 ： </label>
					<c:if test="${empty detail.qna_file }">
						<p class="miniDetail">( 첨부파일이 존재하지 않습니다. )</p>
					</c:if> 
					<c:if test="${not empty detail.qna_file }">
						<a href="" onclick="fn_fileDown('${detail.qna_num}'); return false;">${detail.qna_file}</a>
					</c:if>
				</div>
				
				
			</div>
			
			
			
		</div>
	</div>
	</section><!-- End 1:1 QnA Detail Section -->
	
	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
</body>
</html>