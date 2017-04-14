package tpm.work.model;

import java.util.ArrayList;

import tpm.category.model.CategoryDTO;
import tpm.file.model.FileDTO;
import tpm.member.model.MemberDTO;
import tpm.sample.model.SampleWorkDTO;

public interface WorkDAO {
	
	public ArrayList<MemberDTO> workMemberList(FileDTO dto);
	public ArrayList<MemberDTO> projectMember(int project_idx);
	public ArrayList<WorkDTO> workList(int work_idx);
	public ArrayList<MemberDTO> workMember(int work_idx);
	public ArrayList<MyWorkDTO> myWorkAllList(MemberDTO mdto);
	public int addWork(WorkDTO dto);
	public int workMemberInsert(WorkMemberDTO dto);
	public int workMemberDelete(WorkDTO dto);
	public int updateWork(WorkDTO dto);
	public int workDelete(int work_idx);
	public int testAddWork(SampleWorkDTO dto);
	
}
