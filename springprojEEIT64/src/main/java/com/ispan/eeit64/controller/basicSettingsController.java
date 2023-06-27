package com.ispan.eeit64.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

import com.ispan.eeit64.entity.OpeningHourBean;
import com.ispan.eeit64.repository.OpeningHourRepository;
import com.ispan.eeit64.validator.OpeningHourValidator;

@Controller
public class basicSettingsController {	
	@Autowired
	OpeningHourRepository dao;
	@Autowired
	Environment env;
	
	@GetMapping("/basicSettings")
	public String basicSettings() {
	    return "basicSettings";
	}
	
	@GetMapping("/basicSettings.api/getAllOpeningHour")
	public @ResponseBody List<OpeningHourBean> getAllOpeningHour(){
		return dao.findAll();
	}
	
	@PostMapping("/basicSettings.api/addOpeningHour")
	public @ResponseBody Map<String, Object> addOpeningHour(
			@RequestBody OpeningHourBean bean,
			HttpServletRequest request,
			BindingResult result
	){
		Map<String, Object> map = new HashMap<>();
		new OpeningHourValidator().validate(bean, result, request.getMethod(), dao);

		if (result.hasErrors()) {
			collectErrorMessage(map, result);
			return map;
		}
		
		dao.save(bean);
		map.put("success", "新增成功");
		return map;
	}

	@PutMapping("/basicSettings.api/editOpeningHour")
	public @ResponseBody Map<String, Object> editOpeningHour(
			@RequestBody OpeningHourBean bean,
			HttpServletRequest request,
			BindingResult result
	){
		Map<String, Object> map = new HashMap<>();

		
		new OpeningHourValidator().validate(bean, result, request.getMethod(),dao);
		
		if (result.hasErrors()) {
			collectErrorMessage(map, result);
			return map;
		}
		
		dao.save(bean);
		map.put("success", "修改成功");
		return map;
	}

	@DeleteMapping("/basicSettings.api/deleteOpeningHour")
	public @ResponseBody Map<String, Object> deleteOpeningHour(
			@RequestBody List<Integer> ids
	){
		Map<String, Object> map = new HashMap<>();
		List<Integer> failureId = new LinkedList<>();
		List<Integer> successId = new LinkedList<>();
		List<Integer> errorId = new LinkedList<>();
		for(Integer id : ids) {
			if(!dao.findById(id).isEmpty()) {
				dao.deleteById(id);
				if(dao.existsById(id)) {
					failureId.add(id);
				}else {
					successId.add(id);	
				}
			}else {
				errorId.add(id);
			}
		}
		if(failureId.size()>0) {
			map.put("failureId", failureId);
		}
		if(errorId.size()>0) {
			map.put("errorId", errorId);
		}
		if(successId.size()>0) {
			map.put("success", successId);
		}
		return map;
	}
	
	public void collectErrorMessage(Map<String, Object> map, BindingResult result) {
		List<FieldError> list = result.getFieldErrors();
		Map<String, String> errors = new HashMap<>();
		map.put("errors", errors);
		for (FieldError error : list) {
			String defaulMessage = error.getDefaultMessage();
			errors.put(error.getField(), defaulMessage);
		}
	}
}
