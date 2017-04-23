package tpm.channelmember.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class ChannelMemberDAOImple implements ChannelMemberDAO {

	private SqlSessionTemplate sqlMap;

	public ChannelMemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
	public int inviteChannel() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int exitChannel() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertChannelMember(Object obj) {
		// TODO Auto-generated method stub
		return sqlMap.insert("channelMemberInsert", obj);
	}



	

}
