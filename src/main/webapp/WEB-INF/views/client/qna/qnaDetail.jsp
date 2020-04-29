<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 상세보기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		//답변이 달린글은 수정/삭제버튼이 비활성화되어있어야한다.
		if("${detail.qna_state}" == 1){
			$("#updateBtn").attr("disabled",true);
			$("#deleteBtn").attr("disabled",true);
		}
		
		
		
		//목록으로 버튼 클릭시 실행
		$("#listBtn").click(function(){
			location.href="/client/qna/qnaList.do";
		});
		
		//수정버튼 클릭시 실행
		$("#updateBtn").click(function(){
			
			let qna_num = "${detail.qna_num}";
			
			alert("수정버튼 뿅");
			location.href="/client/qna/qnaUpdateForm.do?qna_num="+qna_num;
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
</head>
<body>
	<form name="downForm" id="downForm">
			<input type="hidden" name="qna_num" id="qna_num1">
		</form>
	<h1>1:1 문의 상세보기</h1>
	<div class="mainContainer">
			<label>*첨부파일</label>
					<c:if test="${empty detail.qna_file }">
									--
					</c:if> 
					<c:if test="${not empty detail.qna_file }">
							<a href="" onclick="fn_fileDown('${detail.qna_num}'); return false;">${detail.qna_file}</a>
					</c:if>
			<div class="titleContainer">
				${detail.qna_title}
			</div>
			<div class="contentContainer">
				${detail.qna_content}
			</div>
			<div class="replyContainer">
			 	댓글이 들어옵니다
			</div>
	</div>
	
	<div class="btnContainer">
		<input type="button" name="updateBtn" id="updateBtn" value="수정"/>
		<input type="button" name="deleteBtn" id="deleteBtn" value="삭제"/>
		<input type="button" name="listBtn" id="listBtn" value="목록으로"/>
	</div>
</body>
</html>