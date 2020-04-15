package daily.admin.style.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import daily.admin.designer.vo.DesignerVO;
import daily.admin.style.vo.StyleVO;

@Repository
public class StyleDaoImpl implements StyleDao {
	
	@Autowired
	SqlSession sqlsession;

	@Override
	public List<StyleVO> stylingList() {
		return sqlsession.selectList("stylingList");
	}

	@Override
	public int updateStyling(StyleVO svo) {
		return sqlsession.update("updateStyling",svo);
	}

	@Override
	public int deleteStyling(int styling_num) {
		return sqlsession.delete("deleteStyling",styling_num);
	}

	@Override
	public int insertStyling(StyleVO svo) {
		return sqlsession.insert("insertStyling",svo);
	}

	@Override
	public List<StyleVO> stylingAjaxList(int des_num) {
		return sqlsession.selectList("stylingAjaxList",des_num);
	}

	@Override
	public StyleVO detailStyling(StyleVO svo) {
		return sqlsession.selectOne("detailStyling" , svo);
	}


}
