package daily.client.reserve.vo;

public class ReserveVo {
	int rest_num;			// 예약 번호
	int des_num;			// 디자이너 번호
	String m_id;			// 회원 ID
	String rest_hairdate;		// 시술 일자
	String rest_regdate;		// 예약 등록 일자
	int rest_state;			// 예약 상태
	String rest_payoption;	// 결제 방식
	String rest_memo;		// 디자이너 전달사항
	String rest_comment;	// 시술 특이사항
	
	public int getRest_num() {
		return rest_num;
	}
	public void setRest_num(int rest_num) {
		this.rest_num = rest_num;
	}
	public int getDes_num() {
		return des_num;
	}
	public void setDes_num(int des_num) {
		this.des_num = des_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getRest_hairdate() {
		return rest_hairdate;
	}
	public void setRest_hairdate(String rest_hairdate) {
		this.rest_hairdate = rest_hairdate;
	}
	public String getRest_regdate() {
		return rest_regdate;
	}
	public void setRest_regdate(String rest_regdate) {
		this.rest_regdate = rest_regdate;
	}
	public int getRest_state() {
		return rest_state;
	}
	public void setRest_state(int rest_state) {
		this.rest_state = rest_state;
	}
	public String getRest_payoption() {
		return rest_payoption;
	}
	public void setRest_payoption(String rest_payoption) {
		this.rest_payoption = rest_payoption;
	}
	public String getRest_memo() {
		return rest_memo;
	}
	public void setRest_memo(String rest_memo) {
		this.rest_memo = rest_memo;
	}
	public String getRest_comment() {
		return rest_comment;
	}
	public void setRest_comment(String rest_comment) {
		this.rest_comment = rest_comment;
	}
	
}
