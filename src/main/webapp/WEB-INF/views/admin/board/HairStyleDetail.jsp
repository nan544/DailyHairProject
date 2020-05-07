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
		
		
		//수정창 띄울시에 DB에서 선택되어있는 디자이너의 직급을 가져와서 변수에 담음
		var category = "${detail.hs_category}";

		//수정창 띄울시에 DB에 저장되어있는 디자이너의 직급을 가져와서 셀렉트박스에 체크시킴
	 	if (category == 1) {
			$("#hs_category").val(1).prop("selected", true);
		} else if (category == 2) {
			$("#hs_category").val(2).prop("selected", true);
		} else if (category == 3) {
			$("#hs_category").val(3).prop("selected", true);
		}
		 
		
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
			$(this).parents("span").children("label").hide();
		});
		
		$("")
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
	
	<c:set var="hs_img2" value="${fn:substringAfter(detail.hs_img2,'_') }"/>
	<c:set var="hs_img2" value="${fn:substringAfter(hs_img2,'_') }"/>
	
	<c:set var="hs_img3" value="${fn:substringAfter(detail.hs_img3,'_') }"/>
	<c:set var="hs_img3" value="${fn:substringAfter(hs_img3,'_') }"/>
	
	<c:set var="hs_img4" value="${fn:substringAfter(detail.hs_img4,'_') }"/>
	<c:set var="hs_img4" value="${fn:substringAfter(hs_img4,'_') }"/>
	<div id="contents">
		<form id="updateForm" enctype="multipart/form-data" method="POST">


			<!-- 수정 및 삭제를 위한 값 -->
			<input type="hidden" id="hs_num" name="hs_num"
				value="${detail.hs_num}"> <input type="hidden"
				name="hs_thumb" id="hs_thumb" value="${detail.hs_thumb}"> <input
				type="hidden" name="hs_img1" id="hs_img1" value="${detail.hs_img1}">
				 <input
				type="hidden" name="hs_img2" id="hs_img2" value="${detail.hs_img2}">
				 <input
				type="hidden" name="hs_img3" id="hs_img3" value="${detail.hs_img3}">
				 <input
				type="hidden" name="hs_img4" id="hs_img4" value="${detail.hs_img4}">
			<h3>HairStyle 게시판 관리 - 상세보기 및 수정</h3>
			<!-- 목록으로 버튼 -->
			<div id="listMenu" align="right">
				<p>
					<input type="button" value="목록으로" class="btn" id="ListBtn">
				</p>
			</div>
			<p align="right"><b><label class="required">*</label> 항목은 필수 입력 값입니다.</b></p>
			<hr>
			<!--수정 및 상세보기 폼 출력 -->
			<div class="formLine">
				<span class="item"> <b><label class="required">*</label>카테고리</b></span>
				<select id="hs_category" name="hs_category" class="form-control">
					<option value="1">남성</option>
					<option value="2">여성</option>
					<option value="3">컬러</option>
				</select>
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> <b><label class="required">*</label>제품명</b>
				</span> <input type="text" id="hs_title" name="hs_title"class="form-control"
					value="${detail.hs_title}">
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> <b><label class="required">*</label>특징</b>
				</span> <textarea rows="20" cols="5" id="hs_content" name="hs_content" size="50"
					placeholder="간략한 설명을 입력하세요." class="form-control">${detail.hs_content}</textarea>
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> <b><label class="required">*</label>썸네일이미지</b>
				</span> <span class="imgBtn"><label for="img">${hs_thumb__}</label>
					<input type="button" class="imgUpdateBtn" value="이미지수정"><input
					type="file" name="uploadFile" id="uploadFile" class="uploadFile"></span>
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> <b>상세이미지1</b>
				</span> <span class="imgBtn"><label for="img">${hs_img1__}</label> <input
					type="button" class="imgUpdateBtn" value="이미지수정"><input
					type="file" name="uploadFile2" id="uploadFile2" class="uploadFile"></span>
			</div>
			<hr>
			<div class="formLine">
				<span class="item"><b>상세이미지2</b>
				</span> <span class="imgBtn"><label for="img">${hs_img2}</label> <input
					type="button" class="imgUpdateBtn" value="이미지수정"><input
					type="file" name="uploadFile3" id="uploadFile3" class="uploadFile"></span>
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> <b>상세이미지3</b>
				</span> <span class="imgBtn"><label for="img">${hs_img3}</label> <input
					type="button" class="imgUpdateBtn" value="이미지수정"><input
					type="file" name="uploadFile4" id="uploadFile4" class="uploadFile"></span>
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> <b>상세이미지4</b>
				</span> <span class="imgBtn"><label for="img">${hs_img4}</label> <input
					type="button" class="imgUpdateBtn" value="이미지수정"><input
					type="file" name="uploadFile5" id="uploadFile5" class="uploadFile"></span>
			</div>
			<hr>
		</form>
	<div align="right">
		<input type="button" value="수정완료" class="btn" id="UpdateBtn">
		<input type="button" value="게시글 삭제" class="btn" id="DeleteBtn">

	</div>
	</div>
	<!-- 수정 및 삭제 버튼  -->
</body>
</html>