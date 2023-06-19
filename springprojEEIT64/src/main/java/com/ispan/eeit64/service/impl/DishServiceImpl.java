package com.ispan.eeit64.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.eeit64.dao.DishRepository;
import com.ispan.eeit64.entity.DishBean;
import com.ispan.eeit64.service.DishService;
@Service
public class DishServiceImpl implements DishService{
	@Autowired
	DishRepository dishRepository;
	
	@Override
	public Optional<DishBean> findById(Integer id) {
		return dishRepository.findById(id);
	}

	@Override
	public List<DishBean> findAll() {
		return (List<DishBean>) dishRepository.findAll();
	}

	@Override
	public DishBean save(DishBean bean) {
		
		return dishRepository.save(bean);
	}

	@Override
	public DishBean update(DishBean bean) {
		return dishRepository.save(bean);
	}

	@Override
	public void deleteById(Integer id) {
		dishRepository.deleteById(id);
		
	}

}
