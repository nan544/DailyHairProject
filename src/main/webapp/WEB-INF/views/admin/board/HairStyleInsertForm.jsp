<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
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
		$("#hairGoodsInsertBtn").click(function() {
			if(!chkData("#hs_title","제목을")) return;
			if(!chkData("#hs_content","특징(한줄평)")) return;
			if(!chkFile($("#uploadFile"),"썸네일이미지를")) return;
			if (confirm("게시물을 등록 하시겠습니까?")) {
				var form = $("form");
				var formData = new FormData(form[0]);

				$.ajax({
					cache : false,
					url : 'HSInsert.do',
					processData : false,
					contentType : false,
					type : 'POST',
					data : formData,
					success : function(data) {
						if (data == 1) {
							alert("등록 완료");
							location.href = "/admin/board/HairStyleList.do";
						} else {
							alert("등록 실패");

						}
					},
					error : function() {
						alert("서버 오류 ");
					}
				});

			}
		});

		$("#cancel").click(function() {
			location.href = "/admin/board/HairStyleList.do";
		});
	});
</script>
<title>글 작성</title>
</head>
<body>

	<div id="contents">
		<form id="insertForm" enctype="multipart/form-data" method="POST">
			<h3>HairStyle 게시판 관리 - 등록</h3>
			<p align="right">* 항목은 필수 입력 값입니다.</p>
			<hr>
			<div class="formLine">
				<span class="item"> <label class="required">*</label>카테고리</span> 
				<select id="hs_category" name="hs_category">
					<option value="1">남성</option>
					<option value="2">여성</option>
					<option value="3">컬러</option>
				</select>
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> <label class="required">*</label>스타일명
				</span> <input type="text" id="hs_title" name="hs_title">
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> <label class="required">*</label>특징
				</span> <input type="text" id="hs_content" name="hs_content" size="50"
					placeholder="간략한 설명을 입력하세요.">
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> <label class="required">*</label>썸네일이미지
				</span><input type="file" id="uploadFile" name="uploadFile" value="이미지 등록">
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> 상세이미지
				</span><input type="file" id="uploadFile2" name="uploadFile2" value="이미지 등록">
			</div>
			<hr>
			<!-- <div class="formLine">
				<span class="item"> 이미지1 </span> <span class="imgBtn"> <input
					type="file" id="uploadFile" name="uploadFile" value="이미지 등록">
					<input type="button" id="img1Delete" name="img1Delete"
					value="이미지 삭제">
				</span>
			</div>
			<hr> -->
			<!-- 
			<div class="formLine">
				<span class="item"> 미구현 </span> <span class="1imgBtn"> <input
					type="button" id="img2Insert" name="img2Insert" value="이미지 등록">
					<input type="button" id="img2Delete" name="img2Delete"
					value="이미지 삭제">
				</span>
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> 미구현 </span> <span class="1imgBtn"> <input
					type="button" id="img3Insert" name="img3Insert" value="이미지 등록">
					<input type="button" id="img3Delete" name="img3Delete"
					value="이미지 삭제">
				</span>
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> 미구현 </span> <span class="1imgBtn"> <input
					type="button" id="img4Insert" name="img4Insert" value="이미지 등록">
					<input type="button" id="img24elete" name="img4Delete"
					value="이미지 삭제">

				</span>

			</div> -->
		</form>
	</div>
	<!-- 글 등록 버튼 시작-->
	<div id="bottomMenu">
		<input type="button" value="등록완료" class="but" id="hairGoodsInsertBtn">
		<input type="button" value="취 소" class="but" id="cancel">
	</div>
	<!-- 글 등록 버튼 끝-->
</body>
</html>