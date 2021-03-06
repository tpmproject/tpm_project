package tpm.member.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import tpm.project.model.ProjectDTO;
import tpm.project.model.ProjectMemberDTO;
import tpm.tendency.model.TendencyDTO;

public class MemberDAOImple implements MemberDAO {

	public static final int ID_NO=0;
	public static final int LOGIN_OK=1;
	public static final int PASSWORD_NO=2;
	
	private SqlSessionTemplate sqlMap;
	public MemberDAOImple(){
		
	}
	public MemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
	public int login(String userid,String userpwd) {
		String db_pwd=sqlMap.selectOne("login",userid);
		int result=0;
		
		if(db_pwd!=null&&db_pwd!=""){
			if(db_pwd.equals(userpwd)){
				result=LOGIN_OK;
			}else{
				result=PASSWORD_NO;
			}
		}else{
			result=ID_NO;
		}
		
		
		return result;
	}
	public List<MemberDTO> userInfo(String userid){
		List<MemberDTO> list=sqlMap.selectList("userInfo",userid);
		
		return list;
	}
	public String idCheck(String email) {
		String db_id = sqlMap.selectOne("memberIdCheck",email);
		return db_id;
	}
	
	public int addTendency() {
		return 0;
	}

	public int addMember(MemberDTO mdto) {
		int count=sqlMap.insert("memberInsert",mdto);
		return count;
	}
	public int memberFindId(String member_id) {
		int count=sqlMap.selectOne("memberFindId",member_id);
		return count;
	}
	
	public int delMember(String userid){
		int count = sqlMap.delete("memberDelete", userid);
		return count;
	}
	
	public MemberDTO getMemberInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	public int updateMember(MemberDTO mdto) {
		int count = sqlMap.update("memberUpdate", mdto);
		return count;
	}
	
	public String myWorkCount(int member_idx) {
		String count = sqlMap.selectOne("myWorkCount", member_idx);
		return count;
	}
	
	public String myWorkComplete(int member_idx) {
		String count = sqlMap.selectOne("myWorkComplete", member_idx);
		return count;
	}
	
	public List<ProjectDTO> myproject(int member_idx) {
		List<ProjectDTO> list = sqlMap.selectList("myProject", member_idx);
		return list;
	}
	
	public String myWorkIng(ProjectMemberDTO dto) {
		String count = sqlMap.selectOne("myWorkIng", dto);
		return count;
	}
	
	public String myworkTotal(ProjectMemberDTO dto) {
		String count = sqlMap.selectOne("myWorkTotal", dto);
		return count;
	}
	
	public ArrayList<MemberDTO> getMemberIdAndNameSearch(MemberDTO mdto) {
		ArrayList<MemberDTO> array_dto =(ArrayList) sqlMap.selectList("memberIdAndNameSearch", mdto);
		return array_dto;
	}
	
	public ArrayList<MemberDTO> memberAddSearch(MemberDTO dto) {
		ArrayList<MemberDTO> arr=(ArrayList) sqlMap.selectList("memberAddSearch", dto);
		return arr;
	}
	public ArrayList<MemberDTO> getMemberAllList() {
		ArrayList<MemberDTO> arry_mdto = (ArrayList) sqlMap.selectList("memberAllList");
		return arry_mdto;
	}
	
	public int setThema(MemberDTO dto) {
		int count = sqlMap.update("memberThema", dto);
		
		return count;
	}
	
	public ArrayList<MemberDTO> getMemberPlist(int project_idx){
		ArrayList<MemberDTO> p_marry=(ArrayList) sqlMap.selectList("getMemberPlist", project_idx);
		return p_marry;
	}
}
