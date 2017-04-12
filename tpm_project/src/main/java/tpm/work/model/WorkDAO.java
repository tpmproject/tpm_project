package tpm.work.model;

import java.util.ArrayList;

import tpm.category.model.CategoryDTO;
import tpm.member.model.MemberDTO;
import tpm.sample.model.SampleWorkDTO;

public interface WorkDAO {
	
	public ArrayList<WorkDTO> listWork();
	public ArrayList<MemberDTO> projectMember(int project_idx);
	public ArrayList<WorkDTO> workList(int work_idx);
	public ArrayList<MemberDTO> workMember(int work_idx);
	public ArrayList<MyWorkDTO> myWorkAllList(MemberDTO mdto);
	public int addWork(WorkDTO dto);
	public int workMemberInsert(WorkMemberDTO dto);
	public int updateWork();
	public int workDelete(int work_idx);
	public int testAddWork(SampleWorkDTO dto);
	
}
