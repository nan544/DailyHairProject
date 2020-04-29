package daily.admin.qna.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import daily.admin.qna.dao.AdminQnaDao;
import daily.admin.qna.vo.replyVO;
import daily.client.qna.vo.QnaVO;

@Service
public class AdminQnaServiceImpl implements AdminQnaService {

	
	@Autowired
	AdminQnaDao qnaDao;
	
	
	@Override
	public java.util.List<QnaVO> List() {
		return qnaDao.List();
	}


	@Override
	public QnaVO detail(QnaVO qvo) {
		return qnaDao.detail(qvo);
	}


	@Override
	public int insertReply(replyVO repVO) {
		return qnaDao.insertReply(repVO);
	}


	@Override
	public int updateState(int qna_num) {
		return qnaDao.updateState(qna_num);
	}

}
