<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자메인페이지</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- <script type="text/javascript">
 $(function(){
	var session = "<c:out value='${login}'/>";
	alert(session+"님 환영합니다.");
 });
</script> -->
</head>
<body>
<c:if test="${login == '관리자'}">
	<script type="text/javascript">
	window.location.href="/admin/reservation/adminReservationList.do";
	</script>
</c:if>
<c:if test="${empty login}">
	<script type="text/javascript">
		window.location.href="/";
	</script>
</c:if>
</body>
</html>