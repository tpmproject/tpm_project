package tpm.work.model;

import java.util.ArrayList;

import tpm.category.model.CategoryDTO;

public interface WorkDAO {
	
	public ArrayList<WorkDTO> listWork();
	public int addWork();
	public int updateWork();
	public int delWork();
	
}
