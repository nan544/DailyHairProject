<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container-fluid">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#navbar" aria-expanded="false"
			aria-controls="navbar">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#">DailyHair[관리자 페이지]</a>
		<c:if test="${login == '관리자'}">
			<div id="logout">
				<a href="/admin/logout.do">로그아웃</a>
			</div>
		</c:if>
	</div>
	<!-- 추후 필요 시 주석 해제
	<div id="navbar" class="navbar-collapse collapse">
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#">Dashboard</a></li>
			<li><a href="#">Settings</a></li>
			<li><a href="#">Profile</a></li>
			<li><a href="#">Help</a></li>
		</ul>
		<form class="navbar-form navbar-right">
			<input type="text" class="form-control" placeholder="Search...">
		</form>
	</div> -->
</div>