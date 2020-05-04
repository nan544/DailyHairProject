<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약현황 상세</title>
<style type="text/css">
.main{text-align:center;}
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
	
	$("#closeBtn").click(function() {
		window.close();
	});
	
});

</script>
</head>
<body>

<div class="main">
	<h3>예약현황 상세</h3>
	
	<table border="1">
		<thead>
			<tr>
				<th width="150">시술 종류</th>
				<th width="150">시술 가격</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty styleList}">
						<c:forEach var="style" items="${styleList}">
							<tr>
								<td>${style.styling_name}</td>
								<td>${style.styling_price}</td>
							</tr>
						</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>
	<br><br><br>
	<div><input type="button" id="closeBtn" name="closeBtn" value="닫기"/></div>
</div>

</body>
</html>