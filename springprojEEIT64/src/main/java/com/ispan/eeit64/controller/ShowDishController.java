package com.ispan.eeit64.controller;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

//import java.util.Map;
//import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
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

import com.ispan.eeit64.entity.CategoryBean;
import com.ispan.eeit64.entity.DishBean;
import com.ispan.eeit64.repository.CategoryRepository;
import com.ispan.eeit64.repository.DishRepository;
import com.ispan.eeit64.service.ProductService;
import com.ispan.eeit64.service.ShowDishService;

//呈現json資料
@Controller
public class ShowDishController {
	
	private ShowDishService service;
	private ProductService productService; // 新增產品
	@Autowired
	private final CategoryRepository categoryRepository;
	
	@Autowired
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

	public String getAllOrderStatus(@RequestParam(required = false, defaultValue = "50") int pageSize,
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
	public  Map<String, String> addProduct(@RequestBody Map<String, Object> dish) {
		Map<String, String> response =new HashMap<>();
		try {
			//字串轉整數
	        String name = (String) dish.get("name");
	        String priceStr = (String) dish.get("price");
	        Integer price = Integer.parseInt(priceStr);
	        String costStr = (String) dish.get("cost");
	        Integer cost = Integer.parseInt(costStr);
	        String description = (String) dish.get("description");
	        String categoryStr = (String) dish.get("FK_categoryId");
	        String imageBase64 = (String) dish.get("imageBase64");
	        Integer categoryId = null;
	        if (categoryStr != null && !categoryStr.isEmpty()) {
	            categoryId = Integer.parseInt(categoryStr);
	        }

	        Optional<CategoryBean> categoryBeanOptional = categoryRepository.findById(categoryId);
			System.out.println(123);
	        CategoryBean categoryBean = null;

	        if (categoryBeanOptional.isPresent()) {
	            categoryBean = categoryBeanOptional.get();
	        }

	        DishBean proudectdish = new DishBean();
	        proudectdish.setName(name);
	        proudectdish.setPrice(price);
	        proudectdish.setPicture(imageBase64);
	        proudectdish.setCost(cost);
	        proudectdish.setDescription(description);
	        proudectdish.setCategoryBean(categoryBean);
	        proudectdish.setStatus("Y");

	        dishRepository.save(proudectdish);
	        
	        response.put("success", "新增成功");
	        System.out.println(proudectdish.getId());
	    
	    } catch (Exception e) {
	    	   e.printStackTrace();
	           response.put("error", "新增失敗");
	       }
	       
	       return response;
	}
	
	

	// 獲取所有的類別訊息，並將其返回给前端
	// @GetMapping("/getAllCategories")
	// public List<CategoryBean> getAllCategories() {
	// 	List<CategoryBean> allCategories = categoryRepository.findAll();
	// 	return allCategories;
	// }

	
	// 刪除餐點
	// @DeleteMapping("/deleteProduct/{productId}")
	// @CrossOrigin(origins = "http://localhost:8080/") // 設置允許跨域的來源網址
	// public void deleteProductById(@PathVariable Integer productId) {
	// 	dishRepository.deleteById(productId);
	// }

}
