package daily.admin.qna.service;

import java.util.List;

import daily.admin.qna.vo.replyVO;
import daily.client.qna.vo.QnaVO;
public interface AdminQnaService {

	public QnaVO detail(QnaVO qvo);
	public int insertReply(replyVO repVO);
	public int updateState(replyVO repVO);
	public replyVO selectReply(int qna_num);
	public List<QnaVO> List(QnaVO qvo);
	public int boardListCnt(QnaVO qvo);
	public int delete(replyVO repVO);
	public void updateStateDel(replyVO repVO);
}
