package tpm.checklist.model;

import org.mybatis.spring.SqlSessionTemplate;

public class ChecklistDAOImple implements ChecklistDAO {

	private SqlSessionTemplate sqlMap;
	
	public ChecklistDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
	public ChecklistDTO addChecklist(ChecklistDTO dto) {
		
		int checklist_idx=sqlMap.selectOne("checklist_seq");
		dto.setChecklist_idx(checklist_idx);
		int result= sqlMap.insert("addChecklist", dto);
		
		if(result>0){
			return dto;
		}else{
			return null;	
		}
		
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
