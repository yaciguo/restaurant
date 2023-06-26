package com.ispan.eeit64.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ispan.eeit64.entity.OrderBean;
import com.ispan.eeit64.service.impl.OrderServiceImpl;

@Controller
public class SearchOrderController {
	OrderServiceImpl service;
	
	@Autowired
    public SearchOrderController(OrderServiceImpl service) {
        this.service = service;
    }
	
	
	//查詢訂單頁面======================================================
    @GetMapping("/searchorders")
    public String showOrderForm(@RequestParam(value = "customer", required = false) String customer,
                                      @RequestParam(value = "phone", required = false) String phone,
                                      Model model) {
        if (customer == null) {
        	customer = "";
        }
        if (phone == null) {
            phone = "";
        }

        model.addAttribute("customer", customer);
        model.addAttribute("phone", phone);

        return "searchorder";
    }

    @PostMapping("/searchorders")
    public String submitOrderForm(@RequestParam("customer") String customer,
                                        @RequestParam("phone") String phone,
                                        Model model) {
        List<OrderBean> orders = service.findByCustomerAndPhone(customer, phone);
        model.addAttribute("orderList", orders);

        return "searchorder";
    }

}
