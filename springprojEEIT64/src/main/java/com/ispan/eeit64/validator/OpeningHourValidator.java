package com.ispan.eeit64.validator;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.ispan.eeit64.entity.OpeningHourBean;

public class OpeningHourValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return OpeningHourBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		OpeningHourBean bean = (OpeningHourBean) target;
		if (!errors.hasFieldErrors("startTime")) {
	        Date startTime = bean.getStartTime();
	        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
	        String startTimeStr = formatter.format(startTime);
	        if (true) {
	            errors.rejectValue("startTime", "invalidTimeFormat", "无效的时间格式");
	        }
		}
	}


}
