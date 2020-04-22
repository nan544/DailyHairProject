<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원상세정보</title>
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

		//닫기 버튼클릭시 팝업창닫기
		$("#closeBtn").click(function() {
			window.close();
		});

		//수정 버튼 클릭시 실행
		$("#updateBtn").click(function() {
			var state = $("#m_state").val();
			var num = ${detail.m_num};
			//활성화/비활성화 선택했는지 확인후 수정하기 완료

			if (state == "#") {
				alert("상태값을 선택하세요");
				$("#m_state").focus();
				return;
			} else {
				if (confirm("수정하시겠습니까?")) {
					$.ajax({

						url : "/admin/member/memberUpdate.do",
						type : "post",
						data : {
							m_state : state,
							m_num : num
						},
						success : function(data) {
							alert("수정이 완료되었습니다");
							opener.parent.location.reload();
							window.close();
						}
					});
				}
			}

		});
	});
</script>
</head>
<body>
	<h1>회원정보</h1>
	<select name="m_state" id="m_state">
		<option value="${detail.m_state}">
			<c:if test="${detail.m_state == 0}">
				<td>비활성화</td>
			</c:if>
			<c:if test="${detail.m_state == 1}">
				<td>활성화</td>
			</c:if>
		</option>
		<option value="#">-----------</option>
		<option value="1">활성</option>
		<option value="0">비활성</option>
	</select>
	
	<div class="memberDeatailContainer" style="margin-top: 10px;">
		<form name="updateForm" id="updateForm">
				<table class="table">
					<colgroup>
						<col width="25%">
						<col width="25%">
						<col width="25%">
						<col width="25%">
					</colgroup>
					<tr>
						<th>회원번호</th>
						<td>${detail.m_num}</td>
						<th>휴대폰번호</th>
						<td>${detail.m_phone}</td>
					</tr>
					<tr>
						<th>ID</th>
						<td>${detail.m_id }</td>
						<th>이메일</th>
						<td>${detail.m_email}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${detail.m_name}</td>
						<th>특이사항</th>
						<td>${detail.m_memo}</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>${detail.m_gender}</td>
						<th>가입일자</th>
						<td>${detail.m_date}</td>
					</tr>
					<tr><td></td><td></td><td></td><td></td></tr>
				</table>
		</form>
	</div>
	<div class="reservationContainer">
		<h2>이전 시술내역</h2>
		<table class="table" style="margin-top: 10px;">
			<tr>
				<td></td>
			</tr>
		</table>
	</div>
	<div class="btnContainer">
		<input type="button" name="updateBtn" id="updateBtn" value="수정" /> <input
			type="button" name="closeBtn" id="closeBtn" value="닫기" />
	</div>
</body>
</html>