<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 수정하기</title>
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

//이미지체크
function chkImg(file){
    if(file.val()!=""){
   var ext = file.val().split('.').pop().toLowerCase();
   if(jQuery.inArray(ext,['gif','png','jpg'])== -1){
      alert("파일 형식이 맞지않습니다 \n업로드 가능 파일[gif, png, jpg]");
      return false;
   }else return true;
}else{
    return true;
}
}

	$(function() {
		//취소버튼 클릭시 전페이지로 가기
		$("#closeBtn").click(function() {
			let qna_num = $("#qna_num").val();

			location.href = "/client/qna/qnaDetail.do?qna_num=" + qna_num;
		});

		//수정하기 버튼 클릭시 수정하기
		$("#updateBtn").click(function() {

			if ($("#qna_title").val() == '') {
				alert("제목을 입력해주세요");
				$("#qna_title").focus();
				return false;
			} else if ($("#qna_content").val() == '') {
				alert("내용을 입력해주세요");
				$("#qna_content").focus();
				return false;
			} else if (!chkImg($("#file"))) {
				return false;
			} else {
				let formData = new FormData($("#updateForm")[0]);

				$.ajax({
					url : "/client/qna/qnaUpdate.do",
					type : "post",
					processData : false,
					contentType : false,
					data : formData,
					success : function(data) {
						if (data == 1) {
							alert("수정에 성공하였습니다");
							location.href = "/client/qna/qnaList.do";
						} else {
							alert("수정 실패");
						}
					}
				}); //ajax 종료
			}

		});
	});

	//이미지 다운로드
	function fn_fileDown(qna_num1) {
		var formObj = $("#downForm");
		$("#qna_num1").attr("value", qna_num1);
		formObj.attr("action", "/client/qna/download.do");
		formObj.submit();
	}
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
.qnaHeadBox > form > div > div > h4 { padding-left: 20px; }
.updateTitle { display: inline; margin-left: 10px;
				width: 400px; height: 35px;
				border: 1px solid #D5D5D5;
				background-color: white;
				padding-left: 10px;
				margin-top: -5px; }
.updateContent { border: 1px solid #D5D5D5; 
				resize: none; }
.tableBox2 { margin-bottom: 150px; padding: 15px 15px 5px 15px;
			box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);
			transition: all ease-in-out 0.3s;
			background-color: #FFFAFA; height: 375px; }
.tableBox2 > div > label { margin-bottom: 25px; }
.tableBox2 > div > label > span { color: red; }
.miniDetail { font-size: 12px; display: inline; }
.minifile { font-size: 12px; display: inline; margin-left: 30px; }
</style>
</head>

<body>
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
				<h1 style="margin-bottom: 50px;">1：1 문의 수정하기</h1>
			</div>
			
			<!-- 버튼 -->
			<div class="btnContainer">
				<input class="qnaBtn" type="button" id="closeBtn" name="closeBtn" value="취소" />
				<input class="qnaBtn" type="button" id="updateBtn" name="updateBtn" value="수정하기" />
			</div>
			
			<!-- 문의 수정 -->
			<form name="downForm" id="downForm">
				<input type="hidden" name="qna_num" id="qna_num1">
			</form>
			
			<div class="qnaHeadBox">
			<form name="updateForm" id="updateForm" enctype="multipart/form-data">
				<div style="padding-top: 50px;">
					<div style="float: left;">
						<h4>문의 제목 </h4>
					</div>
					<div style="float: left; margin-left: 15px;">
						<input class="updateTitle" type="text" name="qna_title" id="qna_title" value="${detail.qna_title}" />
					</div>
				</div>
				<hr style="width: 100%; margin-top: 45px;">
				
				<input type="hidden" id="qna_num" name="qna_num" value="${detail.qna_num}" />
				<input type="hidden" name="qna_file" id="qna_file" value="${detail.qna_file}" />
				
				<div style="width: 95%; margin: 0 auto;">
					<div class="tableBox2">
						<c:if test="${empty detail.qna_file }">
							<div style="width: 80%; height: 350px; float: left;">
								<label><span>*</span> 첨부파일 ： </label>
								<p class="miniDetail">( 첨부파일이 존재하지 않습니다. )</p>
								<input class="minifile" type="file" name="file" id="file" />
								<textarea rows="12" cols="120" name="qna_content" id="qna_content"
									class="updateContent" >${detail.qna_content}</textarea>
							</div>
							<div style="width: 20%; height: 350px; float: right;">
								<img style="float: right;" src="/resources/assets/img/qnaNoImg.png">
							</div>
						</c:if> 
						<c:if test="${not empty detail.qna_file }">
							<div style="width: 80%; height: 350px; float: left;">
								<label><span>*</span> 첨부파일 ： </label>
								<a href="" onclick="fn_fileDown('${detail.qna_num}'); return false;">${detail.qna_file}</a>
								<input class="minifile" type="file" name="file" id="file" />
								<textarea rows="12" cols="120" name="qna_content" id="qna_content"
									class="updateContent" >${detail.qna_content}</textarea>
							</div>
							<div style="width: 20%; height: 350px; float: right;">
								<img style="float: right;" src="/resources/assets/img/qnaYesImg.png">
							</div>
						</c:if>
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
	</section><!-- End 1:1 QnA Detail Section -->
	
	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
</body>
</html>