package daily.client.reserve.vo;

public class ReserveVo {
	private int rest_num;			// 예약 번호
	private int des_num;			// 디자이너 번호
	private String m_id;			// 회원 ID
	private String rest_hairdate;	// 시술 일자
	private String rest_regdate;	// 예약 등록 일자
	private String rest_time;		//시술 시간
	private int rest_state;			// 예약 상태
	private String rest_payoption;	// 결제 방식
	private String rest_memo;		// 디자이너 전달사항
	private String rest_comment;	// 시술 특이사항
	private int rest_totalprice;	//예약 총 금액
	
	private String m_name;			//회원이름
	private String m_gender;		//회원성별
	private String m_phone;		    //회원전화번호
	
	
	private int styling_num;
	private String styling_name;
	private String des_name;
	
	
	
	
	
	public String getDes_name() {
		return des_name;
	}
	public void setDes_name(String des_name) {
		this.des_name = des_name;
	}
	public int getRest_totalprice() {
		return rest_totalprice;
	}
	public void setRest_totalprice(int rest_totalprice) {
		this.rest_totalprice = rest_totalprice;
	}
	public String getStyling_name() {
		return styling_name;
	}
	public void setStyling_name(String styling_name) {
		this.styling_name = styling_name;
	}
	public int getStyling_num() {
		return styling_num;
	}
	public void setStyling_num(int styling_num) {
		this.styling_num = styling_num;
	}
	
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getRest_time() {
		return rest_time;
	}
	public void setRest_time(String rest_time) {
		this.rest_time = rest_time;
	}
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
