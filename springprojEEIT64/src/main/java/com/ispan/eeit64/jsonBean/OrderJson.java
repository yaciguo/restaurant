package com.ispan.eeit64.jsonBean;

import java.util.List;

public class OrderJson {
	public Integer id;
	public List<Integer> orderDetails;
	public String time;
	
	public OrderJson(Integer id, List<Integer> orderDetails, String time) {
		super();
		this.id = id+1;
		this.orderDetails = orderDetails;
		this.time = time;
	}
}
