<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약현황 상세</title>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->
<!--[if lt IE 9]>
<script src="/resources/include/js/html5shiv.js"></script>
<![endif]-->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	
	$("#closeBtn").click(function() {
		window.close();
	});
	
});
</script>
<style type="text/css">

</style>
</head>

<body>

<div class="main">
	<h3>예약현황 상세</h3>
	
	<table border="1">
	<thead>
		<tr>
			<th class="th"> 매장위치 </th>
			<th class="th"> 예약한 날짜 </th>
			<th class="th"> 시술 일자 </th>
			<th class="th"> 디자이너 </th>
			<th class="th"> 총 결제금액 </th>
			<th class="th"> 요구사항 </th>
			<th class="th"> 상태 </th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${not empty myList}">
					<tr data-num = "${list.rest_num}">
						<td class="detailreservation">왕십리점</td>
						<td class="detailreservation">${list.rest_regdate}</td>
						<td class="detailreservation">${list.rest_hairdate} / ${list.rest_time}</td>
						<td class="detailreservation">${list.des_name}</td>
						<td class="detailreservation">${list.rest_totalprice}</td>
						<td class="detailreservation">${list.rest_memo}</td>
						<td>
						<c:if test="${list.rest_state == 1 }">
							예약중 <input type="button" name="cancleBtn" id="cancleBtn" value="예약취소"/>
						</c:if>
							<c:if test="${list.rest_state == 2 }">
							시술완료
						</c:if>
							<c:if test="${list.rest_state == 0}">
							예약취소
						</c:if>
						</td>
					</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan = "6" align="center">예약 내역이없습니다</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
	</table>
	
	<table border="1">
		<thead>
			<tr>
				<th width="150">시술 종류</th>
				<th width="150">시술 가격</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty styleList}">
					<c:forEach var="style" items="${styleList}">
						<tr>
							<td>${style.styling_name}</td>
							<td>${style.styling_price}</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>
	<br><br><br>
	<div><input type="button" id="closeBtn" name="closeBtn" value="닫기"/></div>
</div>

</body>
</html>