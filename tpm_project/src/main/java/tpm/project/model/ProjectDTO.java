package tpm.project.model;

public class ProjectDTO {
	
	private int project_idx;
	private String project_name;
	private int Project_state;
	
	public ProjectDTO() {
		super();
	}

	public ProjectDTO(int project_idx, String project_name, int project_state) {
		super();
		this.project_idx = project_idx;
		this.project_name = project_name;
		Project_state = project_state;
	}
	
	
	
}
