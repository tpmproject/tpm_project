package tpm.tendency.model;

public class TendencyDTO {
	
	private int tendency_e;
	private int tendency_i;
	private int tendency_s;
	private int tendency_n;
	private int tendency_t;
	private int tendency_f;
	private int tendency_j;
	private int tendency_p;
	
	private int member_idx;
	private int project_idx;
	private int appraiser_idx;

	public TendencyDTO() {
		super();
	}

	public TendencyDTO(int tendency_e, int tendency_i, int tendency_s, int tendency_n, int tendency_t, int tendency_f,
			int tendency_j, int tendency_p, int member_idx, int project_idx, int appraiser_idx) {
		super();
		this.tendency_e = tendency_e;
		this.tendency_i = tendency_i;
		this.tendency_s = tendency_s;
		this.tendency_n = tendency_n;
		this.tendency_t = tendency_t;
		this.tendency_f = tendency_f;
		this.tendency_j = tendency_j;
		this.tendency_p = tendency_p;
		this.member_idx = member_idx;
		this.project_idx = project_idx;
		this.appraiser_idx = appraiser_idx;
	}

	public int getTendency_e() {
		return tendency_e;
	}

	public void setTendency_e(int tendency_e) {
		this.tendency_e = tendency_e;
	}

	public int getTendency_i() {
		return tendency_i;
	}

	public void setTendency_i(int tendency_i) {
		this.tendency_i = tendency_i;
	}

	public int getTendency_s() {
		return tendency_s;
	}

	public void setTendency_s(int tendency_s) {
		this.tendency_s = tendency_s;
	}

	public int getTendency_n() {
		return tendency_n;
	}

	public void setTendency_n(int tendency_n) {
		this.tendency_n = tendency_n;
	}

	public int getTendency_t() {
		return tendency_t;
	}

	public void setTendency_t(int tendency_t) {
		this.tendency_t = tendency_t;
	}

	public int getTendency_f() {
		return tendency_f;
	}

	public void setTendency_f(int tendency_f) {
		this.tendency_f = tendency_f;
	}

	public int getTendency_j() {
		return tendency_j;
	}

	public void setTendency_j(int tendency_j) {
		this.tendency_j = tendency_j;
	}

	public int getTendency_p() {
		return tendency_p;
	}

	public void setTendency_p(int tendency_p) {
		this.tendency_p = tendency_p;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public int getProject_idx() {
		return project_idx;
	}

	public void setProject_idx(int project_idx) {
		this.project_idx = project_idx;
	}

	public int getAppraiser_idx() {
		return appraiser_idx;
	}

	public void setAppraiser_idx(int appraiser_idx) {
		this.appraiser_idx = appraiser_idx;
	}

}
