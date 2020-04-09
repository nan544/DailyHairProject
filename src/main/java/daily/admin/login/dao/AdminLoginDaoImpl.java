package daily.admin.login.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import daily.admin.login.vo.AdminLoginVO;

@Repository
public class AdminLoginDaoImpl implements AdminLoginDao {

	@Autowired
	private SqlSession session;
	
	
	@Override
	public int adminLogin(AdminLoginVO lvo) {
		return session.selectOne("adminLogin",lvo);
	}

}
