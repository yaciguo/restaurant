package com.ispan.eeit64.repository;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ispan.eeit64.entity.FdTableBean;
import com.ispan.eeit64.entity.ReservationBean;


@Repository
public interface ReservationRepository extends JpaRepository<ReservationBean, Integer>{
	List<ReservationBean> findBynameAndPhoneOrderBySubmitTimeDesc(String name, String phone);
	@Query("SELECT CASE WHEN COUNT(r) > 0 THEN TRUE ELSE FALSE END FROM ReservationBean r " +
	        "WHERE r.fdTableBean.id = :tableId " +
	        "AND r.date = :date " +
	        "AND r.startTime = :startTime")
	boolean checkTableAvailability(@Param("tableId") Integer tableId, @Param("date") Date date, @Param("startTime") Time startTime);
	
	@Query("SELECT r.startTime FROM ReservationBean r WHERE r.fdTableBean.id = :tableId AND r.date = :date")
	List<Time> getReservedTimes(@Param("tableId") Integer table, @Param("date") Date date);

}
