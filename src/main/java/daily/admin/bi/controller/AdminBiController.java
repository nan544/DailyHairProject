package daily.admin.bi.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import daily.admin.bi.service.AdminBiService;
import daily.admin.bi.vo.AdminBiVO;

@Controller
@RequestMapping(value = "/admin")
public class AdminBiController {
	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	AdminBiService biService;
	
	@RequestMapping(value = "/bi/main.do") //초기 화면  메소드
	public ModelAndView main() throws Exception{
		
	ModelAndView mav = new ModelAndView();
	
	List<AdminBiVO> result = biService.list();
		mav.addObject("result",result);
		mav.setViewName("admin/bi/main");
		return mav;
	}
}
