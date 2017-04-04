package tpm.project.model;

import java.util.ArrayList;
import org.mybatis.spring.SqlSessionTemplate;

import tpm.category.model.CategoryDTO;
import tpm.checklist.model.ChecklistDTO;
import tpm.work.model.WorkDTO;

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
		
		sqlMap.selectMap("projectSearchCount",dto,"");
		ArrayList<TotalDTO> temp=(ArrayList)sqlMap.selectList("projectSearch",dto);
		ArrayList<ProjectDTO> arr=new ArrayList<ProjectDTO>();
		ArrayList<CategoryDTO> cate_arr=new ArrayList<CategoryDTO>();
		ArrayList<WorkDTO> work_arr=new ArrayList<WorkDTO>();
		ArrayList<ChecklistDTO> check_arr=new ArrayList<ChecklistDTO>();
		
		int category_count=0;
		int work_count=0;
		
		ProjectDTO pdto=new ProjectDTO();
		for(int i=0;i<temp.size();i++){
			TotalDTO tdto=temp.get(i);
			
			//프로젝트 정보 입력
			if(i==0){
				pdto.setProject_idx(tdto.getProject_idx());
				pdto.setProject_name(tdto.getProject_name());
				pdto.setProject_content(tdto.getProject_content());
				pdto.setProject_state(tdto.getProject_state());
			}
			
			
			int checklist_idx=tdto.getChecklist_idx();
			int work_idx=tdto.getWork_idx();
			String checklist_content=tdto.getChecklist_content();
			int checklist_state=tdto.getChecklist_state();
			ChecklistDTO chdto=new ChecklistDTO(checklist_idx, work_idx, checklist_content, checklist_state);
			
			
			
	
			CategoryDTO cdto=new CategoryDTO();
			WorkDTO wdto=new WorkDTO();
			
			
			
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
