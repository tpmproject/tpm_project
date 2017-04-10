package tpm.member.model;

import java.util.ArrayList;
import java.util.List;

import tpm.myfriend.model.MyFriendDTO;
import tpm.project.model.ProjectDTO;
import tpm.project.model.ProjectMemberDTO;

public interface MemberDAO {
	
	public int login(String userid,String userpwd);
	public List<MemberDTO> userInfo(String userid);
	public String idCheck(String email);
	public int addTendency();
	public int addMember(MemberDTO mdto);
	public int delMember(String userid);
	public MemberDTO getMemberInfo();
	public int updateMember(MemberDTO mdto);
	public String myWorkCount(int member_idx);
	public String myWorkComplete(int member_idx);
	public List<ProjectDTO> myproject(int member_idx);
	public String myWorkIng(ProjectMemberDTO pmdto);
	public ArrayList<MemberDTO> getMemberIdAndNameSearch(MemberDTO mdto);
	public ArrayList<MemberDTO> memberAddSearch(MemberDTO dto);
	public ArrayList<MemberDTO> getMemberAllList();

}
