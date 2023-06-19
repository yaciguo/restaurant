package com.ispan.eeit64.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ispan.eeit64.entity.CategoryBean;

@Repository
public interface CategoryRepository extends JpaRepository<CategoryBean, Integer>{


}
