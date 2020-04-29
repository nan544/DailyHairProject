package daily.admin.qna.service;

import java.util.List;


import daily.client.qna.vo.QnaVO;
public interface AdminQnaService {

	public List<QnaVO> List();
	public QnaVO detail(QnaVO qvo);
}
