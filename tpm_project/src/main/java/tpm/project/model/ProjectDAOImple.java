package tpm.project.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

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
		
		ArrayList<TotalDTO> temp=(ArrayList)sqlMap.selectList("projectSearch",dto);
		ProjectDTO pdto=new ProjectDTO();
		ArrayList<CategoryDTO> cate_arr=new ArrayList<CategoryDTO>();
		ArrayList<WorkDTO> work_arr=new ArrayList<WorkDTO>();
		ArrayList<ChecklistDTO> check_arr=new ArrayList<ChecklistDTO>();
		HashMap<Integer	, Integer> work_member=new HashMap<Integer, Integer>();
		
		if(temp.size()==0||temp==null){
		return null;	
		}
		
		for(int i=0;i<temp.size();i++){ 
			TotalDTO tdto=temp.get(i);
			
			//프로젝트 정보 입력
			if(i==0){
				pdto.setProject_idx(tdto.getProject_idx());
				pdto.setProject_name(tdto.getProject_name());
				pdto.setProject_content(tdto.getProject_content());
				pdto.setProject_state(tdto.getProject_state());
				pdto.setChecklist_num(tdto.getChecklist_num()-1);
				pdto.setWork_num(tdto.getWork_num()-1);
				pdto.setCategory_num(tdto.getCategory_num()-1);
			}
			
			//checklist 정보 입력
			int checklist_idx=tdto.getChecklist_idx();
			int work_idx=tdto.getWork_idx();
			String checklist_content=tdto.getChecklist_content();
			int checklist_state=tdto.getChecklist_state();
			ChecklistDTO chdto=new ChecklistDTO(checklist_idx, work_idx, checklist_content, checklist_state);
			
			if(checklist_idx!=0){
				check_arr.add(chdto);
			}
			
			if(i==temp.size()-1||tdto.getWork_idx()!=temp.get(i+1).getWork_idx()||checklist_idx==0){
				
				int category_idx=tdto.getCategory_idx();
				String work_title=tdto.getWork_title();
				Date work_start=tdto.getWork_start();
				Date work_end=tdto.getWork_end();
				Date work_complete=tdto.getWork_complete();
				int work_confirm=tdto.getWork_confirm();
				int work_state=tdto.getWork_state();
				WorkDTO wdto=new WorkDTO(work_idx, category_idx, work_title, work_start, work_end, work_complete, work_confirm, work_state, tdto.getProject_name(), tdto.getCategory_name(), check_arr);
				if(work_idx!=0){
					work_arr.add(wdto);
				}
				check_arr=new ArrayList<ChecklistDTO>();

				if(i==temp.size()-1||tdto.getCategory_idx()!=temp.get(i+1).getCategory_idx()||work_idx==0){
					int project_idx=tdto.getProject_idx();
					String category_name=tdto.getCategory_name();
					CategoryDTO cdto=new CategoryDTO(category_idx, project_idx, category_name, work_arr);
					work_arr=new ArrayList<WorkDTO>();
					cate_arr.add(cdto);
					
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
