package daily.admin.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import daily.admin.faq.dao.AdminFaqDao;
import daily.admin.faq.vo.FaqVO;

@Service
@Transactional
public class AdminFaqServiceImpl implements AdminFaqService {

	@Autowired
	private AdminFaqDao FaqDao;
	
	@Override
	public List<FaqVO> faqList() {
		List<FaqVO> allList = null;
		allList = FaqDao.faqList();
		
		return allList;
	}

	@Override
	public FaqVO faqDetail(FaqVO fvo) {
		FaqVO detail = FaqDao.faqDetail(fvo);
		return detail;
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
