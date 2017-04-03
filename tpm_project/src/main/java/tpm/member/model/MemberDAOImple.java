package tpm.member.model;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAOImple implements MemberDAO {

	private SqlSessionTemplate sqlMap;
	
	public MemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
	public int login() {
		// TODO Auto-generated method stub
		return 0;
	}

	public String idCheck() {
		// TODO Auto-generated method stub
		return null;
	}

	public int addTendency() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int addMember() {
		// TODO Auto-generated method stub
		return 0;
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

}
