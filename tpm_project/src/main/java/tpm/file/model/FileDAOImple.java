package tpm.file.model;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import tpm.project.model.ProjectDTO;

public class FileDAOImple implements FileDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public FileDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
	public ArrayList<ProjectDTO> projectAllList() {
		ArrayList<ProjectDTO> project_list=(ArrayList)sqlMap.selectList("projectList");
		return project_list;
	}

	public ArrayList<FileDTO> getFileList(int project_idx) {
		ArrayList<FileDTO> arr=(ArrayList)sqlMap.selectList("fileList",project_idx);
		return arr;
	}

	public int searchFile() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int addFile() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateFile() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delFile() {
		// TODO Auto-generated method stub
		return 0;
	}

}
