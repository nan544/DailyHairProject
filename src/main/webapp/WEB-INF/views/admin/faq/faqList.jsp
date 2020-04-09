<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://code.jquery.com/jquery.min.js"></script>
	<script type="text/javascript">
	$("#insertFormBtn").click(function() {
		location.href = "admin/faq/writeForm";
	});
	$(".goDetail").click(function() {
		var faq_num = $(this).parents("tr").attr("data-num");
		$("faq_num").val(faq_num);
		console.log("글번호 : " + faq_num);
		//상세 페이지로 이동하기 위해 form추가 (id:detailForm)
		$("#detailForm").attr({
			"method" : "get",
			"action" : "admin/faqUpdate.do"
		});
		$("#detailForm").submit();
	});
	</script>
<title>글보기</title>
</head>
<body>
<%--====================상세 페이지 이동을 위한 Form =============== --%>
		<form name="detailForm" id="detailForm">
			<input type="hidden" name="faq_num" id="faq_num"></form>
<%--====================상세 페이지 이동을 위한 Form =============== --%>		
		
	<div id="faqList">
		<table summary="게시판 리스트">
			<colgroup>
				<col />
				<col />
			</colgroup>
			<thead>
				<tr>
					<th>글제목</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody id="list">
				<!-- 데이터 출력 시작-->
				<c:choose>
					<c:when test="${not empty faqList }">
						<c:forEach var="faq" items="${faqList}" varStatus="status">
							<tr class="tac" data-num="${faq.faq_num}">
								<td class="goDetail tal">${faq.faq_answer}</td>
								<td>${faq.faq_question}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="2" class="tac">등록된 게시물이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				<!-- 데이터 출력 끝-->
				<!-- 글 등록 버튼 시작-->
				<!-- 글 등록 버튼 끝 -->
			</tbody>
		</table>
	</div>
</body>
</html>