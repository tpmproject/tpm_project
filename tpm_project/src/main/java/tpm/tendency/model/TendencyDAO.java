package tpm.tendency.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import tpm.member.model.MemberDTO;
import tpm.project.model.ProjectMemberDTO;

public interface TendencyDAO {
	
	public int addTendency(TendencyDTO dto);

	public List<TendencyDTO> getSelfTendency(int member_idx);
	
	public List<TendencyDTO> getTeamTendency(int member_idx);
	
	public ArrayList<MemberDTO> tendencyList(ProjectMemberDTO dto);
	
	public ArrayList<MemberDTO> recommendTendency(int member_idx);
}
