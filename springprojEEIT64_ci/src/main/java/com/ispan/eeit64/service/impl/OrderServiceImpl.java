package com.ispan.eeit64.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.eeit64.entity.OrderBean;
import com.ispan.eeit64.repository.OrderRepository;
import com.ispan.eeit64.service.OrderService;
@Service
@Transactional
public class OrderServiceImpl implements OrderService{
	final static Logger log = LoggerFactory.getLogger(OrderServiceImpl.class);
	@Autowired
	OrderRepository orderRepository;
	
	@Override //新增訂單
	public void save(OrderBean bean) {
		log.info("=====>OrderServiceImpl#save()");		
		if(bean!=null && bean.getId()==null) {
			
				orderRepository.save(bean);
			
		}
	}
	
	@Override//找訂單
	public List<OrderBean> findByCustomerAndPhone(String customer, String phone) {
		return orderRepository.findByCustomerAndPhoneOrderByOrderTimeDesc(customer, phone);
	}
	
	@Override
	public OrderBean findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderBean> findAll() {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public OrderBean update(OrderBean bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteById(Integer id) {
		// TODO Auto-generated method stub
		
	}

	

	@Override
	public void detach(OrderBean bean) {
		// TODO Auto-generated method stub
		
	}


	

}
