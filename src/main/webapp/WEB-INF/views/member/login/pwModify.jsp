<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>PassWord 수정</title>
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
   <!-- 모바일 웹 페이지 설정 끝 -->
   <!--[if lt IE 9]>
   <script src="/resources/include/js/html5shiv.js"></script>
   <![endif]-->
   <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
   
   <script type="text/javascript">
   // PW 수정 확인 버튼 이벤트 (임시)
   function ModifyEnd(){
      alert("임시로 작동하는 알람창입니다.\n기능을 구현해주세요.")
      alert("비밀번호가 정상적으로 수정되었습니다.\n로그인 화면으로 이동합니다.")
      location.replace("/member/login/login.do"); }
   
   // 로그인 버튼 이벤트
   function login() {
      location.replace("/member/login/login.do"); }
   
   // 회원가입 버튼 이벤트
   function join(){
      location.replace("/member/clause.do"); }
   
   // ID 찾기 버튼 이벤트
   function IDfind(){
      location.replace("/member/login/idFind.do"); }
   </script>
   
   <style type="text/css">
      .msgbox { width: 135px; }
      .PWfind_main { margin: 0 auto; margin-top: 15px;
               width: 500px; }
      .PW_form { width: 500px; }
      .PW_find1 { float: left;
               width: 350px; height: 100px; }
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
               background: white;
               border: 2px dashed #ffb03b;
               border-radius: 25px; }
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
               <h4>변경할 PassWord를 입력해주세요.</h4>
            </div><br>
            
            <div class="PWfind_main" align="center">
               <form role="form" id="pwModifyForm" name="pwModifyForm">
               <div class="PW_form">
                  <div class="PW_find1">
                     <label class="msgbox" for="m_id">변경할 PW</label>
                     <input type="password" id="m_pwd" name="m_pwd" placeholder=" PassWord">
                     <label class="msgbox" for="m_email">PW 재입력</label>
                     <input type="password" id="m_pwd2" name="m_pwd2" placeholder=" PassWord">
                  </div>
                  <div class="PW_find2">
                     <input type="button" class="PWfind_btn" id="pwModifyBtn" name="pwModifyBtn" value="확인"
                        onclick="ModifyEnd()">
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