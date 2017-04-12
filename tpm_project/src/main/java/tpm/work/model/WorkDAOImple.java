package tpm.work.model;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import tpm.category.model.CategoryDTO;
import tpm.checklist.model.ChecklistDTO;
import tpm.member.model.MemberDTO;
import tpm.project.model.TotalDTO;
import tpm.sample.model.SampleWorkDTO;

public class WorkDAOImple implements WorkDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public WorkDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
	public ArrayList<WorkDTO> listWork() {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<MemberDTO> projectMember(int project_idx) {
		ArrayList<MemberDTO> arr=(ArrayList)sqlMap.selectList("projectMember",project_idx);
		return arr;
	}
	
	public ArrayList<WorkDTO> workList(int work_idx){
		ArrayList<WorkDTO> arr_w=(ArrayList)sqlMap.selectList("workList",work_idx);
		return arr_w;
	}
	
	public ArrayList<MemberDTO> workMember(int work_idx){
		ArrayList<MemberDTO> arr_m=(ArrayList)sqlMap.selectList("workMember",work_idx);
		return arr_m;
	}

	public int addWork(WorkDTO dto) {
		// TODO Auto-generated method stub
		int result=sqlMap.insert("addWork",dto);
		return result;
	}
	
	public int workMemberInsert(WorkMemberDTO dto){
		int result=sqlMap.insert("workMemberInsert",dto);
		return result;
	}

	public int updateWork() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int workDelete(int work_idx) {
		// TODO Auto-generated method stub
		int result=sqlMap.delete("workDelete", work_idx);
		if(result>0){
			return work_idx;
		}else{
			return 0;
		}
	}

	public ArrayList<MyWorkDTO> myWorkAllList(MemberDTO mdto) {
		ArrayList<TotalDTO> arry_tdto = (ArrayList) sqlMap.selectList("myWorkAllList", mdto);
		ArrayList<MyWorkDTO> arry_mwdto = new ArrayList<MyWorkDTO>();
		ArrayList<ChecklistDTO> arry_ckdto = new ArrayList<ChecklistDTO>();
		
		for (int i = 0 ; i < arry_tdto.size() ; i++) {
			
			if(arry_tdto.get(i).getChecklist_idx() != 0){
				arry_ckdto.add(new ChecklistDTO(
						arry_tdto.get(i).getCategory_idx(), 
						arry_tdto.get(i).getWork_idx(), 
						arry_tdto.get(i).getChecklist_content(), 
						arry_tdto.get(i).getChecklist_state()));
			}
			
			if(i == arry_tdto.size() - 1 || arry_tdto.get(i).getWork_idx() != arry_tdto.get(i+1).getWork_idx()){
				arry_mwdto.add(new MyWorkDTO(arry_tdto.get(i).getProject_idx(), 
						arry_tdto.get(i).getProject_name(), 
						arry_tdto.get(i).getProject_content(), 
						arry_tdto.get(i).getProject_state(), 
						arry_tdto.get(i).getCategory_idx(), 
						arry_tdto.get(i).getCategory_name(), 
						arry_tdto.get(i).getWork_idx(), 
						arry_tdto.get(i).getWork_title(), 
						arry_tdto.get(i).getWork_start(), 
						arry_tdto.get(i).getWork_end(), 
						arry_tdto.get(i).getWork_complete(), 
						arry_tdto.get(i).getWork_confirm(), 
						arry_tdto.get(i).getWork_state(), 
						arry_ckdto));
				arry_ckdto = new ArrayList<ChecklistDTO>();
			}
		}
		
		/*for (MyWorkDTO myworkDTO : arry_mwdto) {
			System.out.println(myworkDTO.toString());
		}*/
		
		return arry_mwdto;
	}

	public int testAddWork(SampleWorkDTO dto) {
		// TODO Auto-generated method stub
		int result=sqlMap.insert("testAddWork",dto);
		
		return result;
	}
	
}
