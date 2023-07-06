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


@Controller
public class AddTypeController {
	@Autowired
	private final CategoryRepository categoryRepository;
	@Autowired
	private final DishRepository dishRepository;

	@Autowired
	public AddTypeController(CategoryRepository categoryRepository, DishRepository dishRepository) {
		this.categoryRepository = categoryRepository;
		this.dishRepository = dishRepository;
	}

////////////////////////////////////////////新增種類

	// 新增種類
	@PostMapping("/addType")
	@ResponseBody
	@CrossOrigin(origins = "http://localhost:8080") // 設置允許跨域的來源網址
	public Map<String, String> addType(@RequestBody Map<String, Object> category) {
		Map<String, String> response = new HashMap<>();
		try {			

			String Typename = (String)category.get("name");
			CategoryBean categoryType = new CategoryBean();
			categoryType.setName(Typename);
			categoryRepository.save(categoryType);

			response.put("success", "新增成功");

		}
		catch (Exception e) {
			e.printStackTrace();
			response.put("error", "新增失敗");
		}

		return response;
	}
	
	
	
	// 取得所有類別
	  @GetMapping("/getCategories")
	  @ResponseBody
	  @CrossOrigin(origins = "http://localhost:8080") // 設置允許跨域的來源網址
	  public List<CategoryBean> getCategories() {
	    return categoryRepository.findAll();
	  }

}
