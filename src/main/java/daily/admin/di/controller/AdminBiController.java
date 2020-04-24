package daily.admin.di.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/admin")
public class AdminBiController {

	@RequestMapping(value = "/bi/main.do")
	public ModelAndView main(){
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/bi/main");
		return mav;
	}
}
