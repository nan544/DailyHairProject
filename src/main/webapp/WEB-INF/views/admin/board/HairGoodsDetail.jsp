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
			$("label[for='img']").hide();
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="contents">
		<form id="updateForm" enctype="multipart/form-data" method="POST">
			<h3>HairGoods 게시판 관리 - 상세보기 및 수정</h3>
			<p align="right">* 항목은 필수 입력 값입니다.</p>
			<!-- 목록으로 버튼 -->
			<div id="listMenu">
				<p>
					<input type="button" value="목록으로" class="but" id="ListBtn">
				</p>
			</div>
			<hr>
			<!-- 수정 및 삭제를 위한 값 -->
			<input type="hidden" id="hg_num" name="hg_num"
				value="${detail.hg_num }">
			<input type="text" id="hg_thumb" name="hg_thumb" value="${detail.hg_thumb}">	
			<input type="text" id="hg_img1" name="hg_img1" value="${detail.hg_img1}">	
				
			<!--수정 및 상세보기 폼 출력 -->
			<div class="formLine">
				<span class="item"> <label class="required">*</label>제품명
				</span> <input type="text" id="hg_title" name="hg_title"
					value="${detail.hg_title}">
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> <label class="required">*</label>특징
				</span> <input type="text" id="hg_content" name="hg_content" size="50"
					placeholder="간략한 설명을 입력하세요." value="${detail.hg_content}">
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> <label class="required">*</label>썸네일이미지
				</span> <span class="imgBtn"><label for="img">${detail.hg_thumb}</label>
					<input type="button" class="imgUpdateBtn" value="이미지수정"><input type="file" name="uploadFile" id="uploadFile" class="uploadFile"></span>
			</div>
			<hr>
			<div class="formLine">
				<span class="item"> <label class="required">*</label>상세이미지
				</span> <span class="imgBtn"><label for="img">${detail.hg_img1}</label>
					<input type="button" class="imgUpdateBtn" value="이미지수정"><input type="file" name="uploadFile2" id="uploadFile2" class="uploadFile"></span>
			</div>
			<hr> 
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
	<div id="btnMenu">
		<input type="button" value="수정완료" class="but" id="UpdateBtn"> <input
			type="button" value="게시글 삭제" class="but" id="DeleteBtn">

	</div>
</body>
</html>