package com.ispan.eeit64.entity;



import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ispan.eeit64.repository.CategoryRepository;
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
	public void getAllCategories() {
        Iterable<CategoryBean> categories = categoryRepository.findAll();
        for (CategoryBean category : categories) {
        	System.out.println("1111111111");
        	System.out.println(category.getName());
            // 在這裡對每個類別進行需要的操作
        }
    }
	
	@Test
	public void testSelectId(){
		Optional<CategoryBean> beans = categoryRepository.findById(8);
		System.out.println("beans"+beans);
	}
	
	
	@Test
	void insert() {
		CategoryBean categoryBean =new CategoryBean("甜點");
		categoryRepository.save(categoryBean);
		
	}
	@Test
	void insert2() {
		CategoryBean categoryBean =new CategoryBean(12,",,,,");
		categoryRepository.save(categoryBean);
		}
		
	
	@Test
    public void testDeleteCategory() {
        categoryRepository.deleteById(2);
    }
		
		
	
	
}
