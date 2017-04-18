package tpm.project.model;

import java.util.ArrayList		;

import tpm.member.model.MemberDTO;
import tpm.project.model.ProjectMemberDTO;

public interface ProjectDAO {

	public ArrayList<ProjectDTO> projectAllList(int member_idx);
	
	public ProjectDTO projectSearch(ProjectMemberDTO dto);
	
	public ArrayList<MemberDTO> projectWorkMember(ProjectMemberDTO dto);
	
	public int projectInsert(ProjectDTO dto);
	
	public ArrayList<MemberDTO> projectUpdateFriend(ProjectMemberDTO dto);
	
	public int projectUpdate(ProjectDTO dto);
	
	public int projectDelete(int project_idx);
	
	public ProjectDTO findProject(String project_name);
	
	public int projectMemberDelete(ProjectDTO dto);
	
	public int projectMemberInsert(ProjectMemberDTO dto);
	
}
