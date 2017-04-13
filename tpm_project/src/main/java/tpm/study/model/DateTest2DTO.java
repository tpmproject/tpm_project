package tpm.study.model;

import java.util.Date;

public class DateTest2DTO {
	private Date t_date;

	public DateTest2DTO() {
		super();
	}

	public DateTest2DTO(Date t_date) {
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
		return "DateTest2DTO [t_date=" + t_date + "]";
	}

}
