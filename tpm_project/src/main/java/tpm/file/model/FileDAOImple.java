package tpm.file.model;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;

import tpm.project.model.ProjectDTO;

public class FileDAOImple implements FileDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public FileDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	/**프로젝트 리스트 */
	public ArrayList<ProjectDTO> projectAllList(int member_idx) {
		ArrayList<ProjectDTO> project_list=(ArrayList)sqlMap.selectList("projectList",member_idx);
		return project_list;
	}
	/**프로젝트 리스트 검색*/
    public ArrayList<ProjectDTO> projectSearchList(int member_idx, String projectSearch) {
    	System.out.println("dao에 들어옴");
    	HashMap<String, Object> map=new HashMap<String, Object>();
    	map.put("member_idx", member_idx);
    	map.put("projectSearch", projectSearch);
    	
    	ArrayList<ProjectDTO> project_list=(ArrayList)sqlMap.selectList("projectSearchList",map);
    	System.out.println(project_list.get(0).getProject_name());
    	return project_list;
    }

	public ArrayList<FileDTO> getFileList(FileSortDTO fsdto, String search_text) {
		String line_name=fsdto.getLine_name();
		int project_idx=fsdto.getProject_idx();
		String sort=fsdto.getSort();
		
		
		HashMap<Object,Object> map=new HashMap<Object, Object>();
		map.put("line_name", line_name);
		map.put("project_idx", project_idx);
		map.put("sort", sort);
		map.put("search_text", search_text);
		
		//System.out.println(search_text);
		//System.out.println(map.get("search_text"));
		ArrayList<FileDTO> arr =null;
		if (!(line_name == null)) {
				arr = (ArrayList) sqlMap.selectList("fileList_sort", map);
			/*	System.out.println(map.get("search_text"));
				System.out.println("정렬 리스트로 들어옴");*/
			} else {
				arr = (ArrayList) sqlMap.selectList("fileList", map);
				// System.out.println("정렬 안된 line_name:"+line_name);
				//System.out.println("일반 리스트로 들어옴");
		}
		return arr;
	}

	public ArrayList<FileDTO> searchFile(int project_idx) {
		ArrayList<FileDTO> arr =(ArrayList) sqlMap.selectList("allList", project_idx);
		return arr;
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
		//System.out.println(result);
		return result;
	}
	//업무쪽 파일리스트
	public ArrayList<FileDTO> getWorkFileList(HashMap<String,Object> map) {
		ArrayList<FileDTO> fileArr= (ArrayList) sqlMap.selectList("workFileList", map);
	
		return fileArr;
	}
	public ArrayList<FileDTO> getWorkSearchFileList(HashMap<String, Object> map) {
		ArrayList<FileDTO> fileArr= (ArrayList) sqlMap.selectList("workSearchFileList", map);
		return fileArr;
	}
}
