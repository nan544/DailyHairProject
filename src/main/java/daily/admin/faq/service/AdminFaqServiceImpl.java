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
		int result = FaqDao.faqDelete(faqNum);
		return result;
	}

	@Override
	public int faqInsert(FaqVO fvo) {
		int result= FaqDao.faqInsert(fvo);
		return result;
	}

	@Override
	public int faqUpdate(FaqVO fvo) {
		int updatedata=FaqDao.faqUpdate(fvo);
		return updatedata;
	}


}
