package daily.admin.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import daily.admin.board.vo.AdminHairGoodsVO;
import daily.admin.board.vo.AdminHairStyleVO;

@Repository
@Transactional
public class AdminHairStyleDAOImpl implements AdminHairStyleDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<AdminHairStyleVO> hairStylelist() {
		return sqlSession.selectList("hsList");
	}

	@Override
	public AdminHairStyleVO hairStyledetail(int hs_num) {
		return sqlSession.selectOne("hsDetail", hs_num);
	}

	@Override
	public int hairStyleupdate(AdminHairStyleVO hsvo) {
		return sqlSession.update("hsUpdate",hsvo);
	}

	@Override
	public int hairStyleinsert(AdminHairStyleVO hsvo) {
		return sqlSession.insert("hsInsert", hsvo);
	}

	@Override
	public int hairStyledelete(int hs_num) {
		return sqlSession.delete("hsDelete", hs_num);
	}
	

}
