package daily.admin.login.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import daily.admin.designer.vo.DesignerVO;
import daily.admin.login.vo.AdminLoginVO;

@Repository
public class AdminLoginDaoImpl implements AdminLoginDao {

	@Autowired
	private SqlSession session;
	
	
	@Override
	public AdminLoginVO adminLogin(AdminLoginVO lvo) {
		return (AdminLoginVO)session.selectOne("adminLogin",lvo);
	}

}
