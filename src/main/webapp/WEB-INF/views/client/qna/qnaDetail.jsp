<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 상세보기</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
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
.mainContainer{
width: 80%;
margin:  auto;
border: 1px solid;
border-radius: 5px;
}
.replyContainer{
width: 80%;
margin: 10px auto;
border: 1px solid;
border-radius: 5px; 
}
</style>
</head>
<body>
	<h1>1:1 문의 상세보기</h1>
	<div class="mainContainer">
		<div class="titleContainer" style="margin: 5px 0 0 10px;" >${detail.qna_title}</div>
		<hr>
		<div class="contentContainer" style="margin-left: 10px;">${detail.qna_content}</div>
		<hr>
		<div class="imgContainer" style="margin-left: 10px;">
			<c:if test="${empty detail.qna_file }">
				<label>--</label>
			</c:if>
			<c:if test="${not empty detail.qna_file }">
				<img id="img">
			</c:if>
		</div>
	</div>
	<div class="replyContainer">댓글이 들어옵니다</div>

	<div class="btnContainer">
		<input type="button" name="updateBtn" id="updateBtn" value="수정" /> <input
			type="button" name="deleteBtn" id="deleteBtn" value="삭제" /> <input
			type="button" name="listBtn" id="listBtn" value="목록" />
	</div>
</body>
</html>