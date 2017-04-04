package tpm.project.model;

import java.util.ArrayList;

import tpm.category.model.CategoryDTO;

public interface ProjectDAO {

	public ArrayList<ProjectDTO> projectAllList();
	
	public ArrayList<CategoryDTO> projectSearch(ProjectDTO dto);
	
	public int projectInsert(ProjectDTO dto);
	
	public int projectUpdate(ProjectDTO dto);
	
	public int projectDelete(int project_idx);
	
	public ProjectDTO findProject(String project_name);
	
}
