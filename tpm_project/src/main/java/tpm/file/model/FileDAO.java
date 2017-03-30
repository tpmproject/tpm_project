package tpm.file.model;

import java.util.ArrayList;

import tpm.project.model.ProjectDTO;

public interface FileDAO {
	
	public ArrayList<FileDTO>projectAllList();
	public getFileList();
	public getFileContent();
	public int addFile();
	public int updateFile();
	public int delFile();

}
