package com.ispan.eeit64.jsonBean;

//update
public class CheckoutJson {
	public Integer id;
	public String payStatus;
	public String payTime;
	public Integer FK_orderId;
	
	public CheckoutJson(Integer id, String payStatus, String payTime, Integer fK_orderId) {
		super();
		this.id = id;
		this.payStatus = payStatus;
		this.payTime = payTime;
		FK_orderId = fK_orderId;
	}	
}
