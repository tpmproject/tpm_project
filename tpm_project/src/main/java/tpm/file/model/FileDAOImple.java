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
	
	public ArrayList<ProjectDTO> projectAllList(int member_idx) {
		ArrayList<ProjectDTO> project_list=(ArrayList)sqlMap.selectList("projectList",member_idx);
		return project_list;
	}

	public ArrayList<FileDTO> getFileList(FileSortDTO fsdto) {
		String line_name=fsdto.getLine_name();
		int project_idx=fsdto.getProject_idx();
		System.out.println("sql 들어가기전 line_name:"+line_name);
		System.out.println("project_idx:"+project_idx);
		ArrayList<FileDTO> arr =null;
		if(!(line_name==null)){
			if(line_name.equals("file_size")){
			     arr=(ArrayList)sqlMap.selectList("fileList_size_sort",project_idx);
			     
			}else if(line_name.equals("file_date")){
				 arr=(ArrayList)sqlMap.selectList("fileList_date_sort",project_idx);
				 
			}else if(line_name.equals("file_name")){
				 arr=(ArrayList)sqlMap.selectList("fileList_name_sort",project_idx);
				 
			}else if(line_name.equals("member_idx")){
				 arr=(ArrayList)sqlMap.selectList("fileList_size_sort",project_idx);
				 
			}else if(line_name.equals("file_size")){
				 arr=(ArrayList)sqlMap.selectList("fileList_size_sort",project_idx);
			}
		}else{
			arr=(ArrayList)sqlMap.selectList("fileList",project_idx);
			System.out.println("정렬 안된 line_name:"+line_name);
		}
		
			return arr;

		
	}

	public int searchFile() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int addFile(FileDTO fdto) {
		int result=sqlMap.insert("addFile",fdto);
		
		return result;
	}

	public int updateFile() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delFile(int file_idx) {
		
		int result=sqlMap.delete("delFile",file_idx);
		System.out.println(result);
		return result;
	}

}
