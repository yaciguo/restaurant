package com.ispan.eeit64.jsonBean;

public class DishJson {
	public Integer id;
	public String name;
	public String category;
	public Integer price;
	public Integer cost;
	public String description;
	
	public DishJson(Integer id, String name, String category, Integer price, Integer cost, String description) {
		super();
		this.id = id;
		this.name = name;
		this.category = category;
		this.price = price;
		this.cost = cost;
		this.description = description;
	}
}
