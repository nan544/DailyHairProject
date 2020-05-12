<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#contents {
	width: 700px;
}

.txtArea {
	width: 700px;
	height: 125px;
	resize: none;
	display: block;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.control {
	float: right;
}

.btnMenu{
margin-top: 5px;

}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {

		//목록으로 버튼 클릭시 전체 페이지로 이동
		$("#faqListBtn").click(function() {
			location.href = "/admin/adminFaqList.do";
		});
		//등록완료 버튼 클릭시
		$("#faqInsertBtn").click(function() {
			if (!chkData("#faq_question", "질문을"))
				return;
			if (!chkData("#faq_answer", "답변을"))
				return;
			if (confirm("등록 하시겠습니까?")) {
				$("#insertForm").attr("method", "post");
				$("#insertForm").attr("action", "/admin/adminFaqInsert.do");
				$("#insertForm").submit();
				alert("등록이 완료되었습니다");
			}
		});

	});
</script>
<title>자주 묻는 질문 작성</title>
</head>
<body>
	<div id="contents">
		<c:if test="${empty login }">
			<script type="text/javascript">
				alert("로그인이 필요합니다.");
				location.href = "/admin/adminLoginForm.do";
			</script>
		</c:if>
		<div>
			<div>
				<h2>자주하는 질문 관리-게시글 등록</h2>
			</div>
					<input type="button" value="목록으로" class="btn control"
						id="faqListBtn">
			<form id="insertForm" name="insertForm" >
				<table>
					<tr>
						<td><span style="color: red;">*</span><b>질문</b></td>
					</tr>
					<tr>

						<td><textarea id="faq_question" class="txtArea"
								name="faq_question" cols="35" rows="15"
								placeholder="질문을 입력해주세요."></textarea></td>
					</tr>
					<tr>
						<td><span style="color: red;">*</span><b>답변</b></td>
					</tr>
					<tr>

						<td><textarea id="faq_answer" name="faq_answer" class="txtArea"
								cols="35" rows="15" placeholder="답변을 입력해주세요."></textarea></td>
					<tr>
				</table>
			</form>
			<!-- 글 등록 버튼 시작-->
			<div class="btnMenu">
				<input type="button" value="등록완료" class="btn control"
					id="faqInsertBtn">
			</div>
			<!-- 글 등록 버튼 끝-->

		</div>
	</div>
</body>
</html>