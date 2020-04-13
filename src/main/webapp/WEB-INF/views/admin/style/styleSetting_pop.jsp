<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시술등록</title>
<style type="text/css">
span {
	color: red;
}
</style>
</head>
<body>
	<h1 align="center">시술등록</h1>
	<div class="insertContainer">
		<form id="insertStyle" name="insertStyle">
			<fieldset>
				<p align="center">시술 추가</p>
				<select id="des_num" name="des_num">
					<option>디자이너선택</option>
				</select>
				<hr>
				<table>
					<tr>
						<td><span>&nbsp;*</span>시술 구분</td>
						<td><select id="styling_option" name="styling_option">
								<option value="1">기본시술</option>
								<option value="2">펌 시술</option>
								<option value="3">기타 1시술</option>
								<option value="4">기타 2시술</option>
						</select></td>
						<td><span>&nbsp;*</span>시술명</td>
						<td><input type="text" name="styling_name" id="styling_name" /></td>
						<td><span>&nbsp;*</span>시술가격</td>
						<td><input type="text" name="styling_price"
							id="styling_price" /></td>
						<td><input type="button" name="insertBtn" id="insertBtn"
							value="등록" /></td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>
	<br>
	<br>
	<div class="updateContainer">
		<form id="updateStyle" name="updateStyle">
			<fieldset>
				<p align="center">시술 목록</p>
				<hr>
				<table>
					<c:choose>
						<c:when test="${not empty stylingList }">
							<c:forEach var="des" items="${designerList}">
								<tr>
									<td><span>&nbsp;*</span>시술 구분</td>
									<td><select id="styling_option" name="styling_option">
											<option value="1">기본시술</option>
											<option value="2">펌 시술</option>
											<option value="3">기타 1시술</option>
											<option value="4">기타 2시술</option>
									</select></td>
									<td><span>&nbsp;*</span>시술명</td>
									<td><input type="text" name="styling_name"
										id="styling_name" value="" /></td>
									<td><span>&nbsp;*</span>시술가격</td>
									<td><input type="text" name="styling_price"
										id="styling_price" value="" /></td>
									<td><input type="button" name="updateBtn" id="updateBtn"
										value="수정" /></td>
									<td><input type="button" name="deleteBtn" id="deleteBtn"
										value="삭제" /></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="8" class="tac">등록된 시술이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</fieldset>
		</form>
	</div>
</body>
</html>