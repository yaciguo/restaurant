package com.ispan.eeit64.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ispan.eeit64.service.impl.CategoryServiceImpl;

@RestController
public class CategoryController {
	CategoryServiceImpl service;
	@Autowired
	public CategoryController(CategoryServiceImpl service) {
		this.service = service;
	}
	
	@GetMapping("/custIndex/showCategories")
	public @ResponseBody List<String> findAllCategories(){
		return service.findAllbyName();
	}
	

}
