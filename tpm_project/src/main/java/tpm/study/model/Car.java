package tpm.study.model;

public class Car {

	private String ownerId;
	private String modelNo;
	private String color;

	public Car() {
		super();
	}

	public Car(String ownerId, String modelNo, String color) {
		super();
		this.ownerId = ownerId;
		this.modelNo = modelNo;
		this.color = color;
	}

	public String getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
	}

	public String getModelNo() {
		return modelNo;
	}

	public void setModelNo(String modelNo) {
		this.modelNo = modelNo;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	@Override
	public String toString() {
		return "Car [ownerId=" + ownerId + ", modelNo=" + modelNo + ", color=" + color + "]";
	}
}
