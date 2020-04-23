<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세현황</title>
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">

tbody tr th,td{
text-align: center;
}
thead tr th,td{
text-align: center;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
	});
</script>
</head>
<body id="mainContainer">
 <h2 align="center">금일 시술내역</h2>
 <form name="stateForm" id="stateForm">
 <select id="m_state" name="m_state">
 	<option value="${reservation.rest_state}">예약중</option>
 	<option value="0">예약취소</option>
 	<option value="2">시술완료</option>
 </select>
 </form>
 <div id="memberContainer">
 <h4 align="center" style="color: gray;">회원정보</h4>
 <table class="table">
 	<colgroup>
 		<col width="25%">
 		<col width="25%">
 		<col width="25%">
 		<col width="25%">
 	</colgroup>
 	<tbody>
			<tr>
				<th>회원번호</th>
				<td>${member.m_num}</td>
				<th>휴대폰번호</th>
				<td>${member.m_phone}</td>
			</tr>
			<tr>
				<th>ID</th>
				<td>${member.m_id}</td>
				<th>이메일</th>
				<td>${member.m_email}</td>
			</tr> 		
			<tr>
				<th>이름</th>
				<td>${member.m_name}</td>
				<th>특이사항</th>
				<td>${member.m_memo}</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${member.m_gender}</td>
				<th>가입 일자</th>
				<td>${member.m_date}</td>
			</tr>
			<tr><td></td><td></td><td></td><td></td></tr>
 	</tbody>
 </table>
  </div>
   <h4 align="center" style="color: gray;">금일 시술내역</h4>
 	<table class="table">
 		<colgroup>
 			<col width="20%">
 			<col width="10%">
 			<col width="20%">
 			<col width="10%">
 			<col width="40%">
 		</colgroup>
 	<thead>
 	<tr>
 		<th>시술 일자</th>
 		<th>디자이너</th>
 		<th>시술 종류</th>
 		<th>시술 가격</th>
 		<th>회원 요구사항</th>
 	</tr>
 	</thead>
 	<tbody>
 		<tr>
 			<td>${reservation.rest_hairdate} / ${reservation.rest_time}</td>
 			<td>${reservation.des_name}</td>
 			<td>
 			<c:forEach var="name" items="${nameList}">
 				${name.styling_name} <br>
 			</c:forEach>
 			</td>
 			<td>${reservation.rest_totalprice}원</td>
 			<td>${reservation.rest_memo}</td>
 		</tr>
 		<tr><td></td><td></td><td></td><td></td><td></td></tr>
 	</tbody>
 	</table>
 	<table>
 		<colgroup>
 			<col width="30%">
 			<col width="70%">
 		<tr>
 			<td>금일 시술 특이사항</td>
 			<td><textarea rows="2" cols="70" name="rest_comment" id="rest_comment" placeholder="금일 시술 특이사항을 적어주세요"></textarea> </td>
 		</tr>
 	</table>
 	<hr>
 	 <h4 align="center" style="color: gray;">이전 시술내역</h4>
 	<table class="table">
 		<colgroup>
 			<col width="20%">
 			<col width="10%">
 			<col width="20%">
 			<col width="10%">
 			<col width="40%">
 		</colgroup>
 			<thead>
 	<tr>
 		<th>시술 일자</th>
 		<th>디자이너</th>
 		<th>시술 종류</th>
 		<th>시술 가격</th>
 		<th>시술후 코멘트</th>
 	</tr>
 	</thead>
 	<tbody>
 	<c:choose>
 		<c:when test="${not empty resultList}">
 		<c:forEach var="result" items="${resultList}">
 			<tr>
 				<td>${result.rest_hairdate} / ${result.rest_time}</td>
 				<td>${result.des_name}</td>
 				<td></td>
 				<td>${result.rest_totalprice}</td>
 				<td>${result.rest_comment}</td>
 			</tr>
 		</c:forEach> 
 		</c:when>
 		<c:otherwise>
 			<tr>
 				<td colspan="5">이전 시술내용이 없습니다</td>
 			</tr>
 		</c:otherwise>
 	</c:choose>
 	</tbody>
 	</table>
 	<div class="btnContainer">
 		<input type="button" name="updateBtn" id="updateBtn" value="저장"/>
 		<input type="button" name="closeBtn" id="closeBtn" value="닫기"/>
 	</div>
</body>
</html>