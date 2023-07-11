package com.ispan.eeit64.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.ispan.eeit64.entity.ActivityBean;
import com.ispan.eeit64.entity.CheckoutBean;
import com.ispan.eeit64.repository.CheckoutRepository;

@Service
public class CheckoutService {
	private final CheckoutRepository checkoutRepository;

	public CheckoutService(CheckoutRepository checkoutRepository) {
		this.checkoutRepository = checkoutRepository;
	}

//	public Page<CheckoutBean> findAllWithPagination(int pageNumber, int pageSize) {
//		Pageable pageable = PageRequest.of(pageNumber, pageSize);
//		return checkoutRepository.findAll(pageable);
//	}
	
	public List<CheckoutBean> resortActivityByColumn(String sortColumn, String sortDirection) {
		Sort sort;
		switch (sortColumn) {
		case "桌號":
			sort = Sort.by(sortDirection.equals("asc") ? Sort.Direction.ASC : Sort.Direction.DESC, "id");
			break;

//		case "金額":
//            sort = Sort.by(sortDirection.equals("asc") ? Sort.Direction.ASC : Sort.Direction.DESC, "amount");
//			break;

		default:
			sort = Sort.by(Sort.Direction.ASC, "id");
			break;
		}

		return checkoutRepository.findAll(sort);
	}
}
