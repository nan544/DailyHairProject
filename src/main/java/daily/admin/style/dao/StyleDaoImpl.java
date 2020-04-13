package daily.admin.style.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import daily.admin.style.vo.StyleVO;

@Repository
public class StyleDaoImpl implements StyleDao {
	
	@Autowired
	SqlSession sqlsession;

	@Override
	public List<StyleVO> stylingList(int des_num) {
		return sqlsession.selectList("stylingList",des_num);
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
