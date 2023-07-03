package com.ispan.eeit64.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

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
//    @GetMapping("/custIndex/searchorders")
//    public String showOrderForm(@RequestParam(value = "customer", required = false) String customer,
//                                      @RequestParam(value = "phone", required = false) String phone,
//                                      Model model) {
//        if (customer == null) {
//        	customer = "";
//        }
//        if (phone == null) {
//            phone = "";
//        }
//
//        model.addAttribute("customer", customer);
//        model.addAttribute("phone", phone);
//
//        return "searchorder";
//    }

	@PostMapping("/searchorders")
    public String submitOrderForm(@ModelAttribute OrderBean bean, Model model) {
		String customer = bean.getCustomer();
	    String phone = bean.getPhone();
		if (customer == null || phone == null) {
            // 前端未輸入值，直接返回 "searchorder" 視圖
            return "searchorder";
        }
    	
        List<OrderBean> orders = service.findByCustomerAndPhone(customer, phone);

        
     // 檢查是否查無資料
        if (orders.isEmpty()) {
            model.addAttribute("noDataMessage", "查無此訂單，請重新查詢!");
            return "searchorder";
            
        } else {
            model.addAttribute("orderList", orders);
            return "searchorder";
            
        }

        
    }
    
    

}
