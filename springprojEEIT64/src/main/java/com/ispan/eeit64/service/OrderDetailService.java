package com.ispan.eeit64.service;

import java.util.List;

import com.ispan.eeit64.entity.OrderDetailBean;
public interface OrderDetailService {
	OrderDetailBean findById(Integer id);
	List<OrderDetailBean> findAll();
	void save(OrderDetailBean bean);	
	OrderDetailBean update(OrderDetailBean bean); 
	void deleteById(Integer id);	
	void detach(OrderDetailBean bean);
	

}
