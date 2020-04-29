package daily.admin.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
		// TODO Auto-generated method stub
		return null;
	}


}
