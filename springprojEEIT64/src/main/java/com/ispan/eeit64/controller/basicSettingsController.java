package com.ispan.eeit64.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.eeit64.dao.OpeningHourDao;
import com.ispan.eeit64.entity.OpeningHourBean;
import com.ispan.eeit64.validator.OpeningHourValidator;

@Controller
public class basicSettingsController {	
	@Autowired
	OpeningHourDao dao;
	@Autowired
	Environment env;
	
	@GetMapping("/basicSettings.api/getAllOpeningHour")
	public @ResponseBody List<OpeningHourBean> getAllOpeningHour(){
		return dao.findAll();
	}
	
	@PostMapping("/basicSettings.api/addOpeningHour")
	public @ResponseBody Map<String, String> addOpeningHour(
			@RequestBody OpeningHourBean bean, 
			BindingResult result
	){
		Map<String, String> map = new HashMap<>();
		
		new OpeningHourValidator().validate(bean, result);

		if (result.hasErrors()) {
			collectErrorMessage(map, result);
		}
		if(bean.getId() != null) {
			map.put("IdExist", "不需要id值");
			return map;
		}
		dao.save(bean);
		map.put("success", "新增成功");
		return map;
	}

	@PutMapping("/basicSettings.api/editOpeningHour")
	public @ResponseBody Map<String, String> editOpeningHour(
			@RequestBody OpeningHourBean bean
	){
		Map<String, String> map = new HashMap<>();
		dao.save(bean);
		map.put("success", "修改成功");
		return map;
	}

	@DeleteMapping("/basicSettings.api/deleteOpeningHour")
	public @ResponseBody Map<String, String> deleteOpeningHour(
			@RequestBody List<Integer> ids
	){
		Map<String, String> map = new HashMap<>();
		for(Integer id : ids) {
			if(!dao.findById(id).isEmpty()) {
				dao.deleteById(id);
				boolean isFound = dao.existsById(id);
				if(isFound) {
					map.put("failure", "刪除失敗 : "+id);
				}else {
					map.put("success", "刪除成功 : "+id);					
				}
			}else {
				map.put("failure", "錯誤id : "+id);
			}
		}
		return map;
	}
	
	public void collectErrorMessage(Map<String, String> map, BindingResult result) {
//		Map<String, String> map = new HashMap<>();
		List<FieldError> list = result.getFieldErrors();
		
		for (FieldError error : list) {
			String errorMessage = env.getProperty(error.getCode());
			map.put(error.getField(), errorMessage);
		}
		
	}
}
