package daily.admin.qna.dao;

import java.util.List;

import daily.admin.qna.vo.replyVO;
import daily.client.qna.vo.QnaVO;

public interface AdminQnaDao {


	public QnaVO detail(QnaVO qvo);

	public int insertReply(replyVO repVO);

	public replyVO selectReply(int qna_num);

	public int boardListCnt(QnaVO qvo);

	public List<QnaVO> List(QnaVO qvo);

	public int Delete(replyVO repVO);

	int updateState(replyVO repVO);

	public void updateStateDel(replyVO repVO);
	
}
