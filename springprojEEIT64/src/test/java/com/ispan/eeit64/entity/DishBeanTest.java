package com.ispan.eeit64.entity;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ispan.eeit64.repository.DishRepository;

@SpringBootTest
public class DishBeanTest {
	
	@Autowired
	private DishRepository dishRepository;
	
	@Test
	void findAll() {
		List<DishBean> beans = dishRepository.findAll();
		System.out.println("beans ="+ beans);
	}
	
	@Test
	void insert() {
		CategoryBean categoryBean = new CategoryBean(2);
		DishBean d1 = new DishBean("乾麵", categoryBean , 100, 50, "pppp", "pppp", "Y");
		dishRepository.save(d1);	
	}
	
	
}
