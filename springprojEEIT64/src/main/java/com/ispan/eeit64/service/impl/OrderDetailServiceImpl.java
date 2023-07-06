package com.ispan.eeit64.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ispan.eeit64.entity.OrderDetailBean;
import com.ispan.eeit64.repository.OrderRepository;
import com.ispan.eeit64.service.OrderDetailService;

public class OrderDetailServiceImpl implements OrderDetailService{
	@Autowired
	OrderRepository orderRepository;

	
	
	@Override
	public OrderDetailBean findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderDetailBean> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void save(OrderDetailBean bean) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public OrderDetailBean update(OrderDetailBean bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteById(Integer id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void detach(OrderDetailBean bean) {
		// TODO Auto-generated method stub
		
	}


}
