package com.ispan.eeit64.service;

import java.util.List;
import com.ispan.eeit64.entity.CategoryBean;


public interface AddTypeService {

	  // 抽象方法，实现类中进行依赖注入
	    List<CategoryBean> getName(String name);
}   
	  

