<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>회원가입</title>
<style type="text/css">

</style>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->
<!--[if lt IE 9]>
<script src="/resources/include/js/html5shiv.js"></script>
<![endif]-->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
//아이디 정규식
var idJ = /^[a-z0-9]{6,13}$/;
//비밀번호 정규식
var pwJ = /^[a-z0-9]{10,18}$/; 
//이름 정규식
var nameJ = /^[가-힣]{2,6}$/;
//이메일 검사 정규식
var mailJ = /^[A-Za-z0-9]{0,20}$/;
//휴대폰 번호 정규식
var phoneJ = /^[0-9]{11,11}$/;

$(function(){
	
	
	$("#insertBtn").attr("disabled",true);
	
	
	//아이디 정규식
	$("#m_id").blur(function() {
		if(idJ.test($("#m_id").val())){
			$("#id_check").text("");
		}else{
			$("#id_check").text("6~13자리 영문 소문자와 숫자만 입력 해주시길 바랍니다.")
			$("#id_check").css("color", "red");
			return false;
		}
	});
	
	//비밀번호 정규식
	$("#m_pwd").blur(function() {
		if(pwJ.test($("#m_pwd").val())){
			$("#pwd_check").text("");
		}else{
			$("#pwd_check").text("10~18자리 영문 소문자와 숫자만 입력 해주시길 바랍니다.")
			$("#pwd_check").css("color", "red");
			return false;
		}
	});
	
	//이름 정규식
	$("#m_name").blur(function() {
		if(nameJ.test($("#m_name").val())){
			$("#name_check").text("");
		}else{
			$("#name_check").text("2~6자리 완전한 이름만 입력 해주시길 바랍니다.")
			$("#name_check").css("color", "red");
			return false;
		}
	});
	
	//전화번호 정규식
	$("#m_phone").blur(function() {
		if(phoneJ.test($("#m_phone").val())){
			$("#phone_check").text("");
		}else{
			$("#phone_check").text("11자리까지 번호만 입력 해주시길 바랍니다.")
			$("#phone_check").css("color", "red");
			return false;
		}
	});
	
	//이메일 정규식
	$("#m_email").blur(function() {
		if(mailJ.test($("#m_email").val())){
			$("#email_check").text("");
		}else{
			$("#email_check").text("20자리 영문 대소문자와 숫자만 입력 해주시길 바랍니다.")
			$("#email_check").css("color", "red");
			return false;
		}
	});
	
	$("#insertBtn").click(function(){
		//필수 입력 요소들을 입력하지 않고 가입 버튼을 눌렀을 때 못넘어가게 함
		if($("#m_id").val()==""){
			alert("필수 입력 요소들을 모두 입력해주시기 바랍니다.");
			$("#m_id").focus();
			return false;
		}if($("#m_pwd").val()==""){
			alert("필수 입력 요소들을 모두 입력해주시기 바랍니다.");
			$("#m_pwd").focus();
			return false;
		}if($("#m_pwd2").val()==""){
			alert("필수 입력 요소들을 모두 입력해주시기 바랍니다.");
			$("#m_pwd2").focus();
			return false;
		}if($("#m_pwd").val() != $("#m_pwd2").val()){	//비밀번호와 비밀번호 확인이 일치하는지 확인
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }if($("#m_name").val()==""){
			alert("필수 입력 요소들을 모두 입력해주시기 바랍니다.");
			$("#m_name").focus();
			return false;
		}if($("#m_phone").val()==""){
			alert("필수 입력 요소들을 모두 입력해주시기 바랍니다.");
			$("#m_phone").focus();
			return false;
		}if($("#m_email").val()==""){
			alert("필수 입력 요소들을 모두 입력해주시기 바랍니다.");
			$("#m_email").focus();
			return false;
		}
		var idChkVal = $("#idChk").val();
		if(idChkVal == "N"){
			alert("중복체크를 해주시길 바랍니다.");
			return false;
		}else if(idChkVal == "Y"){
			$("#insertForm").submit();
		}
		
		//이메일의 앞 부분 텍스트와 뒷부분 주소를 합침
		$("#m_email").val($("#m_email").val()+"@"+$("#emailDomain").val());
		
		
		//가입 버튼을 눌렀을 때 post형식으로 보냄시킴
		$("#insertForm").attr("method","post");
		$("#insertForm").attr("action","/member/join.do");
		$("#insertForm").submit();
	});
});

	function fn_idChk() {
		
		var id = $("#m_id").val();
		
		//아이디 정규식
			if(idJ.test($("#m_id").val())){
				$("#id_check").text("");
			}else{
				$("#id_check").text("6~13자리 영문 소문자와 숫자만 입력 해주시길 바랍니다.")
				$("#id_check").css("color", "red");
				return false;
			}
		
		$.ajax({
			url : "/member/idChk.do",
			type : "post",
			data : {"m_id" : id },
			success : function(data) {
				if(data == 1){
					alert("사용 불가능한 아이디입니다.");
				}else if(data == 0){
					$("#idChk").attr("value", "Y");
					alert("사용 가능한 아이디입니다.");
					$("#insertBtn").attr("disabled",false);
				}
			}
		});
	}
</script>
</head>
<body>

<div>
<h2 class="text-light"><a href="/client/main.do"><span>DailyHairShop</span></a></h2>
<form role="form" id="insertForm" name="insertForm">
	<div>
		<label for="m_Id">아이디<span style="color: red;"> *</span></label><br>
		<input type="text" id="m_id" name="m_id" placeholder="아이디"/>
		<button type="button" id="idChk" name="idChk" onclick="fn_idChk();" value="N">중복체크</button><br>
		<div id="id_check" style="font-size:11px;"></div>
	</div>
	<div>
		<label for="m_Pwd">패스워드<span style="color: red;"> *</span></label><br>
		<input type="password" id="m_pwd" name="m_pwd" placeholder="패스워드"/><br>
		<div id="pwd_check" style="font-size:11px;"></div>
		<label for="m_Pwd">패스워드 확인<span style="color: red;"> *</span></label><br>
		<input type="password" id="m_pwd2" placeholder="패스워드 확인"/>
	</div>
	<div>
		<label for="m_Name">이 름<span style="color: red;"> *</span></label><br>
		<input type="text" id="m_name" name="m_name" placeholder="이름"/>
		<div id="name_check" style="font-size:11px;"></div>
	</div>
	<div>
		<label>성 별<span style="color: red;"> *</span></label><br>
		<input type="radio" id="m_gender1" name="m_gender" value="남" checked="checked"/>
		<label for="m_Gender1">남</label>
		<input type="radio" id="m_gender2" name="m_gender" value="여" />
		<label for="m_Gender2">여</label>
	</div>
	<div>
		<label for="m_Phone">전화번호<span style="color: red;"> *</span></label><br>
		<input type="text" id="m_phone" name="m_phone" placeholder="전화번호"/>
		<div id="phone_check" style="font-size:11px;"></div>
	</div>
	<div>
		<label for="m_Email">이메일<span style="color: red;"> *</span></label><br>
		<input type="text" id="m_email" name="m_email" placeholder="이메일"/>@
		<select id="emailDomain">
			<option value="gmail.com">구글</option>
			<option value="naver.com">네이버</option>
			<option value="daum.com">다음</option>
			<option value="nate.com">네이트</option>
		</select><br>
		<div id="email_check" style="font-size:11px;"></div>
	</div>
	<div>
		<label for="m_Memo">추가사항</label><br>
		<textarea rows="8" cols="40" id="m_memo" name="m_memo" placeholder="DailyHair에 알리고 싶은 개인사항"></textarea>
	</div>
		<div>
		<input type="button" id="insertBtn" name="insertBtn" value="가입"/>
		<a href="/client/main.do"><input type="button" value="취소"></a>
		</div>
	</form>
</div>
</body>
</html>