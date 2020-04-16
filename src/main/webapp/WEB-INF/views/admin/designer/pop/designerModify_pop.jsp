<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디자이너 수정</title>
<style type="text/css">
span {
	color: red;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/include/js/designer.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
		//활성화되어있는 디자이너 수정시 활성화 버튼은 비활성화시키고
		//반대의 경우는 비활성화버튼을 비활성화시킴
		var des_state = "${des.des_state}";
		if (des_state == 1) {
			$("#openBtn").attr("disabled", true);
		} else {
			$("#deleteBtn").attr("disabled", true);
		}

		//수정할 디자이너의 번호를 설정함
		var des_num = "${des.des_num}";
		$("#des_num").val(des_num);

		//선택된 디자이너의 성별값을 변수에 담음
		var gender = "${des.des_gender}";
		//수정창 띄울시 DB에 저장되어있는 디자이너의 성별을 가져와서 라디오버튼에 체크시킴.
		if (gender == "남성") {
			$('input:radio[name=des_gender]:input[value="남성"]').attr("checked",
					true);
		} else if (gender == "여성") {
			$('input:radio[name=des_gender]:input[value="여성"]').attr("checked",
					true);
		}

		//수정창 띄울시에 DB에서 선택되어있는 디자이너의 직급을 가져와서 변수에 담음
		var job = "${des.des_job}";

		//수정창 띄울시에 DB에 저장되어있는 디자이너의 직급을 가져와서 셀렉트박스에 체크시킴
		if (job == "원장") {
			$("#des_job").val("원장").prop("selected", true);
		} else if (job == "실장") {
			$("#des_job").val("실장").prop("selected", true);
		} else if (job == "디자이너") {
			$("#des_job").val("디자이너").prop("selected", true);
		}
		
		//수정창 띄울시에 DB에서 선택되어있는 디자이너의 직급을 가져와서 변수에 담음
		var holyday = "${des.des_holyday}";

		//수정창 띄울시에 DB에 저장되어있는 디자이너의 직급을 가져와서 셀렉트박스에 체크시킴
		if (holyday == "월요일") {
			$("#des_holyday").val("월요일").prop("selected", true);
		} else if (holyday == "화요일") {
			$("#des_holyday").val("화요일").prop("selected", true);
		} else if (holyday == "수요일") {
			$("#des_holyday").val("수요일").prop("selected", true);
		}else if (holyday == "목요일") {
			$("#des_holyday").val("목요일").prop("selected", true);
		}else if (holyday == "금요일") {
			$("#des_holyday").val("금요일").prop("selected", true);
		}else if (holyday == "토요일") {
			$("#des_holyday").val("토요일").prop("selected", true);
		}else if (holyday == "일요일") {
			$("#des_holyday").val("일요일").prop("selected", true);
		}
		
		
		//닫기버튼 클릭시 팝업창 닫기
		$("#closeBtn").click(function() {
			window.close();
		});

		//수정버튼 클릭시 실행 비동기로 보내서 수정완료시 1리턴 실패시0 리턴
		//성공시에는 팝업창을 닫고 부모창을 새로고침시켜서 수정값을 적용시킴
		$("#modifyBtn").click(
				function() {
					updateDes();
					/* $.ajax({
						url : "/admin/designer/designerUpdate.do",
						type : "POST",
						data : "des_num=" + $("#des_num").val() + "&des_job="
								+ $("#des_job").val() + "&des_phone="
								+ $("#des_phone").val() + "&des_holyday="
								+ $("#des_holyday").val() + "&des_gender="
								+ $("input[name='des_gender']:checked").val()
								+ "&des_memo=" + $("#des_memo").val()
								+ "&des_file=" + $("#des_file").val(),
						success : function(data) {

							if (data == 1) {
								alert("디자이너 수정에 성공하였습니다.");
								opener.parent.location.reload();
								window.close();
							} else {
								alert("디자이너 수정에 실패하였습니다.");
							}
						}
					}); */ //수정 ajax 종료

				});  //수정버튼 이벤트 종료

		//디자이너 비활성화 버튼 클릭시 실행
		$("#deleteBtn").click(function() {
			if (confirm("정말로 비활성화시키시겠습니까?")) {
				$.ajax({
					url : "/admin/designer/designerDelete.do",
					type : "POST",
					data : "des_num=" + $("#des_num").val(),
					success : function(data) {
						if (data == 1) {
							alert("비활성화 완료");
							opener.parent.location.reload();
							window.close();
						} else {
							alert("비활성화 실패");
						}
					}
				}); //비활성화  ajax종료
			}
		});// 디자이너 비활성화 이벤트 종료

		//디자이너 활성화 버튼 클릭시 실행
		$("#openBtn").click(function() {
			if (confirm("정말로 활성화시키시겠습니까?")) {
				$.ajax({
					url : "/admin/designer/designerOpen.do",
					type : "POST",
					data : "des_num=" + $("#des_num").val(),
					success : function(data) {
						if (data == 1) {
							alert("활성화 완료");
							opener.parent.location.reload();
							window.close();
						} else {
							alert("활성화 실패");
						}
					}
				}); //활성화  ajax종료
			}
		}); //디자이너 활성화 이벤트 종료
		
	});
</script>
</head>
<body>
	<h1>디자이너 수정</h1>
	<hr>
	<c:if test="${des.des_state == 0}">
		<p>
			<span>*&nbsp;</span>현재상태 : '비활성화'
		</p>
	</c:if>
	<c:if test="${des.des_state == 1}">
		<p>
			<span>*&nbsp;</span>현재상태 : '활성화'
		</p>
	</c:if>
	<input type="button" name="openBtn" id="openBtn" value="활성화" /> <input
			type="button" name="deleteBtn" id="deleteBtn" value="비활성화" />
	<hr>
	<form name="modifyForm" id="modifyForm" enctype="multipart/form-data">
		<input type="hidden" name="des_num" id="des_num"
			value="${des.des_num}" />
			<input type="hidden" name="des_file" id="des_file" value="${des.des_file}"/>
		<table>
			<tr>
				<td><span>*&nbsp;</span>이름</td>
				<td><input type="text" name="des_name" id="des_name" size="15"
					maxlength="5" value="${des.des_name}" readonly="readonly" /></td>
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
					placeholder="010-1234-1234" size="15" maxlength="13"
					value="${des.des_phone}" /></td>
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
				<td><label for="des_gender1">남성</label> <input type="radio"
					name="des_gender" id="des_gender1" value="남성" /> <label
					for="des_gender2">여성</label> <input type="radio" name="des_gender"
					id="des_gender2" value="여성" /></td>
			</tr>
			<tr>
				<td>특이사항</td>
				<td><input type="text" name="des_memo" id="des_memo" size="50"
					placeholder="특이사항을 입력해주세요" maxlength="50" value="${des.des_memo}" />
			</tr>
			<tr>
				<td>이력서</td>
				<td><input type="file" name="file" id="file"></td>
			</tr>
		</table>
	</form>
	<div class="buttonContainer">
		<input type="button" name="modifyBtn" id="modifyBtn" value="수정" /> <input
			type="button" name="closeBtn" id="closeBtn" value="닫기" />
	</div>
</body>
</html>