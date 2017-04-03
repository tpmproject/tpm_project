package tpm.checklist.model;

import org.mybatis.spring.SqlSessionTemplate;

public class ChecklistDAOImple implements ChecklistDAO {

	private SqlSessionTemplate sqlMap;
	
	public ChecklistDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
	public int addChecklist() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateChecklist() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delChecklist() {
		// TODO Auto-generated method stub
		return 0;
	}

}
