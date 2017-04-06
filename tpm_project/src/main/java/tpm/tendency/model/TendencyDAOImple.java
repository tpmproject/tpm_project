package tpm.tendency.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class TendencyDAOImple implements TendencyDAO {
	
	private SqlSessionTemplate sqlMap;

	public TendencyDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<TendencyDTO> getTendency(int member_idx) {
		
		List<TendencyDTO> dto = sqlMap.selectList("SelfTendency", member_idx);
		
		return dto;
	}

}
