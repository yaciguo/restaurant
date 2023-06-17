package com.ispan.eeit64.entity;



import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ispan.eeit64.dao.CategoryRepository;
@SpringBootTest
public class CategoryBeanTest {
	@Autowired
	private CategoryRepository categoryRepository;
	
	  
	@Test
	public void testSelect(){
		List<CategoryBean> beans = categoryRepository.findAll();
		System.out.println("beans"+beans);
	}
	
	@Test
	void insert() {
		CategoryBean categoryBean =new CategoryBean("甜點");
		categoryRepository.save(categoryBean);
		
	}
}
