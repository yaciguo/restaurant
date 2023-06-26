package com.ispan.eeit64.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ispan.eeit64.entity.DishBean;
@Repository
public interface DishRepository extends JpaRepository<DishBean, Integer>{
	 @Query("SELECT d FROM DishBean d ORDER BY d.categoryBean.id")
	    List<DishBean> findAllOrderByCategoryId();

}
