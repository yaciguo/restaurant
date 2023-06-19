package com.ispan.eeit64.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ispan.eeit64.entity.DishBean;
import com.ispan.eeit64.service.DishService;

@RestController
public class DishesController {
	final static Logger log = LoggerFactory.getLogger(DishesController.class);
	DishService dishService;

	@Autowired
	public DishesController(DishService dishService) {
		this.dishService = dishService;
	}
	
//	@RequestMapping(value="/dishes2")
//	public List<DishBean> findAll(Model model) {
//		System.out.println("--------------findAll()--------------------");
//		return dishService.findAll();
//	}
	
	@GetMapping("/dishes2")
    public @ResponseBody List<DishBean> findAll() {
        System.out.println("--------------findAll()--------------------");
        return dishService.findAll();
    }
	
	



}