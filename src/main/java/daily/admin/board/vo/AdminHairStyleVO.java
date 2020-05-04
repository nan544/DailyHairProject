package daily.admin.board.vo;

import org.springframework.web.multipart.MultipartFile;

import daily.common.util.CommonVO;

public class AdminHairStyleVO extends CommonVO {
	private int hs_num;
	private String hs_title;
	private String hs_thumb;
	private String hs_img1;
	private String hs_img2;
	private String hs_img3;
	private String hs_img4;
	private String hs_content;
	private String hs_regdate;
	private int hs_category;
	
	private MultipartFile uploadFile;
	private MultipartFile uploadFile2;
	private MultipartFile uploadFile3;
	private MultipartFile uploadFile4;
	private MultipartFile uploadFile5;
	
	
	
	public MultipartFile getUploadFile5() {
		return uploadFile5;
	}
	public void setUploadFile5(MultipartFile uploadFile5) {
		this.uploadFile5 = uploadFile5;
	}
	public String getHs_img2() {
		return hs_img2;
	}
	public void setHs_img2(String hs_img2) {
		this.hs_img2 = hs_img2;
	}
	public String getHs_img3() {
		return hs_img3;
	}
	public void setHs_img3(String hs_img3) {
		this.hs_img3 = hs_img3;
	}
	public String getHs_img4() {
		return hs_img4;
	}
	public void setHs_img4(String hs_img4) {
		this.hs_img4 = hs_img4;
	}
	public MultipartFile getUploadFile3() {
		return uploadFile3;
	}
	public void setUploadFile3(MultipartFile uploadFile3) {
		this.uploadFile3 = uploadFile3;
	}
	public MultipartFile getUploadFile4() {
		return uploadFile4;
	}
	public void setUploadFile4(MultipartFile uploadFile4) {
		this.uploadFile4 = uploadFile4;
	}
	public int getHs_category() {
		return hs_category;
	}
	public void setHs_category(int hs_category) {
		this.hs_category = hs_category;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getHs_num() {
		return hs_num;
	}
	public void setHs_num(int hs_num) {
		this.hs_num = hs_num;
	}
	public String getHs_title() {
		return hs_title;
	}
	public void setHs_title(String hs_title) {
		this.hs_title = hs_title;
	}
	public String getHs_thumb() {
		return hs_thumb;
	}
	public void setHs_thumb(String hs_thumb) {
		this.hs_thumb = hs_thumb;
	}
	public String getHs_img1() {
		return hs_img1;
	}
	public void setHs_img1(String hs_img1) {
		this.hs_img1 = hs_img1;
	}
	public String getHs_content() {
		return hs_content;
	}
	public void setHs_content(String hs_content) {
		this.hs_content = hs_content;
	}
	public String getHs_regdate() {
		return hs_regdate;
	}
	public void setHs_regdate(String hs_regdate) {
		this.hs_regdate = hs_regdate;
	}
	public MultipartFile getUploadFile2() {
		return uploadFile2;
	}
	public void setUploadFile2(MultipartFile uploadFile2) {
		this.uploadFile2 = uploadFile2;
	}
	
	
}
