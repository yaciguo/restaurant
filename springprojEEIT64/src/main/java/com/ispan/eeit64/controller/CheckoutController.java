package com.ispan.eeit64.controller;

import java.util.Date;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ispan.eeit64.entity.CheckoutBean;
import com.ispan.eeit64.repository.CheckoutRepository;
import com.ispan.eeit64.service.CheckoutService;

@RestController
public class CheckoutController {
	private final CheckoutRepository checkoutRepository;
	private final CheckoutService checkoutService;

	public CheckoutController(CheckoutRepository checkoutRepository, CheckoutService checkoutService) {
		this.checkoutRepository = checkoutRepository;
		this.checkoutService = checkoutService;
	}

//	@GetMapping("/queryUnpaid")
//	public List<CheckoutBean> findAllCheckouts() {
//		List<CheckoutBean> allCheckout = checkoutRepository.findAll();
//
//		return allCheckout;
//	}

//	@GetMapping("/queryUnpaid")
//	public Page<CheckoutBean> findCheckouts(@RequestParam(defaultValue = "0") int pageNumber,
//											@RequestParam(defaultValue = "5") int pageSize) {
//		
//		return checkoutService.findAllWithPagination(pageNumber - 1, pageSize);
//	}
	
	@GetMapping("/queryUnpaid")
	public Page<CheckoutBean> findUnpaidCheckouts(@RequestParam(defaultValue = "eatIn") String orderType,
											@RequestParam(defaultValue = "0") int pageNumber,
											@RequestParam(defaultValue = "4") int pageSize) {
		
		String oType;
		if (orderType.equals("eatIn")) {
	        oType = "I";
	    } else {
	        oType = "O";
	    }
		
		Pageable pageable = PageRequest.of(pageNumber - 1, pageSize);
		Page<CheckoutBean> allUnpaidCheckout =checkoutRepository.findByOrderType(oType, pageable);
		
		return allUnpaidCheckout;
	}
	
	@GetMapping("/queryPaid")
	public Page<CheckoutBean> findPaidCheckouts(@RequestParam(defaultValue = "0") int pageNumber,
											@RequestParam(defaultValue = "4") int pageSize) {
		
		Pageable pageable = PageRequest.of(pageNumber - 1, pageSize);
		Page<CheckoutBean> allPaidCheckout =checkoutRepository.findByPayStatusOrderByPayTimeDesc("Y", pageable);
		
	    return allPaidCheckout;
	}
	
	@PutMapping("/updateCheckoutBean")
	public void updatePayStatus(@RequestParam("paymentId") Integer paymentId) {
	    
		CheckoutBean checkoutBean = checkoutRepository.findById(paymentId).orElse(null);
		checkoutBean.setPayStatus("Y");
		checkoutBean.setPayTime(new Date());

		checkoutRepository.save(checkoutBean);
		
	}
	

}
