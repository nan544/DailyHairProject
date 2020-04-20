package daily.admin.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import daily.admin.board.dao.AdminHairGoodsDAO;
import daily.admin.board.vo.AdminHairGoodsVO;

@Service
@Transactional
public class AdminHairGoodsServiceImpl implements AdminHairGoodsService {

	@Autowired
	private AdminHairGoodsDAO hairgoodsdao;
	
	@Override
	public List<AdminHairGoodsVO> hairGoodslist() {
		List<AdminHairGoodsVO> list = hairgoodsdao.hairGoodslist();
		return list;
	}

	@Override
	public AdminHairGoodsVO hairGoodsdetail(int hg_num) {

		return hairgoodsdao.hairGoodsdetail(hg_num);
	}

	@Override
	public int hairGoodsupdate(AdminHairGoodsVO hgvo) {
		return hairgoodsdao.hairGoodsupdate(hgvo);
	}

	@Override
	public int hairGoodsinsert(AdminHairGoodsVO hgvo) {
		int result = hairgoodsdao.hairGoodsinsert(hgvo);
		return result;
	}

	@Override
	public int hairGoodsdelete(int hg_num) {
		return hairgoodsdao.hairGoodsdelete(hg_num);
	}

	@Override
	public int boardListCnt(AdminHairGoodsVO hgvo) {
		return hairgoodsdao.hairGoodsListCnt(hgvo);
	}

}
