package com.ispan.eeit64.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.ispan.eeit64.entity.FdTableBean;
import com.ispan.eeit64.service.impl.FdTableServiceImpl;

public class FdTableValidator implements Validator{
    private String method;
    private FdTableServiceImpl service;
    
    @Override
    public boolean supports(Class<?> clazz) {
        return FdTableBean.class.isAssignableFrom(clazz);
    }
    
    @Override
    public void validate(Object target, Errors errors) {
        FdTableBean bean = (FdTableBean) target;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "tableId", "FdTable.tableId.empty", "桌位不能為空白");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "capacity", "FdTable.capacity.empty", "人數不能為空白");

        if(this.method.equals( "POST")){
            if (!errors.hasFieldErrors("tableId")) {
                if(service.existsById(bean.getTableId())) {
                    errors.rejectValue("tableId", "FdTable.tableId.exist", "桌號是重複的");
                }
            }   
        }else if(this.method.equals("PUT")){
            if (!errors.hasFieldErrors("tableId")) {
                if(!service.existsById(bean.getTableId())) {
                    errors.rejectValue("tableId", "FdTable.tableId.notExist", "桌號是不存在的");
                }
            }   
        }
    }

    public void validate(Object target, Errors errors, String method, FdTableServiceImpl service) {
        this.method = method;
        this.service = service;
        validate(target, errors);
    }
}
