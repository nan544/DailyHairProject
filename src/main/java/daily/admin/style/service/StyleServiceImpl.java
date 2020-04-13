package daily.admin.style.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import daily.admin.style.dao.StyleDao;
import daily.admin.style.vo.StyleVO;

@Service
public class StyleServiceImpl implements StyleService {
	
	@Autowired
	StyleDao styledao;
	
	@Override
	public List<StyleVO> stylingList(int des_num) {
		return styledao.stylingList(des_num);
	}

	@Override
	public int updateStyling(int styling_num) {
		return 0;
	}

	@Override
	public int deleteStyling(int styling_num) {
		return 0;
	}

	@Override
	public int insertStyling(StyleVO svo) {
		return 0;
	}

}
