package com.ispan.eeit64.service;

import java.util.Comparator;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.ispan.eeit64.entity.ActivityBean;
import com.ispan.eeit64.repository.ActivityRepository;

@Service
public class ActivityService {
	private final ActivityRepository activityRepository;

	public ActivityService(ActivityRepository activityRepository) {
		this.activityRepository = activityRepository;
	}

	public Page<ActivityBean> findAllWithPagination(int pageNumber, int pageSize) {
		Pageable pageable = PageRequest.of(pageNumber, pageSize);
		return activityRepository.findAll(pageable);
	}

	public List<ActivityBean> resortActivityByColumn(String sortColumn, String sortDirection) {
		List<ActivityBean> allActivity = activityRepository.findAll();

		switch (sortColumn) {
		case "活動編號":
			if (sortDirection.equals("asc")) {
				allActivity.sort(Comparator.comparing(ActivityBean::getId));
			} else {
				allActivity.sort(Comparator.comparing(ActivityBean::getId).reversed());
			}
			break;

		case "活動名稱":
			if (sortDirection.equals("asc")) {
				allActivity.sort(Comparator.comparing(ActivityBean::getName));
			} else {
				allActivity.sort(Comparator.comparing(ActivityBean::getName).reversed());
			}
			break;
		case "活動類型":
			if (sortDirection.equals("asc")) {
				allActivity.sort(Comparator.comparing(ActivityBean::getType));
			} else {
				allActivity.sort(Comparator.comparing(ActivityBean::getType).reversed());
			}
			break;

		case "折扣內容":
			if (sortDirection.equals("asc")) {
				allActivity.sort(Comparator.comparing(ActivityBean::getDiscount));
			} else {
				allActivity.sort(Comparator.comparing(ActivityBean::getDiscount).reversed());
			}
			break;
		case "達標金額":
			if (sortDirection.equals("asc")) {
				allActivity.sort(Comparator.comparing(ActivityBean::getAmount));
			} else {
				allActivity.sort(Comparator.comparing(ActivityBean::getAmount).reversed());
			}
			break;

		case "活動開始":
			if (sortDirection.equals("asc")) {
				allActivity.sort(Comparator.comparing(ActivityBean::getStartDate));
			} else {
				allActivity.sort(Comparator.comparing(ActivityBean::getStartDate).reversed());
			}
			break;

		case "活動結束":
			if (sortDirection.equals("asc")) {
				allActivity.sort(Comparator.comparing(ActivityBean::getEndDate));
			} else {
				allActivity.sort(Comparator.comparing(ActivityBean::getEndDate).reversed());
			}
			break;

		default:
			allActivity.sort(Comparator.comparing(ActivityBean::getId));
			break;
		}

		return allActivity;
	}
}
