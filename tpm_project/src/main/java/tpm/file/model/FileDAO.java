package tpm.file.model;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import tpm.project.model.ProjectDTO;

public interface FileDAO {
	
	public ArrayList<ProjectDTO> projectAllList(int member_idx);
	public ArrayList<FileDTO> getFileList(FileSortDTO fsdto,String search_text);
	public ArrayList<FileDTO> searchFile(int project_idx);
	public int addFile(FileDTO fdto);
	public int updateFile();
	public int delFile(int file_idx);
	public ArrayList<FileDTO> getWorkFileList(HashMap<String,Integer> map);
}
