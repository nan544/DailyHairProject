package daily.admin.designer.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import daily.admin.designer.vo.DesignerVO;
import daily.client.reserve.vo.ReserveVo;

@Repository
public class DesignerDaoImpl implements DesignerDao {

	@Autowired
	private SqlSession session;

	//디자이너리스트 출력
	@Override
	public List<DesignerVO> designerList() {
		return session.selectList("designerList");
	}
	//디자이너 상세보기	
	@Override
	public DesignerVO designerDetail(int des_num) {
		return session.selectOne("designerDetail", des_num);
	}
	//디자이너 등록
	@Override
	public int insertDesigner(DesignerVO dvo) {
		return session.insert("insertDesigner", dvo);
	}
	//디자이너 수정
	@Override
	public int updateDesigner(DesignerVO dvo) {
		return session.update("updateDesigner",dvo);
	}
	//디자이너 비활성화
	@Override
	public int deleteDesigner(int des_num) {
		return session.update("deleteDesigner",des_num);
	}
	//디자이너 활성화
	@Override
	public int openDesigner(int des_num) {
		return session.update("openDesigner",des_num);
	}
	//동적으로 디자이너 리스트 생성
	@Override
	public List<DesignerVO> designerAjaxList(int des_state) {
		return session.selectList("designerAjaxList", des_state);
	}
	//예약가능한 디자이너 리스트 출력
	@Override
	public List<DesignerVO> stylingDesigner(ReserveVo rvo) {
		return session.selectList("stylingDesigner",rvo);
	}


}
