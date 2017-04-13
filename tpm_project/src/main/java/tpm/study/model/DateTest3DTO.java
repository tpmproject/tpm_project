package tpm.study.model;

import java.sql.Timestamp;

public class DateTest3DTO {
	private Timestamp t_date;

	public DateTest3DTO() {
		super();
	}

	public DateTest3DTO(Timestamp t_date) {
		super();
		this.t_date = t_date;
	}

	public Timestamp getT_date() {
		return t_date;
	}

	public void setT_date(Timestamp t_date) {
		this.t_date = t_date;
	}

	@Override
	public String toString() {
		return "DateTest3DTO [t_date=" + t_date + "]";
	}

}
