package daily.admin.designer.service;

import java.util.List;

import daily.admin.designer.vo.DesignerVO;

public interface DesignerService {

	public List<DesignerVO> designerList();

	public DesignerVO designerDetail(int des_num);

	public int insertDesigner(DesignerVO dvo);

	public int updateDesigner(DesignerVO dvo);

	public int deleteDesigner(int des_num);
	
	public int openDesigner(int des_num);
}
