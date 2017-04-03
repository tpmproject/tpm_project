package tpm.member.model;

public class MemberDTO {

	private int member_idx;
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_gender;
	private String member_tel;
	private String member_img;
	private int member_thema;
	
	public MemberDTO() {
		super();
	}

	public MemberDTO(int member_idx, String member_id, String member_pwd, String member_name, String member_gender,
			String member_tel, String member_img, int member_thema) {
		super();
		this.member_idx = member_idx;
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_name = member_name;
		this.member_gender = member_gender;
		this.member_tel = member_tel;
		this.member_img = member_img;
		this.member_thema = member_thema;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pwd() {
		return member_pwd;
	}

	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public String getMember_tel() {
		return member_tel;
	}

	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}

	public String getMember_img() {
		return member_img;
	}

	public void setMember_img(String member_img) {
		this.member_img = member_img;
	}

	public int getMember_thema() {
		return member_thema;
	}

	public void setMember_thema(int member_thema) {
		this.member_thema = member_thema;
	}

	@Override
	public String toString() {
		return "MemberDTO [member_idx=" + member_idx + ", member_id=" + member_id + ", member_pwd=" + member_pwd
				+ ", member_name=" + member_name + ", member_gender=" + member_gender + ", member_tel=" + member_tel
				+ ", member_img=" + member_img + ", member_thema=" + member_thema + "]";
	}
	
	
}
