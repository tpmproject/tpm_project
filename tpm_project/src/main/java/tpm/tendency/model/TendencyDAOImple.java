package tpm.tendency.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class TendencyDAOImple implements TendencyDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public TendencyDAOImple() {
		
	}

	public TendencyDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<TendencyDTO> getSelfTendency(int member_idx) {
		
		List<TendencyDTO> dto = sqlMap.selectList("SelfTendency", member_idx);
		
		return dto;
	}
	
	public List<TendencyDTO> getTeamTendency(int member_idx) {
		
		List<TendencyDTO> dto = sqlMap.selectList("TeamTendency", member_idx);
		
		return dto;
	}
	
	public int addTendency(TendencyDTO dto){
		int result=sqlMap.insert("addTendency",dto);
		return result;
	}

}
