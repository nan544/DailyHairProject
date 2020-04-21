package daily.admin.style.service;

import java.util.List;

import daily.admin.designer.vo.DesignerVO;
import daily.admin.style.vo.StyleVO;

public interface StyleService {
	public List<StyleVO> stylingList(int des_num); //시술리스트
	public List<StyleVO> stylingAjaxList(int des_num); //시술리스트
	public StyleVO detailStyling(int styling_num);		//상세보기
	public int insertStyling(StyleVO svo);		//시술 등록
	public int updateStyling(StyleVO svo); //시술수정
	public int deleteStyling(int styling_num);	//시술삭제
	
}
