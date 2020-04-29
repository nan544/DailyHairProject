<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Image</title>
<script type="text/javascript">

	// 스크립트 예정
	function shopIntroGo() {
		alert("Shop 소개 이동");
		location.replace("/client/shopIntro.do");
	}
	
</script>
</head>

<body>
<div style="margin: 0 auto; width: 1020px;" align="center">
	<div style="margin-top: 150px;">
		<h1>Test</h1>
		<button onclick="shopIntroGo()"
			style="width: 100px; height: 35px; border: 0;">클릭하세요</button>
	</div>
</div>
</body>

</html>