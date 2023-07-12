package com.ispan.eeit64.service.impl;

import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.eeit64.entity.FdTableBean;
import com.ispan.eeit64.entity.ReservationBean;
import com.ispan.eeit64.repository.FdTableRepository;
import com.ispan.eeit64.repository.ReservationRepository;
import com.ispan.eeit64.service.ReservationService;

@Service
@Transactional
public class ReservationServiceImpl implements ReservationService{
	final static Logger log = LoggerFactory.getLogger(ReservationServiceImpl.class);
	@Autowired
	ReservationRepository reservationRepository;
	@Autowired
	FdTableRepository fdTableRepository;
	
	
	@Override
	public ReservationBean findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<ReservationBean> findBynameAndPhone(String name, String phone) {
		return reservationRepository.findBynameAndPhoneOrderBySubmitTimeDesc(name, phone);
	}

	@Override
	public List<ReservationBean> findAll() {
		return reservationRepository.findAll();
	}
	//存入訂位
	@Override
	public void save(ReservationBean bean) {
		log.info("=====>ReservationServiceImpl#save()");
		reservationRepository.save(bean);
		
	}
	
	//查詢空的桌位表單
	public List<Integer> getAvailableTableIds(Date date,Time startTime) {
        List<FdTableBean> allTables = fdTableRepository.findAll();
        List<Integer> availableTableIds = new ArrayList<>();

        Iterator<FdTableBean> iterator = allTables.iterator();
        while (iterator.hasNext()) {
            FdTableBean fdTable = iterator.next();
            boolean isTableReserved = reservationRepository.checkTableAvailability(fdTable.getTableId(), date, startTime);

            if (!isTableReserved) {
                availableTableIds.add(fdTable.getTableId());
            }
        }

        return availableTableIds;
    }
	
	//=================================查對應的tableid及可用時間 map=================================
	
	public List<Integer> getTableIdsByCapacity(Integer capacity) {
	    return fdTableRepository.getTableIdsByCapacity(capacity);
	}

	public Map<Integer, List<Time>> getAvailableTimes(List<Integer> availableTableIds, String dateString) {
	    Date date = parseDateString(dateString);
	    Map<Integer, List<Time>> availableTimesMap = new HashMap<>();

	    // 先定义一个包含所有可用时间的列表
	    List<Time> allTimes = new ArrayList<>();
	    allTimes.add(Time.valueOf("11:00:00"));
	    allTimes.add(Time.valueOf("12:00:00"));
	    allTimes.add(Time.valueOf("13:00:00"));
	    allTimes.add(Time.valueOf("16:00:00"));
	    allTimes.add(Time.valueOf("17:00:00"));
	    allTimes.add(Time.valueOf("18:00:00"));
	    allTimes.add(Time.valueOf("19:00:00"));

	    for (Integer table : availableTableIds) {
	        // 根据桌子ID和日期查询已被预订的时间
	        List<Time> reservedTimes = reservationRepository.getReservedTimes(table, date);
	        
	        // 创建该桌子的可用时间列表，初始为所有时间
	        List<Time> availableTimes = new ArrayList<>(allTimes);
	        
	        // 在可用时间列表中移除已被预订的时间
	        availableTimes.removeAll(reservedTimes);
	        
	        // 将该桌子的可用时间列表添加到可用时间的映射中
	        availableTimesMap.put(table, availableTimes);
	    }

	    return availableTimesMap;
	}

	private java.sql.Date parseDateString(String dateString) {
	    // 解析日期字符串为java.util.Date对象
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    java.util.Date parsedDate = null;
	    try {
	        parsedDate =dateFormat.parse(dateString);
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }
	    
	    // 转换为java.sql.Date对象
	    return new java.sql.Date(parsedDate.getTime());
	}
	
	
	
	
	//========================================================================================

	

	@Override
	public ReservationBean update(ReservationBean bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteById(Integer id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void detach(ReservationBean bean) {
		// TODO Auto-generated method stub
		
	}

	

	

}
