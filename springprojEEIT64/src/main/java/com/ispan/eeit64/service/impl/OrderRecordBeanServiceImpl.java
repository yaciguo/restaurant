package com.ispan.eeit64.service.impl;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.eeit64.entity.OrderBean;
import com.ispan.eeit64.entity.OrderDetailBean;
import com.ispan.eeit64.entity.OrderRecordBean;
import com.ispan.eeit64.repository.OrderBeanRepository;
import com.ispan.eeit64.repository.OrderDetailBeanRepository;
import com.ispan.eeit64.repository.OrderRecordBeanRepository;
import com.ispan.eeit64.service.OrderBeanService;
import com.ispan.eeit64.service.OrderRecordBeanService;

@Service
@Transactional
public class OrderRecordBeanServiceImpl implements OrderRecordBeanService{
    OrderDetailBeanRepository orderDetailBeanRepository;
	OrderBeanRepository orderBeanRepository;
	OrderRecordBeanRepository orderRecordBeanRepository;
	
	@Autowired
	public OrderRecordBeanServiceImpl(OrderBeanRepository orderBeanRepository,OrderDetailBeanRepository orderDetailBeanRepository, OrderRecordBeanRepository orderRecordBeanRepository) {
		this.orderBeanRepository = orderBeanRepository;
		this.orderDetailBeanRepository = orderDetailBeanRepository;
		this.orderRecordBeanRepository = orderRecordBeanRepository;
	}
	

	@Override
	public void saveOrderRecordBean(OrderRecordBean orderRecordBean) {
		orderRecordBeanRepository.save(orderRecordBean);
	}
	
}
