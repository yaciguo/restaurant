package com.ispan.eeit64.jsonBean;

public class ActivityJson {
	public Integer id;
	public String name;
	public String type;
	public Integer discount;
	public Integer amount;
	public String startDate;
	public String endDate;
	public Integer FK_Dish_Id;
	
	public ActivityJson(Integer id, String name, String type, Integer discount, Integer amount, String startDate,
			String endDate, Integer fK_Dish_Id) {
		this.id = id;
		this.name = name;
		this.type = type;
		this.discount = discount;
		this.amount = amount;
		this.startDate = startDate;
		this.endDate = endDate;
		this.FK_Dish_Id = fK_Dish_Id;
	}

	@Override
	public String toString() {
		return "ActivityJson [id=" + id + ", name=" + name + ", type=" + type + ", discount=" + discount + ", amount="
				+ amount + ", startDate=" + startDate + ", endDate=" + endDate + ", FK_Dish_Id=" + FK_Dish_Id + "]";
	}
		
}
