package com.ispan.eeit64.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ispan.eeit64.entity.FdTableBean;

@Repository
public interface FdTableRepository extends JpaRepository<FdTableBean, Integer>{
	
	 @Query("SELECT t FROM FdTableBean t WHERE t.capacity = :capacity")
	  FdTableBean findTableByCapacity(@Param("capacity") Integer capacity);
	 
	 @Query("SELECT t.tableId FROM FdTableBean t WHERE t.capacity = :capacity")
	 List<Integer> getTableIdsByCapacity(@Param("capacity") Integer capacity);


	 
}
