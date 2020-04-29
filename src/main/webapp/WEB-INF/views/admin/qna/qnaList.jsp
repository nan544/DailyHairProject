<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".qnaDetail").click(function(){
			let qna_num = $(this).attr("data-num");
			location.href="/client/qna/qnaDetail.do?qna_num="+qna_num;
		});
	});
	
	//상세보기
	
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">

		<div class="row">
			<!-- 최상단 구분 -->
			<!-- <div style="width: 100%; height: 100px; margin-bottom: 50px;">
			</div> -->

			<h1 align="center">1:1 문의 관리</h1>

			<!-- 구분선 -->
			<div style="margin: 20px; width: 100%;">
				<hr style="border: 1 solid black;" />
			</div>

			<div style="width: 100%;">
				<table style="width: 100%">
					<colgroup>
						<col width="5%">
						<col width="20%">
						<col width="40%">
						<col width="15%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr>
							<th>글번호</th>
							<th>아이디</th>
							<th>제목</th>
							<th>작성일</th>
							<th>답변상태</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty qnaList }">
								<c:forEach var="qna" items="${qnaList}">
									<tr data-num="${qna.qna_num}" class="qnaDetail">
										<td class="goDetail">${qna.qna_num}</td>
										<td>${qna.m_id}</td>
										<td class="goDetail">${qna.qna_title}</td>
										<td>${qna.qna_regdate}</td>
										<td><c:if test="${qna.qna_state == 0}">
											답변 대기
										</c:if> <c:if test="${qna.qna_state == 1}">
											답변 완료
										</c:if></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5" align="center">문의한 내역이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>

		</div>
	</div>
</body>
</html>