<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript">

$(function() {
	//목록으로 버튼 클릭 시
	$("#ListBtn").click(function() {
		location.href = "HairStyleList.do";
	});
	//수정완료 버튼 클릭시
	$("#UpdateBtn").click(function() {
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
});

</script>
<title>Insert title here</title>
</head>
<body>
	<div id="contents">
		<form id="updateForm" enctype="multipart/form-data" method="POST">
			<h3>HairGoods 게시판 관리 - 등록</h3>
			<p align="right">* 항목은 필수 입력 값입니다.</p>
			<!-- 목록으로 버튼 -->
			<div id="listMenu">
				<p>
					<input type="button" value="목록으로" class="but" id="ListBtn">
				</p>
			</div>
			<hr>
			<!-- 수정 및 삭제를 위한 PK값 -->
			<input type="text" id="hs_num" name="hs_num" value="${detail.hs_num }">
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
				</span> <span class="imgBtn"> <input type="text" id="hs_thumb" name="hs_thumb" value="${detail.hs_thumb}"> </span>
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
	<!-- 수정 및 삭제 버튼  -->
	<div>
		<input type="button" value="수정완료" class="but" id="UpdateBtn">
		<input type="button" value="게시글 삭제" class="but" id="DeleteBtn">

	</div>
</body>
</html>