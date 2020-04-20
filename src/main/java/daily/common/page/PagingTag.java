package daily.common.page;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class PagingTag extends TagSupport {

	private static final long serialVersionUID = 1L;
	
	private int page = 1;			//현제 페이지 번호
	private int total = 1;			// 전체 조회된 Row수
	private int list_size = 10;		// 페이지에 보여주는 레코드 수
	private int page_size = 5;		// 페이지 네비게이터에 표시되는 페이지 버튼의 개수

	
	@Override
	public int doStartTag() throws JspException {
		try {
		pageContext.getOut().println(getPaging());
		}catch(IOException e) {
			e.printStackTrace();
		}
		return super.doStartTag();
	}
	 
	
	public void setPage(int page) {
		this.page = page;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public void setList_size(int list_size) {
		this.list_size = list_size;
	}
	public void setPage_size(int page_size) {
		this.page_size = page_size;
	}

	public String getPaging() {
		String ret = "";
		if(page<1) page=1;
		if(total<1) return "";
		
		int currentFirst = ((page-1)/page_size)*page_size + 1 ;
		int currentlast = ((page-1)/page_size)* page_size + page_size;
		int nextFirst = (((page-1)/page_size)+1)*page_size+1; 
		int prevFirst = (((page-1)/page_size)-1)*page_size+1; //이전페이지 구하기
		
		int lastPage = 1;
		lastPage = total/list_size;
		
		if(total%list_size != 0) lastPage = lastPage+1;
		currentlast = (currentlast>lastPage)?lastPage:currentlast;
		
		ret += "<div class='paginate'>";
		
		//현재 페이지가 1페이지가 아니면  ( << 처음 버튼이미지에 하이퍼링크를 걸어서 처음페이지로 가는 자바스크립트함수를 실행 )
		//현제 페이지가 1페이지라면 ( << 처음 버튼이미지에 아무런 이벤트가 걸려있지않음)
		if(page>1) {
			ret += "<a href=\"javascript:goPage('1')\"><span><img src='/resources/images/common/btn_paginate_first.gif'alt='처음'/></span></a>";
			
		}else {
			ret += "<span><img src='/resources/images/common/btn_paginate_first.gif' alt='처음'/></span>";
		}
		
		//이전페이지로 가는 버튼
		if(prevFirst > 0){
			ret += "<a href=\"javascript:goPage('"+prevFirst+"');\"></span><img src='/resources/images/common/btn_paginate_prev.gif' alt='이전'/></span></a>";
		}else {
			ret += "<span><img src='/resources/images/common/btn_paginate_prev.gif' alt='이전'/></span></a>";
		}
		
		//
		for(int j=currentFirst; j<currentFirst+page_size && j<=lastPage; j++) {
			if(j<= currentlast) {
				if(j==page) {
					ret += "<a href='#' class='on textAn'>"+j+"</a>";
				}else {
					ret += "<a href=\"javascript:goPage('"+j+"');\" class='textAn'>"+j+"</a>";
				}
			}
		}
		
		//다음페이지로 가는버튼
		if(nextFirst<=lastPage) {
			ret += "<a href=\"javascript:goPage('"+nextFirst+"')\"><span><img src='/resources/images/common/btn_paginate_next.gif' alt='다음'/></span></a>";
		}else {
			ret += "<span><img src='/resources/images/common/btn_paginate_next.gif' alt='다음'/></span>";
		}
		
		if(page<lastPage) {
			ret += "<a href=\"javascript:goPage('"+lastPage+"')\"><span><img src='/resources/images/common/btn_paginate_last.gif' alt='마지막'/></span></a>";
		}else {
			ret += "<span><img src='/resources/images/common/btn_paginate_last.gif' alt='마지막'/></span>";
		}
		 
		ret += "</div>";
				
		return ret;
	}
		
}
