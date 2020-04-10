package daily.admin.faq.service;

import java.util.List;

import daily.admin.faq.vo.FaqVO;

public interface AdminFaqService {
	public List<FaqVO> faqList(); //전체보기
	public FaqVO faqDetail(FaqVO fvo); //상세보기
	public int faqDelete(int faqNum);//게시글삭제
	public int faqInsert(FaqVO fvo);//게시글작성
	public int faqUpdate(FaqVO fvo);//게시글수정
}
