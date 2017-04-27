package tpm.file.model;

import java.sql.*;
import java.util.List;

import tpm.member.model.MemberDTO;

public class FileDTO {

	private int file_idx;
	private int project_idx;
	private int work_idx;
	private int member_idx;
	private String file_name;
	private String file_size;
	private Timestamp file_date;
	private String file_path;
	private MemberDTO memberdto;
	
	public FileDTO() {
		super();
	}

	
	
	
	
	public MemberDTO getMemberdto() {
		return memberdto;
	}





	public void setMemberdto(MemberDTO memberdto) {
		this.memberdto = memberdto;
	}





	public FileDTO(int file_idx, int project_idx, int work_idx, int member_idx, String file_name, String file_size,
			Timestamp file_date, String file_path, MemberDTO memberdto) {
		super();
		this.file_idx = file_idx;
		this.project_idx = project_idx;
		this.work_idx = work_idx;
		this.member_idx = member_idx;
		this.file_name = file_name;
		this.file_size = file_size;
		this.file_date = file_date;
		this.file_path = file_path;
		this.memberdto = memberdto;
	}





	public FileDTO(int file_idx, int project_idx, int work_idx, int member_idx, String file_name, String file_size,
			Timestamp file_date, String file_path) {
		super();
		this.file_idx = file_idx;
		this.project_idx = project_idx;
		this.work_idx = work_idx;
		this.member_idx = member_idx;
		this.file_name = file_name;
		this.file_size = file_size;
		this.file_date = file_date;
		this.file_path = file_path;
	}

	public FileDTO(int project_idx, int work_idx, int member_idx, String file_name, String file_size,
			String file_path) {
		super();
		this.project_idx = project_idx;
		this.work_idx = work_idx;
		this.member_idx = member_idx;
		this.file_name = file_name;
		this.file_size = file_size;
		this.file_path = file_path;
	}

	

	public int getFile_idx() {
		return file_idx;
	}

	public void setFile_idx(int file_idx) {
		this.file_idx = file_idx;
	}

	public int getProject_idx() {
		return project_idx;
	}

	public void setProject_idx(int project_idx) {
		this.project_idx = project_idx;
	}

	public int getWork_idx() {
		return work_idx;
	}

	public void setWork_idx(int work_idx) {
		this.work_idx = work_idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getFile_size() {
		return file_size;
	}

	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}

	public Timestamp getFile_date() {
		return file_date;
	}

	public void setFile_date(Timestamp file_date) {
		this.file_date = file_date;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}





	@Override
	public String toString() {
		return "FileDTO [file_idx=" + file_idx + ", project_idx=" + project_idx + ", work_idx=" + work_idx
				+ ", member_idx=" + member_idx + ", file_name=" + file_name + ", file_size=" + file_size
				+ ", file_date=" + file_date + ", file_path=" + file_path + ", memberdto=" + memberdto + "]";
	}

	

}
