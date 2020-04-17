<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
	
	$("#loginBtn").click(function() {
		$("#loginForm").attr("method","post");
		$("#loginForm").attr("action","/member/login/login.do");
		$("#loginForm").submit();
	});
	
	var msg = "<c:out value='${msg}'/>";
	
	if (msg != ""){
		alert(msg);
	}
	
});

</script>
</head>
<body>

<div>
<h2 class="text-light"><span>DailyHairShop</span></h2>
	<form role="form" id="loginForm" name="loginForm">
		<div>
			<label for="m_id">아이디</label><br>
			<input type="text" id="m_id" name="m_id" placeholder="아이디">
		</div>
		<div>
			<label for="m_pwd">패스워드</label><br>
			<input type="password" id="m_pwd" name="m_pwd" placeholder="패스워드">
			<input type="button" id="loginBtn" name="loginBtn" value="로그인">
		</div>
		<div>
			<a href="/member/clause.do"><input type="button" value="회원가입"></a>
			<a href="/login/idFind.do"><input type="button" value="아이디 찾기"></a>
			<a href="/login/pwFind.do"><input type="button" value="패스워드 찾기"></a>
		</div>
	</form>
</div>

</body>
</html>