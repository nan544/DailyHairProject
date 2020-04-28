package daily.client.qna.dao;

import java.util.List;

import daily.client.member.vo.MemberVO;
import daily.client.qna.vo.QnaVO;

public interface QnaDao {
	
	//문의내역 리스트 출력	
		public List<QnaVO> qnaList(MemberVO mvo);
		
	//문의글 등록하기
		public int insertQna(QnaVO qvo);
		
	//문의글 상세보기
		public QnaVO qnaDetail(QnaVO qvo);
		//문의글 수정하기
		public int qnaUpdate(QnaVO qvo);
}
