package com.ispan.eeit64.service;

import java.util.List;

import com.ispan.eeit64.entity.DishBean;
import com.ispan.eeit64.repository.DishRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ShowDishService {

	  Page<DishBean> findAll(int pageSize, int pageNumber);	  
//	  Page<DishBean> findByOrderStatus(String orderStatus, int pageNumber, int pageSize);
	  
	   
	  
	//下拉選單觸發事件 篩選資料庫FK
	//下拉選單名稱也要跟資料庫一樣
}

