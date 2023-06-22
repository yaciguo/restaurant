package com.ispan.eeit64.service;

import java.util.List;

import com.ispan.eeit64.entity.OrderBean;

public interface OrderService {
	OrderBean findById(Integer id);
	List<OrderBean> findAll();
	void save(OrderBean bean);	
	OrderBean update(OrderBean bean); 
	void deleteById(Integer id);	
	OrderBean findByMemberId(String orderId);	
	void detach(OrderBean bean);
}
