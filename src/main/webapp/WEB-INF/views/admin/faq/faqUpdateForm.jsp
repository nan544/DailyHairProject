<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
textarea {
	width: 700px;
	height: 100px;
	resize: none;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	//목록으로 버튼 클릭시 전체 페이지로 이동

	$(function() {

		$("#faqListBtn").click(function() {
			location.href = "/admin/adminFaqList.do";
		});
		//수정완료 버튼 클릭시
		$("#faqUpdateBtn").click(function() {
			if (confirm("자주하는 질문을 수정 하시겠습니까?")) {
				$("#updateForm").attr("method", "post");
				$("#updateForm").attr("action", "/admin/adminFaqUpdate.do");
				$("#updateForm").submit();
				alert("수정이 완료되었습니다");
			}
		});

		//삭제 버튼 클릭시
		$("#faqDeleteBtn").click(function() {
			if (confirm("자주 하는 질문을 삭제 하시겠습니까?")) {
				$("#updateForm").attr("method", "post");
				$("#updateForm").attr("action", "adminDelete.do");
				$("#updateForm").submit();
				alert("삭제가 완료되었습니다.");
			}
		});
	});
</script>
<title>자주 묻는 질문 수정</title>
</head>
<body>
	<div>
		<div>
			<h2>자주하는 질문-게시글 수정</h2>
		</div>
		<!-- 목록으로 버튼 -->
		<div id="listMenu">
		<p>
			<input type="button" value="목록으로" class="but" id="faqListBtn">
		</p>
		</div>
		<!--게시글 내용 출력 시작-->
		<form id="updateForm">
			<input type="hidden" id="faq_num" name="faq_num"
				value="${updateData.faq_num }" />
			<table>
				<tr>
					<td>질문</td>
					<td><textarea id="faq_question" name="faq_question" cols="35"
							rows="15">${updateData.faq_question}</textarea></td>
				</tr>
				<tr>
					<td>답변</td>
					<td><textarea id="faq_answer" name="faq_answer" cols="35"
							rows="15">${updateData.faq_answer}</textarea></td>
				</tr>
			</table>
		</form>
		<!-- 게시글 내용 출력 끝 -->
		<!-- 글 등록 버튼 시작-->
		<div>
			<input type="button" value="수정완료" class="but" id="faqUpdateBtn">
			<input type="button" value="게시글 삭제" class="but" id="faqDeleteBtn">

		</div>
		<!-- 글 등록 버튼 끝-->
	</div>
</body>
</html>