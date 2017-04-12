package tpm.work.model;

public class WorkMemberDTO {
	
	private int work_idx;
	private int member_idx;
	
	public WorkMemberDTO() {
		super();
	}

	public WorkMemberDTO(int work_idx, int member_idx) {
		super();
		this.work_idx = work_idx;
		this.member_idx = member_idx;
	}

	public int getWork_idx() {
		return work_idx;
	}

	public void setWork_idx(int work_idx) {
		this.work_idx = work_idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

}
