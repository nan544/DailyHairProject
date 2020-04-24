<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 비활성화</title>
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
	var m_num = "${member.m_num}";
	$("#m_num").val(m_num);

	//계정 비활성화 버튼 클릭시 실행
	$("#deleteBtn").click(function() {
	
		if (confirm("비활성화 하시겠습니까?")) {
			$.ajax({
				url : "/mypage/memberDelete.do",
				type : "post",
				data : "m_num=" + $("m_num").val(),
				success : function(data) {
					if (data == 1) {
						alert("계정이 비활성화 되었습니다.");
					} else {
						alert("비활성화 실패");
					}
				}
			}); //비활성화  ajax종료
		}
	}); // 회원 비활성화 이벤트 종료

});

</script>
</head>
<body>

<div>
	<h1>계정 비활성화</h1>
	
	<p><span style="color: red;"> * </span>비활성화 관련 주의 사항<span style="color: red;"> * </span></p>
	
	<p> 1. 계정이 비활성화 될 경우 로그인이 불가능합니다. </p>
	<p> 2. 로그인을 통해 사용 가능한 모든 기능을 사용하실 수 없습니다. </p>
	<p> 3. 예약현황이 존재할 경우 비활성화를 하실 수 없습니다. </p>
	<p> 4. 비활성화를 해제하시려면 관리자에게 문의하셔야 합니다. </p><br><br>
	
	<p> 관리자 문의 전화 ☎ 02-001-0002 </p>
	
	<input type="button" name="deleteBtn" id="deleteBtn" value="비활성화" class="btn"/>
</div>

</body>
</html>