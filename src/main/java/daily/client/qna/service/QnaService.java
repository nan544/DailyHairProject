package daily.client.qna.service;

import java.util.*;

import daily.admin.qna.vo.replyVO;
import daily.client.member.vo.MemberVO;
import daily.client.qna.vo.QnaVO;

public interface QnaService {
	
	//문의내역 리스트 출력	
	public List<QnaVO> qnaList(MemberVO mvo);
	//문의글 등록하기
	public int insertQna(QnaVO qvo);
	//문의글 상세보기
	public QnaVO qnaDetail(QnaVO qvo);
	//문의글 수정하기
	public int qnaUpdate(QnaVO qvo);
	//답글 상세보기
	public replyVO selectReply(int qna_num);
}
