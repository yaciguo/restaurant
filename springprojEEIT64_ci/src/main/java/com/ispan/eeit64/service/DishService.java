package com.ispan.eeit64.service;

import java.util.List;

import org.springframework.data.domain.Page;

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

//	============================================雅琪
	Page<DishBean> findAll(int pageSize, int pageNumber);
//	  Page<DishBean> findByOrderStatus(String orderStatus, int pageNumber, int pageSize);
}
