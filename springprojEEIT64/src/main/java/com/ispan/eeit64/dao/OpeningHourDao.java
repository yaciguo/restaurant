package com.ispan.eeit64.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.eeit64.entity.OpeningHourBean;

@Repository
public interface OpeningHourDao extends JpaRepository<OpeningHourBean, Integer> {
	
}
