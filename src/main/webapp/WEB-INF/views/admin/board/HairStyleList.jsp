<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/include/css/board.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		/* 한페이지에 보여줄 레코드 수 조회후 유지하기 위한 설정 */
		if ("<c:out value='${data.pageSize}'/>" != "") {
			$("#pageSize").val("<c:out value='${data.pageSize}'/>");
		}
		//등록 버튼 클릭시 등록폼 호출
		$("#insertFormBtn").click(function() {
			location.href = "/admin/board/HSInsertForm.do";
		});
		//글번호, 글제목 클릭시 상세페이지로 이동
		$(".goDetail").click(function() {
			var hs_num = $(this).parents("tr").attr("data-num");
			$("#hs_num").val(hs_num);
			console.log("글번호 : " + hs_num);
			//상세 페이지로 이동하기 위해 form추가 (id:detailForm)
			$("#detailForm").attr({
				"method" : "post",
				"action" : "HSDetail.do"
			});
			$("#detailForm").submit();
		});
		//검색 버튼 클릭시
		$("#searchBtn").click(function() {
			goPage(1);
		})
	})
	/* 페이징을 위한 메소드 */
	function goPage(page) {
		$("#page").val(page);
		$("#f_search").attr({
			"method" : "get",
			"action" : "/admin/board/HairStyleList.do"
		});
		$("#f_search").submit();
	}
</script>
</head>
<body>
	<p>
	<h3>HairStyle 게시판 관리</h3>
	<form name="f_search" id="f_search">
	 <input
			type="hidden" id="page" name="page" value="${data.page}">
		<input type="text" id="keyword" name=keyword placeholder="제품이름(제목)" value="${data.keyword}">
		<input type="hidden" id="search" name="search" value="hs_title">
		<input type="button" id="searchBtn" class="btnBoard" name="searchBtn" value="검색">
		</form>
	<p>

		<%--====================상세 페이지 이동을 위한 Form =============== --%>
	<form name="detailForm" id="detailForm">
		<input type="hidden" name="hs_num" id="hs_num">
	</form>
	<%--====================상세 페이지 이동을 위한 Form =============== --%>
	<!-- 페이징 -->
	<!--  -->
	<table class="table table-condensed table-hover">
		<colgroup >
			<col width="10%" />
			<col width="20%" />
			<col width="20%" />
			<col width="25%" />
			<col width="25%" />

		</colgroup>
		<tr class="active">
			<th>글번호</th>
			<th>제품이름</th>
			<th>등록일</th>
			<th>썸네일 이미지명</th>
			<th>상세이미지</th>
		</tr>
		<!-- 데이터 출력 시작-->
		<c:choose>
			<c:when test="${not empty hsList }">
				<c:forEach var="hsList" items="${hsList}" varStatus="status">
				<c:set var="hs_thumb_" value="${fn:substringAfter(hsList.hs_thumb,'_') }" />
				<c:set var="hs_thumb__" value="${fn:substringAfter(hs_thumb_,'_') }"/>
				<c:set var="hs_img1_" value="${fn:substringAfter(hsList.hs_img1,'_') }"/>
				<c:set var="hs_img1__" value="${fn:substringAfter(hs_img1_,'_') }"/>
					<tr data-num="${hsList.hs_num}">
						<td class="goDetail">${hsList.hs_num}</td>
						<td class="goDetail">${hsList.hs_title}</td>
						<td>${hsList.hs_regdate}</td>
						<td>${hs_thumb__}</td>
						<td>${hs_img1__}</td>
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

	<input type="button"  class="btnBoard" id="insertFormBtn" name="insertFormBtn" value="등록">

	<!-- 페이지 네비게이션 -->
	<div id="boardPage">
		<tag:paging page="${param.page}" total="${total}"
			list_size="${data.pageSize}"></tag:paging>

	</div>
</body>
</html>