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
		return (FaqVO)session.selectOne("faqDetail", fvo);
	}

	@Override
	public int faqDelete(int faqNum) {
		return session.delete("faqDelete", faqNum);
	}

	@Override
	public int faqInsert(FaqVO fvo) {
		return session.insert("faqInsert", fvo);
	}

	@Override
	public int faqUpdate(FaqVO fvo) {
		return session.update("faqUpdate", fvo);
	}

}
