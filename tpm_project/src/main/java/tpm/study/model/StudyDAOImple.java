package tpm.study.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class StudyDAOImple {

	private SqlSessionTemplate sqlMap;

	public StudyDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;

	}

	public List<Object> dtoStudy1Select() {
		return sqlMap.selectList("dtoStudy1Select");
	}
	
	public List<Object> dtoStudy2Select() {
		return sqlMap.selectList("dtoStudy2Select");
	}
	
	public List<Object> dateStudy1Select() {
		return sqlMap.selectList("dateStudy1Select");
	}
	
	public List<Object> dateStudy2Select() {
		return sqlMap.selectList("dateStudy2Select");
	}
	
	public List<Object> dateStudy3Select() {
		return sqlMap.selectList("dateStudy3Select");
	}
	
	public int dateStudy4Insert(DateTest3DTO obj) {
		return sqlMap.insert("dateStudy4Insert", obj);
	}
	
	
}
