package daily.client.faq.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import daily.client.faq.vo.FaqVo;

@Repository
public class FaqDaoImpl implements FaqDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<FaqVo> faqList() {
		return session.selectList("faqList");
	}

}
