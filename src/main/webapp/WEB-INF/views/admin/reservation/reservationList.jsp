<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약현황</title>
<style type="text/css">
#datePicker{
width : 130px;
position: absolute;
top : 80px;
right: 300px;
}
#des_num{
width : 130px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script src="/resources/include/js/bootstrap-datepicker.js"></script>
<script src="/resources/include/js/bootstrap-datepicker.ko.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#datePicker").datepicker({
			format : "yyyy-mm-dd",
			startDate : 'd',
			autoclose : true,
			templates : {
				leftArrow : '&laquo;',
				rightArrow : '&raquo'
			},
			title : "날짜선택",
			language : "ko"
		});
	});
	
</script>
</head>
<body>
 <h1>예약 현황</h1>
 <form id="rest_search" name="rest_search">
	<c:choose>
		<c:when test="${not empty desList}">
			<select id="des_num" name="des_num" class="des_num form-control">
				<option value="all">디자이너선택</option>
				<c:forEach var="des" items="${desList}">
					<option value="${des.des_num}">${des.des_name}</option>
				</c:forEach>
			</select>
		</c:when>
	</c:choose> 
 <input type="text" id="datePicker" class="form-control" value="날짜선택">
 <hr>
 	<table class="table">
 		<colgroup>
 			<col width="10%">
 			<col width="10%">
 			<col width="10%">
 			<col width="10%">
 			<col width="20%">
 			<col width="20%">
 			<col width="20%">
 		</colgroup>
 		<thead>
 			<tr>
 				<td>방문 시간</td>
 				<td>성별</td>
 				<td>아이디</td>
 				<td>회원 이름</td>
 				<td>전화번호</td>
 				<td>시술 종류</td>
 				<td>총 시술가격</td>
 			</tr>
 		</thead>
 		<tbody>
 			<c:choose>
 				<c:when test="${not empty restList}">
 					<c:forEach var="res" items="${restList}">
 						<tr data-num="${res.rest_num}">
 							<td>${res.rest_time}</td>
 							<td>${res.m_gender }</td>
 							<td>${res.m_id}</td>
 							<td>${res.m_name }</td>
 							<td>${res.m_phone}</td>
 							<td>시술명
 						<%-- <c:forEach var="style" items="${styleList}">
 							${style.styling_name } <br>
 						</c:forEach> --%>
 							</td>
 							<td>총 시술가격</td>
 					</c:forEach>
 				</c:when>
 				<c:otherwise>
 					<tr>
 						<td colspan="7" align="center">금일 예약자가 없습니다</td>
 					</tr>
 				</c:otherwise>
 			</c:choose>
 		</tbody>
 	</table>
 </form>
</body>
</html>