package tpm.member.model;

public class MemberDAO {
	
	public int login();
	public String idCheck();
	public int addTendency();
	public int addMember();
	public int delMember();
	public String emailCheck();
	public MemberDTO getMemberInfo();
	public int updateMember();

}
