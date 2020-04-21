package daily.client.faq.dao;

import java.util.List;
import daily.client.faq.vo.FaqVo;

public interface FaqDao {
	
	public List<FaqVo> faqList(); // 자주하는 질문 목록 보기
	
	
}
