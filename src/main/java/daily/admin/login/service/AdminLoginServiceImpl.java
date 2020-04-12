package daily.admin.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import daily.admin.designer.vo.DesignerVO;
import daily.admin.login.dao.AdminLoginDao;
import daily.admin.login.vo.AdminLoginVO;

@Service
@Transactional
public class AdminLoginServiceImpl implements AdminLoginService {
	
	@Autowired
	private AdminLoginDao loginDao;
	
	@Override
	public AdminLoginVO adminLogin(AdminLoginVO lvo) {
		return loginDao.adminLogin(lvo);
	}

}
