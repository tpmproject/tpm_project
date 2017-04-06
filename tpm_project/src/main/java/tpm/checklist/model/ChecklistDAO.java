package tpm.checklist.model;

public interface ChecklistDAO {

	public int addChecklist(ChecklistDTO dto);
	public int updateChecklist(int checklist_idx);
	public int delChecklist(int checklist_idx);
}
