package daily.admin.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import daily.admin.board.dao.AdminHairStyleDAO;
import daily.admin.board.vo.AdminHairStyleVO;

@Service
public class AdminHairStyleServiceImpl implements AdminHairStyleService {

	@Autowired
	AdminHairStyleDAO hairStyleDao;
	
	@Override
	public List<AdminHairStyleVO> hairStylelist(AdminHairStyleVO hsvo) {
		return hairStyleDao.hairStylelist(hsvo);
	}

	@Override
	public AdminHairStyleVO hairStyledetail(int hg_num) {
		return hairStyleDao.hairStyledetail(hg_num);
	}

	@Override
	public int hairStyleupdate(AdminHairStyleVO hsvo) {
		return hairStyleDao.hairStyleupdate(hsvo);
	}

	@Override
	public int hairStyleinsert(AdminHairStyleVO hsvo) {
		return hairStyleDao.hairStyleinsert(hsvo);
	}

	@Override
	public int hairStyledelete(int hs_num) {
		return hairStyleDao.hairStyledelete(hs_num);
	}

	@Override
	public int boardListCnt(AdminHairStyleVO hsvo) {
		return hairStyleDao.hairStyleCnt(hsvo);
	}

}
