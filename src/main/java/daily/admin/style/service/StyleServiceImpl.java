package daily.admin.style.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import daily.admin.designer.vo.DesignerVO;
import daily.admin.style.dao.StyleDao;
import daily.admin.style.vo.StyleVO;

@Service
@Transactional
public class StyleServiceImpl implements StyleService {
	
	@Autowired
	StyleDao styledao;
	
	@Override
	public List<StyleVO> stylingList(int des_num) {
		return styledao.stylingList(des_num);
	}


	@Override
	public int deleteStyling(int styling_num) {
		return styledao.deleteStyling(styling_num);
	}

	@Override
	public int insertStyling(StyleVO svo) {
		return styledao.insertStyling(svo);
	}

	@Override
	public List<StyleVO> stylingAjaxList(int des_num) {
		return styledao.stylingAjaxList(des_num);
	}


	@Override
	public int updateStyling(StyleVO svo) {
		return styledao.updateStyling(svo);
	}


	@Override
	public StyleVO detailStyling(int styling_num) {
		return styledao.detailStyling(styling_num);
	}


}
