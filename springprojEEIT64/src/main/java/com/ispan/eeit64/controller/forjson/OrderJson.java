package com.ispan.eeit64.controller.forjson;

import java.util.List;

public class OrderJson {
	public Integer id;
	public List<Integer> orderDetails;
	public String time;
	
	public OrderJson(Integer id, List<Integer> orderDetails, String time) {
		super();
		this.id = id;
		this.orderDetails = orderDetails;
		this.time = time;
	}
}
