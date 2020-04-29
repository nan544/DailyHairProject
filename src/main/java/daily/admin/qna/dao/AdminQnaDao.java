package daily.admin.qna.dao;

import java.util.List;

import daily.client.qna.vo.QnaVO;

public interface AdminQnaDao {

	public List<QnaVO> List();

	public QnaVO detail(QnaVO qvo);
}
