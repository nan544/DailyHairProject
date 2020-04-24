<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
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
	<div>
		<input type="button" id="memberUpdate" name="memberUpdate" value="회원정보 수정">
		<input type="button" value="예약현황">
		<input type="button" value="계정 비활성화">
	</div>
	<form role="form" id="submitForm" name="submitForm">
		<div>
			<label for="m_id">아이디<span style="color: red;"> * </span></label><br>
			<input type="text" id="m_id" name="m_id" value="${member.m_id}" disabled="disabled"/><br>
		</div>
		<div>
			<label for="m_pwd">패스워드<span style="color: red;"> * </span></label><br>
			<input type="password" id="m_pwd" name="m_pwd" value="**********" disabled="disabled"/>
			<input type="button" id="pwdModify" name="pwdModify" value="패스워드 변경"/><br>
		</div>
		<div>
			<label for="m_name">이 름<span style="color: red;"> * </span></label><br>
			<input type="text" id="m_name" name="m_name" value="${member.m_name}" disabled="disabled"/><br>
		</div>
		<div>
			<label for="m_gender">성 별<span style="color: red;"> * </span></label><br>
			<input type="text" id="m_gender" name="m_gender" value="${member.m_gender}" disabled="disabled"/><br>
		</div>
		<div>
			<label for="m_phone">전화번호<span style="color: red;"> * </span></label><br>
			<input type="text" id="m_phone" name="m_phone" value="${member.m_phone}"/><br>
		</div>
		<div>
			<label for="m_email">이메일<span style="color: red;"> * </span></label><br>
			<input type="email" id="m_email" name="m_email" value="${member.m_email}" disabled="disabled"/><br>
		</div>
		<div>
			<label for="m_memo">추가사항<span style="color: red;"> * </span></label><br>
			<input type="text" id="m_memo" name="m_memo" value="${member.m_memo}"/><br>
		</div>
		<div>
			<input type="button" id="submit" name="submit" value="저장하기"/>
		</div>
	</form>
</div>
</body>
</html>