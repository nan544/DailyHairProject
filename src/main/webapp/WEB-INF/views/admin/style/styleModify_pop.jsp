<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시술수정</title>
<style type="text/css">
span {
	color: red;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">


	$(function(){
		//닫기 버튼 클릭시 닫기
		$("#closeBtn").click(function(){
			window.close();	
		});
		
		
		//수정버튼 클릭시 실행
		$("#updateBtn").click(function(){
			
			var styling_num = $("#styling_num").val();
			var styling_option = $("#styling_option").val();
			var styling_name = $("#styling_name").val();
			var styling_price = $("#styling_price").val();
			
			if (!chkSubmit($("#styling_name"), "시술명을")) {
				return;
			}else if(styling_option == '#'){ 
				alert(" 시술구분을 선택하세요");
				return;
			}else if (!chkSubmit($("#styling_price"), "시술가격을")) {
				return;
			} else if (!numberChk($("#styling_price"))) {
				return;
			} else {
				if (confirm("수정하시겠습니까?")) {
					$.ajax({
						url : "/admin/style/updateStyling.do",
						type : "post",
						data : {
							"styling_num" : styling_num,
							"styling_option" : styling_option,
							"styling_name" : styling_name,
							"styling_price" : styling_price
						},
						success : function(data) {
							if (data == 1) {
								alert("시술 수정에 성공하였습니다.");
								window.close();
							} else {
								alert("시술 수정에 실패하였습니다.");
							}
						}
					});
				}
			}
		});
	});
</script>
</head>
<body>
<h1 align="center">시술정보 수정</h1>
	<form id="updateForm" name="updateForm">	
	<fieldset>
		<input type="hidden" name="styling_num" id="styling_num" value="${style.styling_num }"/>
		<p align="center">시술 정보</p>
		<hr>
		<table>
			<tr>
				<td><span>&nbsp;*</span>시술 구분</td>
				<td><select id="styling_option" name="styling_option">
						<option value="${style.styling_option}">${style.styling_option}</option>
						<option value="#">----------------</option>
						<option value="기본시술">기본시술</option>
						<option value="펌시술">펌 시술</option>
						<option value="기타1시술">기타1시술</option>
						<option value="기타2시술">기타2시술</option>
					</select></td>
				<td><span>&nbsp;*</span>시술명</td>
				<td><input type="text" name="styling_name" id="styling_name" value="${style.styling_name}"/></td>
				<td><span>&nbsp;*</span>시술가격</td>
				<td><input type="text" name="styling_price" id="styling_price" value="${style.styling_price}"/></td>
				<td><input type="button" name="updateBtn" id="updateBtn" value="수정"/></td>
				<td><input type="button" name="closeBtn" id="closeBtn" value="닫기"/></td>
		</table>
		</fieldset>
	</form>
</body>
</html>