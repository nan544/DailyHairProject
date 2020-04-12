<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디자이너 리스트</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/include/css/common.css"/>
<link rel="stylesheet" type="text/css" href="/resources/include/css/board.css"/>

<script type="text/javascript">
	$(function(){
		//디자이너 등록 버튼 클릭시 팝업창을 띄운다
		$("#insertDesigner").click(function(){
			window.open("designerJoinForm.do","pop","width=800, height=700, left=600, top=100");
		});
		
		//수정버튼을 클릭시 디자이너 수정폼을 띄운다
		$(".modify").click(function(){
			var des_num = $(this).parents("tr").attr("data-num");
			$("#des_num").val(des_num);
			alert(des_num);
			window.open("designerUpdateForm.do?des_num="+des_num,"pop","width=800, height=700, left=600, top=100");
		});
	});
</script>
</head>
<body>
	<div class="designerContainer">
		<div class="desHeader">
			<h1>디자이너 관리</h1>
			<select>
				<option value="1">활성화</option>
				<option value="0">비활성화</option>
			</select> 
			<input type="button" id="insertStyle" name="intsetStyle" value="시술등록" />
		</div>
		<div class="desList">
			<form name="detailForm" id="detailForm">
				<input type="hidden" name="des_num" id="des_num">
			</form>
			<table summary="디자이너 리스트">
				<colgroup>
					<col width="25%">
					<col width="10%">
					<col width="10%">
					<col width="25%">
					<col width="20%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<td align="center"><strong>등록일</strong></td>
						<td align="center"><strong>직급</strong></td>
						<td align="center"><strong>이름</strong></td>
						<td align="center"><strong>연락처</strong></td>
						<td align="center"><strong>이력서(첨부파일)</strong></td>
						<td align="center"></td>
					</tr>
				</thead>
				<tbody id="list">
				<c:choose>
					<c:when test="${not empty designerList }">
					<hr>
						<c:forEach var="des" items="${designerList}">
							<tr class="tac" data-num = "${des.des_num}">
								<td>${des.des_regdate}</td>
								<td>${des.des_job}</td>
								<td>${des.des_name}</td>
								<td>${des.des_phone}</td>
								<td>${des.des_file}</td>
								<td><input type="button" id="modify" name="modify" class="modify" value="수정"/></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6" class="tac">등록된 디자이너가 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>
		<div class="buttonContainer">
			<input type="button" value="디자이너 등록" id="insertDesigner"/>
		</div>
	</div>
</body>
</html>