package tpm.project.model;

public class ProjectMemberDTO {

	private int project_idx;
	private int member_idx;
	private int project_level;
	
	final public static int ONLY_READ=1000;
	final public static int PROJECT_MEMBER=2000;
	final public static int PROJECT_MANAGER=3000;
	
	public ProjectMemberDTO() {
		super();
	}

	public ProjectMemberDTO(int project_idx, int member_idx, int project_level) {
		super();
		this.project_idx = project_idx;
		this.member_idx = member_idx;
		this.project_level = project_level;
	}

	public int getProject_idx() {
		return project_idx;
	}

	public void setProject_idx(int project_idx) {
		this.project_idx = project_idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public int getProject_level() {
		return project_level;
	}

	public void setProject_level(int project_level) {
		this.project_level = project_level;
	}
}
