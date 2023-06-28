package com.ispan.eeit64.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.ispan.eeit64.jsonBean.DishJson;
import com.ispan.eeit64.jsonBean.OrderJson;
import com.ispan.eeit64.jsonBean.reader.ReadJson;

@Controller
public class DataAnalysisController {	

	@GetMapping("/dataAnalysis")
	public String dataAnalysis() {
	    return "dataAnalysis";
	}
	
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
	
	@GetMapping("/dataAnalysis.api/order")
	public @ResponseBody List<OrderJson>  findMemberToUpdate(Model model) {
		String jsonStr = ReadJson.getJsonFileString("/static/assets/json/orders.json");
		if(jsonStr != null) {
			List<OrderJson> json = new Gson().fromJson(jsonStr, new TypeToken<List<OrderJson>>() {}.getType());
			return json;
		}
		List<OrderJson> list = new LinkedList<>();
        return list;
	}
}
