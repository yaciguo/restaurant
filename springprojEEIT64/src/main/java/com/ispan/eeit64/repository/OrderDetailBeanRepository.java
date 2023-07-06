package com.ispan.eeit64.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ispan.eeit64.entity.OrderDetailBean;

@Repository
public interface OrderDetailBeanRepository extends JpaRepository<OrderDetailBean, Integer> {

}
