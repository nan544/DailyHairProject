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
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {

		$("#hairGoodsInsertBtn").click(function() {
			if (!chkData("#hg_title", "제품명을"))
				return;
			if (!chkData("#hg_content", "특징(한줄평)"))
				return;
			if (!chkFile($("#uploadFile"), "썸네일이미지를"))
				return;
			if (confirm("게시물을 등록 하시겠습니까?")) {
				var form = $("form");
				var formData = new FormData(form[0]);

				$.ajax({
					cache : false,
					url : 'HGInsert.do',
					processData : false,
					contentType : false,
					type : 'POST',
					data : formData,
					success : function(data) {
						if (data == 1) {
							alert("등록 완료");
							location.href = "/admin/board/HairGoodsList.do";
						} else {
							alert(data);
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
			location.href = "/admin/board/HairGoodsList.do";
		});
	});
</script>
<title>글 작성</title>
</head>
<body>

	<div id="contents">
		<form id="insertForm" enctype="multipart/form-data" method="POST">
			<h3>HairGoods 게시판 관리 - 등록</h3>
			<p align="right"><b><label class="required">*</label> 항목은 필수 입력 값입니다.</b></p>
			<hr>
			<div class="formLine">
				<span class="item"><b><label class="required">*</label> 제품명</b>
				</span> <input type="text" id="hg_title" name="hg_title" class="form-control">
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> <b><label class="required">*</label>특징</b>
				</span>
				<textarea id="hg_content" name="hg_content" cols="20" rows="5"
					placeholder="간략한 설명을 입력하세요." class="form-control"></textarea>
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> <b><label class="required">*</label>썸네일이미지</b>
				</span><input type="file" id="uploadFile" name="uploadFile" value="이미지 등록">
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> <b>상세이미지1</b> </span><input type="file"
					id="uploadFile2" name="uploadFile2" value="이미지 등록">
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> <b>상세이미지2</b> </span><input type="file"
					id="uploadFile3" name="uploadFile3" value="이미지 등록">
			</div>
			<hr>
			<div class="formLine">
				<span class="item"><b> 상세이미지3</b> </span><input type="file"
					id="uploadFile4" name="uploadFile4" value="이미지 등록">
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> <b>상세이미지4</b> </span><input type="file"
					id="uploadFile5" name="uploadFile5" value="이미지 등록">
			</div>
			<hr>
		</form>
	<div id="bottomMenu" align="right">
		<input type="button" value="등록완료" class="btn" id="hairGoodsInsertBtn">
		<input type="button" value="취 소" class="btn" id="cancel">
	</div>
	</div>
	<!-- 글 등록 버튼 시작-->
	<!-- 글 등록 버튼 끝-->
</body>
</html>