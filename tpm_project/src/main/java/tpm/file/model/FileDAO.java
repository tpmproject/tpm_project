package tpm.file.model;

import java.util.ArrayList;

import tpm.project.model.ProjectDTO;

public interface FileDAO {
	
	public ArrayList<ProjectDTO> projectAllList();
	public ArrayList<FileDTO> getFileList(int project_idx);
	public int searchFile();
	public int addFile();
	public int updateFile();
	public int delFile();

}
