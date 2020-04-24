package daily.admin.designer.vo;

import org.springframework.web.multipart.MultipartFile;

public class DesignerVO {

	// designer 테이블 컬럼
	/*
	 * des_num number primary key, des_name varchar2(20) not null, des_job
	 * varchar2(30) not null, des_phone varchar2(20) not null, des_holyday
	 * varchar2(15) null, des_regdate date default sysdate, des_file varchar2(500),
	 * des_state number not null);
	 */

	private int des_num;
	private String des_name;
	private String des_job;
	private String des_phone;
	private String des_gender;
	private String des_holyday;
	private String des_regdate;
	private String des_file;
	private int des_state;
	private String des_memo;
	private String des_image;
	
	private MultipartFile file;   //첨부파일
	private MultipartFile file2;	//이미지 첨부파일(디자이너사진)

	
	
	public String getDes_image() {
		return des_image;
	}

	public void setDes_image(String des_image) {
		this.des_image = des_image;
	}

	public MultipartFile getFile2() {
		return file2;
	}

	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getDes_gender() {
		return des_gender;
	}

	public void setDes_gender(String des_gender) {
		this.des_gender = des_gender;
	}

	public String getDes_memo() {
		return des_memo;
	}

	public void setDes_memo(String des_memo) {
		this.des_memo = des_memo;
	}

	public int getDes_num() {
		return des_num;
	}

	public void setDes_num(int des_num) {
		this.des_num = des_num;
	}

	public String getDes_name() {
		return des_name;
	}

	public void setDes_name(String des_name) {
		this.des_name = des_name;
	}

	public String getDes_job() {
		return des_job;
	}

	public void setDes_job(String des_job) {
		this.des_job = des_job;
	}

	public String getDes_phone() {
		return des_phone;
	}

	public void setDes_phone(String des_phone) {
		this.des_phone = des_phone;
	}

	public String getDes_holyday() {
		return des_holyday;
	}

	public void setDes_holyday(String des_holyday) {
		this.des_holyday = des_holyday;
	}

	public String getDes_regdate() {
		return des_regdate;
	}

	public void setDes_regdate(String des_regdate) {
		this.des_regdate = des_regdate;
	}

	public String getDes_file() {
		return des_file;
	}

	public void setDes_file(String des_file) {
		this.des_file = des_file;
	}

	public int getDes_state() {
		return des_state;
	}

	public void setDes_state(int des_state) {
		this.des_state = des_state;
	}

}
