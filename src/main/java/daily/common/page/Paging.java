package daily.common.page;

import daily.common.util.CommonVO;
import daily.common.util.Util;

public class Paging {
		
	
	//페이징을 위한 설정.
	public static void setPage(CommonVO cvo) {
		
		
		/* page : 페이지번호
		 * pageSize : 한페이지에 보여줄 로우수
		 * start_row : 시작할 로우번호
		   end_row : 끝나는 로우번호 */
		 
		int page = Util.nvl(cvo.getPage(),1);
		int pageSize = Util.nvl(cvo.getPageSize(), 10);
		
		if(cvo.getPage()==null)cvo.setPage(page+"");
		if(cvo.getPageSize()==null)cvo.setPageSize(pageSize+"");
		
		int start_row = (page-1)*pageSize+1;
		int end_row = (page-1)*pageSize+pageSize;
		
		cvo.setStart_row(start_row+"");
		cvo.setEnd_row(end_row+"");
	}
}
