package com.ispan.eeit64.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.eeit64.repository.CategoryRepository;
import com.ispan.eeit64.service.CategoryService;
@Service
@Transactional
public class CategoryServiceImpl implements CategoryService{
	@Autowired 
	CategoryRepository categoryRepository;

	@Override
	public List<String> findAllbyName() {
		
		return categoryRepository.findAllNamesOrderById();
	}

}
