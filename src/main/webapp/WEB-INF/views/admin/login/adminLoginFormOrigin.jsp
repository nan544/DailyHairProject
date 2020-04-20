<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-
	scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Login</title>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->
<!--[if lt IE 9]>
<script src="/resources/include/js/html5shiv.js"></script>
<![endif]-->
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#loginBtn").click(function() {
			$("#loginForm").attr("method", "post");
			$("#loginForm").attr("action", "/admin/adminLogin.do");
			$("#loginForm").submit();
		});

		var msg = "<c:out value='${msg}'/>";

		if (msg != "") {
			alert(msg);
		}
	});
</script>
</head>
<body>
	<div class="contentContainer">
		<div class="well">
			<form id="loginForm" class="form-horizontal">
				<div class="form-group">
					<label for="userId" class="col-sm-2 control-label"> 아 이 디 </label>
					<div class="col-sm-4">
						<input type="text" id="ad_id" name="ad_id" class="form-control"
							placeholder="ID">
					</div>
					<p class="form-control-static error"></p>
				</div>
				<div class="form-group">
					<label for="userPw" class="col-sm-2 control-label"> 비밀번호 </label>
					<div class="col-sm-4">
						<input type="password" id="ad_pwd" name="ad_pwd"
							class="form-control" placeholder="Password">
					</div>
					<p class="form-control-static error"></p>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-6">
						<input type="button" value="로그인" id="loginBtn"
							class="btn btn-default" />
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>