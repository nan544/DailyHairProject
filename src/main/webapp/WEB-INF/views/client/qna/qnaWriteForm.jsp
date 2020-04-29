<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">

function chkImg(file){
    var ext = file.val().split('.').pop().toLowerCase();
    if(jQuery.inArray(ext,['gif','png','jpg'])== -1){
       alert("파일 형식이 맞지않습니다 \n업로드 가능 파일[gif, png, jpg]");
       return false;
    }else return true;
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
.writeContainer{
width : 80%;
margin: 0 auto;	
}
</style>
</head>
<body>

	<h1 align="center">1:1 문의하기</h1>

	<div class= "writeContainer">
		<form name="inForm" id="inForm" enctype="multipart/form-data">
			<input type="hidden" id="m_id" name="m_id" value="${login.m_id}" />
			<label>제목</label>
			<input type="text" name="qna_title" id="qna_title" value=""/><br>
			<input type="file" name="file" id="file" style="margin-top: 10px;"/>
			<p>내용</p>
			<textarea rows="15" cols="90" name="qna_content" id="qna_content" style="resize: none;"></textarea>
		</form>
	</div>
	<div class="btnContainer" style="margin-top: 10px;">
		<input type="button" id="closeBtn" name="closeBtn" value="닫기" /> <input
			type="button" id="insertBtn" name="insertBtn" value="문의하기" />
	</div>
</body>
</html>