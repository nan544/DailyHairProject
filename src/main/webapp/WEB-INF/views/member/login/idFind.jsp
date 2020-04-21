<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>ID 찾기</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">

   <!-- Favicons -->
   <link href="/resources/assets/img/favicon.png" rel="icon">
   <link href="/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
   
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
   
   $(function() {
   });
   
   // 로그인 버튼 이벤트
   function login() {
      location.replace("/member/login/login.do"); }
   
   // 회원가입 버튼 이벤트
   function join(){
      location.replace("/member/clause.do"); }
   
   // PW 찾기 버튼 이벤트
   function PWfind(){
      location.replace("/member/login/pwFind.do"); }
   </script>
   
   <style type="text/css">
      .msgbox { width: 75px; padding: 10px; }
      .IDfind_btn { width: 125px; height: 35px;
               background: #ffb03b; color: #fff;
               border: 0; border-radius: 25px;
               transition: 0.4s;
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
         
         <div style="margin: 0 auto;" align="center">
            <div style="margin-bottom: 30px; text-align: center;">
               <h1 style="font-size: 50px;">DailyHairShop</h1>
               <h4>가입시 입력한 Email로 ID를 간편하게 찾으세요.</h4>
            </div><br>
            
            <form role="form" id="idFindForm" name="idFindForm">
            <div>
               <label class="msgbox" for="m_email">Email</label>
               <input type="text" id="m_email" name="m_email" placeholder=" Email"
                  style="margin-right: 15px;">
               <input type="button" class="IDfind_btn" id="idFindBtn" name="idFindBtn" value="ID 찾기">
            </div><br>
            
            <div>
               <input type="button" class="other_btn" value="로그인" onclick="login()">
               <input type="button" class="other_btn" value="회원가입" onclick="join()">
               <input type="button" class="other_btn" value="PW 찾기" onclick="PWfind()">
            </div>
            </form>
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