package com.ispan.eeit64.validator;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.ispan.eeit64.entity.OpeningHourBean;
import com.ispan.eeit64.repository.OpeningHourRepository;

public class OpeningHourValidator implements Validator {
	private String method;
	OpeningHourRepository dao;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return OpeningHourBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		OpeningHourBean bean = (OpeningHourBean) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "bean.id.empty", "id欄不能為空白");
		if(this.method.equals("PUT")) {
			if (!errors.hasFieldErrors("id")) {
				if(dao.findById(bean.getId()).isEmpty()) {
					errors.rejectValue("id", "notFoundData", "id資料不存在");
				}
			}
		}else if(this.method.equals("POST")) {
			if (!errors.hasFieldErrors("id")) {
				if(bean.getId() != 0) {
					errors.rejectValue("id", "postIdIsNotZero", "POST id需要是零");
				}
			}			
		}
		
		if (!errors.hasFieldErrors("dayOfWeek")) {
	        if (bean.getDayOfWeek()<0 || bean.getDayOfWeek()>6) {
	            errors.rejectValue("dayOfWeek", "invalidTimeFormat", "錯誤星期格式");
	        }
		}
		if (!errors.hasFieldErrors("startTime")) {
	        Date startTime = bean.getStartTime();
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	        String startTimeStr = formatter.format(startTime);
	        if (startTimeStr.equals("1970-01-01 08:00:00")) {
	            errors.rejectValue("startTime", "invalidTimeFormat", "錯誤時間格式");
	        }
		}
		if (!errors.hasFieldErrors("endTime")) {
	        Date endTime = bean.getEndTime();
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	        String endTimeStr = formatter.format(endTime);
	        if (endTimeStr.equals("1970-01-01 08:00:00")) {
	            errors.rejectValue("endTime", "invalidTimeFormat", "錯誤時間格式");
	        }
		}
	}
	public void validate(Object target, Errors errors, String method, OpeningHourRepository dao) {
		this.method = method;
		this.dao = dao;
		validate(target, errors);
	}
	
}
