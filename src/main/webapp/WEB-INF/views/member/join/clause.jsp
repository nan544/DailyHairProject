<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-
	scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>이용약관</title>
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
	$("#nextBtn").click(function() {
		if(!$("input[name='clause1']").is(":checked")){
			alert("모든 약관에 동의해주시길 바랍니다.");
			return false;
		}if(!$("input[name='clause2']").is(":checked")){
			alert("모든 약관에 동의해주시길 바랍니다.");
			return false;
		}
	});
});

</script>
</head>
<body>

<div>
	<h2 class="text-light"><a href="/client/main.do"><span>DailyHairShop</span></a></h2>

	<div>
		<input type="checkbox" id="clause1" name="clause1" value="이용약관 동의">이용약관 동의<br>
		<p>미안하다 이거 하려고 어그로 끌었다</p>
		<input type="checkbox" id="clause2" name="clause2" value="개인정보 수집 및 이용동의">개인정보 수집 및 이용동의<br>
		<p>킹국영 진짜 개쩔지 않냐, 코딩도 잘하고 모든것이 완벽한 휴먼이다.</p>
	</div>
	<div>
		<a href="/member/join.do"><input type="button" id="nextBtn" name="nextBtn" value="다음단계"></a>
		<a href="/client/main.do"><input type="button" value="취소"></a>
	</div>
</div>

</body>
</html>