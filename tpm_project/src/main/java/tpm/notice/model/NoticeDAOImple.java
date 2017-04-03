package tpm.notice.model;

import org.mybatis.spring.SqlSessionTemplate;

public class NoticeDAOImple implements NoticeDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public NoticeDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
}
