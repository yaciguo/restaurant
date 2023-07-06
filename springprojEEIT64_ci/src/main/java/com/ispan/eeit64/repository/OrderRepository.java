package com.ispan.eeit64.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ispan.eeit64.entity.OrderBean;

@Repository
public interface OrderRepository extends JpaRepository<OrderBean, Integer>{
	List<OrderBean> findByCustomerAndPhoneOrderByOrderTimeDesc(String customer, String phone);

}
