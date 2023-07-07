package com.ispan.eeit64.service;

import java.util.List;
import com.ispan.eeit64.entity.DishBean;
import org.springframework.data.domain.Page;


public interface ShowDishService {

	  Page<DishBean> findAll(int pageSize, int pageNumber);	  
	  Page<DishBean> getDishesByCategoryId(int categoryId, int pageSize, int pageNumber);
	  
//	  Page<DishBean> findByOrderStatus(String orderStatus, int pageNumber, int pageSize);
	  // 抽象方法，实现类中进行依赖注入
	    List<DishBean> getAllDishes();
		List<DishBean> getDishesByCategoryId(int categoryId);
}   
	  
	//下拉選單觸發事件 篩選資料庫FK
	//下拉選單名稱也要跟資料庫一樣


