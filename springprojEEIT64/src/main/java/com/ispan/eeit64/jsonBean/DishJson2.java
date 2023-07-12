package com.ispan.eeit64.jsonBean;

import java.util.Map;

public class DishJson2 {
	public Integer id;
	public String name;
	public Map<String,Object> categoryBean;
	public String picture;
	public Integer price;
	public Integer cost;
	public String description;
	public String status;

	public DishJson2(Integer id, String name, Map<String, Object> categoryBean, String picture, Integer price,
			Integer cost, String description, String status) {
		this.id = id;
		this.name = name;
		this.categoryBean = categoryBean;
		this.picture = picture;
		this.price = price;
		this.cost = cost;
		this.description = description;
		this.status = status;
	}	
}
