package com.ispan.eeit64.jsonBean;

import java.util.List;

//update
public class OrderJson {
	public Integer id;
	public String orderStatus;
	public Integer peopleNum;	
	public List<Integer> orderDetails;
	public Integer amount;	
	public String type;
	public String customer;
	public String phone;
	public String leaveTime;
	public String orderTime;
	public String pickTime;
	public Integer FK_Activity_Id;
	
	public OrderJson(Integer id, String orderStatus, Integer peopleNum, List<Integer> orderDetails, Integer amount,
			String type, String customer, String phone, String leaveTime, String orderTime, String pickTime,
			Integer fK_Activity_Id) {
		super();
		this.id = id;
		this.orderStatus = orderStatus;
		this.peopleNum = peopleNum;
		this.orderDetails = orderDetails;
		this.amount = amount;
		this.type = type;
		this.customer = customer;
		this.phone = phone;
		this.leaveTime = leaveTime;
		this.orderTime = orderTime;
		this.pickTime = pickTime;
		this.FK_Activity_Id = fK_Activity_Id;
	}	
	
}
