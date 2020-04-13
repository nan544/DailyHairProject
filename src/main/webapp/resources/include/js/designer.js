
//입력값 체크후 디자이너 등록하기
function insertDes() {
	if (!chkSubmit($("#des_name"), "이름을")) {
		return;
	} else if (!chkSubmit($("#des_job"), "직급을")) {
		return;
	} else if (!chkSubmit($("#des_phone"), "연락처를")) {
		return;
	} else if (!inputVerify(2, "#des_phone")) {
		alert("연락처 형식에 맞지않습니다.");
		return;
	} else if (!chkSubmit($("#des_holyday"), "휴무일을")) {
		return;
	} else {
		$.ajax({
			url : "/admin/designer/designerJoin.do",
			type : "post",
			data : "des_name=" + $("#des_name").val() + "&des_job="
					+ $("#des_job").val() + "&des_phone="
					+ $("#des_phone").val() + "&des_holyday="
					+ $("#des_holyday").val() + "&des_gender="
					+ $("input[name='des_gender']:checked").val()
					+ "&des_memo=" + $("#des_memo").val() + "&des_file="
					+ $("#des_file").val(),
			success : function(data) {
				if (data == 1) {
					alert("디자이너 등록에 성공하였습니다.");
					opener.parent.location.reload();
					window.close();
				} else {
					alert("디자이너 등록에 실패하였습니다.");
					loaction.reload(true);
				}
			}

		});
	}
}

// 입력값 체크후 디자이너 수정하기
function updateDes() {
	if (!chkSubmit($("#des_name"), "이름을")) {
		return;
	} else if (!chkSubmit($("#des_job"), "직급을")) {
		return;
	} else if (!chkSubmit($("#des_phone"), "연락처를")) {
		return;
	} else if (!inputVerify(2, "#des_phone")) {
		alert("연락처 형식에 맞지않습니다.");
		return;
	} else if (!chkSubmit($("#des_holyday"), "휴무일을")) {
		return;
	} else {
		$.ajax({
			url : "/admin/designer/designerUpdate.do",
			type : "POST",
			data : "des_num=" + $("#des_num").val() + "&des_job="
					+ $("#des_job").val() + "&des_phone="
					+ $("#des_phone").val() + "&des_holyday="
					+ $("#des_holyday").val() + "&des_gender="
					+ $("input[name='des_gender']:checked").val()
					+ "&des_memo=" + $("#des_memo").val() + "&des_file="
					+ $("#des_file").val(),
			success : function(data) {

				if (data == 1) {
					alert("디자이너 수정에 성공하였습니다.");
					opener.parent.location.reload();
					window.close();
				} else {
					alert("디자이너 수정에 실패하였습니다.");
				}
			}
		});
	}
}