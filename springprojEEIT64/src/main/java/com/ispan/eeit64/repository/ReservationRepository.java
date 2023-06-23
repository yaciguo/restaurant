package com.ispan.eeit64.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.eeit64.entity.ReservationBean;



public interface ReservationRepository extends JpaRepository<ReservationBean, Integer>{
	List<ReservationBean> findBynameAndPhoneOrderBySubmitTimeDesc(String name, String phone);

}
