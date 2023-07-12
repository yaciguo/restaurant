package com.ispan.eeit64.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ispan.eeit64.entity.CheckoutBean;


@Repository
public interface CheckoutRepository extends JpaRepository<CheckoutBean, Integer>  {

	@Query("SELECT c FROM CheckoutBean c JOIN c.order o WHERE o.type = :orderType AND c.payStatus = 'N'")
	Page<CheckoutBean> findByOrderType(@Param("orderType") String orderType, Pageable pageable);
	
	Page<CheckoutBean> findByPayStatusOrderByPayTimeDesc(String payStatus, Pageable pageable);



}
