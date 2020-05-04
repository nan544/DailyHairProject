package daily.client.qna.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import daily.admin.qna.vo.replyVO;
import daily.client.member.vo.MemberVO;
import daily.client.qna.vo.QnaVO;

@Repository
@Transactional
public class QnaDaoImpl implements QnaDao {
	
	
	@Inject
	SqlSession sqlSession;
	
	
	@Override
	public List<QnaVO> qnaList(MemberVO mvo) {
		return	sqlSession.selectList("qnaList",mvo);
	}


	@Override
	public int insertQna(QnaVO qvo) {
		return sqlSession.insert("insertQna",qvo);
	}


	@Override
	public QnaVO qnaDetail(QnaVO qvo) {
		return sqlSession.selectOne("qnaDetail",qvo);
	}


	@Override
	public int qnaUpdate(QnaVO qvo) {
		return sqlSession.update("qnaUpdate",qvo);
	}


	@Override
	public replyVO selectReply(int qna_num) {
		return sqlSession.selectOne("selectReply",qna_num);
	}

}
