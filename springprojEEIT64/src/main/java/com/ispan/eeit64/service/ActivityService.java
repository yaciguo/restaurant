package com.ispan.eeit64.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.ispan.eeit64.entity.ActivityBean;

public interface ActivityService {

	Page<ActivityBean> findAllWithPagination(int pageNumber, int pageSize);
	List<ActivityBean> resortActivityByColumn(String sortColumn, String sortDirection);

}
