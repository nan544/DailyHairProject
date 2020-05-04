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
	height: auto;
	margin: 5px;
	padding: 0px;
}

.item {
	width: 120px;
	margin: 10px;
	display: table-cell;
}

.formLine > textarea {
	height: 105px;
	width: 590px;
	resize: none;
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

label[for='img']{
font-size: 12px;
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
			if (!chkData("#hg_title", "제품명을"))
				return;
			if (!chkData("#hg_content", "특징(한줄평)"))
				return;
			if (confirm("게시글을 수정 하시겠습니까?")) {
				$("#updateForm").attr("method", "post");
				$("#updateForm").attr("action", "/admin/board/HGUpdate.do");
				$("#updateForm").submit();
				alert("수정이 완료되었습니다");
			}
		});
		//삭제 버튼 클릭시
		$("#DeleteBtn").click(function() {
			if (confirm("게시글을 삭제 하시겠습니까?")) {
				$("#updateForm").attr("method", "post");
				$("#updateForm").attr("action", "/admin/board/HGDelete.do");
				$("#updateForm").submit();
				alert("삭제가 완료되었습니다.");
			}
		});
		//파일선택시 기존 파일명 숨기기
		$(".uploadFile").on("change keyup paste", function() {
			$(this).parents("span").children("label").hide();
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<!-- 이미지 파일명 표기를 위한 식 -->
	<c:set var="hg_thumb_"
		value="${fn:substringAfter(detail.hg_thumb,'_') }" />
	<c:set var="hg_thumb__" value="${fn:substringAfter(hg_thumb_,'_') }" />
	
	<c:set var="hg_img1_" value="${fn:substringAfter(detail.hg_img1,'_') }" />
	<c:set var="hg_img1__" value="${fn:substringAfter(hg_img1_,'_') }" />
	
	<c:set var="hg_img2" value="${fn:substringAfter(detail.hg_img2,'_') }"/>
	<c:set var="hg_img2" value="${fn:substringAfter(hg_img2,'_') }"/>
	
	<c:set var="hg_img3" value="${fn:substringAfter(detail.hg_img3,'_') }"/>
	<c:set var="hg_img3" value="${fn:substringAfter(hg_img3,'_') }"/>
	
	<c:set var="hg_img4" value="${fn:substringAfter(detail.hg_img4,'_') }"/>
	<c:set var="hg_img4" value="${fn:substringAfter(hg_img4,'_') }"/>
	<div id="contents">
		<form id="updateForm" enctype="multipart/form-data" method="POST">
			<h3>HairGoods 게시판 관리 - 상세보기 및 수정</h3>
			<!-- 목록으로 버튼 -->
			<div id="listMenu">
				<p align="right">
					<input type="button" value="목록으로" class="btn" id="ListBtn">
				</p>
			</div>
			<p align="right"><b><label class="required">*</label> 항목은 필수 입력 값입니다.</b></p>
			<hr>
			<!-- 수정 및 삭제를 위한 값 -->
			<input type="hidden" id="hg_num" name="hg_num"
				value="${detail.hg_num }"> <input type="hidden"
				id="hg_thumb" name="hg_thumb" value="${detail.hg_thumb}"> <input
				type="hidden" id="hg_img1" name="hg_img1" value="${detail.hg_img1}">
				 <input
				type="hidden" id="hg_img2" name="hg_img2" value="${detail.hg_img2}">
				 <input
				type="hidden" id="hg_img3" name="hg_img3" value="${detail.hg_img3}">
				 <input
				type="hidden" id="hg_img4" name="hg_img4" value="${detail.hg_img4}">

			<!--수정 및 상세보기 폼 출력 -->
			<div class="formLine">
				<span class="item"> <label class="required">*</label>제품명
				</span> <input type="text" id="hg_title" name="hg_title"
					value="${detail.hg_title}" class="form-control">
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> <label class="required">*</label>특징
				</span> <input type="text" id="hg_content" name="hg_content" size="50" class="form-control"
					placeholder="간략한 설명을 입력하세요." value="${detail.hg_content}">
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> <label class="required">*</label>썸네일이미지
				</span> <span class="imgBtn"><label for="img">${hg_thumb__}</label>

					<input type="button" class="imgUpdateBtn" value="이미지수정"><input
					type="file" name="uploadFile" id="uploadFile" class="uploadFile"></span>
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> <label class="required">*</label>상세이미지
				</span> <span class="imgBtn"><label for="img">${hg_img1__}</label> <input
					type="button" class="imgUpdateBtn" value="이미지수정"><input
					type="file" name="uploadFile2" id="uploadFile2" class="uploadFile"></span>
			</div>
			<hr>
			<div class="formLine">
				<span class="item">상세이미지2
				</span> <span class="imgBtn"><label for="img">${hg_img2}</label> <input
					type="button" class="imgUpdateBtn" value="이미지수정"><input
					type="file" name="uploadFile3" id="uploadFile3" class="uploadFile"></span>
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> 상세이미지3
				</span> <span class="imgBtn"><label for="img">${hg_img3}</label> <input
					type="button" class="imgUpdateBtn" value="이미지수정"><input
					type="file" name="uploadFile4" id="uploadFile4" class="uploadFile"></span>
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> 상세이미지4
				</span> <span class="imgBtn"><label for="img">${hg_img4}</label> <input
					type="button" class="imgUpdateBtn" value="이미지수정"><input
					type="file" name="uploadFile5" id="uploadFile5" class="uploadFile"></span>
			</div>
			<hr>
		</form>
	<!-- 수정 및 삭제 버튼  -->
	<div id="btnMenu" align="right">
		<input type="button" value="수정완료" class="btn" id="UpdateBtn">
		<input type="button" value="게시글 삭제" class="btn" id="DeleteBtn">

	</div>
	</div>
</body>
</html>