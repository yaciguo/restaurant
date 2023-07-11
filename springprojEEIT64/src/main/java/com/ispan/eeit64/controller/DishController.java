package com.ispan.eeit64.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ispan.eeit64.service.DishService;

@Controller
public class DishController {
	final static Logger log = LoggerFactory.getLogger(DishController.class);
	DishService dishService;
	
	@Autowired
	public DishController(DishService dishService) {
		this.dishService = dishService;
	}
	@RequestMapping(value="/dishes", method={RequestMethod.GET, RequestMethod.DELETE})
	public String findAll(Model model) {
		model.addAttribute("dishList", dishService.findAll());
		return "showAllDishes";
	}
	
	
	
}
