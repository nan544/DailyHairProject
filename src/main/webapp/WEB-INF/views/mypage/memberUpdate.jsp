<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<style type="text/css">

</style>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->
<!--[if lt IE 9]>
<script src="/resources/include/js/html5shiv.js"></script>
<![endif]-->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>

	<div>
		<input type="button" id="memberUpdate" name="memberUpdate" value="회원정보 수정">
		<input type="button" value="예약현황">
		<input type="button" value="계정 비활성화">
	</div>

	<div>
		<label>아이디<span style="color: red;"> *</span></label>
		<input type="text" id="m_id" name="m_id" value="${memberUp.m_id}" readonly="readonly"/>
	</div>

</body>
</html>