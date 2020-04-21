<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		/* 한페이지에 보여줄 레코드 수 조회후 유지하기 위한 설정 */
		if ("<c:out value='${data.pageSize}'/>" != "") {
			$("#pageSize").val("<c:out value='${data.pageSize}'/>");
		}
		$("#insertFormBtn").click(function() {
			location.href = "/admin/board/HGInsertForm.do";
		});
		$(".goDetail").click(function() {
			var hg_num = $(this).parents("tr").attr("data-num");
			$("#hg_num").val(hg_num);
			console.log("글번호 : " + hg_num);
			//상세 페이지로 이동하기 위해 form추가 (id:detailForm)
			$("#detailForm").attr({
				"method" : "post",
				"action" : "HGDetail.do"
			});
			$("#detailForm").submit();
		});
	});
	function goPage(page){
		$("#page").val(page);
		$("#f_search").attr({
			"method" : "get",
			"action" : "/admin/board/HairGoodsList.do"
		});
		$("#f_search").submit();
	}
</script>
</head>
<body>
	<p>
	<h3>HairGoods 게시판 관리</h3>
	<input type="text" id="search" name="search" placeholder="제품이름(제목)">
	<input type="button" id="searchBtn" name="searchBtn" value="검색">
	<p>

		<%--====================상세 페이지 이동을 위한 Form =============== --%>
	<form name="detailForm" id="detailForm">
		<input type="hidden" name="hg_num" id="hg_num">
	</form>
	<%--====================상세 페이지 이동을 위한 Form =============== --%>
	<!-- 페이징 -->
	<form id="f_search">
	<input type="hidden" id="page" name="page" value="1">
	</form>
	<!--  -->
	<table border="1">
		<colgroup>
			<col width="10%" />
			<col width="30%" />
			<col width="10%" />
			<col width="22.5%" />
			<col width="22.5%" />

		</colgroup>
		<tr>
			<th>글번호</th>
			<th>스타일명</th>
			<th>등록일</th>
			<th>썸네일 이미지명</th>
			<th>상세이미지</th>
		</tr>
		<!-- 데이터 출력 시작-->
		<c:choose>
			<c:when test="${not empty hgList }">
				<c:forEach var="hgList" items="${hgList}" varStatus="status">
					<tr data-num="${hgList.hg_num}">
						<td class="goDetail">${hgList.hg_num }</td>
						<td class="goDetail">${hgList.hg_title}</td>
						<td>${hgList.hg_regdate}</td>
						<td>${hgList.hg_thumb}</td>
						<td>${hgList.hg_img1}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="8" class="tac">등록된 게시물이 존재하지 않습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		<!-- 데이터 출력 끝-->
	</table>
	<!-- BtnMenu -->
	<input type="button" id="insertFormBtn" name="insertFormBtn" value="등록">

	<!-- 페이지 네비게이션 -->
	<div id="boardPage">
		<tag:paging page="${param.page}" total="${total}"
			list_size="${data.pageSize}"></tag:paging>

	</div>
</body>
</html>