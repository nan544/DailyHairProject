package daily.admin.style.dao;

import java.util.*;

import daily.admin.style.vo.StyleVO;

public interface StyleDao {
	public List<StyleVO> stylingList(int des_num); //시술리스트
	public int insertStyling(StyleVO svo);		//시술 등록
	public int updateStyling(int styling_num); //시술수정
	public int deleteStyling(int styling_num);	//시술삭제
}
