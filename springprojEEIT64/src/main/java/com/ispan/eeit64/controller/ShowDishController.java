package com.ispan.eeit64.controller;

//import java.util.Map;
//import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.eeit64.entity.ActivityBean;
import com.ispan.eeit64.entity.CategoryBean;
import com.ispan.eeit64.entity.DishBean;

import com.ispan.eeit64.repository.CategoryRepository;
import com.ispan.eeit64.repository.DishRepository;
import com.ispan.eeit64.service.ProductService;
import com.ispan.eeit64.service.ShowDishService;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

//呈現json資料
@Controller
public class ShowDishController {
	private static final Integer categoryId = null;
	private ShowDishService service;
	private ProductService productService; // 新增產品
	private final CategoryRepository categoryRepository;
	private final DishRepository dishRepository;

	// 參考
//	public ActivityController(ActivityRepository activityRepository, ActivityService activityService,
//			CategoryRepository categoryRepository, DishRepository dishRepository) {
//		this.activityRepository = activityRepository;
//		this.activityService = activityService;
//		this.categoryRepository = categoryRepository;
//		this.dishRepository = dishRepository;
//	}

	@Autowired
	public ShowDishController(ShowDishService service, ProductService productService,
			CategoryRepository categoryRepository, DishRepository dishRepository) {
		this.service = service;
		this.productService = productService; // 新增產品
		this.categoryRepository = categoryRepository;
		this.dishRepository = dishRepository;
	}

//    @GetMapping("/filterDishes")
//    public String getDishesByCategory(@RequestParam("categoryId") int categoryId,
//                                      @RequestParam(required = false, defaultValue = "40") int pageSize,
//                                      @RequestParam(required = false, defaultValue = "0") int pageNumber,
//                                      Model model) {
//        Page<DishBean> filteredDishes = service.findAll(pageSize, pageNumber);
//        model.addAttribute("dishes", filteredDishes);
//        return "product";
//    }

	// 篩選後資料
	@GetMapping("/filterDishes")
	@CrossOrigin(origins = "http://localhost:8080")
	public @ResponseBody List<DishBean> filterDishesByCategory(@RequestParam("categoryId") int categoryId) {
		// 调用 service 中的方法，根据分类 ID 获取筛选后的餐点数据
		List<DishBean> filteredDishes = service.getDishesByCategoryId(categoryId);

		return filteredDishes;
	}

////    前端表格出現json資料
	@GetMapping("/product")

	public String getAllOrderStatus(@RequestParam(required = false, defaultValue = "40") int pageSize,
			@RequestParam(required = false, defaultValue = "0") int pageNumber, Model model) {
		Page<DishBean> list = service.findAll(pageSize, pageNumber);
		model.addAttribute("list", list);
		return "product";
	}

//網頁呈現json資料
//    @GetMapping("/dishtitle")
//    @ResponseBody
//    public Page<DishBean> getAllOrderStatus(
//            @RequestParam(required = false, defaultValue = "20") int pageSize,
//            @RequestParam(required = false, defaultValue = "0") int pageNumber,
//            Model model){ 	    	   
////      Page<DishBean>   list = service.findAll(pageSize, pageNumber);
////          model.addAttribute("dishes", list); 
//         return service.findAll(pageSize, pageNumber);
//         }
//}

////////////////////////////////////////////新增餐點

	// 新增產品
	@PostMapping("/addProduct")
	@ResponseBody
	@CrossOrigin(origins = "http://localhost:8080") // 設置允許跨域的來源網址
	public void addProduct(@RequestBody Map<String, Object> dish) {
		Map<String, String> response = new HashMap<>();	
		
		String name = (String) dish.get("name");
		Integer price = (Integer) dish.get("price");
		Integer cost = (Integer) dish.get("cost");
		String description = (String) dish.get("description");
		String categorystr = (String) dish.get("categoryId");
		
		Integer categoryId = Integer.parseInt(categorystr);
		
		CategoryBean categoryBean = null; 
		Optional<CategoryBean> categoryBeanOptional = categoryRepository.findById(categoryId); // 根據 categoryId 查詢
		if (categoryBeanOptional.isPresent()) {
			categoryBean = categoryBeanOptional.get();
        }
		// CategoryBean
		
		

		DishBean proudectdish = new DishBean();
		proudectdish.setName(name);
		proudectdish.setPrice(price);
		proudectdish.setPicture("000000000000");
		proudectdish.setCost(cost);
		proudectdish.setDescription(description);
		proudectdish.setCategoryBean(categoryBean); // 設置 categoryBean

		dishRepository.save(proudectdish);
		response.put("success", "新增成功");
		System.out.println(proudectdish);

	}

//	@GetMapping("/queryActivity")
//	public Page<ActivityBean> findAllActivitys(@RequestParam(defaultValue = "0") int pageNumber,
//			@RequestParam(defaultValue = "5") int pageSize) {
//		return activityService.findAllWithPagination(pageNumber - 1, pageSize);
//	}

	// 查詢產品訊息並進行分頁展示
	@GetMapping("/queryProducts")
	public Page<DishBean> findAllProducts(@RequestParam(defaultValue = "0") int pageNumber,
			@RequestParam(defaultValue = "5") int pageSize) {
		return productService.findAllWithPagination(pageNumber - 1, pageSize);
	}

//	@GetMapping("/resortActivity")
//	public List<ActivityBean> resortActivityByColumn(@RequestParam("sortColumn") String sortColumn,
//			@RequestParam("sortDirection") String sortDirection) {
//		List<ActivityBean> sortedActivity = activityService.resortActivityByColumn(sortColumn, sortDirection);
//
//		return sortedActivity;
//	}

	// 產品排序
	@GetMapping("/resortProducts")
	public List<DishBean> resortProductsByColumn(@RequestParam("sortColumn") String sortColumn,
			@RequestParam("sortDirection") String sortDirection) {
		List<DishBean> sortedProducts = productService.resortProductsByColumn(sortColumn, sortDirection);

		return sortedProducts;
	}

//	@GetMapping("/queryCategory")
//	public List<CategoryBean> findAllCategory() {
//		List<CategoryBean> allCategory = categoryRepository.findAll();
//
//		return allCategory;
//	}

	// 獲取所有的類別訊息，並將其返回给前端
	@GetMapping("/getAllCategories")
	public List<CategoryBean> getAllCategories() {
		List<CategoryBean> allCategories = categoryRepository.findAll();
		return allCategories;
	}

//	@GetMapping("/queryDish")
//	public Set<DishBean> findDishByCategoryId(@RequestParam Integer categoryId) {
//		CategoryBean category = categoryRepository.findById(categoryId).orElse(null);
//
//		if (category != null) {
//			return category.getDishBean();
//		} else {
//			return new HashSet<>();
//		}
//	}

	// 查詢餐點 不確定會不會用到
	@GetMapping("/queryProduct")
	public Set<DishBean> findDishByCategoryId(@RequestParam Integer categoryId) {
		Optional<CategoryBean> categoryOptional = categoryRepository.findById(categoryId);
		if (categoryOptional.isPresent()) {
			CategoryBean category = categoryOptional.get();
			return category.getDishBean();
		} else {
			return new HashSet<>();
		}
	}

//	@DeleteMapping("/deleteActivity")
//	@CrossOrigin(origins = "http://localhost:8080/") // 設置允許跨域的來源網址
//	public void deleteActivityById(@RequestParam Integer activityId) {
//		activityRepository.deleteById(activityId);
//	}

	// 刪除餐點
	@DeleteMapping("/deleteProduct/{productId}")
	@CrossOrigin(origins = "http://localhost:8080/") // 設置允許跨域的來源網址
	public void deleteProductById(@PathVariable Integer productId) {
		dishRepository.deleteById(productId);
	}

}