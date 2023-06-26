package com.ispan.eeit64.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.eeit64.entity.OrderBean;
import com.ispan.eeit64.service.impl.OrderServiceImpl;

@Controller
public class OrderCreateController {
	@Autowired
	OrderServiceImpl service;
	

	@GetMapping("/shoppingcart")
	public String shoppingcart(Model model) {
	    model.addAttribute("orderForm", new OrderBean());
	    return "shoppingcart";
	}
	
	@PostMapping("/newOrder")
	@ResponseBody
    public Map<String, String> newOrder(@RequestBody OrderBean bean) {
		Map<String, String> response = new HashMap<>();
        bean.setOrderTime(new Timestamp(System.currentTimeMillis()));
                
        // 返回相應的視圖名稱或重定向URL
		service.save(bean);
		System.out.println(bean.getId()); 
		response.put("success", "新增成功");
        return response;
    }

}
