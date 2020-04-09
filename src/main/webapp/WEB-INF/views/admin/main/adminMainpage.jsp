<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자메인페이지</title>
</head>
<body>
<c:if test="${login == '관리자'}">
 <h1>메인페이지입니다</h1>
 <h2>컨텐츠 부분이에염</h2>
</c:if>
<c:if test="${login == null }">
 <c:redirect url="/admin/adminLogin.do"/>
</c:if>
</body>
</html>