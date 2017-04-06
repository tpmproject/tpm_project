package tpm.sample.model;

import java.util.*;

public class OrderDTO {
	private List<ItemDTO> itemdto;
	private MarketInfo marketInfo;
	public OrderDTO() {
		super();
	}
	public OrderDTO(List<ItemDTO> itemdto, MarketInfo marketInfo) {
		super();
		this.itemdto = itemdto;
		this.marketInfo = marketInfo;
	}
	public List<ItemDTO> getItemdto() {
		return itemdto;
	}
	
	public void setItemdto(List<ItemDTO> itemdto) {
		this.itemdto = itemdto;
	}
	public MarketInfo getMarketInfo() {
		return marketInfo;
	}
	public void setMarketInfo(MarketInfo marketInfo) {
		this.marketInfo = marketInfo;
	}
}
