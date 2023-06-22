package com.ispan.eeit64.service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.LinkedHashSet;
import java.util.Set;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ispan.eeit64.entity.DishBean;
import com.ispan.eeit64.entity.OrderBean;
import com.ispan.eeit64.entity.OrderDetailBean;
import com.ispan.eeit64.repository.DishRepository;
import com.ispan.eeit64.repository.OrderRepository;
import com.ispan.eeit64.service.impl.OrderServiceImpl;

@SpringBootTest
public class OrderServiceTest {
//	@Autowired
//	private OrderServiceImpl orderService;
	
	@Autowired
	private OrderRepository dao;
	private DishRepository dishDao;
	
	@Test
	public void testInsert() {
		Timestamp currentTimestamp = Timestamp.valueOf(LocalDateTime.now());
		OrderBean o1 = new OrderBean();
		
		OrderDetailBean detail1 = new OrderDetailBean();
//		detail1.setId(1);
	    detail1.setDish(new DishBean(2));
	    detail1.setQuantity(2);
	    Set<OrderDetailBean> orderDetails = new LinkedHashSet<>();
	    orderDetails.add(detail1);
	    
//		o1.setId(6);
//		o1.setActivityBean(new ActivityBean(1));
		o1.setAmount(80);
		o1.setCheckoutBean(null);
		o1.setCustomer("ooeeoo");
		o1.setNote("no bag");
		
		o1.setOrderDetailBean(orderDetails);
		o1.setOrderStatus("create");
		o1.setOrderTime(currentTimestamp);
		o1.setPhone("0912345678");
		o1.setType("o");
		o1.setPickTime(new java.util.Date());
		try{
			dao.save(o1);
		}catch(Exception e) {
			System.out.println(e);
		}
		
		
		
		System.out.println("ok");
		
		
	}
	
}
