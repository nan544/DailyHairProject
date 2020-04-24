<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시술 완료 목록</title>
</head>
<body>
	<h1>시술완료 목록</h1>
	<div class="resultContainer">
		<table class="table table-hover">
			<colgroup>
				<col width="20%">
				<col width="15%">
				<col width="15%">
				<col width="20%">
				<col width="15%">
				<col width="15%">
			</colgroup>
			<thead>
				<tr>
					<th>방문시간</th>
					<th>아이디</th>
					<th>회원이름</th>
					<th>연락처</th>
					<th>디자이너</th>
					<th>시술가격</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty resultList}">
						<c:forEach var="result" items="${resultList}">
							<tr>
								<td>${result.rest_hairdate} / ${result.rest_time}</td>
								<td>${result.m_id}</td>
								<td>${result.m_name}</td>
								<td>${result.m_phone}</td>
								<td>${result.des_name}</td>
								<td>${result.rest_totalprice}원</td>
							</tr>
						</c:forEach>
					</c:when>	
					<c:otherwise>
						<tr>
							<td colspan="7" align="center">완료된 시술이 없습니다</td>
						</tr>
					</c:otherwise>
				</c:choose>	
			</tbody>
		</table>
	</div>
</body>
</html>