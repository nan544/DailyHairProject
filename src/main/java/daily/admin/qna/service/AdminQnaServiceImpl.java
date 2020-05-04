package daily.admin.qna.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import daily.admin.qna.dao.AdminQnaDao;
import daily.admin.qna.vo.replyVO;
import daily.client.qna.vo.QnaVO;

@Service
public class AdminQnaServiceImpl implements AdminQnaService {

	@Autowired
	AdminQnaDao qnaDao;

	@Override
	public QnaVO detail(QnaVO qvo) {
		return qnaDao.detail(qvo);
	}

	@Override
	public int insertReply(replyVO repVO) {
		return qnaDao.insertReply(repVO);
	}

	@Override
	public int updateState(replyVO repVO) {
		return qnaDao.updateState(repVO);
	}

	@Override
	public replyVO selectReply(int qna_num) {
		return qnaDao.selectReply(qna_num);
	}


	@Override
	public int boardListCnt(QnaVO qvo) {
		return qnaDao.boardListCnt(qvo);
	}

	@Override
	public List<QnaVO> List(QnaVO qvo) {
		return qnaDao.List(qvo);
	}

	@Override
	public int delete(replyVO repVO) {
		return qnaDao.Delete(repVO);
	}

	@Override
	public void updateStateDel(replyVO repVO) {
		qnaDao.updateStateDel(repVO);
	}
}
