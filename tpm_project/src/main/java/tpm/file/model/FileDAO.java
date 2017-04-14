package tpm.file.model;

import java.util.ArrayList;

import tpm.project.model.ProjectDTO;

public interface FileDAO {
	
	public ArrayList<ProjectDTO> projectAllList(int member_idx);
	public ArrayList<FileDTO> getFileList(FileSortDTO fsdto);
	public int searchFile();
	public int addFile(FileDTO fdto);
	public int updateFile();
	public int delFile(int file_idx);

}
