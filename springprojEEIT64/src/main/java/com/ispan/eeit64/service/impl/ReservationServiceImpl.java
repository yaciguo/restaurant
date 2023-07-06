package com.ispan.eeit64.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.eeit64.entity.ReservationBean;
import com.ispan.eeit64.repository.ReservationRepository;
import com.ispan.eeit64.service.ReservationService;

@Service
@Transactional
public class ReservationServiceImpl implements ReservationService{
	final static Logger log = LoggerFactory.getLogger(ReservationServiceImpl.class);
	@Autowired
	ReservationRepository reservationRepository;
	
	@Override
	public ReservationBean findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<ReservationBean> findBynameAndPhone(String name, String phone) {
		return reservationRepository.findBynameAndPhoneOrderBySubmitTimeDesc(name, phone);
	}

	@Override
	public List<ReservationBean> findAll() {
		return reservationRepository.findAll();
	}
	
	@Override
	public void save(ReservationBean bean) {
		log.info("=====>ReservationServiceImpl#save()");
		reservationRepository.save(bean);
		
	}

	

	@Override
	public ReservationBean update(ReservationBean bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteById(Integer id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void detach(ReservationBean bean) {
		// TODO Auto-generated method stub
		
	}

	

	

}
