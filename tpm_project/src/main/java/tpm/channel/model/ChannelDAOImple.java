package tpm.channel.model;

import org.mybatis.spring.SqlSessionTemplate;

public class ChannelDAOImple implements ChannelDAO {

	private SqlSessionTemplate sqlMap;
	
	public ChannelDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
		
	public int createChannel() {
		// TODO Auto-generated method stub
		return 0;
	}

}
