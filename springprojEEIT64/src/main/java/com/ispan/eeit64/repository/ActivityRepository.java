package com.ispan.eeit64.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ispan.eeit64.entity.ActivityBean;

@Repository
public interface ActivityRepository extends JpaRepository<ActivityBean, Integer>{

}
