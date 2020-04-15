<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디자이너 등록</title>
<style type="text/css">
span {
	color: red;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/include/js/designer.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {

		//닫기버튼 클릭시 팝업창 닫기
		$("#closeBtn").click(function() {
			window.close();
		});

		//등록하기버튼 클릭시 실행
		$("#insertBtn").click(function() {
			//유효성 검사 후 등록하기 실행.
			insertDes();
				
				/* 	$.ajax({
						url : "/admin/designer/designerJoin.do",
						type : "post",
						data : "des_name=" + $("#des_name").val() + "&des_job="
								+ $("#des_job").val() + "&des_phone="
								+ $("#des_phone").val() + "&des_holyday="
								+ $("#des_holyday").val() + "&des_gender="
								+ $("input[name='des_gender']:checked").val()
								+ "&des_memo=" + $("#des_memo").val()
								+ "&des_file=" + $("#des_file").val(),
						success : function(data) {
							if (data == 1) {
								alert("디자이너 등록에 성공하였습니다.");
								opener.parent.location.reload();
								window.close();
							}else{
								alert("디자이너 등록에 실패하였습니다.");
								loaction.reload(true);
							}
						}
						
					}); */
			
				});
	});
</script>
</head>
<body>
	<div class="joinheader">
		<h1>디자이너 등록</h1>
		<label><span>*&nbsp;</span>부분은 필수입력 입니다.</label>
		<hr align="left" width="650">
	</div>
	<div class="joinContainer">
		<form name="insertForm" id="insertForm" enctype="multipart/form-data">
			<table>
				<tr>
					<td><span>*&nbsp;</span>이름</td>
					<td><input type="text" name="des_name" id="des_name"
						placeholder="이름을 입력해주세요" size="15" maxlength="5" /></td>
				</tr>
				<tr>
					<td><span>*&nbsp;</span>직급</td>
					<td><select name="des_job" id="des_job">
							<option value="">직급 선택</option>
							<option value="원장">원 장</option>
							<option value="실장">실 장</option>
							<option value="디자이너">디자이너</option>
					</select></td>
				</tr>
				<tr>
					<td><span>*&nbsp;</span>연락처</td>
					<td><input type="text" name="des_phone" id="des_phone"
						placeholder="010-1234-1234" size="15" maxlength="13" /></td>
				</tr>
				<tr>
					<td><span>*&nbsp;</span>휴무일</td>
					<td><select name="des_holyday" id="des_holyday">
							<option value="">선택하세요</option>
							<option value="월요일">월요일</option>
							<option value="화요일">화요일</option>
							<option value="수요일">수요일</option>
							<option value="목요일">목요일</option>
							<option value="금요일">금요일</option>
							<option value="토요일">토요일</option>
							<option value="일요일">일요일</option>
						</select></td>
				</tr>
				<tr>
					<td><span>*&nbsp;</span>성별</td>
					<td><label for="des_gender1">남성</label><input type="radio"
						name="des_gender" id="des_gender1" value="남성" checked="checked"/> <label
						for="des_gender2">여성</label><input type="radio" name="des_gender"
						id="des_gender2" value="여성" /></td>
				</tr>
				<tr>
					<td>특이사항</td>
					<td><input type="text" name="des_memo" id="des_memo" size="50"
						placeholder="특이사항을 입력해주세요" maxlength="50" />
				</tr>
				<tr>
					<td>이력서</td>
					<td><input type="file" name="des_file" id="des_file"></td>
				</tr>
			</table>
		</form>
		<div class="buttonContainer">
			<input type="button" name="insertBtn" id="insertBtn" value="등록하기" />
			<input type="button" name="closeBtn" id="closeBtn" value="닫기" />
		</div>
	</div>


</body>
</html>

