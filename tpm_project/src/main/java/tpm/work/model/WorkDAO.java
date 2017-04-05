package tpm.work.model;

import java.util.ArrayList;

import tpm.category.model.CategoryDTO;
import tpm.member.model.MemberDTO;

public interface WorkDAO {
	
	public ArrayList<WorkDTO> listWork();
	public ArrayList<MemberDTO> projectMember(MemberDTO dto);
	public int addWork();
	public int updateWork();
	public int delWork();
	
}
