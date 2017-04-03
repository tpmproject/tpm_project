package tpm.work.model;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

public class WorkDAOImple implements WorkDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public WorkDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
	public ArrayList<WorkDTO> listWork() {
		// TODO Auto-generated method stub
		return null;
	}

	public int addWork() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateWork() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delWork() {
		// TODO Auto-generated method stub
		return 0;
	}

}
