package tpm.tendency.model;

import java.util.List;

public interface TendencyDAO {

	public List<TendencyDTO> getTendency(int member_idx);
}
