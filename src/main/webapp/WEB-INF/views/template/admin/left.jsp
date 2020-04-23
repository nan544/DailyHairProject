<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<div class="dropdown">
 <ul class="nav nav-sidebar dropdown">
            <li class="active"><a href="/admin/reservation/adminReservationList.do">메인 페이지<span class="sr-only">(current)</span></a></li>
            <li><a href="/admin/member/memberList.do">회원 관리</a></li>
            <li><a href="/admin/reservation/adminReservationList.do">예약 관리</a>
            <ul>
            	<li><a href="/admin/reservation/adminReservationList.do">예약현황</a></li>
            	<li><a href="/admin/reservation/resultReservationList.do">시술완료내역</a></li>
            	<li>예약취소내역</li>
            </ul></li>
            <li><a href="/admin/adminFaqList.do">고객센터 관리</a></li>
            <li><a href="#">갤러리 관리</a></li>
            <li><a href="/admin/designer/designerList.do">매장 관리</a></li>
            <li><a href="#">통계</a></li>
          </ul>
          </div>