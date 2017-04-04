package tpm.project.model;

import java.util.ArrayList;
import tpm.work.model.WorkDTO;


public interface ProjectDAO {

	public ArrayList<ProjectDTO> projectAllList();
	
	public ArrayList<WorkDTO> projectSearch(ProjectDTO dto);
	
	public int projectInsert(ProjectDTO dto);
	
	public int projectUpdate(ProjectDTO dto);
	
	public int projectDelete(int project_idx);
	
	public ProjectDTO findProject(String project_name);
	
}
