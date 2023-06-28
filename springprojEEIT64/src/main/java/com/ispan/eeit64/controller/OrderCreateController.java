package com.ispan.eeit64.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.eeit64.entity.ActivityBean;
import com.ispan.eeit64.entity.DishBean;
import com.ispan.eeit64.entity.OrderBean;
import com.ispan.eeit64.entity.OrderDetailBean;
import com.ispan.eeit64.entity.OrderRecordBean;
import com.ispan.eeit64.repository.ActivityRepository;
import com.ispan.eeit64.repository.DishRepository;
import com.ispan.eeit64.service.impl.OrderServiceImpl;

@Controller
public class OrderCreateController {
	@Autowired
	OrderServiceImpl service;
	
	@Autowired
	DishRepository dishDao;
	@Autowired
	ActivityRepository activityDao;
	

	@GetMapping("/shoppingcart")
	public String shoppingcart(Model model) {
//	    model.addAttribute("newOrder", new OrderBean());
	    return "shoppingcart";
	}
	
	@PostMapping("/newOrder")
	@ResponseBody
//    public Map<String, String> newOrder(@RequestBody OrderBean bean, @RequestParam("orderDetails") List<Integer> dishIds) {
	public Map<String, String> newOrder(@RequestBody Map<String, Object> requestData) throws Exception {	
		Map<String, String> response = new HashMap<>();		
		SimpleDateFormat formatDate = new SimpleDateFormat("hh:mm:ss");
		Date pickTime = null;
		
		OrderBean orderBean = new OrderBean();
       //處裡前端data=========================
		//od部分====================
		
			Set<OrderDetailBean> odBeans = new LinkedHashSet<>();			  
			Map<Integer, Integer> elementCountMap = new HashMap<>();
			
//			Object orderDetailsObj = requestData.get("orderDetails");
//			if (orderDetailsObj instanceof List) {
//			    List<Integer> dishIds = (List<Integer>) orderDetailsObj;
			
			List<Integer> orderDetails = (List<Integer>)requestData.get("orderDetails");
			    for(Integer dishId :orderDetails) {
		        	 if (elementCountMap.containsKey(dishId)) {
		                 int count = elementCountMap.get(dishId);
		                 elementCountMap.put(dishId, count + 1);
		             } else {
		                 elementCountMap.put(dishId, 1);
		             }      	
		        }
		    
		        for (Integer id : elementCountMap.keySet()) {
		        	Optional<DishBean> dishBeanOptional = dishDao.findById(id);
		        	if (dishBeanOptional.isPresent()) {
		                DishBean dishBean = dishBeanOptional.get();
		                int quantity = elementCountMap.get(id);                
		                OrderDetailBean odBean = new OrderDetailBean(orderBean, dishBean, quantity);		                
		                odBeans.add(odBean);
		                
		            }
		        	System.out.println(elementCountMap);
		        }
		        
		        
		        
		        
//			}			
        
        //================================record============
        java.sql.Timestamp orderEstablish = new Timestamp(System.currentTimeMillis());
        java.sql.Timestamp orderDeal=null;
        java.sql.Timestamp orderFinish=null;
        java.sql.Timestamp orderCancel=null;       
        OrderRecordBean rBean = new OrderRecordBean(orderEstablish, orderDeal, orderFinish, orderCancel, orderBean);
        //========================活動====================
        ActivityBean aBean = null;
        if(requestData.get("FK_Activity_Id")!= null) {
			Optional<ActivityBean> dishBeanOptional = activityDao.findById((Integer) requestData.get("FK_Activity_Id"));
			aBean = dishBeanOptional.get();					
		}
        
      //===處裡時間===========================       
		pickTime = formatDate.parse((String) requestData.get("pickTime"));
		Timestamp orderTime = new Timestamp(System.currentTimeMillis());
        //========================
		//將值裝進orderBean
        orderBean.setType((String) requestData.get("type"));
        orderBean.setPickTime(pickTime);
        orderBean.setOrderTime(orderTime);
        orderBean.setAmount(Integer.parseInt((String) requestData.get("amount")));
        orderBean.setOrderStatus((String) requestData.get("orderStatus"));
        orderBean.setNote((String) requestData.get("note"));
        orderBean.setCustomer((String) requestData.get("customer"));
        orderBean.setPhone((String) requestData.get("phone"));      
        orderBean.setOrderDetailBean(odBeans);
        orderBean.setOrderRecordBean(rBean);
        orderBean.setActivityBean(aBean);

		service.save(orderBean);
		
		System.out.println(orderBean.getId()); 
		response.put("success", "新增成功");
        return response;
    }

}
