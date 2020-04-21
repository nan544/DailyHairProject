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

	function idFind() {
		
		var phone = $("#m_phone").val();
		
		$.ajax({
			url : "/member/login/idFind.do",
			type : "post",
			data : {"m_phone" : phone},
			success : function(data) {
				if(data == 1){
					alert("전화번호를 확인해 주세요.");
				}else if(data == 0){
					$("#idFind").attr("value", "Y");
					alert("아이디를 전송했습니다.");
				}
			}
		});
	}

</script>
</head>
<body>

<div>
<h1>아이디 찾기</h1>
<form role="form" id="idFindForm" name="idFindForm">
	<div>
		<label for="m_Phone">전화번호<span style="color: red;"> *</span></label>
		<input type="text" id="m_phone" name="m_phone" placeholder="전화번호"/>
		<button type="button" id="idFind" name="idFind" onclick="idFind();" value="N">확인</button>
	</div>
	<div>
		<a href="/member/login/login.do"><input type="button" value="로그인"></a>
		<a href="/member/clause.do"><input type="button" value="회원가입"></a>
		<a href="/member/login/pwFind.do"><input type="button" value="패스워드 찾기"></a>
	</div>
</form>
</div>

</body>
</html>