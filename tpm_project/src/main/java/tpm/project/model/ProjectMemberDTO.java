package tpm.project.model;

import tpm.member.model.MemberDTO;

public class ProjectMemberDTO {

	private int project_idx;
	private int member_idx;
	private int project_level;

	private MemberDTO mdtos;

	final public static int ONLY_READ = 1000;
	final public static int PROJECT_MEMBER = 2000;
	final public static int PROJECT_MANAGER = 3000;

	public ProjectMemberDTO() {
		super();
	}

	public ProjectMemberDTO(int project_idx, int member_idx, int project_level) {
		super();
		this.project_idx = project_idx;
		this.member_idx = member_idx;
		this.project_level = project_level;
	}

	public ProjectMemberDTO(int project_idx, int member_idx, int project_level, MemberDTO mdtos) {
		super();
		this.project_idx = project_idx;
		this.member_idx = member_idx;
		this.project_level = project_level;
		this.mdtos = mdtos;
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

	public MemberDTO getMdtos() {
		return mdtos;
	}

	public void setMdtos(MemberDTO mdtos) {
		this.mdtos = mdtos;
	}

	@Override
	public String toString() {
		return "ProjectMemberDTO [project_idx=" + project_idx + ", member_idx=" + member_idx + ", project_level="
				+ project_level + ", mdtos=" + mdtos + "]";
	}

	

}
