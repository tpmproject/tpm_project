package tpm.project.model;

import java.util.ArrayList;
import org.mybatis.spring.SqlSessionTemplate;

import tpm.category.model.CategoryDTO;

public class ProjectDAOImple implements ProjectDAO {

	private SqlSessionTemplate sqlMap;
	
	
	
	public ProjectDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap=sqlMap;
		
	}
	
	public ArrayList<ProjectDTO> projectAllList() {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<CategoryDTO> projectSearch(ProjectDTO dto) {
		
		ArrayList<CategoryDTO> arr=(ArrayList)sqlMap.selectList("projectSearch",dto);
		
		return arr;
	}

	public int projectInsert(ProjectDTO dto) {
		
		int count=sqlMap.insert("projectInsert", dto);
		return count;
	}

	public int projectUpdate(ProjectDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int projectDelete(int project_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ProjectDTO findProject(String project_name) {
		// TODO Auto-generated method stub
		return null;
	}

}
