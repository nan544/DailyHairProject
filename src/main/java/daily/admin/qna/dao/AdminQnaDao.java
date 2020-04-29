package daily.admin.qna.dao;

import java.util.List;

import daily.admin.qna.vo.replyVO;
import daily.client.qna.vo.QnaVO;

public interface AdminQnaDao {

	public List<QnaVO> List();

	public QnaVO detail(QnaVO qvo);

	public int insertReply(replyVO repVO);

	public int updateState(int qna_num);
	
}
