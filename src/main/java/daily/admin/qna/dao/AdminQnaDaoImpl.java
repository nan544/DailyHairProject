package daily.admin.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import daily.admin.qna.vo.replyVO;
import daily.client.qna.vo.QnaVO;
@Repository
@Transactional
public class AdminQnaDaoImpl implements AdminQnaDao {

	@Autowired
	SqlSession sqlSession;
	@Override
	public List<QnaVO> List() {
		return sqlSession.selectList("List");
	}
	@Override
	public QnaVO detail(QnaVO qvo) {
		return sqlSession.selectOne("detail", qvo);
	}
	@Override
	public int insertReply(replyVO repVO) {
		return sqlSession.insert("insertReply", repVO);
	}
	@Override
	public int updateState(int qna_num) {
		return sqlSession.update("updateState", qna_num);
	}


}
