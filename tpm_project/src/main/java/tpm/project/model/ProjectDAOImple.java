package tpm.project.model;

import java.sql.Date;
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

	public ProjectDTO projectSearch(ProjectDTO dto) {
		
		sqlMap.selectMap("projectSearchCount",dto,"");
		ArrayList<TotalDTO> temp=(ArrayList)sqlMap.selectList("projectSearch",dto);
		ProjectDTO pdto=new ProjectDTO();
		ArrayList<CategoryDTO> cate_arr=new ArrayList<CategoryDTO>();
		ArrayList<WorkDTO> work_arr=new ArrayList<WorkDTO>();
		ArrayList<ChecklistDTO> check_arr=new ArrayList<ChecklistDTO>();
		
		
		
		for(int i=0;i<temp.size();i++){
			TotalDTO tdto=temp.get(i);
			
			//프로젝트 정보 입력
			if(i==0){
				pdto.setProject_idx(tdto.getProject_idx());
				pdto.setProject_name(tdto.getProject_name());
				pdto.setProject_content(tdto.getProject_content());
				pdto.setProject_state(tdto.getProject_state());
			}
			
			//checklist 정보 입력
			int checklist_idx=tdto.getChecklist_idx();
			int work_idx=tdto.getWork_idx();
			String checklist_content=tdto.getChecklist_content();
			int checklist_state=tdto.getChecklist_state();
			ChecklistDTO chdto=new ChecklistDTO(checklist_idx, work_idx, checklist_content, checklist_state);
			check_arr.add(chdto);
			
			if(tdto.getWork_idx()!=temp.get(i+1).getWork_idx()){
				
				int category_idx=tdto.getCategory_idx();
				String work_title=tdto.getWork_title();
				Date work_start=tdto.getWork_start();
				Date work_end=tdto.getWork_end();
				Date work_complete=tdto.getWork_complete();
				int work_confirm=tdto.getWork_confirm();
				int work_state=tdto.getWork_state();
				WorkDTO wdto=new WorkDTO(work_idx, category_idx, work_title, work_start, work_end, work_complete, work_confirm, work_state, tdto.getProject_name(), tdto.getCategory_name(), check_arr);
				work_arr.add(wdto);
				check_arr=new ArrayList<ChecklistDTO>();
				
				if(tdto.getCategory_idx()!=temp.get(i+1).getCategory_idx()){
					int project_idx=tdto.getProject_idx();
					String category_name=tdto.getCategory_name();
					CategoryDTO cdto=new CategoryDTO(category_idx, project_idx, category_name, work_arr);
					work_arr=new ArrayList<WorkDTO>();
					
					if(i==temp.size()-1){
						pdto.setCategory_dtos(cate_arr);
					}
				}
			}
			
		}
		
		return pdto;
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
