package com.ispan.eeit64.jsonBean;

public class ClosingTimeJson {
	public Integer id;
	public String start;
	public String end;
	public String note;
    public ClosingTimeJson(Integer id, String start, String end, String note) {
        this.id = id;
        this.start = start;
        this.end = end;
        this.note = note;
    }
    
}
