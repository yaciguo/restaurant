package com.ispan.eeit64.jsonBean;

public class CategoryJson {
	public Integer id;
	public String name;
	
	public CategoryJson(Integer id, String name) {
		this.id = id+1;
		this.name = name;
	}

	@Override
	public String toString() {
		return "CategoryJson [id=" + id + ", name=" + name + "]";
	}
	
}
