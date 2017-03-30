package tpm.work.model;

import java.util.ArrayList;

public interface WorkDAO {
	
	public ArrayList<WorkDTO> listWork();
	public int addWork();
	public int updateWork();
	public int delWork();
	
}
