package com.ispan.eeit64.daoTest;

import java.util.Optional;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ispan.eeit64.entity.CategoryBean;
import com.ispan.eeit64.entity.DishBean;
import com.ispan.eeit64.repository.CategoryRepository;
import com.ispan.eeit64.repository.DishRepository;
import com.ispan.eeit64.repository.UniversalCustomRepository;

@SpringBootTest
public class DishRepositoryTest {

	@Autowired
	UniversalCustomRepository ucDao;

	@Autowired
	DishRepository dishDao;

	@Autowired
	CategoryRepository categoryDao;

	@BeforeEach
	public void before(TestInfo testInfo) {
		System.out.println("");
		System.out.println("Test method execution : " + testInfo.getDisplayName());
	}

	@AfterEach
	public void after(TestInfo testInfo) {
		System.out.println("Test method execution end : " + testInfo.getDisplayName());
		System.out.println("");
	}

	@Test
	public void test() {
		try {
			CategoryBean bean = new CategoryBean("測試2");
			categoryDao.save(bean);
			Optional<CategoryBean> beanOptional = categoryDao.findById(1);
			CategoryBean cBean = beanOptional.get();
			DishBean dBean = new DishBean("測試麵",cBean, 200, 100, "null", "測試用麵", "null");
			System.out.println(dBean);
			dishDao.save(dBean);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
