package com.ispan.eeit64.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.concurrent.TimeUnit;

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
	
	@PostMapping("/custIndex/newOrder")
	@ResponseBody
//  public Map<String, String> newOrder(@RequestBody OrderBean bean, @RequestParam("orderDetails") List<Integer> dishIds) {
	public Map<String, String> newOrder(@RequestBody Map<String, Object> requestData) throws Exception {	
		Map<String, String> response = new HashMap<>();		
		SimpleDateFormat formatDate = new SimpleDateFormat("hh:mm:ss");
//		Date pickTime = null;
		
		OrderBean orderBean = new OrderBean();
     //處裡前端data=========================
		//od部分====================
		
			Set<OrderDetailBean> odBeans = new LinkedHashSet<>();			  
			Map<Integer, Integer> elementCountMap = new HashMap<>();

			
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
      String activityId = (String) requestData.get("FK_Activity_Id");
      if(activityId != null && !activityId.isEmpty()) {
			Optional<ActivityBean> dishBeanOptional = 
					activityDao.findById(Integer.parseInt(activityId));
			aBean = dishBeanOptional.get();					
		}else {
			aBean = null;
		}
      
    //===處裡時間===========================       
      LocalTime localTime = LocalTime.parse((String) requestData.get("pickTime"));
      int hour = localTime.getHour();
      int minute = localTime.getMinute();
      
      if (hour == 12) {
          hour = 12; 
      }
      LocalDateTime localDateTime = LocalDateTime.of(LocalDate.now(), LocalTime.of(hour, minute));
      Timestamp pickTime = Timestamp.valueOf(localDateTime);

		Timestamp orderTime = new Timestamp(System.currentTimeMillis());
		// 檢查orderTime是否小於pickTime並且差距大於等於10分鐘
		long timeDifferenceInMillis = pickTime.getTime() - orderTime.getTime();
		long timeDifferenceInMinutes = TimeUnit.MILLISECONDS.toMinutes(timeDifferenceInMillis);
		if (orderTime.after(pickTime) || timeDifferenceInMinutes < 10) {
		    response.put("error", "訂單提交時間已超過能取餐的時間或差距不足10分鐘！");
		    return response;
		}
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
