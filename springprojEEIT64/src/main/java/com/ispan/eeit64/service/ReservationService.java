package com.ispan.eeit64.service;

import java.util.List;

import com.ispan.eeit64.entity.ReservationBean;

public interface ReservationService {
	ReservationBean findById(Integer id);
	List<ReservationBean> findAll();
	void save(ReservationBean bean);	
	ReservationBean update(ReservationBean bean); 
	void deleteById(Integer id);	
	void detach(ReservationBean bean);
	public List<ReservationBean> findBynameAndPhone(String name, String phone);

}
