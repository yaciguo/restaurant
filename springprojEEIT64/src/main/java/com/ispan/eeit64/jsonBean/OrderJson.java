package com.ispan.eeit64.jsonBean;

import java.util.List;

public class OrderJson {
	public Integer id;
	public List<Integer> orderDetails;
	public String time;
	
	public OrderJson(Integer id, List<Integer> orderDetails, String time) {
		this.id = id;
		this.orderDetails = orderDetails;
		this.time = time;
	}
}
