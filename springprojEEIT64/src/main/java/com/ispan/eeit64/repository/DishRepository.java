package com.ispan.eeit64.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ispan.eeit64.entity.DishBean;

@Repository
public interface DishRepository extends JpaRepository<DishBean, Integer>{
	Page<DishBean> findAll(Pageable pageable);


//	Page<DishBean> findByOrderStatus(String orderStatus, Pageable pageable);
}


