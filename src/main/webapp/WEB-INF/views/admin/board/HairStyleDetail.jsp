<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.formLine {
	display: inline-block;
	height: 40px;
	margin: 5px;
	padding: 0px;
}

.item {
	display: inline-block;
	width: 120px;
	margin: 10px;
}

hr {
	background: gray;
	height: 1px;
	margin: 1px;
}

input[type="file"] {
	display: inline;
}

#contents {
	width: 800px;
}

#bottomMenu button {
	float: right;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
		$(".uploadFile").hide();
		//목록으로 버튼 클릭 시
		$("#ListBtn").click(function() {
			history.go(-1);
		});

		//수정하기 버튼 클릭시
		$(".imgUpdateBtn").click(function() {
			$(".uploadFile").show();
			$(".imgUpdateBtn").hide();

		});

		//수정완료 버튼 클릭시
		$("#UpdateBtn").click(function() {
			if (!chkData("#hs_title", "제목을"))
				return;
			if (!chkData("#hs_content", "특징(한줄평)"))
				return;
			if (confirm("게시글을 수정 하시겠습니까?")) {
				$("#updateForm").attr("method", "post");
				$("#updateForm").attr("action", "/admin/board/HSUpdate.do");
				$("#updateForm").submit();
				alert("수정이 완료되었습니다");
			}
		});

		//삭제 버튼 클릭시
		$("#DeleteBtn").click(function() {
			if (confirm("게시글을 삭제 하시겠습니까?")) {
				$("#updateForm").attr("method", "post");
				$("#updateForm").attr("action", "/admin/board/HSDelete.do");
				$("#updateForm").submit();
				alert("삭제가 완료되었습니다.");
			}
		});
		//파일선택시 기존 파일명 숨기기
		$(".uploadFile").on("change keyup paste", function() {
			$("label[for='img']").hide();
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<!-- 이미지 파일명 표기를 위한 식 -->
	<c:set var="hs_thumb_"
		value="${fn:substringAfter(detail.hs_thumb,'_') }" />
	<c:set var="hs_thumb__" value="${fn:substringAfter(hs_thumb_,'_') }" />
	<c:set var="hs_img1_" value="${fn:substringAfter(detail.hs_img1,'_') }" />
	<c:set var="hs_img1__" value="${fn:substringAfter(hs_img1_,'_') }" />
	<div id="contents">
		<form id="updateForm" enctype="multipart/form-data" method="POST">


			<!-- 수정 및 삭제를 위한 값 -->
			<input type="hidden" id="hs_num" name="hs_num"
				value="${detail.hs_num}"> <input type="hidden"
				name="hs_thumb" id="hs_thumb" value="${detail.hs_thumb}"> <input
				type="hidden" name="hs_img1" id="hs_img1" value="${detail.hs_img1}">
			<h3>HairStyle 게시판 관리 - 상세보기 및 수정</h3>
			<p align="right">* 항목은 필수 입력 값입니다.</p>
			<!-- 목록으로 버튼 -->
			<div id="listMenu">
				<p>
					<input type="button" value="목록으로" class="but" id="ListBtn">
				</p>
			</div>
			<hr>
			<!--수정 및 상세보기 폼 출력 -->
			<div class="formLine">
				<span class="item"> <label class="required">*</label>제품명
				</span> <input type="text" id="hs_title" name="hs_title"
					value="${detail.hs_title}">
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> <label class="required">*</label>특징
				</span> <input type="text" id="hs_content" name="hs_content" size="50"
					placeholder="간략한 설명을 입력하세요." value="${detail.hs_content}">
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> <label class="required">*</label>썸네일이미지
				</span> <span class="imgBtn"><label for="img">${hs_thumb__}</label>
					<input type="button" class="imgUpdateBtn" value="이미지수정"><input
					type="file" name="uploadFile" id="uploadFile" class="uploadFile"></span>
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> <label class="required"></label>상세이미지
				</span> <span class="imgBtn"><label for="img">${hs_img1__}</label> <input
					type="button" class="imgUpdateBtn" value="이미지수정"><input
					type="file" name="uploadFile2" id="uploadFile2" class="uploadFile"></span>
			</div>
			<hr>
		</form>
	</div>
	<!-- 수정 및 삭제 버튼  -->
	<div>
		<input type="button" value="수정완료" class="but" id="UpdateBtn">
		<input type="button" value="게시글 삭제" class="but" id="DeleteBtn">

	</div>
</body>
</html>