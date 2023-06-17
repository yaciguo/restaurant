package com.ispan.eeit64.service;

import java.util.List;
import java.util.Optional;

import com.ispan.eeit64.entity.DishBean;

public interface DishService {
	Optional<DishBean> findById(Integer id);

	List<DishBean> findAll();

	DishBean save(DishBean bean);
	
	DishBean update(DishBean bean); 

	void deleteById(Integer key);
}
