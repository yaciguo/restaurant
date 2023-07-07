package com.ispan.eeit64.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.eeit64.entity.DishBean;
import com.ispan.eeit64.repository.DishRepository;
import com.ispan.eeit64.service.DishService;
@Service
@Transactional
public class DishServiceImpl implements DishService{
	final static Logger log = LoggerFactory.getLogger(DishServiceImpl.class);
	@Autowired
	DishRepository dishRepository;
	
	@Override
	public List<DishBean> findAll() {
		return dishRepository.findAll();
	}
	
	//找全部並利用類別排序
	@Override
	public List<DishBean> findAllbyCategory() {
		return dishRepository.findAllOrderByCategoryId();
	}


	@Override
	public DishBean update(DishBean bean) {
		return dishRepository.save(bean);
	}

	@Override
	public void deleteById(Integer id) {
		dishRepository.deleteById(id);
		
	}

	@Override
	public DishBean findByMemberId(String dishId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void detach(DishBean bean) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public DishBean findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public void save(DishBean bean) {
		// TODO Auto-generated method stub
		
	}

	

}
