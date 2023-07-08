package com.ispan.eeit64.controller.APIResult;

import java.util.List;
import java.util.Map;

import lombok.Data;

// @Getter
// @Setter
@Data
public class APIResult {
    private Object data;
	private Integer code;
    private String msg;

    public APIResult(Integer code, Object data, String msg) {
        this.data = data;
        this.code = code;
        this.msg = msg;
    }

    public APIResult(Integer code, Object data) {
        this.data = data;
        this.code = code;
    }

    public APIResult() {

    }
	// public void setData(List<Map<String, Object>> categoryAndDish) {
	// 	// TODO Auto-generated method stub
		
	// }
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}