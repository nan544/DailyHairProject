<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>PassWord 찾기</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">

	<!-- Favicons -->
	<link href="/resources/assets/img/DHS-icon.png" rel="icon">
	<link href="/resources/assets/img/DHS-icon.png" rel="apple-touch-icon">
   
   <!-- Google Fonts -->
   <link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,600,600i,700,700i|Satisfy|Comic+Neue:300,300i,400,400i,700,700i" rel="stylesheet">
   
   <!-- Vendor CSS Files -->
   <link rel="stylesheet" type="text/css" href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" >
   <link rel="stylesheet" type="text/css" href="/resources/assets/vendor/icofont/icofont.min.css" >
   <link rel="stylesheet" type="text/css" href="/resources/assets/vendor/boxicons/css/boxicons.min.css" >
   <link rel="stylesheet" type="text/css" href="/resources/assets/vendor/animate.css/animate.min.css" >
   <link rel="stylesheet" type="text/css" href="/resources/assets/vendor/venobox/venobox.css" >
   <link rel="stylesheet" type="text/css" href="/resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css" >
   
   <!-- Template Main CSS File -->
   <link rel="stylesheet" type="text/css" href="/resources/assets/css/style.css" >
   
   <!-- =======================================================
   * Template Name: Delicious - v2.0.0
   * Template URL: https://bootstrapmade.com/delicious-free-restaurant-bootstrap-theme/
   * Author: BootstrapMade.com
   * License: https://bootstrapmade.com/license/
   ======================================================== -->

   <!-- Vendor JS Files -->
   <script src="/resources/assets/vendor/jquery/jquery.min.js"></script>
   <script src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <script src="/resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
   <script src="/resources/assets/vendor/php-email-form/validate.js"></script>
   <script src="/resources/assets/vendor/jquery-sticky/jquery.sticky.js"></script>
   <script src="/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
   <script src="/resources/assets/vendor/venobox/venobox.min.js"></script>
   <script src="/resources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>

   <!-- Template Main JS File -->
   <script type="text/javascript" src="/resources/assets/js/main_main.js"></script>

   <!-- 모바일 웹 페이지 설정 -->
   <link rel="shortcut icon" href="/resources/image/icon.png" />
   <link rel="apple-touch-icon" href="/resources/image/icon.png" />
   <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
   
   <script type="text/javascript">
   // 로그인 버튼 이벤트
   function login() {
      location.replace("/member/login/login.do"); }
   
   // 회원가입 버튼 이벤트
   function join(){
      location.replace("/member/clause.do"); }
   
   // ID 찾기 버튼 이벤트
   function IDfind(){
      location.replace("/member/login/idFind.do"); }
   
   $(function() {
	   
	   var msg = "<c:out value='${msg}'/>";

		if (msg != "") {
			alert(msg);
		}
	   
	   $("#pwFindBtn").click(function() {
		 	//필수 입력 요소들을 입력하지 않고 가입 버튼을 눌렀을 때 못넘어가게 함
			if ($("#m_id").val() == "") {
				alert("필수 입력 요소들을 모두 입력해주시기 바랍니다.");		//아이디
				$("#m_id").focus();
				return false;
			}
			if ($("#m_email").val() == "") {
				alert("필수 입력 요소들을 모두 입력해주시기 바랍니다.");		//이메일
				$("#m_email").focus();
				return false;
			}
		   
		   $("#pwFindForm").attr("method", "post");
		   $("#pwFindForm").attr("action", "/member/login/pwFind.do");
		   $("#pwFindForm").submit();
		   alert("패스워드 변경창으로 이동합니다.");
		});
	   
	});
   
   function enterkey() {
       if (window.event.keyCode == 13) {
            // 엔터키가 눌렸을 때 실행할 내용
    	   $("#pwFindForm").attr("method", "post");
		   $("#pwFindForm").attr("action", "/member/login/pwFind.do");
		   $("#pwFindForm").submit();
       }
	}
</script>
   
   <style type="text/css">
      .msgbox { width: 75px; }
      .PWfind_main { margin: 0 auto; margin-top: 15px;
               width: 500px; }
      .PW_form { width: 450px; }
      .PW_find1 { float: left;
               width: 300px; height: 100px; }
      .PW_find2 { float: right;
               width: 150px; height: 100px; }
               
      .PWfind_btn { width: 125px; height: 65px;
               background: #ffb03b; color: #fff;
               border: 0; border-radius: 25px;
               text-align: center; font-size: 15px; }
               
      .other_btn { width: 100px; height: 35px;
               text-align: center;
               cursor: pointer;
               display: inline-block;
               font-size: 10px;
               padding: 8px 16px 10px 16px;
               font-weight: 500;
               line-height: 1;
               color: #444444;
               margin: 0 3px 10px 3px;
               transition: all ease-in-out 0.3s;
               	background: #fffaf3;
				border: 2px dashed #ffb03b;
				border-radius: 25px; }
		.other_btn:hover { background: #FFE08C; }
   </style>
</head>

<body>
   <!-- header 삽입 -->
   <jsp:include page="/WEB-INF/views/client/main/header.jsp"></jsp:include>
   
   <!-- ======= Join Section ======= -->
   <section id="about" class="about">
   <div class="container-fluid" >
      <div class="row">
         <!-- 최상단 구분 -->
         <div style="width: 100%; height: 150px; margin-bottom: 50px;">
         </div><br>
         
         <!-- PW 찾기 -->
         <div style="margin: 0 auto;" align="center">
            <div style="margin-bottom: 30px; text-align: center;">
               <h1 style="font-size: 50px;">DailyHairShop</h1>
               <h4>ID와 가입시 입력한 Email로 PW를 간편하게 수정하세요.</h4>
            </div><br>
            
            <div class="PWfind_main" align="center">
               <form role="form" id="pwFindForm" name="pwFindForm">
               <div class="PW_form">
                  <div class="PW_find1">
                     <label class="msgbox" for="m_id">ID</label>
                     <input type="text" id="m_id" name="m_id" placeholder=" ID">
                     <label class="msgbox" for="m_email">Email</label>
                     <input type="email" id="m_email" name="m_email" placeholder=" Email" onkeyup="enterkey();">
                  </div>
                  <div class="PW_find2">
                     <input type="button" class="PWfind_btn" id="pwFindBtn" name="pwFindBtn" value="PW 찾기" onclick="IDmodify()">
                  </div>
               </div><br> <!-- 줄 바꿈 효과 -->
               
               <!-- 로그인, 회원가입, ID 찾기 버튼 -->
               <div>
                  <input type="button" class="other_btn" value="로그인" onclick="login()">
                  <input type="button" class="other_btn" value="회원가입" onclick="join()">
                  <input type="button" class="other_btn" value="ID 찾기" onclick="IDfind()">
               </div>
               </form>
            </div>
         </div>
         
         <!-- 하단 여백 -->
         <div style="width: 100%; height: 175px; margin-bottom: 50px;">
         </div>
      </div>
   </div>
   </section><!-- End Join Section -->
   
   <!-- footer 삽입 -->
   <jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
</body>
</html>