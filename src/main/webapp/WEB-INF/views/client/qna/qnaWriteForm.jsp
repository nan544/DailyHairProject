<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">

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

		//닫기버튼 클릭시 팝업창 닫기
		$("#closeBtn").click(function() {
			window.close();
		});

		//문의하기 버튼클릭시 글 등록하기
		$("#insertBtn").click(function() {

			let m_id = "<c:out value='${login.m_id}'/>";
			let qna_title = $("#qna_title").val();
			let qna_content = $("#qna_content").val();
			let file = $("#file").val();

			if ($("#qna_title").val() == '') {
				alert("제목을 입력해주세요");
				$("#qna_title").focus();
				return false;
			} else if ($("#qna_content").val() == '') {
				alert("내용을 입력해주세요");
				$("#qna_content").focus();
				return false;
			} else if (!chkImg($("#file"))){
				return false;
			}else {

				var formData = new FormData($("#inForm")[0]);

				$.ajax({
					url : "/client/qna/qnaInsert.do",
					type : "post",
					processData : false,
					contentType : false,
					data : formData,
					error : function(xhr, status, error) {
						alert(error);
					},
					success : function(data) {
						if (data == 1) {
							alert("1:1 문의가 등록되었습니다.");
							opener.parent.location.reload();
							window.close();
						} else {
							alert("1:1 문의등록 실패.");
							loaction.reload(true);
						}
					}

				}); //ajax 종료 */

			}
		});
	});
</script>
<style type="text/css">
	body { background-color: #fffaf3; }
	.title { margin: 50px 0px 50px 0px; }
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
	
	.writeContainer { width: 95%; margin: 0 auto; }
	.writeContainer > form > div > div > h4 { padding-left: 12.5px; }
	.insertTitle { display: inline; margin-left: 10px;
				width: 400px; height: 35px;
				border: 1px solid #D5D5D5;
				background-color: white;
				padding-left: 10px;
				margin-top: -5px; }
	.tableBox2 { margin-bottom: 50px; padding: 15px 15px 5px 15px;
				box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);
				transition: all ease-in-out 0.3s;
				background-color: #FFFAFA; height: 375px; }
	.tableBox2 > div > label { margin-bottom: 25px; }
	.tableBox2 > div > label > span { color: red; }
	.minifile { font-size: 12px; display: inline; margin-left: 10px; }
	.insertContent { border: 1px solid #D5D5D5; 
					resize: none; }
</style>
</head>
<body>
	<!-- 상단 -->
	<div style="margin: 0 auto; text-align: center; width: 100%;">
		<h1 class="title">1：1 문의하기</h1>
	</div>
	
	<!-- 버튼 -->
	<div class="btnContainer">
		<input class="qnaBtn" type="button" id="closeBtn" name="closeBtn" value="닫기" />
		<input class="qnaBtn" type="button" id="insertBtn" name="insertBtn" value="문의하기" />
	</div>
	
	<!-- 문의하기 상세 폼 -->
	<div class= "writeContainer">
		<form name="inForm" id="inForm" enctype="multipart/form-data">
			<input type="hidden" id="m_id" name="m_id" value="${login.m_id}" />
			
			<!-- 제목 부분 -->
			<div style="padding-top: 100px;">
				<div style="float: left;">
					<h4>문의 제목 </h4>
				</div>
				<div style="float: left; margin-left: 15px;">
					<input class="insertTitle" type="text" name="qna_title" id="qna_title" value=""/>
				</div>
			</div>
			<hr style="width: 100%; margin-top: 45px;">
			
			<!-- 내용 부분 -->
			<div style="width: 95%; margin: 0 auto;">
			<div class="tableBox2">
				<div style="width: 80%; height: 350px; float: left;">
					<label><span>*</span> 첨부파일</label>
					<input class="minifile" type="file" name="file" id="file" />
					<textarea rows="12" cols="106" name="qna_content" id="qna_content"
						class="insertContent" placeholder=" 문의 할 내용을 입력해주세요."></textarea>
				</div>
			</div>
			</div>
		</form>
	</div>
</body>
</html>