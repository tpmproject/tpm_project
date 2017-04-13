package tpm.study.model;

import java.sql.Date;

public class DateTest1DTO {
	private Date t_date;

	public DateTest1DTO() {
		super();
	}

	public DateTest1DTO(Date t_date) {
		super();
		this.t_date = t_date;
	}

	public Date getT_date() {
		return t_date;
	}

	public void setT_date(Date t_date) {
		this.t_date = t_date;
	}

	@Override
	public String toString() {
		return "DateTest1DTO [t_date=" + t_date + "]";
	}

}
