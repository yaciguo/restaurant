package com.ispan.eeit64.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.eeit64.entity.ActivityBean;
import com.ispan.eeit64.repository.ActivityRepository;
import com.ispan.eeit64.service.ActivityService;

@Service
@Transactional
public class ActivityServiceImpl implements ActivityService{
	
	@Autowired 
	ActivityRepository activityRepository;
	@Override
	public Page<ActivityBean> findAllWithPagination(int pageNumber, int pageSize) {
		Pageable pageable = PageRequest.of(pageNumber, pageSize);
		return activityRepository.findAll(pageable);
	}
	@Override
	public List<ActivityBean> resortActivityByColumn(String sortColumn, String sortDirection) {
	    Sort sort;
	    switch (sortColumn) {
	        case "活動編號":
	            sort = Sort.by(sortDirection.equals("asc") ? Sort.Direction.ASC : Sort.Direction.DESC, "id");
	            break;
	        case "活動名稱":
	            sort = Sort.by(sortDirection.equals("asc") ? Sort.Direction.ASC : Sort.Direction.DESC, "name");
	            break;
	        case "活動類型":
	            sort = Sort.by(sortDirection.equals("asc") ? Sort.Direction.ASC : Sort.Direction.DESC, "type");
	            break;
	        case "折扣內容":
	            sort = Sort.by(sortDirection.equals("asc") ? Sort.Direction.ASC : Sort.Direction.DESC, "discount");
	            break;
	        case "達標金額":
	            sort = Sort.by(sortDirection.equals("asc") ? Sort.Direction.ASC : Sort.Direction.DESC, "amount");
	            break;
	        case "活動開始":
	            sort = Sort.by(sortDirection.equals("asc") ? Sort.Direction.ASC : Sort.Direction.DESC, "startDate");
	            break;
	        case "活動結束":
	            sort = Sort.by(sortDirection.equals("asc") ? Sort.Direction.ASC : Sort.Direction.DESC, "endDate");
	            break;
	        default:
	            sort = Sort.by(Sort.Direction.ASC, "id");
	            break;
	    }

	    return activityRepository.findAll(sort);
	}
	

}
