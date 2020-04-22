package daily.admin.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import daily.admin.board.vo.AdminHairGoodsVO;

@Repository
@Transactional
public class AdminHairGoodsDAOImpl implements AdminHairGoodsDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<AdminHairGoodsVO> hairGoodslist(AdminHairGoodsVO hgvo) {
		List<AdminHairGoodsVO> list=session.selectList("hgList", hgvo);
		return list;
	}

	@Override
	public AdminHairGoodsVO hairGoodsdetail(int hg_num) {
		return session.selectOne("hgDetail",hg_num);
	};

	@Override
	public int hairGoodsupdate(AdminHairGoodsVO hgvo) {
		return session.update("hgUpdate", hgvo);
	}

	@Override
	public int hairGoodsinsert(AdminHairGoodsVO hgvo) {
		return session.insert("hgInsert",hgvo);
	}

	@Override
	public int hairGoodsdelete(int hg_num) {
		return session.delete("hgDelete", hg_num);
	}

	@Override
	public int hairGoodsListCnt(AdminHairGoodsVO hgvo) {
		return session.selectOne("hgListCnt", hgvo);
	}

}
