package daily.admin.designer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import daily.admin.designer.dao.DesignerDao;
import daily.admin.designer.vo.DesignerVO;
import daily.client.reserve.vo.ReserveVo;

@Service("designerService")
@Transactional
public class DesignerServiceImpl implements DesignerService {
	
	@Autowired
	private DesignerDao designerdao;
	
	//디자이너 리스트 출력
	@Override
	public List<DesignerVO> designerList() {
		return designerdao.designerList();
	}
	
	//디자이너 상세보기
	@Override
	public DesignerVO designerDetail(int des_num) {
		return designerdao.designerDetail(des_num);
	}
	
	//디자이너 등록
	@Override
	public int insertDesigner(DesignerVO dvo) {
		return designerdao.insertDesigner(dvo);
	}

	//디자이너 수정
	@Override
	public int updateDesigner(DesignerVO dvo) {
		return designerdao.updateDesigner(dvo);
	}
	
	//디자이너 비활성화
	@Override
	public int deleteDesigner(int des_num) {
		return designerdao.deleteDesigner(des_num);
	}

	//디자이너 활성화
	@Override
	public int openDesigner(int des_num) {
		return designerdao.openDesigner(des_num);
	}

	//동적으로 디자이너 리스트 출력
	@Override
	public List<DesignerVO> designerAjaxList(int des_state) {
		return designerdao.designerAjaxList(des_state);
	}

	//예약가능한 디자이너 리스트 출력
	@Override
	public List<DesignerVO> stylingDesigner(ReserveVo rvo) {
		return designerdao.stylingDesigner(rvo);
	}

}
