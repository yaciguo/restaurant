package com.ispan.eeit64.controller;

import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ispan.eeit64.entity.ActivityBean;
import com.ispan.eeit64.entity.CategoryBean;
import com.ispan.eeit64.entity.DishBean;
import com.ispan.eeit64.repository.ActivityRepository;
import com.ispan.eeit64.repository.CategoryRepository;
import com.ispan.eeit64.repository.DishRepository;
import com.ispan.eeit64.service.ActivityService;

@RestController
public class ActivityController {
	private final ActivityRepository activityRepository;
	private final ActivityService activityService;
	private final CategoryRepository categoryRepository;
	private final DishRepository dishRepository;

	public ActivityController(ActivityRepository activityRepository, ActivityService activityService,
			CategoryRepository categoryRepository, DishRepository dishRepository) {
		this.activityRepository = activityRepository;
		this.activityService = activityService;
		this.categoryRepository = categoryRepository;
		this.dishRepository = dishRepository;
	}

//	@GetMapping("/queryActivity")
//	public String findAllActivitys(Model model) {
//		List<ActivityBean> allActivity = activityRepository.findAll();
//		System.out.println(allActivity);
//		model.addAttribute("allActivity", allActivity);
//		return "activity";
//	}
//	

//	@GetMapping("/queryActivity")
//	public List<ActivityBean> findAllActivitys() {
//		List<ActivityBean> allActivity = activityRepository.findAll();
//
//		return allActivity;
//	}

	@GetMapping("/queryActivity")
	public Page<ActivityBean> findAllActivitys(@RequestParam(defaultValue = "0") int pageNumber,
												@RequestParam(defaultValue = "5") int pageSize) {
		
		return activityService.findAllWithPagination(pageNumber-1, pageSize);
	}

	@GetMapping("/resortActivity")
	public List<ActivityBean> resortActivityByColumn(@RequestParam("sortColumn") String sortColumn,
			@RequestParam("sortDirection") String sortDirection) {
		List<ActivityBean> sortedActivity = activityService.resortActivityByColumn(sortColumn, sortDirection);

		return sortedActivity;
	}

	@PostMapping("/saveActivity")
	public String saveActivity(@RequestBody Map<String, Object> activity) {
		System.out.println(activity);
		System.out.println(activity.get("id"));

		String idStr = (String) activity.get("id");
		Integer id = Integer.parseInt(idStr);

		String name = (String) activity.get("name");
		String type = (String) activity.get("type");

		String discountStr = (String) activity.get("discount");
		Integer discount = Integer.parseInt(discountStr);

		String amountStr = (String) activity.get("amount");
		Integer amount = Integer.parseInt(amountStr);

		String startDateStr = (String) activity.get("start");
		String endDateStr = (String) activity.get("end");

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date startDate = null;
		java.sql.Date endDate = null;
		try {
			java.util.Date parsedStartDate = dateFormat.parse(startDateStr);
			java.util.Date parsedEndDate = dateFormat.parse(endDateStr);
			startDate = new java.sql.Date(parsedStartDate.getTime());
			endDate = new java.sql.Date(parsedEndDate.getTime());
		} catch (Exception e) {
			e.printStackTrace();
		}

		ActivityBean activityBean = new ActivityBean();
		activityBean.setId(id);
		activityBean.setName(name);
		activityBean.setType(type);

		if (type.equals("discount")) {
			activityBean.setDiscount(discount);
		} else {
			String dishIdStr = (String) activity.get("dishId");
			Integer dishId = Integer.parseInt(dishIdStr);
			activityBean.setDiscount(dishRepository.findById(dishId).orElse(null).getPrice());

			activityBean.setDishBean(dishRepository.findById(dishId).orElse(null));
		}

		activityBean.setAmount(amount);
		activityBean.setStartDate(startDate);
		activityBean.setEndDate(endDate);

		activityRepository.save(activityBean);

		return "redirect:/activity";
	}

	@GetMapping("/queryCategory")
	public List<CategoryBean> findAllCategory() {
		List<CategoryBean> allCategory = categoryRepository.findAll();

		return allCategory;
	}

	@GetMapping("/queryDish")
	public Set<DishBean> findDishByCategoryId(@RequestParam Integer categoryId) {
		CategoryBean category = categoryRepository.findById(categoryId).orElse(null);

		if (category != null) {
			return category.getDishBean();
		} else {
			return new HashSet<>();
		}
	}

	@DeleteMapping("/deleteActivity")
	public void deleteActivityById(@RequestParam Integer activityId) {
		activityRepository.deleteById(activityId);
	}

}
