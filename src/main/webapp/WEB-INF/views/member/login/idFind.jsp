<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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

$(function() {
	
	
	
});

</script>
</head>
<body>

<div>
<h1>아이디 찾기</h1>
<form role="form" id="idFindForm" name="idFindForm">
	<div>
		<label>이메일</label>
		<input type="text" id="m_email" name="m_email" placeholder="이메일">
		<input type="button" id="idFindBtn" name="idFindBtn" value="확인">
	</div>
	<div>
		<a href="/login/login.do"><input type="button" value="로그인"></a>
		<a href="/member/clause.do"><input type="button" value="회원가입"></a>
		<a href="/login/pwFind.do"><input type="button" value="패스워드 찾기"></a>
	</div>
</form>
</div>

</body>
</html>