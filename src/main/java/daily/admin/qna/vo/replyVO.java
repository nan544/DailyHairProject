package daily.admin.qna.vo;

import org.springframework.web.multipart.MultipartFile;

public class replyVO {
	private int rep_num;	//답글번호
	private int qna_num;	//1:1문의글번호
	private String rep_name; //작성자
	private String rep_regdate; // 댓글작성일
	private String rep_content; // 댓글내용
	private String rep_file; // 댓글파일
	
	private MultipartFile uploadFile; //파일업로드를 위한 파일필드

	public int getRep_num() {
		return rep_num;
	}

	public void setRep_num(int rep_num) {
		this.rep_num = rep_num;
	}

	public int getQna_num() {
		return qna_num;
	}

	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}

	public String getRep_name() {
		return rep_name;
	}

	public void setRep_name(String rep_name) {
		this.rep_name = rep_name;
	}

	public String getRep_regdate() {
		return rep_regdate;
	}

	public void setRep_regdate(String rep_regdate) {
		this.rep_regdate = rep_regdate;
	}

	public String getRep_content() {
		return rep_content;
	}

	public void setRep_content(String rep_content) {
		this.rep_content = rep_content;
	}

	public String getRep_file() {
		return rep_file;
	}

	public void setRep_file(String rep_file) {
		this.rep_file = rep_file;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}


}
