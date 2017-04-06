package tpm.file.model;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

public class FileDAOImple implements FileDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public FileDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
	public ArrayList<FileDTO> projectAllList() {
		// TODO Auto-generated method stub
		return null;
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
