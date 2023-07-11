package com.ispan.eeit64.service;

import java.util.List;

import com.ispan.eeit64.entity.DishBean;

public interface DishService {
	DishBean findById(Integer id);
	List<DishBean> findAll();
	List<DishBean> findAllbyCategory();
	void save(DishBean bean);	
	DishBean update(DishBean bean); 
	void deleteById(Integer id);	
	DishBean findByMemberId(String dishId);	
	void   detach(DishBean bean);
}
