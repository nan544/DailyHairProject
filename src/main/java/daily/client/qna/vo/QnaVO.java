package daily.client.qna.vo;

import org.springframework.web.multipart.MultipartFile;

/*qna_num number primary key
m_id varchar2(30)
qna_title varchar2(500) not null
qna_state number(5) default 0 not null
qna_content varchar2(1000) not null
qna_regdate date default sysdate
qna_file varchar2(100) null*/


public class QnaVO {
	
	private int qna_num;			//글 번호
	private String m_id;			//회원 아이디
	private String qna_title;		//글 제목
	private int qna_state;			//글의 상태(댓글여부)
	private String qna_content;		//글 내용
	private String qna_regdate;		//글 쓴 날짜
	private String qna_file;		//첨부파일
	
	private MultipartFile file;    //첨부파일 업로드용

	public int getQna_num() {
		return qna_num;
	}

	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public int getQna_state() {
		return qna_state;
	}

	public void setQna_state(int qna_state) {
		this.qna_state = qna_state;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getQna_regdate() {
		return qna_regdate;
	}

	public void setQna_regdate(String qna_regdate) {
		this.qna_regdate = qna_regdate;
	}

	public String getQna_file() {
		return qna_file;
	}

	public void setQna_file(String qna_file) {
		this.qna_file = qna_file;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	
}
