package daily.admin.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import daily.admin.login.dao.AdminLoginDao;
import daily.admin.login.vo.AdminLoginVO;

@Service
@Transactional
public class AdminLoginServiceImpl implements AdminLoginService {
	
	@Autowired
	private AdminLoginDao loginDao;
	
	@Override
	public int adminLogin(String ad_id, String ad_pwd) {
		AdminLoginVO vo = new AdminLoginVO();
		vo.setAd_id(ad_id);
		vo.setAd_pwd(ad_pwd);
		System.out.println(vo.getAd_id());
		System.out.println(vo.getAd_pwd());
		int result = loginDao.adminLogin(vo);
		
		return result;
	}

}
