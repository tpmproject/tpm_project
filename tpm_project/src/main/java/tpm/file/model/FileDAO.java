package tpm.file.model;

import java.util.ArrayList;

import tpm.project.model.ProjectDTO;

public interface FileDAO {
	
	public ArrayList<FileDTO> projectAllList();
	public ArrayList<FileDTO> getFileList();
	public int searchFile();
	public int addFile();
	public int updateFile();
	public int delFile();

}
