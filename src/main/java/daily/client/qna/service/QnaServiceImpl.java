package daily.client.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import daily.admin.qna.vo.replyVO;
import daily.client.member.vo.MemberVO;
import daily.client.qna.dao.QnaDao;
import daily.client.qna.vo.QnaVO;


@Service
@Transactional
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDao qnaDao;
	
	
	@Override
	public List<QnaVO> qnaList(MemberVO mvo) {
		return qnaDao.qnaList(mvo);
	}

	@Override
	public int insertQna(QnaVO qvo) {
		return qnaDao.insertQna(qvo);
	}

	@Override
	public QnaVO qnaDetail(QnaVO qvo) {
		return qnaDao.qnaDetail(qvo);
	}

	@Override
	public int qnaUpdate(QnaVO qvo) {
		return qnaDao.qnaUpdate(qvo);
	}

	@Override
	public replyVO selectReply(int qna_num) {
		return qnaDao.selectReply(qna_num);
	}

}
