package daily.admin.style.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import daily.admin.style.service.StyleService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping(value = "/admin")
public class StyleController {
	private Logger log = LoggerFactory.getLogger(StyleController.class);
	
	@Autowired
	StyleService styleService;
	
	//시술등록창 팝업 띄우기
	@RequestMapping(value = "/style/styleSetting.do" , method =RequestMethod.GET)
	public ModelAndView stylingList() {
		log.info("stylingList 호출완료");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/style/styleSetting_pop");
		
		return mav;
		
	}
}
