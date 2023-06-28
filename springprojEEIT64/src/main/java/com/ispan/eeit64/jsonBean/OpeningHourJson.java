package com.ispan.eeit64.jsonBean;

public class OpeningHourJson {
	public Integer id;
	public Integer day;
	public String open;
	public String close;
	
	public OpeningHourJson(Integer id, Integer day, String open, String close) {
		this.id = id;
		this.day = day;
		this.open = open;
		this.close = close;
	}

}
