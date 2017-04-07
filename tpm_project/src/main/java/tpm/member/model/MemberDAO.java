package tpm.member.model;

import java.util.ArrayList;
import java.util.List;

import tpm.myfriend.model.MyFriendDTO;

public interface MemberDAO {
	
	public int login(String userid,String userpwd);
	public List<MemberDTO> userInfo(String userid);
	public String idCheck(String email);
	public int addTendency();
	public int addMember(MemberDTO mdto);
	public int delMember(String userid);
	public MemberDTO getMemberInfo();
	public int updateMember(MemberDTO mdto);
	public ArrayList<MemberDTO> getMemberIdAndNameSearch(MemberDTO mdto);
	public ArrayList<MemberDTO> memberAddSearch(MemberDTO dto);

}
