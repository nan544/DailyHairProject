package daily.admin.designer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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

	// 디자이너 리스트 출력
	@RequestMapping(value = "/designer/designerList.do", method = RequestMethod.GET)
	public ModelAndView designerList() {

		log.info("designerList.do 호출완료");

		ModelAndView mav = new ModelAndView();

		List<DesignerVO> desList = designerService.designerList();

		mav.addObject("designerList", desList);
		mav.setViewName("admin/designer/designerList");
		return mav;
	}
	
	//디자이너 리스트 출력(선택시 변경)
	@RequestMapping(value = "/designer/desAjaxList.do", method = RequestMethod.POST)
	@ResponseBody
	public List<DesignerVO> designerAjaxList(int des_state){
		
		log.info("designerAjaxList 호출완료");
		System.out.println(designerService.designerAjaxList(des_state));
		return designerService.designerAjaxList(des_state);
		
	}

	// 디자이너 등록폼
	@RequestMapping(value = "/designer/designerJoinForm.do", method = RequestMethod.GET)
	public String designerInsertForm() {
		log.info("designerInsertForm 호출 성공");
		return "admin/designer/pop/designerJoin_pop";
	}

	// 디자이너 등록하기
	@RequestMapping(value = "/designer/designerJoin.do", method = RequestMethod.POST)
	@ResponseBody
	public String designerInsert(@ModelAttribute DesignerVO dvo) {
		log.info("designerInsert 호출 성공");

		String msg = "0";

		int result = designerService.insertDesigner(dvo);
		if (result == 1) {
			msg = "1";
		} else {
			msg = "0";
		}
		return msg;
	}

	// 디자이너 정보 수정폼
	@RequestMapping(value = "/designer/designerUpdateForm.do", method = RequestMethod.GET)
	public ModelAndView designerUpdateForm(@ModelAttribute DesignerVO dvo) {
		log.info("designerupdateForm 호출 성공" + dvo.getDes_num());

		ModelAndView mav = new ModelAndView();

		DesignerVO updateDesigner = new DesignerVO();
		updateDesigner = designerService.designerDetail(dvo.getDes_num());
		if (updateDesigner != null) {
			mav.addObject("des", updateDesigner);
			mav.setViewName("admin/designer/pop/designerModify_pop");
			return mav;
		} else {
			mav.addObject("msg", "에러에염");
			mav.setViewName("admin/designer/designerList");
			return mav;
		}
	}

	// 디자이너 정보 수정하기
	@RequestMapping(value = "/designer/designerUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public String designerUpdate(@ModelAttribute DesignerVO dvo) {
		log.info("designerUpdate 호출 성공");

		String msg = "0";

		int result = designerService.updateDesigner(dvo);
		if (result == 1) {
			msg = "1";
			return msg;
		} else {
			msg = "0";
			return msg;
		}

	}

	// 디자이너 비활성화하기
	@RequestMapping(value = "/designer/designerDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String designerDelete(@ModelAttribute DesignerVO dvo) {

		String msg = "0";

		int result = designerService.deleteDesigner(dvo.getDes_num());
		if (result == 1) {
			msg = "1";
			return msg;
		} else {
			msg = "0";
			return msg;
		}
	}

	// 디자이너 활성화 하기
	@RequestMapping(value = "/designer/designerOpen.do", method = RequestMethod.POST)
	@ResponseBody
	public String designerOpen(@ModelAttribute DesignerVO dvo) {

		String msg = "0";

		int result = designerService.openDesigner(dvo.getDes_num());

		if (result == 1) {
			msg = "1";
			return msg;
		} else {
			msg = "0";
			return msg;
		}
	}
}
