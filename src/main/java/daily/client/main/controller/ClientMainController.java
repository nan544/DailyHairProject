package daily.client.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/client")
public class ClientMainController {
	
	// 메인페이지로 이동
	@RequestMapping(value = "/main.do")
	public String clientMainpage() {
		return "client/main/main";
	}
	
	// Shop소개로 이동
	@RequestMapping(value = "/shopIntro.do")
	public String clientShopIntro() {
		return "client/shopIntro/shopIntro";
	}
	
	// 예약하기로 이동
	@RequestMapping(value = "/reservePage.do")
	public String clientReservePage() {
		return "client/reserve/reserveLoginCheck";
	}
	
	// 고객센터 - 문의하기로 이동
	
	
	// 고객센터 - 자주하는 질문으로 이동
	
	
	// Gallery - HairStyle로 이동
	@RequestMapping(value = "/hairStyle.do")
	public String clientHairStyle() {
		return "client/gallery/hairStyle";
	}
	
	// Gallery - HairGoods로 이동
	@RequestMapping(value = "/hairGoods.do")
	public String clientHairGoods() {
		return "client/gallery/hairGoods";
	}
	
	// 부가 서비스 - 코로나 예방정책으로 이동
	@RequestMapping(value = "/corona.do")
	public String clientCorona() {
		return "client/main/corona";
	}
	
	// 부가 서비스 - 코로나 예방정책으로 이동
	@RequestMapping(value = "/clause1.do")
	public String clientClause1() {
		return "client/main/clause1";
	}
	
	// 부가 서비스 - 코로나 예방정책으로 이동
	@RequestMapping(value = "/clause2.do")
	public String clientClause2() {
		return "client/main/clause2";
	}
}
