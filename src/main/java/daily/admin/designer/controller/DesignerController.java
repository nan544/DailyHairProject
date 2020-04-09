package daily.admin.designer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import daily.admin.designer.service.DesignerService;
import daily.admin.designer.vo.DesignerVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.*;

@Controller
@RequestMapping(value = "/admin")
public class DesignerController {
	private Logger log = LoggerFactory.getLogger(DesignerController.class);
	
	@Autowired
	private DesignerService designerService;
	
	//디자이너 리스트 출력
	@RequestMapping(value = "/designer/designerList.do" , method = RequestMethod.GET)
	public ModelAndView designerList() {
	
	log.info("designerList.do 호출완료");
	
	ModelAndView mav = new ModelAndView();
		
	List<DesignerVO> desList = designerService.designerList();
	
	mav.addObject("designerList",desList);
	mav.setViewName("admin/designer/designerList");
	return mav;
		
	}
}
