package com.ispan.eeit64.service;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

import com.ispan.eeit64.entity.OrderBean;
import com.ispan.eeit64.entity.OrderDetailBean;
import com.ispan.eeit64.entity.OrderRecordBean;

public interface OrderBeanService  {		
		Page<OrderBean> findAll(Integer pageSize, Integer pageNumber);	
		Page<OrderBean> findByOrderStatus(String orderStatus, Integer pageNumber, Integer pageSize);		
		Page<OrderBean> findById(Integer id, Integer pageSize, Integer pageNumber);	
		Optional<OrderBean> findById(Integer id);	
		Page<OrderBean> findByPhone(String phone, Integer pageNumber, Integer pageSize);		
		Page<OrderBean> findByCustomer(String customer, Integer pageSize, Integer pageNumber);
		Page<OrderBean> findByCheckoutBeanPayStatus(String payStatus, Integer pageNumber, Integer pageSize);	
		void updateOrderState(List<OrderBean> orderBeans);
		void saveOrder(OrderBean order);
		OrderBean findOrderWithRecordById(Integer orderId);		
		
}
