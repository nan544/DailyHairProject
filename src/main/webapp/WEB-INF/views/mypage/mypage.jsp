<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
	
	$("#mypageBtn").click(function() {
		$("#mypageForm").attr("method","post");
		$("#mypageForm").attr("action","/mypage/mypage.do");
		$("#mypageForm").submit();
	});
	
	var msg = "<c:out value='${msg}'/>";
	
	if (msg != ""){
		alert(msg);
	}
	
	$("#memberSelect").click(function() {
		location.href = "/mypage/memberSelect.do"
	});
	
	$("#deactivation").click(function() {
		location.href = "/mypage/deactivation.do"
	});
	
});

</script>
</head>
<body>

<c:if test="${mypage == null}">
	<h1>본인확인</h1>
	<form role="form" id="mypageForm" name="mypageForm">
		<div>
			<label for="m_pwd">패스워드</label>
			<input type="password" id="m_pwd" name="m_pwd" placeholder="패스워드">
			<input type="button" id="mypageBtn" name="mypageBtn" value="확인">
		</div>
	</form>
</c:if>
<c:if test="${mypage == '사용자'}">
	<div>
		<input type="button" id="memberSelect" name="memberSelect" value="회원정보 수정">
		<input type="button" value="예약현황">
		<input type="button" id="deactivation" name="deactivation" value="계정 비활성화">
	</div>
</c:if>

</body>
</html>