package tpm.work.model;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import tpm.category.model.CategoryDTO;
import tpm.member.model.MemberDTO;

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

	public int addWork() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateWork() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delWork() {
		// TODO Auto-generated method stub
		return 0;
	}

}
