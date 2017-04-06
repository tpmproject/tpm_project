package tpm.sample.model;

public class MarketInfo {
	private String address;
	private String orderName;
	public MarketInfo() {
		super();
	}
	public MarketInfo(String address, String orderName) {
		super();
		this.address = address;
		this.orderName = orderName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
}
