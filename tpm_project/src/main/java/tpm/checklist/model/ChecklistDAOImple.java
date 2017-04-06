package tpm.checklist.model;

import org.mybatis.spring.SqlSessionTemplate;

public class ChecklistDAOImple implements ChecklistDAO {

	private SqlSessionTemplate sqlMap;
	
	public ChecklistDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
	public int addChecklist(ChecklistDTO dto) {
		int result= sqlMap.insert("addChecklist", dto);
		
		return result;
	}

	public int updateChecklist(int checklist_idx) {
		int result=sqlMap.update("updateChecklist", checklist_idx);
		return result;
	}

	public int delChecklist(int checklist_idx) {
		int result=sqlMap.delete("delChecklist", checklist_idx);
		return result;
	}

}
