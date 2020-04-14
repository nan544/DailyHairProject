package daily.client.reserve.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/reserve")
public class ReserveController {
	
	// 예약하기 최초 접속 시 예약 정보 값 초기화
	@RequestMapping(value = "/reserveSelectPlace")
	public String reserveSelectPlace(HttpSession session) {
		session.setAttribute("place", "(매장)입력 대기 중");
		session.setAttribute("date", "(시술 일시)입력 대기 중");
		session.setAttribute("designer", "(디자이너)입력 대기 중");
		session.setAttribute("sergery", "(시술)입력 대기 중");
		return "client/reserve/reserveSelectPlace";
	}
	
	// 1. 지점선택) 왕십리 본점 선택 시
	@RequestMapping(value = "/reserveSelectDate")
	public String reserveSelectDate(HttpSession session, HttpServletRequest request) {
		session.setAttribute("place", "왕십리 본점");
		return "client/reserve/reserveSelectDate";
	}
	
	// 1. 지점선택) 왕십리 본점 선택 시
	@RequestMapping(value = "/reserveSelectDateTest")
	public String reserveSelectDateTest(HttpSession session, HttpServletRequest request) {
		session.setAttribute("place", "테스트 목적");
		return "client/reserve/reserveSelectDate";
	}
	
	// (임시) 디자이너 선택으로 이동
	@RequestMapping(value = "/reserveSelectDesigner")
	public String reserveSelectDesigner() {
		return "client/reserve/reserveSelectDesigner";
	}
	
	// (임시) 시술 선택으로 이동
	@RequestMapping(value = "/reserveSelectSergery")
	public String reserveSelectSergery() {
		return "client/reserve/reserveSelectSergery";
	}
	
	// (임시) 결제하기로 이동
	@RequestMapping(value = "/reservePayment")
	public String reservePayment() {
		return "client/reserve/payment";
	}
	
	// 결제 - 카드 결제
	@RequestMapping(value = "/reservePaymentCard")
	public String reservePaymentCard() {
		return "client/reserve/paymentCard";
	}
	
	// 결제 - 계좌이체
	@RequestMapping(value = "/reservePaymentAccount")
	public String reservePaymentAccount() {
		return "client/reserve/paymentAccount";
	}
	
}
