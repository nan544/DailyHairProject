package daily.admin.designer.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import daily.admin.designer.vo.DesignerVO;

@Repository
public class DesignerDaoImpl implements DesignerDao {

	@Autowired
	private SqlSession session;

	
	@Override
	public List<DesignerVO> designerList() {
		return session.selectList("designerList");
	}

	@Override
	public DesignerVO designerDetail(int des_num) {
		return session.selectOne("designerDetail", des_num);
	}

	@Override
	public int insertDesigner(DesignerVO dvo) {
		return session.insert("insertDesigner", dvo);
	}

	@Override
	public int updateDesigner(DesignerVO dvo) {
		return session.update("updateDesigner",dvo);
	}

	@Override
	public int deleteDesigner(int des_num) {
		return session.update("deleteDesigner",des_num);
	}

}
