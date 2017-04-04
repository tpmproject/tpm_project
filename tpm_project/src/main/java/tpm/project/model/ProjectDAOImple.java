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

	public ArrayList<ProjectDTO> projectSearch(ProjectDTO dto) {
		
		ArrayList<TotalDTO> temp=(ArrayList)sqlMap.selectList("projectSearch",dto);
		ArrayList<ProjectDTO> arr=new ArrayList<ProjectDTO>();
		
		for(int i=0;i<temp.size();i++){
			TotalDTO tdto=temp.get(i);
			System.out.println(tdto.getChecklist_content());
			
		}
		
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
