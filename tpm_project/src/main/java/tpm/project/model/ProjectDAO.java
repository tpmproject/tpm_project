package tpm.project.model;

import java.util.ArrayList;
import tpm.work.model.WorkDTO;


public interface ProjectDAO {

	public ArrayList<ProjectDTO> projectAllList();
	
	public ArrayList<WorkDTO> projectSearch();
	
	public int projectInsert(WorkDTO dto);
	
	public int projectUpdate(WorkDTO dto);
	
	public int projectDelete(int work_idx);
}
