<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btnBoard {
	width: 70px;
	float: left;
	margin-right: 5px;
}

.keyword {
	width: 200px;
	float: left;
	margin-right: 5px;
	}
#insertFormBtn{
	float: right;
	margin-top: -35px;
}
#contents {
	width: 800px;
}
</style>
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
			location.href = "/admin/board/HGInsertForm.do";
		});

		//글번호, 글제목 클릭시 상세페이지로 이동
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
		//검색 버튼 클릭시
		$("#searchBtn").click(function() {
			goPage(1);
		});

	});

	/* 페이징을 위한 메소드 */
	function goPage(page) {
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
	<div>
		<h3>HairGoods 게시판 관리</h3>
		<!-- 검색 및 페이징을 위한 form -->
		<div id="contents">
			<form id="f_search">
				<input type="hidden" id="page" name="page" value="${data.page}">
				<input type="text" id="keyword" class="keyword form-control"
					name="keyword" placeholder="제품이름(제목)" value="${data.keyword }">
				<input type="hidden" id="search" name="search" value="hg_title">
				<input type="button" id="searchBtn" class="btn btnBoard"
					name="searchBtn" value="검색">
			</form>
		</div>
		<!-- 검색 및 페이징을 위한 form -->


		<%--====================상세 페이지 이동을 위한 Form =============== --%>
		<form name="detailForm" id="detailForm">
			<input type="hidden" name="hg_num" id="hg_num">
		</form>
		<%--====================상세 페이지 이동을 위한 Form =============== --%>
		<table class="table table-condensed table-hover">
			<colgroup>
				<col width="10%" />
				<col width="30%" />
				<col width="10%" />
				<col width="22.5%" />
				<col width="22.5%" />

			</colgroup>
			<tr class="active">
				<th>글번호</th>
				<th>제품명</th>
				<th>등록일</th>
				<th>썸네일 이미지명</th>
				<th>상세이미지</th>
			</tr>
			<!-- 데이터 출력 시작-->
			<c:choose>
				<c:when test="${not empty hgList }">
					<c:forEach var="hgList" items="${hgList}" varStatus="status">
						<c:set var="hg_thumb_"
							value="${fn:substringAfter(hgList.hg_thumb,'_') }" />
						<c:set var="hg_thumb__"
							value="${fn:substringAfter(hg_thumb_,'_') }" />
						<c:set var="hg_img1_"
							value="${fn:substringAfter(hgList.hg_img1,'_') }" />
						<c:set var="hg_img1__" value="${fn:substringAfter(hg_img1_,'_') }" />
						<tr data-num="${hgList.hg_num}">
							<td class="goDetail">${hgList.hg_num }</td>
							<td class="goDetail">${hgList.hg_title}</td>
							<td>${hgList.hg_regdate}</td>
							<td>${hg_thumb__}</td>
							<td>${hg_img1__}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5" class="tac">등록된 게시물이 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			<!-- 데이터 출력 끝-->
		</table>
		<!-- BtnMenu -->
		<div>
		<!-- 페이지 네비게이션 -->
			<tag:paging page="${param.page}" total="${total}"
				list_size="${data.pageSize}"></tag:paging>
			<input type="button" class="btn" id="insertFormBtn"
				name="insertFormBtn" value="등록">
		</div>
	</div>
</body>
</html>