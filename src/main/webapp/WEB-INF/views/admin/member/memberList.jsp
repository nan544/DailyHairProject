<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<style type="text/css">
	span{
	color: red;
	}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$(".detail").click(function(){
			 	var m_num = $(this).parents("tr").attr("data-num");
			 	alert(m_num);
				window.open("/admin/member/memberDetailForm.do?m_num=" + m_num,
						"memberpop", "width=800, height=800, left=600, top=100");
		});
	});
</script>
</head>
<body>
	<h1>회원목록</h1>
	 <form id="detailForm" name="detailForm">
		<input type="hidden" name="m_num" id="m_num"/>
	</form>
	<p><span>*</span>아이디를 클릭하면 상세보기</p>
		<table>
			<colgroup>
				<col width="15%">
				<col width="10%">
				<col width="10%">
				<col width="5%">
				<col width="15%">
				<col width="15%">
				<col width="20%">
				<col width="10%">
			</colgroup>
			<thead>
			<tr>
						<td align="center"><strong>회원번호</strong></td>
						<td align="center"><strong>아이디</strong></td>
						<td align="center"><strong>이름</strong></td>
						<td align="center"><strong>성별</strong></td>
						<td align="center"><strong>이메일</strong>
						<td align="center"><strong>연락처</strong></td>
						<td align="center"><strong>등록일</strong></td>
						<td align="center"><strong>상태</strong></td>
			</tr>
			</thead>
		 	<tbody>		
				<c:choose>		
					<c:when test="${not empty memberList}">
						<hr>
						<c:forEach var="member" items="${memberList}">
							<tr data-num="${member.m_num}">
								<td align="center">${member.m_num}</td>
								<td align="center" class="detail">${member.m_id}</td>
								<td align="center">${member.m_name}</td>
								<td align="center">${member.m_gender}</td>
								<td align="center">${member.m_email}</td>
								<td align="center">${member.m_phone}</td>
								<td align="center">${member.m_date}</td>
								<c:if test="${member.m_state == 1}">
									<td align="center">활성화</td>
								</c:if>
								<c:if test="${member.m_state == 0}">
									<td align="center">비활성화</td>
								</c:if>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose> 
			<%-- 	<c:otherwise>
					<tr>
						<td>등록된 회원이 없습니다</td>
					</tr>
				</c:otherwise>  --%>
			</tbody> 		
		</table> 
</body>
</html>