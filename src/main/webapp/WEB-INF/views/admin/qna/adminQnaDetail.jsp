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
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
	
		//답변입력
		$("#insertReply").click(function() {
			if (!chkData("#rep_name", "작성자를"))
				return;
			if (!chkData("#rep_content", "답변내용을"))
				return;
			if(confirm("답변을 등록하시겠습니까?")){
			$("#replyForm").attr("method","POST");
			$("#replyForm").attr("action","/admin/qna/qnaReplyInsert.do");
			alert("시발럼아");
			$("#replyForm").submit();
			};
		})
	/* 	//이미지 다운로드
		function fn_fileDown(qna_num1) {
			var formObj = $("#downForm");
			$("#qna_num1").attr("value", qna_num1);
			formObj.attr("action", "/client/qna/download.do");
			formObj.submit();
		} */
	});
</script>
<style type="text/css">
.he {
	background-color: #c7daf1;
}

.mainContainer>table, #reply {
	width: 800px;
}

textarea {
	width: 500px;
	resize: none;
}

#reply>span {
	display: inline;
}

#content {
	width: 800px;
	height: 300px;
	border: 1px dashed;
}

.replyRow {
	margin: 2px;
}

div>.he {
	position: top;
}
</style>
</head>
<body>
	<form name="downForm" id="downForm">
	</form>
	<h1>1:1 문의 상세보기 </h1>
	<div class="mainContainer">
		<table>
			<tr>
				<td class="he">글번호</td>
				<td>${detail.qna_num}</td>
				<td class="he">제목</td>
				<td>${detail.qna_title}</td>
				<td class="he">작성자</td>
				<td>${detail.m_id}</td>
				<td class="he">작성일</td>
				<td>${detail.qna_regdate}</td>

			</tr>
			<tr>
				<td class="he">첨부파일</td>
				<c:choose>
					<c:when test="${not empty detail.qna_file}">
						<td colspan="7">${detail.qna_file}</td>
					</c:when>
					<c:otherwise>
						<td colspan="7">-</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</table>
		<div id="content">${detail.qna_content}</div>
	</div>
	<c:choose>
		<c:when test="${detail.qna_state==0}">
			<div id="reply">
				<form id="replyForm">
					<input type="text" id="qna_num" name="qna_num"
						value="${detail.qna_num}">
					<div class="replyRow">
						<span class="he">작성자:</span><input type="text" id="rep_name"
							name="rep_name" placeholder="작성자">
					</div>
					<div class="replyRow">
						<span class="he">내 용:</span>
						<textarea id="rep_content" name="rep_content" rows="3" cols="10" placeholder="내용을 입력해주세요"></textarea>
					</div>
				<div class="replyRow">
	<!-- 					<span class="he">첨부이미지:</span><input type="file" id="uploadFile"
							name="uploadFile"> -->
					</div> 

				</form>
			</div>

			<div class="btnContainer">
				<input type="button" name="insertReply" id="insertReply" value="답변입력" />
				<input type="button" name="deleteBtn" id="deleteBtn" value="문의글삭제" />
				<input type="button" name="listBtn" id="listBtn" value="목록으로" />
			</div>
		</c:when>
		<c:otherwise>
			<div id="reply">
				<form id="replyForm">윽엑윽</form>
			</div>

			<div class="btnContainer">
				<input type="button" name="updateBtn" id="updateBtn" value="수정" />
				<input type="button" name="deleteBtn" id="deleteBtn" value="삭제" />
				<input type="button" name="listBtn" id="listBtn" value="목록으로" />
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>