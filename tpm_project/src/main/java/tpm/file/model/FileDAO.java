package tpm.file.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import tpm.project.model.ProjectDTO;

public interface FileDAO {
	
	public ArrayList<ProjectDTO> projectAllList(int member_idx);
	public ArrayList<FileDTO> getFileList(FileSortDTO fsdto,String search_text);
	public int searchFile();
	public int addFile(FileDTO fdto);
	public int updateFile();
	public int delFile(int file_idx);

}
