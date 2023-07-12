package com.ispan.eeit64.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.eeit64.entity.OrderBean;
import com.ispan.eeit64.repository.CheckoutRepository;
import com.ispan.eeit64.service.OrderBeanService;

@CrossOrigin
@Controller
public class OrderController {
	
	OrderBeanService orderBeanService;
	
	@Autowired
	public OrderController(OrderBeanService orderBeanService) {
		this.orderBeanService = orderBeanService;
	}
	
    @Autowired
    private CheckoutRepository checkoutRepository;
	
    
    //透過網址變數
    @GetMapping("/orders")  
     public String getAllOrderStatus(
     		@RequestParam(value="orderStatus", required = false, defaultValue = "1") String  status,
            @RequestParam(required = false, defaultValue = "20") int pageSize,
            @RequestParam(required = false, defaultValue = "0") int pageNumber,
            Model model) {   	
    	
	        	model.addAttribute("status", status);  
	        	return "order";
    }
  
    
  //透過選擇狀態欄
    @GetMapping("/orders/orderStatus/{id}")  
    @ResponseBody
    public Page<OrderBean> getAllOrderStatusAjax(
    	   @PathVariable(value="id") Integer  status,
           @RequestParam(required = false, defaultValue = "20") int pageSize,
           @RequestParam(required = false, defaultValue = "0") int pageNumber) {
   	
	    	Page<OrderBean> allOrders = null;
	    	String orderStatus = "order_establish";
	    	String payStatus = "N";
	    	
	    	switch (status) {
	    	    case 1:
	    	    	return orderBeanService.findAll(pageSize, pageNumber);	 
	    	    case 2 :
	    	    	orderStatus = "order_establish";
	    	    	return orderBeanService.findByOrderStatus(orderStatus, pageSize, pageNumber);

	    	    case 3 :  
	    	    	orderStatus = "order_deal";
	    	    	return orderBeanService.findByOrderStatus(orderStatus, pageSize, pageNumber);

	    	    case 4 :
	    	    	orderStatus = "order_finish";
	    	    	return orderBeanService.findByOrderStatus(orderStatus, pageSize, pageNumber);

	    	    case 5 :
	    	    	orderStatus = "order_cancel";
	    	    	return orderBeanService.findByOrderStatus(orderStatus, pageSize, pageNumber);
	    	    case 6 :
	    	    	payStatus = "N";
	    	    	return orderBeanService.findByCheckoutBeanPayStatus(payStatus, pageSize, pageNumber);
	    	    default:
	    	    	return orderBeanService.findAll(pageSize, pageNumber);
	    	}	        
   }
    

	//查訂單編號
	@GetMapping("/orders/orderId/{id}")
	@ResponseBody
	public Page<OrderBean> findByOrderId(@PathVariable(value = "id", required = true) String id,
        @RequestParam(required = false, defaultValue = "20") int pageSize,
        @RequestParam(required = false, defaultValue = "0") int pageNumber) {
	    Integer orderId = Integer.parseInt(id);
	    return orderBeanService.findById(orderId,pageSize, pageNumber);
	}

    //搜尋手機號碼
	@GetMapping("/orders/orderPhone/")
	@ResponseBody
	public Page<OrderBean> findByPhone(@RequestParam String phone, @RequestParam(required = false, defaultValue = "0") Integer pageNumber, @RequestParam(required = false, defaultValue = "20") Integer pageSize) {
		 Page<OrderBean>  orders = orderBeanService.findByPhone(phone, pageNumber, pageSize);
	     return orders;
	}
	
    //搜尋客戶名稱
	@GetMapping("/orders/customer/")
	@ResponseBody
	public Page<OrderBean> findByCustomer(@RequestParam String customer, @RequestParam(required = false, defaultValue = "0") Integer pageNumber, @RequestParam(required = false, defaultValue = "20") Integer pageSize) {
	    try {
	        String decodedCustomer = customer != null ? URLDecoder.decode(customer, "UTF-8") : null;
	        return orderBeanService.findByCustomer(decodedCustomer, pageNumber, pageSize);
	    } catch (UnsupportedEncodingException e) {
	        System.out.println(e);
	        return orderBeanService.findByCustomer(customer, pageNumber, pageSize);
	    }
	}   

	//更新狀態(訂單狀態)
		@PutMapping("/orders/orderId")
		@ResponseBody
		public ResponseEntity updateOrderState(@RequestBody List<OrderBean> orderBeans) {
	        try {
	            orderBeanService.updateOrderState(orderBeans);
	            return ResponseEntity.ok("更新成功");
	        } catch (Exception e) {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("更新失败");
	        }
		}
	
}