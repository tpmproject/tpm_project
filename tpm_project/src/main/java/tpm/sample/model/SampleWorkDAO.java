package tpm.sample.model;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class SampleWorkDAO {

	private SqlSessionTemplate sqlMap;
	
	public SampleWorkDAO(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
	public List<Object> getSampleWorkList(){
		return sqlMap.selectList("sampleWorkList");
	}
	
}
