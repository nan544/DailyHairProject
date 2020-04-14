package daily.admin.style.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import daily.admin.designer.service.DesignerService;
import daily.admin.designer.vo.DesignerVO;
import daily.admin.style.service.StyleService;
import daily.admin.style.vo.StyleVO;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping(value = "/admin")
public class StyleController {
	private Logger log = LoggerFactory.getLogger(StyleController.class);

	@Autowired
	StyleService styleService;

	@Autowired
	DesignerService designerService;

	// 시술등록창 팝업 띄우기
	@RequestMapping(value = "/style/styleSetting.do", method = RequestMethod.GET)
	public ModelAndView stylingList() {
		log.info("stylingList 호출완료");

		ModelAndView mav = new ModelAndView();

		List<StyleVO> svo = styleService.stylingList();
		List<DesignerVO> dvo = designerService.designerList();

		if (svo != null) {
			mav.addObject("stylingList", svo);
			mav.addObject("desList", dvo);
		}

		mav.setViewName("admin/style/styleSetting_pop");

		return mav;

	}

	// 디자이너 선택시 선택된 디자이너 리스트 출력하기
	@RequestMapping(value = "/style/styleAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public List<StyleVO> stylingAjaxList(int des_num){
		log.info("styleAjaxList 호출완료");
		return styleService.stylingAjaxList(des_num);
	}

	// 시술등록하기.
	@RequestMapping(value = "/style/insertStyling.do", method = RequestMethod.POST)
	@ResponseBody
	public String insertStyling(@ModelAttribute StyleVO svo) {
		log.info("insertStyling 호출 성공");

		String msg = "0";
		int result = styleService.insertStyling(svo);

		if (result == 1) {
			msg = "1";
			return msg;
		} else {
			msg = "0";
			return msg;
		}
	}
}
