package daily.admin.faq.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import daily.admin.faq.vo.FaqVO;

@Repository
public class AdminFaqDaoImpl implements AdminFaqDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<FaqVO> faqList() {
			return session.selectList("faqList");
	}

	@Override
	public FaqVO faqDetail(FaqVO fvo) {
		return session.selectOne("faqDetail");
	}

	@Override
	public int faqDelete(int faqNum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int faqInsert(FaqVO fvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int faqUpdate(int faqNum) {
		// TODO Auto-generated method stub
		return 0;
	}

}
