package daily.admin.designer.service;

import java.util.List;

import daily.admin.designer.vo.DesignerVO;
import daily.client.reserve.vo.ReserveVo;

public interface DesignerService {

	public List<DesignerVO> designerList(); //디자이너리스트  

	public DesignerVO designerDetail(int des_num);	//디자이너 상세보기

	public int insertDesigner(DesignerVO dvo);	//디자이너 등록

	public int updateDesigner(DesignerVO dvo);	//디자이너 수정

	public int deleteDesigner(int des_num);		//디자이너 비활성화
		
	public int openDesigner(int des_num);		//디자이너 활성화
	
	public List<DesignerVO> designerAjaxList(int des_state); //디자이너 리스트(활성화/비활성화체크)
	
	public List<DesignerVO> stylingDesigner(ReserveVo rvo);
}
