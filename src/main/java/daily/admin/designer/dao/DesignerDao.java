package daily.admin.designer.dao;

import java.util.*;

import daily.admin.designer.vo.DesignerVO;
import daily.client.reserve.vo.ReserveVo;

public interface DesignerDao {
	//디자이너리스트 출력
	public List<DesignerVO> designerList();
	//디자이너 상세보기
	public DesignerVO designerDetail(int des_num);
	//디자이너 등록
	public int insertDesigner(DesignerVO dvo);
	//디자이너 수정
	public int updateDesigner(DesignerVO dvo);
	//디자이너 비활성화
	public int deleteDesigner(int des_num);
	//디자이너 활성화시키기
	public int openDesigner(int des_num);
	//동적으로 디자이너리스트 출력
	public List<DesignerVO> designerAjaxList(int des_state);
	//예약가능한 디자이너 목록 출력
	public List<DesignerVO> stylingDesigner(ReserveVo rvo);
}
