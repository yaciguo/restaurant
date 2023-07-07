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
//	@GetMapping("/dataAnalysis.api/CategoryAndDish")
//	public @ResponseBody List<Object> getCategoryAndDishName(){
//		List<Object> list = new ArrayList<>();
//		List<DishJson> json = new ArrayList<>();
//		String jsonStr = ReadJson.getJsonFileString("/static/assets/json/menu.json");
//		if(jsonStr != null) {
//			json = new Gson().fromJson(jsonStr, new TypeToken<List<DishJson>>() {}.getType());
//		}
//		
//		
//		List<String> checkList = new ArrayList<>();
//		Map<Integer, String> categoryMap = new HashMap<>();
//		Map<Integer, Map> categoryDishMap = new HashMap<>();
//		
//		Integer categoryId = 0;
//		for(DishJson dish:json) {
//			if(categoryMap.values().contains(dish.category) == false) {
//				categoryMap.put(categoryId, dish.category);
//				categoryDishMap.put(categoryId++, new HashMap<>());
//			}
//			categoryDishMap.get(categoryId-1).put(dish.id, dish.name);
//		}
//		list.add(categoryMap);
//		list.add(categoryDishMap); 
//		 
//		return list;
//	}
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

	
	@PostMapping("/getProfit")
	public @ResponseBody APIResult  getProfit(
		@RequestBody Map<String, Object> condition
		) throws ParseException {
		SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
		
		int method = (int)condition.get("method");
		Set<Integer> ids = new HashSet<>((List<Integer>)condition.get("ids"));
		Date startDate = ymd.parse((String)condition.get("startDate"));
		Date endDate = ymd.parse((String)condition.get("endDate"));
		
		APIResult apiResult = new APIResult();

		List<Map<String,Object>> data = service.getProfit(method, ids, startDate, endDate);
		apiResult.setData(data);
		apiResult.setCode(StatusCode.SUCCESS);
		apiResult.setMsg("成功提取資料");
		return apiResult;
	}
}