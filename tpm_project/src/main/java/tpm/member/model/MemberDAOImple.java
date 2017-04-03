package tpm.member.model;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAOImple implements MemberDAO {

	public static final int ID_NO=0;
	public static final int LOGIN_OK=1;
	public static final int PASSWORD_NO=2;
	private SqlSessionTemplate sqlMap;
	
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

	public String idCheck() {
		// TODO Auto-generated method stub
		return null;
	}

	public int addTendency() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int addMember(MemberDTO mdto) {
		int count=sqlMap.insert("memberInsert",mdto);
		return count;
	}

	public int delMember() {
		// TODO Auto-generated method stub
		return 0;
	}

	public String emailCheck() {
		// TODO Auto-generated method stub
		return null;
	}

	public MemberDTO getMemberInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	public int updateMember() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int addMember() {
		// TODO Auto-generated method stub
		return 0;
	}

}
