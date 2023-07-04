package com.ispan.eeit64.controller.APIResult;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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
}