package tpm.member.model;

import org.springframework.web.multipart.MultipartFile;

public class MemberDTO {

	private int member_idx;
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_gender;
	private String member_tel;
	private String member_img;
	private String member_thema;
	private MultipartFile member_img_file;

	// projectContent 에서 업무 배정자 불러올 때 사용함
	private int work_idx;
	
	//projectList수정 시 사용 [프로젝트멤버=1,마이프렌드=10]
	private int pm;
	private int mf;
	private int project_level;
	
	//추천 멤버
	private int te;
	private int ti;
	private int ts;
	private int tn;
	private int tt;
	private int tf;
	private int tj;
	private int tp;

	public MemberDTO() {
		super();
	}

	public MemberDTO(String member_id, String member_pwd, String member_name, String member_gender, String member_tel,
			String member_img) {
		super();
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_name = member_name;
		this.member_gender = member_gender;
		this.member_tel = member_tel;
		this.member_img = member_img;
	}

	public MemberDTO(int member_idx, String member_id, String member_pwd, String member_name, String member_gender,
			String member_tel, String member_img, String member_thema) {
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

	public MemberDTO(int member_idx, String member_id, String member_pwd, String member_name, String member_gender,
			String member_tel, String member_img, String member_thema, MultipartFile member_img_file, int work_idx) {
		super();
		this.member_idx = member_idx;
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_name = member_name;
		this.member_gender = member_gender;
		this.member_tel = member_tel;
		this.member_img = member_img;
		this.member_thema = member_thema;
		this.member_img_file = member_img_file;
		this.work_idx = work_idx;
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

	public String getMember_thema() {
		return member_thema;
	}

	public void setMember_thema(String member_thema) {
		this.member_thema = member_thema;
	}

	public int getWork_idx() {
		return work_idx;
	}

	public void setWork_idx(int work_idx) {
		this.work_idx = work_idx;
	}

	public MultipartFile getMember_img_file() {
		return member_img_file;
	}

	public void setMember_img_file(MultipartFile member_img_file) {
		this.member_img_file = member_img_file;
	}

	public int getPm() {
		return pm;
	}

	public void setPm(int pm) {
		this.pm = pm;
	}

	public int getMf() {
		return mf;
	}

	public void setMf(int mf) {
		this.mf = mf;
	}
	
	public int getProject_level() {
		return project_level;
	}

	public void setProject_level(int project_level) {
		this.project_level = project_level;
	}

	public int getTe() {
		return te;
	}

	public void setTe(int te) {
		this.te = te;
	}

	public int getTi() {
		return ti;
	}

	public void setTi(int ti) {
		this.ti = ti;
	}

	public int getTs() {
		return ts;
	}

	public void setTs(int ts) {
		this.ts = ts;
	}

	public int getTn() {
		return tn;
	}

	public void setTn(int tn) {
		this.tn = tn;
	}

	public int getTt() {
		return tt;
	}

	public void setTt(int tt) {
		this.tt = tt;
	}

	public int getTf() {
		return tf;
	}

	public void setTf(int tf) {
		this.tf = tf;
	}

	public int getTj() {
		return tj;
	}

	public void setTj(int tj) {
		this.tj = tj;
	}

	public int getTp() {
		return tp;
	}

	public void setTp(int tp) {
		this.tp = tp;
	}

	@Override
	public String toString() {
		return "MemberDTO [member_idx=" + member_idx + ", member_id=" + member_id + ", member_pwd=" + member_pwd
				+ ", member_name=" + member_name + ", member_gender=" + member_gender + ", member_tel=" + member_tel
				+ ", member_img=" + member_img + ", member_thema=" + member_thema + ", member_img_file="
				+ member_img_file + ", work_idx=" + work_idx + ", pm=" + pm + ", mf=" + mf + ", project_level="
				+ project_level + ",  te=" + te + ", ti=" + ti + ", ts=" + ts + ", tn=" + tn + ", tt="
				+ tt + ", tf=" + tf + ", tj=" + tj + ", tp=" + tp + "]";
	}

	

	
}
