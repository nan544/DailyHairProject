package daily.admin.board.vo;


import org.springframework.web.multipart.MultipartFile;

import daily.common.util.CommonVO;

public class AdminHairGoodsVO extends CommonVO{
	private int hg_num;	//글번호
	private String hg_title;	//글제목
	private String hg_thumb;	//썸네일이미지
	private String hg_img1;		//이미지1
	private String hg_content;	//내용
	private String hg_regdate;	//작성일
	
	//파일업로드를 위한 속성
	private MultipartFile uploadFile; //썸네일 첨부파일
	private MultipartFile uploadFile2; //상세첨부파일
	
	public int getHg_num() {
		return hg_num;
	}
	public void setHg_num(int hg_num) {
		this.hg_num = hg_num;
	}
	public String getHg_title() {
		return hg_title;
	}
	public void setHg_title(String hg_title) {
		this.hg_title = hg_title;
	}
	public String getHg_thumb() {
		return hg_thumb;
	}
	public void setHg_thumb(String hg_thumb) {
		this.hg_thumb = hg_thumb;
	}
	public String getHg_img1() {
		return hg_img1;
	}
	public void setHg_img1(String hg_img1) {
		this.hg_img1 = hg_img1;
	}
	public String getHg_content() {
		return hg_content;
	}
	public void setHg_content(String hg_content) {
		this.hg_content = hg_content;
	}

	public String getHg_regdate() {
		return hg_regdate;
	}
	public void setHg_regdate(String hg_regdate) {
		this.hg_regdate = hg_regdate;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public MultipartFile getUploadFile2() {
		return uploadFile2;
	}
	public void setUploadFile2(MultipartFile uploadFile2) {
		this.uploadFile2 = uploadFile2;
	}
	
	
	
	
}
