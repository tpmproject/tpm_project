package tpm.tendency.model;

import java.util.List;

public interface TendencyDAO {
	
	public int addTendency(TendencyDTO dto);

	public List<TendencyDTO> getSelfTendency(int member_idx);
	
	public List<TendencyDTO> getTeamTendency(int member_idx);
	
}
