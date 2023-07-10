package com.ispan.eeit64.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.eeit64.controller.APIResult.APIResult;
import com.ispan.eeit64.controller.APIResult.StatusCode;
import com.ispan.eeit64.service.impl.DataAnalysisServiceImpl;

@Controller
@RequestMapping("/dataAnalysis.api")
public class DataAnalysisController {	
	@Autowired
	DataAnalysisServiceImpl service;

	@GetMapping("/getCategoryAndDish")
	public @ResponseBody APIResult getCategoryAndDish(){
		APIResult apiResult = new APIResult();
		apiResult.setData(service.getCategoryAndDish());
		apiResult.setCode(StatusCode.SUCCESS);
		apiResult.setMsg("成功提取資料");
		return apiResult;
	}
	
	@GetMapping("/getCategory")
	public @ResponseBody APIResult getCategory(){
		APIResult apiResult = new APIResult();
		apiResult.setData(service.getCategory());
		apiResult.setCode(StatusCode.SUCCESS);
		apiResult.setMsg("成功提取資料");
		return apiResult;
	}
	
	@PostMapping("/getData")
	public @ResponseBody APIResult  getData(
		@RequestBody Map<String, Object> condition
		) throws ParseException {
		SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
		
		int method = (int)condition.get("method");
		int value_type = (int)condition.get("value_type");
		Set<Integer> ids = null;
		if(condition.get("ids") != null){
			ids = new HashSet<>((List<Integer>)condition.get("ids"));
		}
		Date startDate = ymd.parse((String)condition.get("startDate"));
		Date endDate = ymd.parse((String)condition.get("endDate"));
				
		System.out.println("++++++++++getData");		
		List<Map<String,Object>> data = service.getData(method, value_type, ids, startDate, endDate);

		APIResult apiResult = new APIResult();
		apiResult.setData(data);
		apiResult.setCode(StatusCode.SUCCESS);
		apiResult.setMsg("成功提取資料");
		return apiResult;
	}
	
	@PostMapping("/getAllData")
	public @ResponseBody APIResult  getAllData(
		@RequestBody Map<String, Object> condition
		) throws ParseException {	
		SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = ymd.parse((String)condition.get("startDate"));
		Date endDate = ymd.parse((String)condition.get("endDate"));

		Map<String, List<Map<String, Object>>> data = service.getAllData(startDate, endDate);
		APIResult apiResult = new APIResult();
		apiResult.setData(data);
		apiResult.setCode(StatusCode.SUCCESS);
		apiResult.setMsg("成功提取資料");
		return apiResult;
	}
}
