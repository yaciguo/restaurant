package com.ispan.eeit64.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ispan.eeit64.entity.DishBean;
import com.ispan.eeit64.service.impl.DishServiceImpl;

@RestController
public class DishesController {
	final static Logger log = LoggerFactory.getLogger(DishesController.class);
	DishServiceImpl service;

	@Autowired
	public DishesController(DishServiceImpl service) {
		this.service = service;
	}
	
//	@RequestMapping(value="/dishes2")
//	public List<DishBean> findAll(Model model) {
//		System.out.println("--------------findAll()--------------------");
//		return dishService.findAll();
//	}
	//找全部並利用類別排序
	@GetMapping("/custIndex/dishes2")
    public @ResponseBody List<DishBean> findAllbyCategory() {
        System.out.println("--------------findAll()--------------------");
        return service.findAllbyCategory();
    }
	
	



}
