package com.ispan.eeit64.validator;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.ispan.eeit64.entity.ClosingTimeBean;
import com.ispan.eeit64.service.impl.ClosingTimeServiceImpl;

public class ClosingTimeValidator implements Validator {
    private String method;
    ClosingTimeServiceImpl service;
    
    @Override
    public boolean supports(Class<?> clazz) {
        return ClosingTimeBean.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ClosingTimeBean bean = (ClosingTimeBean) target;
        
        if(this.method.equals("POST")) {
            if (!errors.hasFieldErrors("id")) {
                if(bean.getId() != null) {
                    errors.rejectValue("id", "postIdIsNotNull", "POST id需要是null");
                }
            }            
        }else if(this.method.equals("PUT")) {
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "bean.id.empty", "id欄不能為空白");
            if (!errors.hasFieldErrors("id")) {
                if(service.findById(bean.getId()) == null) {
                    errors.rejectValue("id", "notFoundData", "id資料不存在");
                }
            }
        } 
        
        if (!errors.hasFieldErrors("startTime")) {
            Date startTime = bean.getStartDate();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            String startTimeStr = formatter.format(startTime);
            if (startTimeStr.equals("1970-01-01 08:00:00")) {
                errors.rejectValue("startTime", "invalidTimeFormat", "錯誤時間格式");
            }
        }
        if (!errors.hasFieldErrors("endTime")) {
            Date endTime = bean.getEndDate();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            String endTimeStr = formatter.format(endTime);
            if (endTimeStr.equals("1970-01-01 08:00:00")) {
                errors.rejectValue("endTime", "invalidTimeFormat", "錯誤時間格式");
            }
        }
    }
    
    public void validate(Object target, Errors errors, String method, ClosingTimeServiceImpl service) {
        this.method = method;
        this.service = service;
        validate(target, errors);
    }    
}
