package daily.admin.designer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import daily.admin.designer.dao.DesignerDao;
import daily.admin.designer.vo.DesignerVO;

@Service
@Transactional
public class DesignerServiceImpl implements DesignerService {
	
	@Autowired
	private DesignerDao designerdao;

	@Override
	public List<DesignerVO> designerList() {
		return designerdao.designerList();
	}

	@Override
	public DesignerVO designerDetail(int des_num) {
		return designerdao.designerDetail(des_num);
	}

	@Override
	public int insertDesigner(DesignerVO dvo) {
		return designerdao.insertDesigner(dvo);
	}

	@Override
	public int updateDesigner(DesignerVO dvo) {
		return designerdao.updateDesigner(dvo);
	}

	@Override
	public int deleteDesigner(int des_num) {
		return designerdao.deleteDesigner(des_num);
	}

	@Override
	public int openDesigner(int des_num) {
		return designerdao.openDesigner(des_num);
	}

	@Override
	public List<DesignerVO> designerAjaxList(int des_state) {
		return designerdao.designerAjaxList(des_state);
	}

}
