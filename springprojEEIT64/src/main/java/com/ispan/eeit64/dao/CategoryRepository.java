package com.ispan.eeit64.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.ispan.eeit64.entity.CategoryBean;

public interface CategoryRepository extends JpaRepository<CategoryBean, Integer>{


}
