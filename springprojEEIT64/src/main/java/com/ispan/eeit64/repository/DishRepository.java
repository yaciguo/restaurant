package com.ispan.eeit64.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ispan.eeit64.entity.DishBean;
@Repository
public interface DishRepository extends JpaRepository<DishBean, Integer>{
	@Query("SELECT d FROM DishBean d ORDER BY d.categoryBean.id")
	List<DishBean> findAllOrderByCategoryId();
	
	Page<DishBean> findByCategoryBeanId(Integer categoryId, Pageable pageable);

	void save(Map<String, Object> dish);

}
