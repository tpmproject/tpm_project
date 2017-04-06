package tpm.sample.model;

import java.sql.Date;
import java.util.*;

public class SampleWorkDTO {
	private int work_idx;
	private int category_idx;
	private String work_title;
	
	//업무 기한
	private Date work_start;
	private Date work_end;
	private Date work_complete;
	
	private int work_confirm; //결재 요청여부
	private int work_state; //결재 상태
	
	
}
