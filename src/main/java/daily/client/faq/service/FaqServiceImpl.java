package daily.client.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import daily.admin.faq.vo.FaqVO;
import daily.client.faq.dao.FaqDao;
import daily.client.faq.vo.FaqVo;

@Service("faqService")
@Transactional
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	private FaqDao faqDao;
	
	@Override
	public List<FaqVo> faqList() {
		List<FaqVo> allList = null;
		allList = faqDao.faqList();
		
		return allList;
	}

}
