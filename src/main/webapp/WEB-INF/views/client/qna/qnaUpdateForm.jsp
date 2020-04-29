<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 수정하기</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	//이미지체크
	function chkImg(file) {
		var ext = file.val().split('.').pop().toLowerCase();
		if (jQuery.inArray(ext, [ 'gif', 'png', 'jpg' ]) == -1) {
			alert("파일 형식이 맞지않습니다 \n업로드 가능 파일[gif, png, jpg]");
			return false;
		} else
			return true;
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
.mainContainer {
	width: 80%;
	margin: auto;
	border: 1px solid;
	border-radius: 5px;
}
</style>
</head>
<body>
	<h1 align="center">1:1 문의수정</h1>
	<div class="mainContainer">
		<form name="downForm" id="downForm">
			<input type="hidden" name="qna_num" id="qna_num1">
		</form>
		<form name="updateForm" id="updateForm" enctype="multipart/form-data">
			<div class="donwContainer" style="margin: 5px 0 0 10px;">
				<label>첨부파일</label>
				<c:if test="${empty detail.qna_file }">
									--
					</c:if>
				<c:if test="${not empty detail.qna_file }">
					<a href=""
						onclick="fn_fileDown('${detail.qna_num}'); return false;">${detail.qna_file}</a>
				</c:if>
			</div>
			<input type="hidden" id="qna_num" name="qna_num"
				value="${detail.qna_num}" /> <input type="hidden" name="qna_file"
				id="qna_file" value="${detail.qna_file}" />
				<hr>
			<div class="titleContainer" style="margin: 5px 0 0 10px;">
				<input type="text" name="qna_title" id="qna_title"
					value="${detail.qna_title}" />
			</div>
			<hr>
			<div class="contentContainer" style="margin-left: 10px;">
				<textarea rows="15" cols="90" name="qna_content" id="qna_content" style="resize: none;" >${detail.qna_content}</textarea>
				<br> <input type="file" name="file" id="file" />
			</div>
		</form>
	</div>
	<div class="btnContainer" style="margin-top: 10px;">
			<input type="button" id="updateBtn" name="updateBtn" value="수정하기" />
			<input type="button" id="closeBtn" name="closeBtn" value="취소" />
		</div>
</body>
</html>